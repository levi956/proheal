import 'package:flutter/material.dart';
import 'package:proheal/app/pages/landing/landing_page.dart';
import 'package:proheal/core/repository/repostiory.dart';
import 'package:proheal/core/style/color_contants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Repository.init();
  runApp(const ProHealApp());
}

class ProHealApp extends StatelessWidget {
  const ProHealApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'proheal',
      home: const LandingPage(),
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: black,
        ),
      ),
    );
  }
}




// final year project app
// get details of features and functionalities
// happy building Nifesi

// don't forget the programming principles and keep things simple
// development and implementation of features starts on Wednesday
// but still keep things simple 
// understand dependecny injection 
// know your state and all that shit

// features -- book apointment, list prescriptions, get a list of healthcare providers

// DEFENSE IS JULY 26TH
