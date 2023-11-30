import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputComponent extends StatelessWidget {
  final TextEditingController? controller;
  final double height;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? style;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;
  final InputBorder? focusedBorder;
  final String? hintText;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final Color fillColor;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final bool obscureText;
  final Widget? suffixIcon;
  final Function()? suffixIconTap;

  const InputComponent({
    super.key,
    this.controller,
    this.height = AppSize.size40,
    this.enabled = true,
    this.inputFormatters,
    this.style,
    this.border,
    this.enabledBorder,
    this.disabledBorder,
    this.focusedBorder,
    this.hintText,
    this.hintStyle,
    this.contentPadding,
    this.fillColor = AppColors.pickledBlueWood,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.keyboardType,
    this.textInputAction = TextInputAction.done,
    this.focusNode,
    this.obscureText = false,
    this.onChanged,
    this.suffixIcon,
    this.suffixIconTap,
  });

  @override
  Widget build(BuildContext context) {
    outlineBorder(Color color, double radius) => OutlineInputBorder(
          borderSide: BorderSide(color: color, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        );

    const primaryColor = AppColors.pickledBlueWood;
    const disabledColor = AppColors.manatee;
    const radius = AppSize.radius8;

    InputDecoration decoration = InputDecoration(
      filled: true,
      fillColor: fillColor,
      counterText: "",
      border: border ?? const OutlineInputBorder(),
      enabledBorder: enabledBorder ?? outlineBorder(primaryColor, radius),
      disabledBorder: disabledBorder ?? outlineBorder(disabledColor, radius),
      focusedBorder: focusedBorder ?? outlineBorder(primaryColor, radius),
      hintText: hintText,
      hintStyle: hintStyle ??
          NotoSansStyle.normal.copyWith(
            color: AppColors.manatee,
          ),
      contentPadding: contentPadding ?? const EdgeInsets.all(AppSize.size10),
      isDense: true,
    );

    if (suffixIcon != null) {
      decoration = decoration.copyWith(
        suffix: Container(
          padding: const EdgeInsets.only(top: 1, bottom: 1, right: 1),
          child: () {
            if (suffixIconTap == null) {
              return suffixIcon;
            } else {
              return SizedBox();
            }
          }(),
        ),
        suffixIconConstraints: BoxConstraints.expand(height: height, width: 0),
      );
    }

    return TextField(
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      controller: controller,
      obscureText: obscureText,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: style ?? _styleDefault(),
      decoration: decoration,
      enabled: enabled,
      maxLines: obscureText ? 1 : maxLines,
      minLines: minLines,
      maxLength: maxLength,
      expands: false,
      cursorColor: AppColors.dodgerBlue,
      onChanged: (text) {
        onChanged?.call(text);
      },
      inputFormatters: inputFormatters ?? _defaultFormat(),
    );
  }

  List<TextInputFormatter> _defaultFormat() {
    return [FilteringTextInputFormatter.singleLineFormatter];
  }

  TextStyle _styleDefault() {
    return NotoSansStyle.normal.copyWith(color: AppColors.white);
  }
}
