import 'package:flutter/material.dart';
import 'package:proheal/app/pages/core/dashboard.dart';
import 'package:proheal/app/pages/core/homepage.dart';
import 'package:proheal/app/pages/feedback/feedback.dart';
import 'package:proheal/app/pages/onboard/onboard.dart';
import 'package:proheal/core/system/set_potrait.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SetPotrait.init();
  runApp(const ProhealApp());
}

class ProhealApp extends StatelessWidget {
  const ProhealApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'proheal',
      home: Dashboard(),
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


// feauturs -- book apointment, list prescriptions, get a list of healthcare providers

// DEFENSE IS JULY 26TH