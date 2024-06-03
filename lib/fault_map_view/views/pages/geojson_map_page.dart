import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_geojson/flutter_map_geojson.dart';

import 'package:latlong2/latlong.dart';

import '../../models/data/geojson_properties.dart';
import '../widgets/map_key.dart';

class GeojsonMapPage extends StatefulWidget {
  const GeojsonMapPage(
      {super.key,
      required this.geoJSON,
      required this.geoJSONs,
      required this.faultPoint});

  final String title = 'Map View of Fault';
  final String geoJSON;
  final List<GeoJsonProperties> geoJSONs;
  final List<LatLng> faultPoint;

  @override
  State<GeojsonMapPage> createState() => _GeojsonMapPageState();
}

class _GeojsonMapPageState extends State<GeojsonMapPage> {
  List<GeoJsonParser> geoJsonParsers = [];

  bool loadingData = false;

  bool myFilterFunction(Map<String, dynamic> properties) {
    if (properties['section'].toString().contains('Point M-4')) {
      return false;
    } else {
      return true;
    }
  }

  // this is callback that gets executed when user taps the marker
  void onTapMarkerFunction(Map<String, dynamic> map) {
    // ignore: avoid_print
    print('onTapMarkerFunction: $map');
  }

  Future<void> processData() async {
    // Parse the GeoJson Strings
    // If this breaks this is the likely culprit

    for (int i = 0; i < geoJsonParsers.length; i++) {
      geoJsonParsers[i].parseGeoJsonAsString(widget.geoJSONs[i].geoJsonString);
    }
  }

  @override
  void initState() {
    // Instantiate GeojsonParsers
    for (var geoJson in widget.geoJSONs) {
      geoJsonParsers.add(GeoJsonParser(
        defaultPolylineColor: geoJson.color,
        defaultMarkerColor: geoJson.color,
        defaultPolygonBorderColor: geoJson.color,
        defaultPolygonFillColor: geoJson.color.withOpacity(0.1),
        defaultMarkerIcon: Icons.circle,
        defaultCircleMarkerColor: geoJson.color.withOpacity(0.25),
      ));
    }

    // Set Properties for GeoJson Parsers
    for (GeoJsonParser parser in geoJsonParsers) {
      parser.setDefaultMarkerTapCallback(onTapMarkerFunction);
      parser.filterFunction = myFilterFunction;
    }

    loadingData = true;
    Stopwatch stopwatch2 = Stopwatch()..start();
    processData().then((_) {
      setState(() {
        loadingData = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.help,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            showModalBottomSheet(
                showDragHandle: true,
                context: context,
                builder: (context) {
                  return SingleChildScrollView(
                      child: MapKey(geoJSONs: widget.geoJSONs));
                });
          },
        ),
        body: loadingData
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : FlutterMap(
                mapController: MapController(),
                options: MapOptions(
                  initialCenter: widget.faultPoint[0],
                  initialZoom: 14,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  ),

                  for (GeoJsonParser parser in geoJsonParsers) ...[
                    PolygonLayer(
                      polygons: parser.polygons,
                    ),
                    PolylineLayer(polylines: parser.polylines),
                    MarkerLayer(markers: parser.markers),
                    CircleLayer(circles: parser.circles),
                  ],

                  // Define Fault Points

                  MarkerLayer(
                    markers: [
                      for (LatLng faultPoint in widget.faultPoint) ...[
                        Marker(
                          point: faultPoint,
                          child: Icon(
                            Icons.wrong_location_rounded,
                            color: Theme.of(context).colorScheme.error,
                            size: 30,
                          ),
                        )
                      ]
                    ],
                  )
                ],
              ));
  }
}
