import 'package:flutter/material.dart';
import 'package:proheal/core/style/color_contants.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final Widget? iconSuffix;
  final Widget? iconLabel;
  final bool isHidden;

  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;

  const CustomTextField(
      {Key? key,
      this.label,
      required this.isHidden,
      this.iconLabel,
      this.keyboardType,
      this.onChanged,
      this.iconSuffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // height: 56.31,
        width: double.maxFinite,
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        child: TextField(
          maxLines: null,
          autofocus: false,
          onChanged: onChanged,
          autocorrect: false,
          obscureText: isHidden,
          cursorColor: black,
          style: const TextStyle(fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            fillColor: grey3,
            filled: true,
            focusColor: grey3,
            prefixIcon: iconLabel,
            suffixIcon: iconSuffix,
            labelText: label,
            labelStyle: const TextStyle(fontWeight: FontWeight.w400),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: black),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: grey3),
            ),
            errorBorder: OutlineInputBorder(
              gapPadding: 2,
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: black),
            ),
          ),
        ),
      ),
    );
  }
}
