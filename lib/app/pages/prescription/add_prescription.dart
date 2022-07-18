// here it is a list<PerescriptionModel> i am working with
// so users adds prescripton and i incldue here

// Drug name, pills

import 'package:flutter/material.dart';

import '../../../core/navigation/navigation.dart';
import '../../../core/style/color_contants.dart';

class AddPrescription extends StatelessWidget {
  const AddPrescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 60,
          bottom: 20,
        ),
        child: ListView(
          children: [
            Column(
              children: [
                IconButton(
                  iconSize: 19,
                  color: black,
                  onPressed: () => pop(context),
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Fill the details below to manually add prescription',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
