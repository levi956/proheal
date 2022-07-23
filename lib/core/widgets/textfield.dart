import 'package:flutter/material.dart';
import 'package:proheal/core/style/color_contants.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final Widget? iconSuffix;
  final Widget? iconLabel;
  final bool isHidden;
  final String? Function(String? value)? validator;

  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;

  const CustomTextField(
      {Key? key,
      this.label,
      this.validator,
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
        child: TextFormField(
          validator: validator,
          // maxLines: null,
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

class CustomTextField2 extends StatelessWidget {
  final String label;
  final TextInputType? keyboardType;

  final ValueChanged<String>? onChanged;
  final bool isHidden;
  final String? hintText;

  const CustomTextField2(
      {Key? key,
      required this.label,
      this.hintText,
      this.keyboardType,
      required this.isHidden,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          decoration: BoxDecoration(
            color: grey,
            borderRadius: BorderRadius.circular(3),
          ),
          child: TextField(
            autocorrect: false,
            obscureText: isHidden,
            cursorColor: black,
            keyboardType: keyboardType,
            onChanged: onChanged,
            decoration: InputDecoration.collapsed(
              hintText: hintText,
              hintStyle: TextStyle(
                color: grey2,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
