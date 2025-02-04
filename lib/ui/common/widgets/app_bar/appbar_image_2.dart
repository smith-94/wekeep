import 'package:flutter/material.dart';
import 'package:wekeep/core/app_export.dart';
import 'package:wekeep/ui/common/widgets/custom_image_view.dart';

// ignore: must_be_immutable
class AppbarImage2 extends StatelessWidget {
  AppbarImage2({
    Key? key,
    this.imagePath,
    this.svgPath,
    this.margin,
    this.onTap,
    this.width,
    this.height,
  }) : super(
          key: key,
        );

  String? imagePath;

  String? svgPath;

  EdgeInsetsGeometry? margin;

  Function? onTap;
  double? width;
  double? height;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          svgPath: svgPath,
          imagePath: imagePath,
          height: 40.adaptSize,
          width: 40.adaptSize,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
