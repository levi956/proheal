import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:proheal/core/style/color_contants.dart';
import 'package:url_launcher/url_launcher.dart';

class DistressButton extends StatefulWidget {
  const DistressButton({Key? key}) : super(key: key);

  @override
  State<DistressButton> createState() => _DistressButtonState();
}

class _DistressButtonState extends State<DistressButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: callDistress,
      child: Container(
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
      ),
    );
  }

  Future<void> callDistress() async {
    final url = Uri.parse('tel:911');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch url';
    }
  }
}
