import 'package:flutter/material.dart';

showSnackBar(String meessage, Color color, BuildContext cont) {
  final snackBar = SnackBar(
    content: Text(
      meessage,
    ),
    backgroundColor: color,
  );
  ScaffoldMessenger.of(cont).showSnackBar(snackBar);
}
