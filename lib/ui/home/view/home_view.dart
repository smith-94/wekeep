import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:wekeep/common/const/color.dart';
import 'package:wekeep/riverpod/provider/sensor_provider.dart';
import 'package:wekeep/ui/home/widget/airplane_status_widget.dart';
import 'package:wekeep/ui/home/widget/network_status_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:wekeep/core/app_export.dart';
import 'package:wekeep/ui/home/widget/storage_status_widget.dart';
import 'package:sensors_plus/sensors_plus.dart';

class HomeView extends ConsumerWidget {

  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  StreamSubscription<GyroscopeEvent>? _gyroscopeSubscription;
  bool isRecording = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sensorState = ref.watch(sensorProvider);
    final sensorNotifier = ref.read(sensorProvider.notifier);
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
                    '항공기 상태',
                    style: TextStyle(
                      color: Color(0xFF233B6E),
                      fontSize: 13,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 5.v),
                  AirplaneStatusWidget(),
                  SizedBox(height: 15.v,),
                  Text(
                    '통신 상태 (클라우드 서버)',
                    style: TextStyle(
                      color: Color(0xFF233B6E),
                      fontSize: 13,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 5.v),
                  NetworkStatusWidget(),
                  SizedBox(height: 10.v),
                  Text(
                    '저장 공간',
                    style: TextStyle(
                      color: Color(0xFF233B6E),
                      fontSize: 13,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 5.v),
                  StorageStatusWidget(),
                ],
              ),
            ),
            ),
        ),
        floatingActionButton: SpeedDial(
          activeBackgroundColor: Color(0xFF233B6E),
          buttonSize: Size(90, 90), // FAB 크기 키우기
          childrenButtonSize: Size(90, 90), // 펼쳐지는 버튼 크기 키우기
          spaceBetweenChildren: 10,
          backgroundColor: Color(0xFF233B6E),
          overlayColor: Colors.transparent,
          animatedIcon: AnimatedIcons.menu_close,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7), // 네모난 모양을 위해 둥근 모서리 설정
          ),
          children: [
            SpeedDialChild(
              child: Icon(
                isRecording ? Icons.stop : Icons.play_arrow,
                color: Color(0xFF233B6E),
                size: 60,),
              label: isRecording ? "측정 중지" : "측정 시작",
              onTap: ((){
                  isRecording = !isRecording;
                  if(isRecording){
                    sensorNotifier.startListening();
                  }
                  else{
                    sensorNotifier.stopListening();
                  }
              }),
            ),
            SpeedDialChild(
              child: Icon(Icons.cloud_upload,color: Color(0xFF233B6E),size: 60,),
              label: "업로드",
              onTap: ((){

              }),
            ),
          ],
        ),
      )
  );
  }
}
