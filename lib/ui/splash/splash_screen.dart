import 'dart:async';

import 'package:costbridge/provider/member_provider.dart';
import 'package:costbridge/singleton/MemberViewModel.dart';
import 'package:flutter/material.dart';
import 'package:costbridge/core/app_export.dart';
import 'package:costbridge/routes/routes.dart';
import 'package:costbridge/ui/login/view/login_screen.dart';
import 'package:costbridge/ui/common/widgets/custom_image_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//스플래쉬 [smith]

class Splash extends StatefulWidget {
  @override
  _Splash createState() => _Splash();
}

class _Splash extends State<Splash> {

  @override
  void initState() {
    Timer(Duration(milliseconds: 3000), () {
      if(MemberStore.instance.id  == null || MemberStore.instance.id == ''){
        Navigator.pushNamed(context, Routes.login_screen);
      }
      else{
        Navigator.pushNamed(context, Routes.main);
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: SizedBox(
            // width: MediaQuery.of(context).size.height * 0.5,
            width:  mediaQueryData.size.width,
            child: CustomImageView(
              fit: BoxFit.fill,
              imagePath: ImageConstant.logo,
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.5,
              alignment: Alignment.center,
            ),
          ),
        ),
      ),
    );
  }
}
