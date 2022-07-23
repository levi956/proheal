// title, large space for textfield
// then some greeting message for the user

import 'package:flutter/material.dart';
import 'package:proheal/core/style/color_contants.dart';
import 'package:proheal/core/system/status_bar_color.dart';
import 'package:proheal/core/widgets/add_image_card.dart';
import 'package:proheal/core/widgets/custom_button.dart';

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
    setStatusBarColor(color: BarColor.black);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: white,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
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
                    'Send Feeback on any Complaints',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const AddImageCard(),
                  const SizedBox(height: 15),
                  const Text(
                    'Please provide a detailed description on any form of symptoms you might be facing.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFFB3B4B6),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    onChanged: (v) {
                      setState(() {
                        _feedback = v;
                      });
                    },
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    cursorColor: black,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                    decoration: feedbackInputStyle(),
                  ),
                  const SizedBox(height: 15),
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
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration feedbackInputStyle() {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: grey3,
      filled: true,
      focusColor: grey3,
      labelText: 'Enter Feedback',
      labelStyle: const TextStyle(fontWeight: FontWeight.w400),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: black),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: grey3),
      ),
      errorBorder: OutlineInputBorder(
        gapPadding: 2,
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: black),
      ),
    );
  }
}
