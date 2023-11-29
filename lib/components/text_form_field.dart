import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/utils/texts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.prefixIcon,
      this.validator,
      this.textCapitalization,
      this.obscureText,
      this.onFieldSubmitted,
      this.controller});

  final IconData? prefixIcon;
  final TextEditingController? controller;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final TextCapitalization? textCapitalization;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      style: Texts.bodyMediumBlack(context),
      validator: validator,
      inputFormatters:
          prefixIcon != null ? [LengthLimitingTextInputFormatter(20)] : [],
      controller: controller,
      obscureText: obscureText ?? false,
      onFieldSubmitted: onFieldSubmitted,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      decoration: InputDecoration(
        hintText: prefixIcon == null ? 'Digite seu texto' : null,
        hintStyle: Texts.bodyMediumGrey(context),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: Colors.black,
              )
            : null,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
