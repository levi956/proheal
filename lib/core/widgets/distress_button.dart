import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:proheal/core/style/color_contants.dart';

class DistressButton extends StatelessWidget {
  const DistressButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(6),
      height: 38,
      width: size.width * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFAD2222),
      ),
      child: Row(
        children: [
          Icon(
            LineAwesomeIcons.phone_volume,
            color: white,
            size: 20,
          ),
          const Spacer(),
          Text(
            'Distress Call',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: white,
            ),
          )
        ],
      ),
    );
  }
}
