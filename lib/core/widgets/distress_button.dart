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
    return GestureDetector(
      onTap: callDistress,
      child: Container(
        padding: const EdgeInsets.all(6),
        height: 38,
        width: 112,
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
    try {
      final url = Uri.parse('tel:911');
      await launchUrl(url);
      // since emulator can't call, then real device
    } catch (_) {
      print(_.toString());
    }
  }
}
