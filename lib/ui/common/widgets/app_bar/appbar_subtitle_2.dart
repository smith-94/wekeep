import 'package:flutter/material.dart';
import 'package:costbridge/core/app_export.dart';
import 'package:costbridge/ui/common/widgets/custom_image_view.dart';
// ignore: must_be_immutable
class AppbarSubtitle2 extends StatelessWidget {
  AppbarSubtitle2({
    Key? key,
    required this.text,
    this.margin,
    this.onTap,
    this.color,
  }) : super(
          key: key,
        );

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;
  Color? color;
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
          style: theme.textTheme.titleLarge!.copyWith(
            color: color??theme.colorScheme.primaryContainer,
          ),
        ),
      ),
    );
  }
}
