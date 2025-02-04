import 'package:flutter/material.dart';
import 'package:wekeep/core/app_export.dart';
import 'package:wekeep/ui/common/widgets/custom_search_view.dart';
import 'package:wekeep/ui/common/widgets/custom_image_view.dart';
// ignore: must_be_immutable
class AppbarSearchview extends StatelessWidget {
  AppbarSearchview({
    Key? key,
    this.hintText,
    this.controller,
    this.margin,
  }) : super(
          key: key,
        );

  String? hintText;

  TextEditingController? controller;

  EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: CustomSearchView(
        width: 313.h,
        controller: controller,
        hintText: "lbl152",
        prefix: Container(
          margin: EdgeInsets.fromLTRB(13.h, 13.v, 14.h, 13.v),
          child: CustomImageView(
            svgPath: ImageConstant.imgSearchGray50001,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 56.v,
        ),
        suffix: Container(
          margin: EdgeInsets.fromLTRB(30.h, 18.v, 15.h, 18.v),
          child: CustomImageView(
            svgPath: ImageConstant.imgFrame,
          ),
        ),
        suffixConstraints: BoxConstraints(
          maxHeight: 56.v,
        ),
      ),
    );
  }
}
