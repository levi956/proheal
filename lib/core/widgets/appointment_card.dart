import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:proheal/core/style/color_contants.dart';

class AppointmentCard extends StatelessWidget {
  final bool status;
  final DateTime date;
  final String? additionalNotes;

  final String? statusName;

  const AppointmentCard({
    Key? key,
    this.additionalNotes,
    required this.date,
    required this.status,
    this.statusName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 97,
      width: 382,
      decoration: BoxDecoration(
          border: Border.all(
            color: grey2,
          ),
          borderRadius: BorderRadius.circular(7)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  LineAwesomeIcons.calendar_check,
                ),
                const SizedBox(width: 5),
                Text(DateFormat.Hm().format(date)),
                const Spacer(),
                Text(
                  status ? 'Approved' : 'Pending',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      // color: ,
                      color: status ? Colors.green : const Color(0xFFFE8343)),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              DateFormat('EEEEE MMMM, yyyy').format(date),
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              additionalNotes!,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
