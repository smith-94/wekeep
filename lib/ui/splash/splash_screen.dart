import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wekeep/core/app_export.dart';
import 'package:wekeep/routes/routes.dart';
import 'package:wekeep/ui/common/widgets/custom_image_view.dart';
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
      // if(MemberStore.instance.id  == null || MemberStore.instance.id == ''){
      //   Navigator.pushNamed(context, Routes.login_screen);
      // }
      // else{
      //   Navigator.pushNamed(context, Routes.home);
      // }
      Navigator.pushNamed(context, Routes.login);
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
        backgroundColor: Color(0xFFFFF59D) // 따뜻한 노란색
        ,
        body: Container(
          child: SizedBox(
            // width: MediaQuery.of(context).size.height * 0.5,
            width:  mediaQueryData.size.width,
            child: CustomImageView(
              fit: BoxFit.fill,
              imagePath: ImageConstant.logo,
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.4,
              alignment: Alignment.center,
            ),
          ),
        ),
      ),
    );
  }
}
