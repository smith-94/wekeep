import 'package:flutter/material.dart';
import 'package:costbridge/core/app_export.dart';
import 'package:costbridge/ui/common/widgets/custom_image_view.dart';
// ignore: must_be_immutable
class AppbarSubtitle1 extends StatelessWidget {
  AppbarSubtitle1({
    Key? key,
    required this.text,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          style: CustomTextStyles.titleLargeBlack900.copyWith(
            color: appTheme.black900,
          ),
        ),
      ),
    );
  }
}
