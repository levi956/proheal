import 'package:flutter/material.dart';
import 'package:proheal/app/pages/auth/sign_up.dart';
import 'package:proheal/app/pages/core/dashboard.dart';
import 'package:proheal/core/mixins/validator.dart';
import 'package:proheal/core/navigation/navigation.dart';
import 'package:proheal/core/system/status_bar_color.dart';
import 'package:proheal/core/widgets/custom_button.dart';
import 'package:proheal/core/widgets/textfield.dart';

import '../../../core/style/color_contants.dart';

enum OnboardState { getStarted, hasAccount, forgotPassword }

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> with Validator {
  OnboardState getStarted = OnboardState.getStarted;
  bool isVisible = true;

  void toggleState() {
    setState(() {
      getStarted = OnboardState.hasAccount;
    });
  }

  double toggleHeight() {
    if (getStarted == OnboardState.getStarted) {
      return 287;
    } else {
      return 460;
    }
  }

  tooglePassword() {
    setState(() {
      isVisible = !isVisible;
    });
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
                physics: const AlwaysScrollableScrollPhysics(),
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
                          onPressed: () => pushTo(context, const SignUp()),
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
                              fontSize: 27,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const SizedBox(
                            width: 217,
                            child: Text(
                              'Enter your credentials to login back to your ProHeal profile.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          CustomTextField(
                            isHidden: false,
                            validator: validateEmail,
                            label: 'email',
                            onChanged: (v) {
                              setState(() {
                                email = v;
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            isHidden: isVisible,
                            label: 'password',
                            onChanged: (v) {
                              setState(() {
                                password = v;
                              });
                            },
                          ),
                          const SizedBox(height: 7),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () => tooglePassword(),
                              child: Text(
                                'Show Password',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                    color: black),
                              ),
                            ),
                          ),
                          const SizedBox(height: 13),
                          Text(
                            'Forgot Password?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 20),
                          // button
                          CustomButton(
                            text: 'login',
                            onPressed: () {
                              pushTo(context, const Dashboard());
                            },
                            buttonWidth: double.maxFinite,
                            buttonTextColor: white,
                            validator: () {
                              return email.isNotEmpty &&
                                  password.isNotEmpty &&
                                  (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                      .hasMatch(email));
                            },
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () => pushTo(context, const SignUp()),
                            child: const Text(
                              "No account? Here creates one",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
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
