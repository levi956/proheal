import 'package:flutter/material.dart';
import 'package:proheal/app/models/user.dart';
import 'package:proheal/app/pages/core/dashboard.dart';
import 'package:proheal/app/services/http_service/response_model.dart';
import 'package:proheal/core/repository/repostiory.dart';
import 'package:proheal/core/style/color_contants.dart';
import 'package:proheal/core/widgets/textfield.dart';

import '../../../core/navigation/navigation.dart';
import '../../../core/system/status_bar_color.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/drop_down.dart';

enum SignUpStage { one, two }

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  SignUpStage signUpStage = SignUpStage.one;
  bool isVisible = true;

// proably make this a provider later on
  List<String> genderOptions = ['Select your gender', 'Male', 'Female'];
  List<String> stateOptions = ['Select your state', 'Lagos', 'Abuja'];
  List<String> bloodGroupOptions = [
    'Select your blood group',
    '-A',
    'B',
    'AB',
    'O',
  ];
  List<String> hasConceivedOptions = ['Had a baby?', 'Yes', 'No'];
  List<String> userOptions = [
    'Choose one',
    'Never undergone surgery, but needs to undergo.',
    'Undergone surgery in the past.',
    'Just need health tips and consultations.',
    'Others.',
  ];

  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String height = '';
  String weight = '';
  String phoneNumber = '';
  String gender = 'Select your gender';
  String hasConcieved = 'Had a baby?';
  String userSelectedOption = 'Choose one';
  String bloodGroup = 'Select your blood group';

  tooglePassword() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  toogleStepInt() {
    if (signUpStage == SignUpStage.one) {
      return 'STEP 1 OF 2';
    } else {
      return 'STEP 2 OF 2';
    }
  }

  toogleButtonText() {
    if (signUpStage == SignUpStage.one) {
      return 'Continue';
    } else {
      return 'Verify account';
    }
  }

  backButtonOnPressed() {
    if (signUpStage == SignUpStage.one) {
      pop(context);
    } else {
      setState(() {
        signUpStage = SignUpStage.one;
      });
    }
  }

  mainButtonOnpressed() {
    if (signUpStage == SignUpStage.one) {
      setState(() {
        signUpStage = SignUpStage.two;
      });
    } else {
      pushTo(context, const Dashboard());
      // registerUser();
    }
  }

  bool buttonValidator() {
    if (signUpStage == SignUpStage.one) {
      return firstName.isNotEmpty &&
          lastName.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          phoneNumber.isNotEmpty &&
          password.length > 7;
    } else {
      return gender != 'Select your gender' &&
          height != '' &&
          weight != '' &&
          bloodGroup != 'Select your blood group' &&
          userSelectedOption != 'Choose one';
    }
  }

  List<TextSpan> textSpans = [
    const TextSpan(text: 'Fill in the details below to create\nyour'),
    TextSpan(
      text: ' proheal',
      style: TextStyle(
        color: black,
        fontWeight: FontWeight.w700,
      ),
    ),
    const TextSpan(text: ' account'),
  ];

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.black);
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              // sign up text with steps
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 19,
                  color: black,
                  onPressed: () => backButtonOnPressed(),
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              Column(
                children: [
                  Text(
                    "Let's get your account setup",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: black),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        height: 1.5,
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                      children: textSpans,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    toogleStepInt(),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: black),
                  ),
                ],
              ),

              const SizedBox(height: 40),
              // step one column

              if (signUpStage == SignUpStage.one)
                Column(
                  // text field and stuff here
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField2(
                            label: 'First Name',
                            hintText: 'Nifesi',
                            keyboardType: TextInputType.name,
                            isHidden: false,
                            onChanged: (v) {
                              setState(() {
                                firstName = v.trim();
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: CustomTextField2(
                            label: 'Last Name',
                            hintText: 'Odumirin',
                            keyboardType: TextInputType.name,
                            isHidden: false,
                            onChanged: (v) {
                              setState(() {
                                lastName = v.trim();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    CustomTextField2(
                      label: 'Email',
                      hintText: 'nifesi@example.com',
                      keyboardType: TextInputType.emailAddress,
                      isHidden: false,
                      onChanged: (v) {
                        setState(() {
                          email = v.trim();
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextField2(
                      label: 'Password',
                      hintText: 'Your password',
                      keyboardType: TextInputType.visiblePassword,
                      isHidden: isVisible,
                      onChanged: (v) {
                        setState(() {
                          password = v.trim();
                        });
                      },
                    ),
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 20),
                    CustomTextField2(
                      label: 'Phone number',
                      keyboardType: TextInputType.phone,
                      hintText: '+234 903 453 5549',
                      isHidden: false,
                      onChanged: (v) {
                        setState(() {
                          phoneNumber = v.trim();
                        });
                      },
                    ),
                  ],
                ),
              //
              if (signUpStage == SignUpStage.two)
                Column(
                  children: [
                    CustomDropDown(
                      label: 'Gender',
                      items: genderOptions
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (v) {
                        setState(() {
                          gender = v!;
                        });
                      },
                      value: gender,
                    ),
                    const SizedBox(height: 20),
                    gender == 'Female'
                        ? CustomDropDown(
                            label: 'Have you concieved',
                            items: hasConceivedOptions
                                .map((e) =>
                                    DropdownMenuItem(value: e, child: Text(e)))
                                .toList(),
                            onChanged: (v) {
                              setState(() {
                                hasConcieved = v!;
                              });
                            },
                            value: hasConcieved,
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField2(
                            label: 'Height',
                            hintText: '35ft',
                            keyboardType: TextInputType.number,
                            isHidden: false,
                            onChanged: (v) {
                              setState(() {
                                height = v;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: CustomTextField2(
                            label: 'Weight',
                            hintText: '16.9kg',
                            keyboardType: TextInputType.number,
                            isHidden: false,
                            onChanged: (v) {
                              setState(() {
                                weight = v;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    CustomDropDown(
                      label: 'Blood group',
                      items: bloodGroupOptions
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (v) {
                        setState(() {
                          bloodGroup = v!;
                        });
                      },
                      value: bloodGroup,
                    ),
                    const SizedBox(height: 20),
                    CustomDropDown(
                      label: 'Please select an option',
                      items: userOptions
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (v) {
                        setState(() {
                          userSelectedOption = v!;
                        });
                      },
                      value: userSelectedOption,
                    ),
                  ],
                ),

              const SizedBox(height: 60),
              CustomButton(
                text: toogleButtonText(),
                buttonWidth: double.maxFinite,
                // validator: buttonValidator,
                buttonTextColor: white,
                onPressed: mainButtonOnpressed,
              ),
              const SizedBox(height: 40),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Already registered? Log in",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // probaly throw the method that registers the user here
  Future<void> registerUser() async {
    ServiceResponse response = await Repository.databaseCreate.registerUser(
      User(
        fullName: '$firstName $lastName',
        email: email,
        height: height,
        bloodGroup: bloodGroup,
        femaleConcieved: hasConcieved,
        gender: gender,
        phoneNumber: phoneNumber,
        userDefaultChoiceoOption: userSelectedOption,
      ),
    );
    print(response.message);
    if (response.status) {
      // show success prmompt and move to the next page
      if (!mounted) return;
      pushToAndClearStack(context, const Dashboard());
    } else {
      // show error prompt
      print(response.message);
    }
  }
}
