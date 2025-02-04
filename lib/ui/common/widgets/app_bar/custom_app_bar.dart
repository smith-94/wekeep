import 'package:flutter/material.dart';
import 'package:wekeep/core/app_export.dart';
import 'package:wekeep/ui/common/widgets/custom_image_view.dart';
// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
    this.backgroundColor,
  }) : super(
          key: key,
        );

  final double? height;

  final Style? styleType;

  final double? leadingWidth;

  final Widget? leading;

  final Widget? title;

  final bool? centerTitle;

  final List<Widget>? actions;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? 90.v,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor ?? Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        mediaQueryData.size.width,
        height ?? 90.v,
      );
  _getStyle() {
    switch (styleType) {
      case Style.bgFill_1:
        return Stack(
          children: [
            Container(
              height: 90.v,
              width:mediaQueryData.size.width,
              decoration: BoxDecoration(
                color: appTheme.whiteA700,
              ),
            ),
            Container(
              height: 1.v,
              width: mediaQueryData.size.width,
              margin: EdgeInsets.only(top: 90.v),
              decoration: BoxDecoration(
                color: appTheme.gray300,
              ),
            ),
          ],
        );
      case Style.bgFill_2:
        return Container(
          height: 110.v,
          width: mediaQueryData.size.width,
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
          ),
        );
      case Style.bgFill:
        return Container(
          height: 90.v,
          width: mediaQueryData.size.width,
          decoration: BoxDecoration(
            color: appTheme.whiteA700,
          ),
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgFill_1,
  bgFill_2,
  bgFill,
}
