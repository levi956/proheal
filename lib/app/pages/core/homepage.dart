import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:proheal/app/models/health_news.dart';
import 'package:proheal/app/pages/appointment/schedule.dart';
import 'package:proheal/app/pages/feedback/feedback.dart';
import 'package:proheal/core/navigation/navigation.dart';
import 'package:proheal/core/repository/repostiory.dart';
import 'package:proheal/core/widgets/access_card.dart';
import 'package:proheal/core/widgets/distress_button.dart';

import '../../../core/style/color_contants.dart';
import '../../../core/widgets/health_news_card.dart';
import '../../services/http_service/response_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<ServiceResponse<List<HealthNews>>> data;

  @override
  void initState() {
    data = Repository.httpClient.getHealthNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hey Levi,',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'What do you want to do today?',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFB3B4B6),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    //
                    DistressButton(),
                  ],
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
                  children: [
                    QuickAccessCard(
                      title: 'Book an\nAppointment',
                      description: 'Find a doctor',
                      color: const Color(0xFFF5EEEC),
                      onPressed: () =>
                          pushTo(context, const ScheduleAppointment()),
                    ),
                    const QuickAccessCard(
                      title: 'Access your\nRecovery',
                      description: 'Answer questions\nin a tracking session',
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

                const Text(
                  'Latest Health News',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),

                FutureBuilder<ServiceResponse<List<HealthNews>>>(
                  future: data,
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      ServiceResponse<List<HealthNews>> data = snapshot.data!;
                      if (data.status) {
                        List<HealthNews> articles = data.data!;
                        return SizedBox(
                          height: 130,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return HealthNewsCard(
                                size: size,
                                data: articles[index],
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 10,
                            ),
                            itemCount: articles.length,
                          ),
                        );
                      } else {
                        return Container(
                          width: double.maxFinite,
                          color: white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                LineAwesomeIcons.plug,
                                color: Colors.red,
                                size: 25.0,
                              ),
                              const SizedBox(height: 15),
                              Text(
                                data.message!,
                                style: TextStyle(
                                  color: black,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    } else {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
