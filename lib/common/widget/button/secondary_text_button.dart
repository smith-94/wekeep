import 'package:wekeep/common/const/const.dart';
import 'package:flutter/material.dart';

class SecondaryTextButton extends StatelessWidget {
  const SecondaryTextButton({
    Key? key,
    this.disabled = true,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  final String text;
  final bool disabled;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          side: BorderSide(
            width: 0, 
            color: disabled ? CustomColor.primaryBlue400 : CustomColor.primaryBlue300
          ),
          backgroundColor: disabled ? CustomColor.primaryBlue400 : CustomColor.primaryBlue300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: CustomText.headLine8.copyWith(
            color: CustomColor.primaryBlue100,
          )
        ),
      ),
    );
  }
}
