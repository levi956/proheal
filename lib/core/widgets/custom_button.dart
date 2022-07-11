import 'package:flutter/material.dart';
import 'package:proheal/core/style/color_contants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? buttonTextColor;
  final bool Function()? validator;
  final double? buttonWidth;

  const CustomButton(
      {required this.text,
      required this.onPressed,
      this.buttonWidth,
      this.buttonTextColor,
      this.validator,
      Key? key})
      : super(key: key);

  final double borderRadius = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: buttonWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: (validator == null ? true : validator!())
            ? black
            : black.withOpacity(0.7),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          alignment: Alignment.center,
          padding: MaterialStateProperty.all(
            const EdgeInsets.only(top: 15, bottom: 15),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        onPressed: (validator == null ? true : validator!()) ? onPressed : null,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Text(
            text,
            style: TextStyle(
                color: buttonTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
