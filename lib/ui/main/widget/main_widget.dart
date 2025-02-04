import 'dart:convert';
import 'dart:io';

import 'package:costbridge/routes/routes.dart';
import 'package:costbridge/ui/costbilling/dto/costbilling.dart';
import 'package:costbridge/ui/main/viewmodel/main_viewmodel.dart';
import 'package:costbridge/ui/main/widget/bottomsheet/main_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:costbridge/core/app_export.dart';
import 'package:provider/provider.dart';

class MainWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    const List<BoxShadow> shadow = [
      BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 6)
    ];
    return Scaffold(
      body: Container(
        color: Colors.white70,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 50.h,right: 10.h,top: 120.h),
              child: SizedBox(
                height: 0.v,
                width: mediaQueryData.size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  ],
                ),
              ),
            ),
            //SizedBox(height: 30.v,),
          ],
        ),
      ),
      bottomSheet: MainBottomSheetWidget()
    );

  }

}

