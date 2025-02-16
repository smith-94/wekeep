import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChildLocationScreen(),
    );
  }
}

class ChildLocationScreen extends StatefulWidget {
  @override
  _ChildLocationScreenState createState() => _ChildLocationScreenState();
}

class _ChildLocationScreenState extends State<ChildLocationScreen> {
  final LatLng _childLocation = LatLng(37.5665, 126.9780); // 현재 위치 (서울 예시)
  final LatLng _destination = LatLng(37.5670, 126.9860); // 목적지 예시
  final List<LatLng> _route = [
    LatLng(37.5665, 126.9780),
    LatLng(37.5670, 126.9860),

  ]; // 이동 경로 예시

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 100,
              child: FlutterMap(
                options: MapOptions(
                  center: _childLocation,
                  zoom: 15,
                ),
                children: [
                  TileLayer(
                    urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                  ),
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: _route,
                        color: Colors.black,
                        strokeWidth: 5.0,
                      ),
                    ],
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        width: 40.0,
                        height: 40.0,
                        point: _childLocation,
                        child: Icon(
                          Icons.person_pin,
                          color: Colors.black,
                          size: 30.0,
                        ),
                      ),
                      Marker(
                        width: 40.0,
                        height: 40.0,
                        point: _destination,
                        child: Icon(
                          Icons.pin_drop,
                          color: Colors.black,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      color: Color(0xFFFFF59D),
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('assets/images/babyface.png'), // 프로필 사진 추가
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '하늘 태권도 학원',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '10:00 - 12:00',
                                  style: TextStyle(fontSize: 16, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
