import 'package:flutter/material.dart';

import '../../models/data/geojson_properties.dart';
import 'map_key_item.dart';

class MapKey extends StatelessWidget {
  const MapKey({
    super.key,
    required this.geoJSONs,
  });

  final List<GeoJsonProperties> geoJSONs;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: [
          Text(
            "This is a breakdow of what each color represents on the map",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 12,
          ),
          for (GeoJsonProperties geoJson in geoJSONs) ...[
            MapKeyItem(
                keyName: geoJson.name,
                keyDescription: geoJson.description,
                keyColor: geoJson.color),
            const SizedBox(
              height: 6,
            )
          ]
        ],
      ),
    );
  }
}
