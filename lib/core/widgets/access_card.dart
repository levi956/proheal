import 'package:flutter/material.dart';
import 'package:proheal/core/style/color_contants.dart';

class QuickAccessCard extends StatelessWidget {
  final String? title;
  final String? description;
  final void Function()? onPressed;
  const QuickAccessCard(
      {Key? key, this.description, this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: size.width * 0.42,
        height: 172,
        color: grey,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: const TextStyle(
                  height: 1.5,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description!,
                style: const TextStyle(
                  fontSize: 10,
                  color: Color(0xFFB3B4B6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
