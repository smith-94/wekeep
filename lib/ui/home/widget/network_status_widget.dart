
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wekeep/core/utils/size_utils.dart';

class NetworkStatusWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: mediaQueryData.size.width* 0.81,
        height: 56,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child:
        Row(
          children: [
            SizedBox(
              width: 100.h,
              child: Padding(
                padding: EdgeInsets.only(left: 35.h),
                child:
                Text(
                  '지속시간',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4000000059604645),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(width: 35.h),
            SizedBox(
              width: 30.h,
              child: Text(
                '7',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(width: 15.h),
            SizedBox(
              width: 30.h,
              child: Text(
                '분째',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.4000000059604645),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            SizedBox(
              width: 120.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: mediaQueryData.size.width * 0.15,
                    height: 25,
                    decoration: ShapeDecoration(
                      color: Color(0xFFC1282C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '통신 불량',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
  }

}
