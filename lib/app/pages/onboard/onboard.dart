import 'package:flutter/material.dart';
import 'package:proheal/core/system/status_bar_color.dart';
import 'package:proheal/core/widgets/custom_button.dart';
import 'package:proheal/core/widgets/textfield.dart';

import '../../../core/style/color_contants.dart';

enum OnboardState { getStarted, hasAccount }

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  OnboardState getStarted = OnboardState.getStarted;

  void toggleState() {
    setState(() {
      getStarted = OnboardState.hasAccount;
    });
  }

  double toggleHeight() {
    if (getStarted == OnboardState.getStarted) {
      return 287;
    } else {
      return 350;
    }
  }

  String email = '';
  String password = '';

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
            AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              padding: const EdgeInsets.only(left: 7, right: 7),
              height: toggleHeight(),
              width: double.maxFinite,
              color: white,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  if (getStarted == OnboardState.getStarted)
                    Column(
                      children: [
                        const SizedBox(height: 30),

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
                          buttonWidth: double.maxFinite,
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
                              onPressed: toggleState,
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
                  if (getStarted == OnboardState.hasAccount)
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 10),
                          const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 32,
                            ),
                          ),
                          const SizedBox(
                            width: 217,
                            child: Text(
                              'Enter your credentials to login back to your ProHeal profile.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          CustomTextField(
                            isHidden: false,
                            label: 'email',
                            onChanged: (v) {
                              setState(() {
                                email = v;
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            isHidden: true,
                            label: 'password',
                            onChanged: (v) {
                              setState(() {
                                password = v;
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          // button
                          CustomButton(
                            text: 'login',
                            onPressed: () {},
                            buttonWidth: double.maxFinite,
                            buttonTextColor: white,
                            validator: () {
                              return email.isNotEmpty && password.isNotEmpty;
                            },
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
