// here it is a list<PerescriptionModel> i am working with
// so users adds prescripton and i incldue here

// Drug name, pills

import 'package:flutter/material.dart';
import 'package:proheal/core/widgets/custom_button.dart';
import 'package:proheal/core/widgets/textfield.dart';

import '../../../core/navigation/navigation.dart';
import '../../../core/style/color_contants.dart';
import '../../../core/widgets/drop_down.dart';

class AddPrescription extends StatefulWidget {
  const AddPrescription({Key? key}) : super(key: key);

  @override
  State<AddPrescription> createState() => _AddPrescriptionState();
}

class _AddPrescriptionState extends State<AddPrescription> {
  List<String> dosageOptions = [
    'Select your dosage',
    'Thrice a day',
    'Twice a day',
    'Once a day',
    'Others',
  ];

  String drugName = '';
  String noTablets = '';
  String drugDosage = 'Select your dosage';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
            bottom: 20,
          ),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  const SizedBox(height: 20),
                  CustomTextField2(
                    label: 'Drug name',
                    isHidden: false,
                    keyboardType: TextInputType.text,
                    onChanged: (k) {
                      setState(() {
                        drugName = k;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  // proably change to a drop down button
                  CustomDropDown(
                    label: 'Dosage',
                    value: drugDosage,
                    items: dosageOptions
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (v) {
                      setState(() {
                        drugDosage = v!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextField2(
                    label: 'No of tablets',
                    isHidden: false,
                    keyboardType: TextInputType.number,
                    onChanged: (k) {
                      setState(() {
                        noTablets = k;
                      });
                    },
                  ),
                  const SizedBox(height: 100),
                  CustomButton(
                    text: 'Add',
                    onPressed: () {},
                    buttonWidth: double.maxFinite,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
