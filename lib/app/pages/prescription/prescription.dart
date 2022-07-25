import 'package:flutter/material.dart';
import 'package:proheal/app/pages/prescription/add_prescription.dart';
import 'package:proheal/core/navigation/navigation.dart';

import '../../../core/widgets/custom_button.dart';

class Prescription extends StatelessWidget {
  const Prescription({Key? key}) : super(key: key);

// similar to a do do list that just contains prescription data and all that
// state is highly needed here

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 60,
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Prescriptions',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'No prescriptions have been given to you!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          CustomButton(
            text: 'Manually add prescriptions',
            buttonWidth: double.maxFinite,
            onPressed: () => pushTo(context, const AddPrescription()),
          )
        ],
      ),
    );
  }
}
