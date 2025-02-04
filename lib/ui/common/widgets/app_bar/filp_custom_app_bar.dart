import 'package:flutter/material.dart';
import 'package:wekeep/core/app_export.dart';
import 'package:wekeep/ui/common/widgets/custom_image_view.dart';
// ignore: must_be_immutable

class ClipperCustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: CustomAppBarClipper(),
            child: Container(
              height: 200,
              color: Color(0xFF233B6E), // 원하는 배경색
              child: Center(
                child: Text(
                  'NOVA AIR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 220),
            child: Center(
              child: Text(
                '항공기 상태',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class CustomAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 30); // 시작점 (왼쪽 하단)
    path.quadraticBezierTo(
      size.width / 2, // 제어점 X
      size.height,    // 제어점 Y
      size.width,     // 끝점 X
      size.height - 30, // 끝점 Y
    );
    path.lineTo(size.width, 0); // 오른쪽 위로 직선
    path.close(); // 경로 닫기
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
