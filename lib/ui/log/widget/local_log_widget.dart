import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wekeep/core/app_export.dart';
import 'package:wekeep/ui/log/enum/local_log_status.dart';

class LocalLogWidget extends StatelessWidget{

  final LocalLogStatus localLogStatus;

  const LocalLogWidget({super.key, required this.localLogStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaQueryData.size.width * 0.85,
      height: 40,
      decoration: ShapeDecoration(
        color: localLogStatus.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 90.h,
              child: Text(
                localLogStatus.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(width: 10.h,),
            SizedBox(
              width: 100.h,
              child: Text(
                '15분 지속',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            SizedBox(
              width: 130.h,
              child: Text(
                '2024.10.08 18:00',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
