import 'package:artispark/apps/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.keyboardType,
        this.textInputAction,
      this.fillColor = Colors.white,
      this.style,
      this.inputFormatters,
      this.hintext,
      this.suffixIcon,
      this.isObsecure = false,
      this.controller,
      this.validator,
      this.onChanged,
      this.enabled = true,
      this.lines = 1})
      : super(key: key);

  final String? hintext;
  final IconButton? suffixIcon;
  final bool isObsecure;
  final bool enabled;
  final TextEditingController? controller;
  final dynamic validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final List<TextInputFormatter>? inputFormatters;
  final Color? fillColor;
  final dynamic onChanged;
  final int lines;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: TextFormField(
        enabled: enabled,
        textInputAction: textInputAction,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.transparent
                  // color: Colors.red,
                  // width: 2
                  ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: primaryColor, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            fillColor: fillColor,
            filled: true,
            hintText: hintext,
            suffixIcon: suffixIcon,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20.3, vertical: 15)),
        obscureText: isObsecure,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        style: style,
        maxLines: lines,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
      ),
    );
  }
}
