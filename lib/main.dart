import 'package:flutter/material.dart';
import 'package:proheal/app/pages/auth/sign_up.dart';
import 'package:proheal/app/pages/core/dashboard.dart';
import 'package:proheal/app/pages/core/homepage.dart';
import 'package:proheal/app/pages/landing/landing_page.dart';
import 'package:proheal/core/repository/repostiory.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Repository.init();
  runApp(const ProhealApp());
}

class ProhealApp extends StatelessWidget {
  const ProhealApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'proheal',
      // theme: ThemeData(),
      home: LandingPage(),
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