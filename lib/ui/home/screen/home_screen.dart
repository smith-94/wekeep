import 'dart:async';
import 'package:wekeep/ui/home/view/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:wekeep/core/app_export.dart';
import 'package:wekeep/ui/home/widget/storage_status_widget.dart';
import 'package:sensors_plus/sensors_plus.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
    );
  }

}
