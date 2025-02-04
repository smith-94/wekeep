import 'package:flutter/material.dart';
import 'package:wekeep/core/app_export.dart';
import 'package:wekeep/ui/common/widgets/custom_drop_down.dart';
import 'package:wekeep/ui/common/widgets/custom_image_view.dart';

// ignore: must_be_immutable
class AppbarDropdown1 extends StatelessWidget {
  AppbarDropdown1({
    Key? key,
    required this.hintText,
    required this.items,
    required this.onTap,
    this.margin,
  }) : super(
          key: key,
        );

  String? hintText;

  List<String> items;

  Function(String) onTap;

  EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: CustomDropDown(
        width: 277.h,
        icon: Container(
          margin: EdgeInsets.only(left: 12.h),
          child: CustomImageView(
            svgPath: ImageConstant.imgArrowdownGray50001,
          ),
        ),
        hintText: "lbl199",
        items: items,
        onChanged: (value) {
          onTap(value!);
        },
      ),
    );
  }
}
