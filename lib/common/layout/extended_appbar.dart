import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../const/color.dart';
import '../const/font.dart';

class ExtendedAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ExtendedAppbar({
    Key? key,
    required this.title,
    this.leadingDisable = false,
    this.leadginWidget,
    this.leadingOnPressed,
    this.actionDisable = false,
    this.actionWidget,
    this.actionOnPressed,
  }) : super(key: key);

  final String title;
  final bool leadingDisable;
  final Widget? leadginWidget;
  final VoidCallback? leadingOnPressed;
  final bool actionDisable;
  final Widget? actionWidget;
  final VoidCallback? actionOnPressed;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(51.0),
      child: AppBar(
        elevation: 0,
        backgroundColor: CustomColor.white,
        leading: !leadingDisable
            ? leadginWidget ?? IconButton(
                onPressed: leadingOnPressed,
                icon: SvgPicture.asset(
                  'assets/icons/shortcut/arrow_back.svg',
                  width: 24,
                  height: 24,
                ),
              )
            : const SizedBox(),
        title: Text(
          title,
          style: TextStyle(
              color: CustomColor.black,
              fontSize: CustomText.headLine7.fontSize,
              fontFamily: CustomText.headLine7.fontFamily,
              fontWeight: CustomText.headLine7.fontWeight),
        ),
        centerTitle: true,
        actions: !actionDisable
            ? [
                IconButton(
                  onPressed: actionOnPressed,
                  icon: actionWidget ?? SvgPicture.asset(
                    'assets/icons/system/quit.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
              ]
            : null,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(51.0);
}
