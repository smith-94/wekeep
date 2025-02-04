import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wekeep/core/app_export.dart';
import 'package:wekeep/ui/log/enum/cloud_log_status.dart';

class CloudLogWidget extends StatelessWidget{

  final CloudLogStatus cloudLogStatus;
  final DateTime sendDate;
  final String modelName;
  final int sendTime;
  const CloudLogWidget({super.key, required this.cloudLogStatus, required this.sendDate, required this.modelName, required this.sendTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaQueryData.size.width * 0.85,
      height: 40,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.30, color: Color(0xFF233B6E)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20.v),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 40.h,
              child: Text(
                cloudLogStatus.name,
                style: TextStyle(
                  color: Color(0xFF193367),
                  fontSize: 10,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              width: 70.h,
              child: Text(
                '${sendTime}시 전송',
                style: TextStyle(
                  color: Color(0xFF193367),
                  fontSize: 10,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                ),
              )
            ),
            SizedBox(
              width: 160.h,
              child: Text(
                '${modelName}',
                style: TextStyle(
                  color: Color(0xFF193367),
                  fontSize: 10,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w800,
                ),
              )
            ),
            SizedBox(
              width: 70.h,
              child: Text(
                '${sendTime}',
                style: TextStyle(
                  color: Color(0xFF193367),
                  fontSize: 10,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
