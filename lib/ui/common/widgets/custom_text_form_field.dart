import 'package:costbridge/common/utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:costbridge/core/app_export.dart';

import '../../../common/utils/price_formatter.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    this.alignment,
    this.width,
    this.margin,
    this.controller,
    required this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.readOnly,
    this.tapFunction,
    this.changeFunction,
    this.context,
    this.isOnlyNumber = false,
    this.isDate = false,
    this.isPrice = false,
  });

  final Alignment? alignment;

  final double? width;
  bool? readOnly;
  BuildContext? context;
  final EdgeInsetsGeometry? margin;

  final TextEditingController? controller;

  final FocusNode focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final bool? obscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  final bool isOnlyNumber;
  final bool isDate;
  final bool isPrice;

  Function()? tapFunction;
  ValueChanged<String>? changeFunction;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment ?? Alignment.center,
      child: textFormFieldWidget,
    )
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => Container(
    width: width ?? double.maxFinite,
    margin: margin,
    child: TextFormField(
      inputFormatters:
      isOnlyNumber ?
      (
          isDate ? (
              <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(8),
                DateInputFormatter(),
              ]
          ) : isPrice ? (
              <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                ThousandsSeparatorInputFormatter(),
              ]
          ) : [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))]
      )
          :<TextInputFormatter>[],
      readOnly:  readOnly ?? false,
      controller: controller,
      focusNode: focusNode ?? FocusNode(),
      //focusNode: focusNode,
      autofocus: autofocus!,
      style: textStyle ?? CustomTextStyles.bodyLargeBlack900,
      obscureText: obscureText!,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      maxLines: maxLines ?? 1,
      decoration: decoration,
      validator: validator,
      onTap: tapFunction ?? null,
      onChanged: changeFunction ?? null,
    ),
  );
  InputDecoration get decoration => InputDecoration(
    hintText: hintText ?? "",
    hintStyle: hintStyle ?? CustomTextStyles.bodyLargeBlack900,
    prefixIcon: prefix,
    prefixIconConstraints: prefixConstraints,
    suffixIcon: suffix,
    suffixIconConstraints: suffixConstraints,
    isDense: true,
    contentPadding: contentPadding ?? EdgeInsets.all(20.h),
    fillColor: fillColor ?? appTheme.gray5002,
    filled: filled,
    border: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.h),
          borderSide: BorderSide(
            color: appTheme.gray300,
            width: 1,
          ),
        ),
    enabledBorder: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.h),
          borderSide: BorderSide(
            color: appTheme.gray300,
            width: 1,
          ),
        ),
    focusedBorder: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.h),
          borderSide: BorderSide(
            color: theme.colorScheme.primary,
            width: 1,
          ),
        ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.h),
      borderSide: BorderSide(
        color: appTheme.redA700,
        width: 1,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.h),
      borderSide: BorderSide(
        color: appTheme.redA700,
        width: 1,
      ),
    ),
  );
}

/// Extension on [CustomTextFormField] to facilitate inclusion of all types of border style etc
extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get fillPrimary => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.h),
    borderSide: BorderSide.none,
  );
  static OutlineInputBorder get outlineGray => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.h),
    borderSide: BorderSide(
      color: appTheme.gray300,
      width: 1,
    ),
  );
  static OutlineInputBorder get outlineGrayTL10 => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.h),
    borderSide: BorderSide(
      color: appTheme.gray300,
      width: 1,
    ),
  );
  static OutlineInputBorder get outlineRedA => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.h),
    borderSide: BorderSide(
      color: appTheme.redA400,
      width: 1,
    ),
  );
  static OutlineInputBorder get outlineBlack => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.h),
    borderSide: BorderSide(
      color: appTheme.black900,
      width: 1,
    ),
  );
  static OutlineInputBorder get outlineBlackTL10 => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.h),
    borderSide: BorderSide(
      color: appTheme.black900,
      width: 1,
    ),
  );
  static OutlineInputBorder get outlineGrayTL101 => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.h),
    borderSide: BorderSide(
      color: appTheme.gray300,
      width: 1,
    ),
  );
  static OutlineInputBorder get outlinePrimary => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.h),
    borderSide: BorderSide(
      color: theme.colorScheme.primary,
      width: 1,
    ),
  );
  static OutlineInputBorder get outlineBlueGrayTL10 => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.h),
    borderSide: BorderSide(
      color: appTheme.blueGray100,
      width: 1,
    ),
  );

}
