import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:proheal/app/pages/appointment/appointments.dart';
import 'package:proheal/app/pages/core/health_advice.dart';
import 'package:proheal/app/pages/core/homepage.dart';
import 'package:proheal/app/pages/prescription/prescription.dart';
import 'package:proheal/app/pages/core/user_health.dart';
import 'package:proheal/core/style/color_contants.dart';
import 'package:proheal/core/system/status_bar_color.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // experiment of a tab provider here to manipulate the value
  int tabIndex = 0;
  final List<Widget> _screens = const [
    HomePage(),
    HealthAdvice(),
    Appointments(),
    Prescription(),
    UserHealth()
  ];

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.black);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: white,
        currentIndex: tabIndex,
        onTap: (index) {
          setState(() {
            HapticFeedback.lightImpact();
            tabIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: black,
        unselectedItemColor: grey2,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.medical_notes),
            label: 'advice',
          ),
          BottomNavigationBarItem(
              icon: Icon(LineAwesomeIcons.calendar_check),
              label: 'appointment'),
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.capsules),
            label: 'prescription',
          ),
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.medical_file),
            label: 'your health',
          ),
        ],
      ),
      body: IndexedStack(
        index: tabIndex,
        children: _screens,
      ),
    );
  }
}
