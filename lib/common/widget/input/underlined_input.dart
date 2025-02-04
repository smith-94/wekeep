import 'package:costbridge/common/const/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UnderlinedInput extends StatelessWidget {
  const UnderlinedInput({
    Key? key,
    this.controller,
    this.onChanged,
    this.hintText = '',
    this.keyboardType,
    this.obscureText = false,
    this.enabled = true,
    this.validator,
    this.errorText,
    this.inputFormatter,
    this.enabledBorder,
    this.focusedBorder,
    this.suffixIcon,
    this.suffixIconConstraints,
  }) : super(key: key);

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool enabled;
  final String? Function(String?)? validator;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatter;
  final Color? enabledBorder;
  final Color? focusedBorder;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextFormField(
        controller: controller,
        validator: validator,
        enabled: enabled,
        onChanged: onChanged,
        keyboardType: keyboardType,
        obscureText: obscureText,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: enabled ? CustomColor.white : CustomColor.lightGray,
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          errorText: errorText,
          errorStyle: CustomText.body8.copyWith(
            color: CustomColor.error
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: CustomColor.error),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: enabledBorder ?? CustomColor.lightGray),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: focusedBorder ?? CustomColor.primaryBlue100),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: enabledBorder ?? CustomColor.lightGray),
          ),
          suffixIcon: suffixIcon,
          suffixIconConstraints: suffixIconConstraints,
        ),
        style: CustomText.body4.copyWith(
          color: CustomColor.extraDarkGray,
          decorationThickness: 0,
        ),
        cursorColor: CustomColor.primaryBlue100,
        inputFormatters: inputFormatter ?? [
          FilteringTextInputFormatter.allow(RegExp('[.!@#\$%^&*()-_|1-9|a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣|ᆞ|ᆢ|ㆍ|ᆢ|ᄀᆞ|ᄂᆞ|ᄃᆞ|ᄅᆞ|ᄆᆞ|ᄇᆞ|ᄉᆞ|ᄋᆞ|ᄌᆞ|ᄎᆞ|ᄏᆞ|ᄐᆞ|ᄑᆞ|ᄒᆞ| ]')),
        ],
      ),
    );
  }
}
