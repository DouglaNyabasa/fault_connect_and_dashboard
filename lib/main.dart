import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// <<<<<<< HEAD
import 'HomePage/map_screen.dart';
import 'Reports/get_reports.dart';
import 'SplashScreen/splash_screen.dart';
import 'firebase_options.dart';
// =======
import 'fault_map_view/models/data/geojson_properties.dart';
import 'fault_map_view/views/pages/geojson_map_page.dart';
import 'package:latlong2/latlong.dart';
// >>>>>>> ea8f9144c4fbf2ddae82375aac127f75c20abda4

// void main() {
//   runApp(const MyApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String testGeoJson = '''{
"type": "FeatureCollection",
"name": "waterline kaguvi phase 2",
"crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
"features": [
{ "type": "Feature", "properties": { "diameter": 200, "id": 1 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12872, -18.11521 ], [ 30.12747, -18.11394 ], [ 30.12829, -18.11325 ], [ 30.12793, -18.1129 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150, "id": 2 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12793, -18.1129 ], [ 30.13074, -18.11037 ], [ 30.13231, -18.10902 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 100, "id": 3 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12793, -18.1129 ], [ 30.12736, -18.11334 ], [ 30.12263, -18.11417 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150, "id": 4 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.13383, -18.11011 ], [ 30.13231, -18.10902 ], [ 30.13049, -18.10708 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150, "id": 5 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12632, -18.11352 ], [ 30.12644, -18.11308 ], [ 30.12642, -18.11291 ], [ 30.12715, -18.11116 ], [ 30.12546, -18.10933 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150, "id": 6 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12586, -18.10977 ], [ 30.12692, -18.10879 ], [ 30.12731, -18.10843 ], [ 30.12748, -18.10829 ], [ 30.12788, -18.10795 ], [ 30.12866, -18.10876 ], [ 30.13049, -18.10708 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 100, "id": 7 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.13092, -18.10754 ], [ 30.12936, -18.10895 ], [ 30.13073, -18.11037 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 75, "id": 8 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.13003, -18.10835 ], [ 30.13143, -18.10978 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 75, "id": 9 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.13162, -18.10828 ], [ 30.13137, -18.10854 ], [ 30.13119, -18.10874 ], [ 30.13149, -18.10908 ], [ 30.13156, -18.10916 ], [ 30.13119, -18.10874 ], [ 30.13066, -18.10818 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 75, "id": 10 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.13007, -18.10968 ], [ 30.13033, -18.10947 ], [ 30.12985, -18.10898 ], [ 30.13033, -18.10947 ], [ 30.13076, -18.10989 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 75, "id": 11 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12877, -18.11214 ], [ 30.12771, -18.1111 ], [ 30.12809, -18.1106 ], [ 30.12847, -18.11032 ], [ 30.12881, -18.11005 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 75, "id": 12 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12722, -18.11194 ], [ 30.12758, -18.11221 ], [ 30.1278, -18.11245 ], [ 30.12855, -18.11186 ], [ 30.1295, -18.11104 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 75, "id": 13 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12974, -18.11126 ], [ 30.1295, -18.11104 ], [ 30.1289, -18.11042 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 75, "id": 14 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12908, -18.1114 ], [ 30.12849, -18.11078 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 75, "id": 15 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12822, -18.11211 ], [ 30.12751, -18.1114 ], [ 30.12771, -18.1111 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 75, "id": 16 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12632, -18.10934 ], [ 30.12709, -18.11013 ], [ 30.12839, -18.10893 ], [ 30.128, -18.10856 ], [ 30.12692, -18.10952 ], [ 30.12655, -18.10913 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 100, "id": 17 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12669, -18.11228 ], [ 30.12562, -18.11182 ], [ 30.12443, -18.11089 ], [ 30.12308, -18.11191 ], [ 30.12343, -18.11345 ], [ 30.12503, -18.11314 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 75, "id": 18 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12483, -18.1112 ], [ 30.12406, -18.11188 ], [ 30.12419, -18.11274 ], [ 30.1252, -18.11259 ], [ 30.12518, -18.11235 ], [ 30.1255, -18.11173 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 75, "id": 19 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12542, -18.11368 ], [ 30.12574, -18.11298 ], [ 30.126, -18.11239 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 75, "id": 20 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12323, -18.11256 ], [ 30.12211, -18.11271 ], [ 30.12211, -18.11306 ], [ 30.12217, -18.11331 ], [ 30.12297, -18.11318 ] ] ] } }
]
}
''';

    List<GeoJsonProperties> geoJsons = [
      GeoJsonProperties(
        name: "seweline kaguvi 2",
        color: Colors.brown,
        description:
            "Kaguvi Sewer Line is a Lorem ipsulum whateverKaguvi Sewer Line is a Lorem ipsulum whateverKaguvi Sewer Line ",
        geoJsonString: """{
"type": "FeatureCollection",
"name": "seweline kaguvi 2",
"crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
"features": [
{ "type": "Feature", "properties": { "diameter": 150 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.1221586812, -18.1133355871 ], [ 30.1229522453, -18.1131850295 ], [ 30.1232219944, -18.1136712052 ], [ 30.1231749451, -18.114082102 ], [ 30.1239245966, -18.1140005499 ], [ 30.125715605, -18.113614746 ], [ 30.1258912555, -18.1140036866 ], [ 30.1270329841, -18.1152081475 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.122127315, -18.1127364933 ], [ 30.1228675566, -18.1125922089 ], [ 30.1229522484, -18.1131850356 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.1241663612, -18.1111306464 ], [ 30.1230999113, -18.1119336204 ], [ 30.1233884801, -18.1133388248 ], [ 30.1234261195, -18.1134642895 ], [ 30.1250383407, -18.1131725841 ], [ 30.1257156295, -18.1136147491 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.124197078, -18.1129369458 ], [ 30.1240151542, -18.1119457748 ], [ 30.1239461486, -18.111738758 ], [ 30.1243727285, -18.111443916 ], [ 30.1246989367, -18.1116070201 ], [ 30.1245295594, -18.1118265833 ], [ 30.1246926635, -18.1128428472 ], [ 30.1247785322, -18.113219592 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.1246969372, -18.1128493326 ], [ 30.1241970389, -18.1129368638 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.124172093, -18.1107019751 ], [ 30.1256400298, -18.1118186108 ], [ 30.1261418885, -18.1120569937 ], [ 30.1263802714, -18.112144819 ], [ 30.1257156027, -18.1136147468 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.1259799598, -18.1123895713 ], [ 30.1255154786, -18.1134828272 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 200 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.1334554778, -18.1088135374 ], [ 30.1326950845, -18.1092480479 ], [ 30.13251517, -18.109343097 ], [ 30.1316461492, -18.1084265516 ], [ 30.1308687829, -18.1076322122 ], [ 30.1303086718, -18.1081108526 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.130653225, -18.1082025071 ], [ 30.1316088084, -18.1091869448 ], [ 30.1318090906, -18.1090511603 ], [ 30.1320195566, -18.1092548371 ], [ 30.1323114933, -18.1095196169 ], [ 30.13251517, -18.109343097 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.1297742555, -18.1085555543 ], [ 30.1291768087, -18.1090851094 ], [ 30.1305414316, -18.1105312023 ], [ 30.1320027479, -18.1092385718 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.129843629, -18.1081795709 ], [ 30.1305225459, -18.1088584878 ], [ 30.1313840145, -18.1097858789 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.1298224858, -18.1089687786 ], [ 30.1309995712, -18.1101259473 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.1254436843, -18.1094446039 ], [ 30.1275551157, -18.1114813544 ], [ 30.1284818372, -18.1123571571 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.1257156754, -18.1136147445 ], [ 30.1274140283, -18.1133060495 ], [ 30.1305406525, -18.1105309769 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.1272075951, -18.1111562169 ], [ 30.1264030787, -18.1131488378 ], [ 30.127160071, -18.113016449 ], [ 30.1282395488, -18.1121338571 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.1278763282, -18.1109355689 ], [ 30.128670661, -18.1117604529 ], [ 30.1303721631, -18.1103518264 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.1282428505, -18.1121316294 ], [ 30.1286434115, -18.111751436 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.1287248815, -18.1101084572 ], [ 30.1281681697, -18.1105565424 ], [ 30.1291050749, -18.1113848209 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.1289149782, -18.1104343373 ], [ 30.129512425, -18.1110317841 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.1260499491, -18.1090459524 ], [ 30.1272719994, -18.1102951594 ], [ 30.1268517075, -18.1108022254 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 200 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.1277928559, -18.107840875 ], [ 30.1286890262, -18.1087234669 ], [ 30.1304677883, -18.1071348015 ], [ 30.1308689857, -18.1076323202 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.1266121771, -18.1091069488 ], [ 30.1278749625, -18.1079188443 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.1270059489, -18.1094871422 ], [ 30.1282755234, -18.1082990378 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.1273929315, -18.1098877032 ], [ 30.1286890262, -18.1087234934 ] ] ] } }
]
}
""",
      ),
      GeoJsonProperties(
        name: "waterline kaguvi phase 2",
        color: Colors.blue,
        description:
            "Kaguvi Sewer Line is a Lorem ipsulum whateverKaguvi Sewer Line is a Lorem ipsulum whateverKaguvi Sewer Line ",
        geoJsonString: """{
"type": "FeatureCollection",
"name": "waterline kaguvi phase 2",
"crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
"features": [
{ "type": "Feature", "properties": { "diameter": 200, "id": 1 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12872, -18.11521 ], [ 30.12747, -18.11394 ], [ 30.12829, -18.11325 ], [ 30.12793, -18.1129 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150, "id": 2 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12793, -18.1129 ], [ 30.13074, -18.11037 ], [ 30.13231, -18.10902 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 100, "id": 3 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12793, -18.1129 ], [ 30.12736, -18.11334 ], [ 30.12263, -18.11417 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150, "id": 4 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.13383, -18.11011 ], [ 30.13231, -18.10902 ], [ 30.13049, -18.10708 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150, "id": 5 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12632, -18.11352 ], [ 30.12644, -18.11308 ], [ 30.12642, -18.11291 ], [ 30.12715, -18.11116 ], [ 30.12546, -18.10933 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 150, "id": 6 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12586, -18.10977 ], [ 30.12692, -18.10879 ], [ 30.12731, -18.10843 ], [ 30.12748, -18.10829 ], [ 30.12788, -18.10795 ], [ 30.12866, -18.10876 ], [ 30.13049, -18.10708 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 100, "id": 7 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.13092, -18.10754 ], [ 30.12936, -18.10895 ], [ 30.13073, -18.11037 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 75, "id": 8 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.13003, -18.10835 ], [ 30.13143, -18.10978 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 75, "id": 9 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.13162, -18.10828 ], [ 30.13137, -18.10854 ], [ 30.13119, -18.10874 ], [ 30.13149, -18.10908 ], [ 30.13156, -18.10916 ], [ 30.13119, -18.10874 ], [ 30.13066, -18.10818 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 75, "id": 10 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.13007, -18.10968 ], [ 30.13033, -18.10947 ], [ 30.12985, -18.10898 ], [ 30.13033, -18.10947 ], [ 30.13076, -18.10989 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 75, "id": 11 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12877, -18.11214 ], [ 30.12771, -18.1111 ], [ 30.12809, -18.1106 ], [ 30.12847, -18.11032 ], [ 30.12881, -18.11005 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 75, "id": 12 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12722, -18.11194 ], [ 30.12758, -18.11221 ], [ 30.1278, -18.11245 ], [ 30.12855, -18.11186 ], [ 30.1295, -18.11104 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 75, "id": 13 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12974, -18.11126 ], [ 30.1295, -18.11104 ], [ 30.1289, -18.11042 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 75, "id": 14 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12908, -18.1114 ], [ 30.12849, -18.11078 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 75, "id": 15 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12822, -18.11211 ], [ 30.12751, -18.1114 ], [ 30.12771, -18.1111 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 75, "id": 16 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12632, -18.10934 ], [ 30.12709, -18.11013 ], [ 30.12839, -18.10893 ], [ 30.128, -18.10856 ], [ 30.12692, -18.10952 ], [ 30.12655, -18.10913 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 100, "id": 17 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12669, -18.11228 ], [ 30.12562, -18.11182 ], [ 30.12443, -18.11089 ], [ 30.12308, -18.11191 ], [ 30.12343, -18.11345 ], [ 30.12503, -18.11314 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 75, "id": 18 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12483, -18.1112 ], [ 30.12406, -18.11188 ], [ 30.12419, -18.11274 ], [ 30.1252, -18.11259 ], [ 30.12518, -18.11235 ], [ 30.1255, -18.11173 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 75, "id": 19 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12542, -18.11368 ], [ 30.12574, -18.11298 ], [ 30.126, -18.11239 ] ] ] } },
{ "type": "Feature", "properties": { "diameter": 75, "id": 20 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12323, -18.11256 ], [ 30.12211, -18.11271 ], [ 30.12211, -18.11306 ], [ 30.12217, -18.11331 ], [ 30.12297, -18.11318 ] ] ] } }
]
}
""",
      ),
      GeoJsonProperties(
        name: "manhole kaguvi 2",
        color: Colors.grey,
        description:
            "Kaguvi Sewer Line is a Lorem ipsulum whateverKaguvi Sewer Line is a Lorem ipsulum whateverKaguvi Sewer Line ",
        geoJsonString: """{
"type": "FeatureCollection",
"name": "manhole kaguvi 2",
"crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
"features": [
{ "type": "Feature", "properties": { "id": 1 }, "geometry": { "type": "Point", "coordinates": [ 30.12295226, -18.11318504 ] } },
{ "type": "Feature", "properties": { "id": 2 }, "geometry": { "type": "Point", "coordinates": [ 30.12342611, -18.11346427 ] } },
{ "type": "Feature", "properties": { "id": 3 }, "geometry": { "type": "Point", "coordinates": [ 30.12477848, -18.11321973 ] } },
{ "type": "Feature", "properties": { "id": 4 }, "geometry": { "type": "Point", "coordinates": [ 30.12469436, -18.11284961 ] } },
{ "type": "Feature", "properties": { "id": 5 }, "geometry": { "type": "Point", "coordinates": [ 30.12551033, -18.1134827 ] } },
{ "type": "Feature", "properties": { "id": 6 }, "geometry": { "type": "Point", "coordinates": [ 30.12571231, -18.11361509 ] } },
{ "type": "Feature", "properties": { "id": 7 }, "geometry": { "type": "Point", "coordinates": [ 30.12637086, -18.11214863 ] } },
{ "type": "Feature", "properties": { "id": 8 }, "geometry": { "type": "Point", "coordinates": [ 30.1272195, -18.11115741 ] } },
{ "type": "Feature", "properties": { "id": 9 }, "geometry": { "type": "Point", "coordinates": [ 30.1264048, -18.11314664 ] } },
{ "type": "Feature", "properties": { "id": 10 }, "geometry": { "type": "Point", "coordinates": [ 30.12824042, -18.1121325 ] } },
{ "type": "Feature", "properties": { "id": 11 }, "geometry": { "type": "Point", "coordinates": [ 30.12848399, -18.11235824 ] } },
{ "type": "Feature", "properties": { "id": 12 }, "geometry": { "type": "Point", "coordinates": [ 30.12869105, -18.11177098 ] } },
{ "type": "Feature", "properties": { "id": 13 }, "geometry": { "type": "Point", "coordinates": [ 30.12909841, -18.11139079 ] } },
{ "type": "Feature", "properties": { "id": 14 }, "geometry": { "type": "Point", "coordinates": [ 30.12952612, -18.11105133 ] } },
{ "type": "Feature", "properties": { "id": 15 }, "geometry": { "type": "Point", "coordinates": [ 30.13037137, -18.11035205 ] } },
{ "type": "Feature", "properties": { "id": 16 }, "geometry": { "type": "Point", "coordinates": [ 30.13053771, -18.11053366 ] } },
{ "type": "Feature", "properties": { "id": 17 }, "geometry": { "type": "Point", "coordinates": [ 30.13100277, -18.11012631 ] } },
{ "type": "Feature", "properties": { "id": 18 }, "geometry": { "type": "Point", "coordinates": [ 30.13139654, -18.10980721 ] } },
{ "type": "Feature", "properties": { "id": 20 }, "geometry": { "type": "Point", "coordinates": [ 30.13200756, -18.1092505 ] } },
{ "type": "Feature", "properties": { "id": 21 }, "geometry": { "type": "Point", "coordinates": [ 30.1322995, -18.10952886 ] } },
{ "type": "Feature", "properties": { "id": 22 }, "geometry": { "type": "Point", "coordinates": [ 30.13250317, -18.10933197 ] } },
{ "type": "Feature", "properties": { "id": 23 }, "geometry": { "type": "Point", "coordinates": [ 30.13086359, -18.10763298 ] } },
{ "type": "Feature", "properties": { "id": 24 }, "geometry": { "type": "Point", "coordinates": [ 30.13045963, -18.10714756 ] } },
{ "type": "Feature", "properties": { "id": 25 }, "geometry": { "type": "Point", "coordinates": [ 30.12867408, -18.1086887 ] } },
{ "type": "Feature", "properties": { "id": 26 }, "geometry": { "type": "Point", "coordinates": [ 30.12826673, -18.10833566 ] } },
{ "type": "Feature", "properties": { "id": 28 }, "geometry": { "type": "Point", "coordinates": [ 30.12787126, -18.10792152 ] } },
{ "type": "Feature", "properties": { "id": 28 }, "geometry": { "type": "Point", "coordinates": [ 30.12727212, -18.11029264 ] } },
{ "type": "Feature", "properties": { "id": 29 }, "geometry": { "type": "Point", "coordinates": [ 30.12685204, -18.11080352 ] } },
{ "type": "Feature", "properties": { "id": 30 }, "geometry": { "type": "Point", "coordinates": [ 30.12917818, -18.10908332 ] } },
{ "type": "Feature", "properties": { "id": 31 }, "geometry": { "type": "Point", "coordinates": [ 30.1281632, -18.11056845 ] } },
{ "type": "Feature", "properties": { "id": 32 }, "geometry": { "type": "Point", "coordinates": [ 30.12309848, -18.11194665 ] } },
{ "type": "Feature", "properties": { "id": 33 }, "geometry": { "type": "Point", "coordinates": [ 30.12394712, -18.11174298 ] } }
]
}
""",
      ),
      GeoJsonProperties(
        name: "substation",
        color: Colors.amber,
        description:
            "Kaguvi Sewer Line is a Lorem ipsulum whateverKaguvi Sewer Line is a Lorem ipsulum whateverKaguvi Sewer Line ",
        geoJsonString: """{
"type": "FeatureCollection",
"name": "substation",
"crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
"features": [
{ "type": "Feature", "properties": { "id": 1, "substation": 1 }, "geometry": { "type": "MultiPolygon", "coordinates": [ [ [ [ 30.126690655009959, -18.108330621289337 ], [ 30.126639446285981, -18.108251838637067 ], [ 30.126856098579729, -18.108094273332522 ], [ 30.126919124701544, -18.108180934250022 ], [ 30.126690655009959, -18.108330621289337 ] ] ] ] } },
{ "type": "Feature", "properties": { "id": 2, "substation": 2 }, "geometry": { "type": "MultiPolygon", "coordinates": [ [ [ [ 30.132355127708294, -18.109043604292388 ], [ 30.132445727758405, -18.108988456435799 ], [ 30.132548145206357, -18.109110569546822 ], [ 30.132477240819313, -18.10916571740341 ], [ 30.132355127708294, -18.109043604292388 ] ] ] ] } },
{ "type": "Feature", "properties": { "id": 3, "substation": 3 }, "geometry": { "type": "MultiPolygon", "coordinates": [ [ [ [ 30.126615811490293, -18.113774502561302 ], [ 30.126804889855745, -18.113995093987661 ], [ 30.126930942099378, -18.113888737407098 ], [ 30.126773376794834, -18.113703598174258 ], [ 30.126615811490293, -18.113774502561302 ] ] ] ] } }
]
}
""",
      ),
      GeoJsonProperties(
          name: "powerline kaguvi 2",
          color: Colors.red,
          description:
              "Kaguvi Sewer Line is a Lorem ipsulum whateverKaguvi Sewer Line is a Lorem ipsulum whateverKaguvi Sewer Line ",
          geoJsonString: """{
"type": "FeatureCollection",
"name": "powerline kaguvi 2",
"crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
"features": [
{ "type": "Feature", "properties": { "voltage": 33 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.121030121444221, -18.112986676038584 ], [ 30.12666554303954, -18.108291722354771 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 33 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12688662685747, -18.108135634224954 ], [ 30.129677502314181, -18.106162128785549 ], [ 30.132383686419718, -18.109029817328238 ], [ 30.132513677795966, -18.109147991306646 ], [ 30.132627912641759, -18.109301617478575 ], [ 30.135881636180585, -18.1071350945411 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 33 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.121025197528443, -18.112982736905966 ], [ 30.123995303519084, -18.115976477692296 ], [ 30.126742848517058, -18.113922220034308 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 33 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.126878748592222, -18.113825711285273 ], [ 30.127615366390966, -18.113841467815732 ], [ 30.132628897424908, -18.109301617478568 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 0 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12212421552762, -18.112754267214374 ], [ 30.122904163785108, -18.112596701909833 ], [ 30.122990824702608, -18.113156058740962 ], [ 30.122242389506027, -18.113329380575959 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 0 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.122908102917719, -18.112598671476142 ], [ 30.123233081358343, -18.112586854078302 ], [ 30.123392616229186, -18.113475128482659 ], [ 30.125007660600755, -18.11315999787357 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 0 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.124141051425767, -18.111151040240642 ], [ 30.123116876946234, -18.11193886676336 ], [ 30.123235050924638, -18.112592762777211 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 0 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.123238990057249, -18.112586854078288 ], [ 30.123238990057249, -18.112586854078288 ], [ 30.123510790207586, -18.112512010558628 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 0 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.124141051425767, -18.111151040240639 ], [ 30.124241991698987, -18.111067333672597 ], [ 30.125502514135338, -18.112059995091222 ], [ 30.126046114436001, -18.112272708252355 ], [ 30.125478879339642, -18.113572622014839 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 0 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.125486757604872, -18.113572622014839 ], [ 30.125400096687372, -18.113808969971654 ], [ 30.123052373649674, -18.114171370172102 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 0 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.124582726670059, -18.111336179473479 ], [ 30.124275474326186, -18.111840388448012 ], [ 30.124464552691638, -18.112848806397089 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 0 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.125488727171167, -18.109532056736438 ], [ 30.126969841033876, -18.110824092233695 ], [ 30.127269215112506, -18.110304126728703 ], [ 30.12604020573707, -18.109075117353264 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 0 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.126323823285247, -18.109358734901441 ], [ 30.127867963269772, -18.107909134099643 ], [ 30.128651850659875, -18.108752108478953 ], [ 30.130357495081554, -18.107215846759654 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 0 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.126918632309895, -18.109504482808152 ], [ 30.128009772043857, -18.108563030113505 ], [ 30.128376111376923, -18.10897663903793 ], [ 30.12734011949955, -18.109906274334737 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 0 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.127710397965224, -18.107779142723398 ], [ 30.127489806538861, -18.108047003741124 ], [ 30.12801075682701, -18.108563030113508 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 0 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.127711382748384, -18.107778157940253 ], [ 30.127866978486619, -18.107909134099657 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 0 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.129840483926021, -18.108196690780446 ], [ 30.131465376129125, -18.109801887320479 ], [ 30.132142906938661, -18.109187382632761 ], [ 30.130681488739022, -18.107757477494033 ], [ 30.130315149405959, -18.10811593856187 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 0 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.129767609972674, -18.108561060547206 ], [ 30.129145227019727, -18.109120417378335 ], [ 30.129889723083693, -18.109825522116168 ], [ 30.130551497362781, -18.110526687721382 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 0 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.131481132659577, -18.10978613079002 ], [ 30.130575132158452, -18.110550322517057 ], [ 30.128495270138476, -18.112315053927944 ], [ 30.127392313006673, -18.113386497998842 ], [ 30.125414868434653, -18.113811924321109 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 0 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.127163843315085, -18.111204218530915 ], [ 30.12642328638373, -18.113134393511572 ], [ 30.12717959984554, -18.113016219533165 ], [ 30.127951669837802, -18.112338688723629 ], [ 30.127455339128492, -18.111755697096818 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 0 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.127952654620959, -18.112338688723629 ], [ 30.129639588162721, -18.1108368944147 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 0 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.128213622156604, -18.112121051646728 ], [ 30.127583360938431, -18.111435642571962 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 0 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.128646926744096, -18.111735016650595 ], [ 30.127851221956153, -18.110923555332196 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 0 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.129056596535911, -18.111348981654466 ], [ 30.128434213582963, -18.110710842171063 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 0 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.129482022858177, -18.110962946658333 ], [ 30.128938422557503, -18.110442981153341 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 0 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.12981290999771, -18.108946110760179 ], [ 30.131057675903602, -18.110143607074708 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 0 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.127402160838162, -18.113413087144 ], [ 30.126858560537489, -18.113822756935814 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 0 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.132125180841854, -18.109172610885469 ], [ 30.132440311450942, -18.109078071702744 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 0 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.126846743139648, -18.1081957059973 ], [ 30.12771335231464, -18.107786036205489 ] ] ] } },
{ "type": "Feature", "properties": { "voltage": 0 }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 30.126972795383281, -18.110819168317956 ], [ 30.127161873748733, -18.111205203314086 ], [ 30.127642447927592, -18.111165811987952 ] ] ] } }
]
}
"""),
      GeoJsonProperties(
        name: "transformer",
        color: Colors.yellow,
        description:
            "Kaguvi Sewer Line is a Lorem ipsulum whateverKaguvi Sewer Line is a Lorem ipsulum whateverKaguvi Sewer Line ",
        geoJsonString: """{
"type": "FeatureCollection",
"name": "transformer",
"crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
"features": [
{ "type": "Feature", "properties": { "id": 1 }, "geometry": { "type": "Point", "coordinates": [ 30.123498480418139, -18.112514964908083 ] } },
{ "type": "Feature", "properties": { "id": 2 }, "geometry": { "type": "Point", "coordinates": [ 30.127394282572965, -18.113405208878749 ] } },
{ "type": "Feature", "properties": { "id": 3 }, "geometry": { "type": "Point", "coordinates": [ 30.124581741886871, -18.11134110338924 ] } },
{ "type": "Feature", "properties": { "id": 4 }, "geometry": { "type": "Point", "coordinates": [ 30.126433134215247, -18.113113713065353 ] } },
{ "type": "Feature", "properties": { "id": 5 }, "geometry": { "type": "Point", "coordinates": [ 30.129655344693163, -18.110836894414696 ] } },
{ "type": "Feature", "properties": { "id": 6 }, "geometry": { "type": "Point", "coordinates": [ 30.127717291447272, -18.107788005771781 ] } },
{ "type": "Feature", "properties": { "id": 7 }, "geometry": { "type": "Point", "coordinates": [ 30.126314960236833, -18.10935578055199 ] } },
{ "type": "Feature", "properties": { "id": null }, "geometry": { "type": "Point", "coordinates": [ 30.132105485178798, -18.109198215247449 ] } }
]
}
""",
      )
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
// <<<<<<< HEAD
      home:  SplashScreen(),
// =======
//       home: GeojsonMapPage(
//         geoJSONs: geoJsons,
//         geoJSON: testGeoJson,
//         faultPoint: [
//           LatLng(-18.11318504, 30.12295226),
//           LatLng(-18.11318504, 30.13296226),
//         ],
//       ),
// >>>>>>> ea8f9144c4fbf2ddae82375aac127f75c20abda4
    );
  }
}
