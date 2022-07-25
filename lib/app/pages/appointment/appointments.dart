import 'package:flutter/material.dart';
import 'package:proheal/app/pages/appointment/schedule.dart';
import 'package:proheal/core/navigation/navigation.dart';
import 'package:proheal/core/widgets/custom_button.dart';

// if appointment, button might change

class Appointments extends StatelessWidget {
  const Appointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Appointments',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'You have no appointments set!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          CustomButton(
            text: 'Schedule Appointment',
            buttonWidth: double.maxFinite,
            onPressed: () => pushTo(context, const ScheduleAppointment()),
          )
        ],
      ),
    );
  }
}
