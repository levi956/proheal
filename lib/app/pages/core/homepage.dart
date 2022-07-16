import 'package:flutter/material.dart';
import 'package:proheal/app/pages/feedback/feedback.dart';
import 'package:proheal/core/navigation/navigation.dart';
import 'package:proheal/core/widgets/access_card.dart';

import '../../../core/style/color_contants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String ktext1 = 'Lorem ipsum dolor sit amet';
    String ktext2 =
        '‘Content here, content here’, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ‘lorem ipsum';
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: ListView(
          padding: const EdgeInsets.only(bottom: 10),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hi Anna',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'What do you want to do today?',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFB3B4B6),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Quick Access',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    QuickAccessCard(
                      title: 'Book an\nAppointment',
                      description: 'Find a doctor',
                      color: Color(0xFFF5EEEC),
                    ),
                    QuickAccessCard(
                      title: 'Request a\nConsultation',
                      description: 'Talk to a specialist',
                      color: Color(0xFFF6F8FC),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const QuickAccessCard(
                      title: 'Locate a\nhospital',
                      description: 'Appoint a surgey',
                      color: Color(0xFFF1EEF6),
                    ),
                    QuickAccessCard(
                      title: 'Send\nFeedback',
                      description: 'Get feedback to\nmedical expert',
                      color: const Color(0xFFF7EDF7),
                      onPressed: () => pushTo(context, const FeedbackPage()),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                //
                Container(
                  height: 122,
                  width: size.width * 0.82,
                  color: black,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, top: 20, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ktext1,
                          style: TextStyle(
                            color: white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          ktext2,
                          style: const TextStyle(
                            color: Color(0xFF999A9D),
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
