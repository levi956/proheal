import 'package:flutter/material.dart';
import 'package:proheal/core/system/status_bar_color.dart';
import 'package:proheal/core/widgets/custom_button.dart';

import '../../../core/style/color_contants.dart';

class Onboard extends StatelessWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.white);
    return Scaffold(
      backgroundColor: black,
      body: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              padding: const EdgeInsets.only(left: 7, right: 7),
              height: 297,
              width: double.maxFinite,
              color: white,
              child: Column(
                children: [
                  const SizedBox(height: 50),

                  // never stress text
                  const Text(
                    'Never Stress',
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // intro text
                  const SizedBox(
                    width: 216,
                    child: Text(
                      'Get great tips postnatal care using Proheal.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // button
                  CustomButton(
                    text: 'Get Started',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 15),

                  //other auth option
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Have an account?',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            color: black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
