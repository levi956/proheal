// title, large space for textfield
// then some greeting message for the user

import 'package:flutter/material.dart';
import 'package:proheal/core/style/color_contants.dart';
import 'package:proheal/core/widgets/custom_button.dart';
import 'package:proheal/core/widgets/textfield.dart';

import '../../../core/navigation/navigation.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  String _feedback = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              iconSize: 19,
              color: black,
              onPressed: () {
                pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
            const SizedBox(height: 5),
            const Text(
              'Send Feeback on any Complaints',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Please provide a detailed description on any form of symptoms you might be facing.',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFFB3B4B6),
                fontWeight: FontWeight.w400,
              ),
            ),
            CustomTextField(
              isHidden: false,
              keyboardType: TextInputType.text,
              onChanged: (v) {
                setState(() {
                  _feedback = v;
                });
              },
            ),
            CustomButton(
              buttonTextColor: white,
              buttonWidth: double.maxFinite,
              text: 'Submit feedback',
              onPressed: () {},
              // if the string or the image is not empty
              validator: () {
                return _feedback.isNotEmpty;
              },
            )
          ],
        ),
      ),
    );
  }
}
