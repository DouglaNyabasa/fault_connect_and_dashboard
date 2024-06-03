import 'package:flutter/material.dart';

class GeoJsonProperties {
  String name;
  Color color;
  String description;
  String geoJsonString;

  GeoJsonProperties(
      {required this.name,
      required this.color,
      required this.description,
      required this.geoJsonString});
}
