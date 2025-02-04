
import 'package:wekeep/ui/log/enum/cloud_log_status.dart';
import 'package:wekeep/ui/log/enum/local_log_status.dart';
import 'package:wekeep/ui/log/widget/cloud_log_widget.dart';
import 'package:wekeep/ui/log/widget/local_log_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:wekeep/core/app_export.dart';

class LogView extends StatefulWidget {
  @override
  State<LogView> createState() => _LogViewState();
}

class _LogViewState extends State<LogView> {

  @override
  Widget build(BuildContext context) {
  return  GestureDetector(
          onTap: () {
        FocusScope.of(context).unfocus();
        },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height * 0.8,
            color: Color(0xFFD6DBED),
            child: Padding(
              padding: EdgeInsets.only(top: 30.v,left: 40.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '데이터 저장로그(로컬 서버)',
                    style: TextStyle(
                      color: Color(0xFF233B6E),
                      fontSize: 13,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 5.v),
                  LocalLogWidget(localLogStatus: LocalLogStatus.MODERATE,),
                  SizedBox(height: 15.v,),
                  LocalLogWidget(localLogStatus: LocalLogStatus.SEVERE),
                  SizedBox(height: 15.v,),
                  LocalLogWidget(localLogStatus: LocalLogStatus.EXTREME),
                  SizedBox(height: 15.v,),
                  LocalLogWidget(localLogStatus: LocalLogStatus.LIGHT),
                  SizedBox(height: 15.v,),
                  LocalLogWidget(localLogStatus: LocalLogStatus.MODERATE),
                  SizedBox(height: 15.v,),
                  LocalLogWidget(localLogStatus: LocalLogStatus.MODERATE),
                  SizedBox(height: 35.v,),
                  Text(
                    '데이터 송신 로그 (클라우드 서버)',
                    style: TextStyle(
                      color: Color(0xFF233B6E),
                      fontSize: 13,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 15.v),
                  CloudLogWidget(cloudLogStatus: CloudLogStatus.SUCCESS,
                    sendDate: DateTime.now(),
                    sendTime: 18,
                    modelName: "MOE123111222",
                  ),
                  SizedBox(height: 10.v),
                  CloudLogWidget(cloudLogStatus: CloudLogStatus.FAIL,
                    sendDate: DateTime.now(),
                    sendTime: 18,
                    modelName: "DOE123111222",
                  ),
                  SizedBox(height: 10.v),
                  CloudLogWidget(cloudLogStatus: CloudLogStatus.SUCCESS,
                    sendDate: DateTime.now(),
                    sendTime: 18,
                    modelName: "COE123111222",
                  ),
                ],
              ),
            ),
            ),
        ),
      )
  );
  }
}
