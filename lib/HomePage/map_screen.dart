import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _originController = TextEditingController();
  final _destinationController = TextEditingController();
  late LatLng _origin;
  late LatLng _destination;
  late GoogleMapController _mapController;

  @override
  void initState() {
    super.initState();
    _initializeOriginAndDestination();
  }

  void _initializeOriginAndDestination() {
    // Set the initial values for _origin and _destination
    _origin = LatLng(37.7749, -122.4194);
    _destination = LatLng(34.0522, -118.2437);

    // Set the initial text in the TextFormFields
    _originController.text = '37.7749, -122.4194';
    _destinationController.text = '34.0522, -118.2437';
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Row(
          children: [
            Text('Fault Connect Dashboard',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25)),
          ],
        ),
        leading: IconButton(
          icon: Icon(Iconsax.menu_1,size: 27,),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [


          IconButton(
            icon: Icon(CupertinoIcons.bell),
            onPressed: () {
              // Handle notifications functionality
            },
          ),
          IconButton(
            icon: Icon(CupertinoIcons.person,size: 25,),
            onPressed: () {
              // Handle search functionality
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/header.png',
                      height: 120.0,
                      width: 250,
                    ),
                  ),

                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home,size: 25,),
              title: Text('H o m e',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14)),
              onTap: () {
                // Navigate to home page
              },
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(CupertinoIcons.bell,size: 25,),
              title: Text('R e p o r t s',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14)),
              onTap: () {
                // Navigate to settings page
              },
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Iconsax.logout,size: 25,),
              title: Text('S i g n  o u t',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14),),
              onTap: () {
                // Handle logout functionality
              },
            ),
            // Add more list tiles as needed
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Origin'),
                TextFormField(
                  controller: _originController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter origin',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0,
                    ),
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Text('Destination'),
                TextFormField(
                  controller: _destinationController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter origin',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0,
                    ),
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _updateOriginAndDestination,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 24.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    textStyle: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text('Update Map'),
                ),
              ],
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: _origin,
                zoom: 14.0,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('origin'),
                  position: _origin,
                  infoWindow: InfoWindow(
                    title: 'Origin',
                  ),
                ),
                Marker(
                  markerId: MarkerId('destination'),
                  position: _destination,
                  infoWindow: InfoWindow(
                    title: 'Destination',
                  ),
                ),
              },
              polylines: {
                Polyline(
                  polylineId: PolylineId('route'),
                  points: [_origin, _destination],
                  color: Colors.blue,
                  width: 4,
                ),
              },
            ),
          ),
        ],
      ),
    );
  }

  void _updateOriginAndDestination() {
    // Parse the origin and destination from the TextFormFields
    final originString = _originController.text.trim();
    final destinationString = _destinationController.text.trim();

    // Convert the strings to LatLng objects
    final originLatLng = _parseLatLng(originString);
    final destinationLatLng = _parseLatLng(destinationString);

    // Update the _origin and _destination fields
    setState(() {
      _origin = originLatLng;
      _destination = destinationLatLng;
    });

    // Move the camera to the updated location
    _mapController.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(
            min(originLatLng.latitude, destinationLatLng.latitude),
            min(originLatLng.longitude, destinationLatLng.longitude),
          ),
          northeast: LatLng(
            max(originLatLng.latitude, destinationLatLng.latitude),
            max(originLatLng.longitude, destinationLatLng.longitude),
          ),
        ),
        50,
      ),
    );
  }

  LatLng _parseLatLng(String latLngString) {
    final parts = latLngString.split(',');
    final latitude = double.parse(parts[0].trim());
    final longitude = double.parse(parts[1].trim());
    return LatLng(latitude, longitude);
  }
}
