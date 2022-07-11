import 'package:flutter/material.dart';
import 'package:proheal/app/services/http_service/api.dart';
import 'package:proheal/core/style/color_contants.dart';
import 'package:proheal/core/widgets/health_advice_card.dart';

import '../../models/health_advice.dart';
import '../../services/http_service/response_model.dart';

class HealthAdvice extends StatefulWidget {
  const HealthAdvice({Key? key}) : super(key: key);

  @override
  State<HealthAdvice> createState() => _HealthAdviceState();
}

class _HealthAdviceState extends State<HealthAdvice> {
  late Future<ServiceResponse<List<HealthAdviceModel>>> data;

  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() {
    data = HttpClient.getHealthAdvice('25');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Health Advices',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder<ServiceResponse<List<HealthAdviceModel>>>(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                ServiceResponse<List<HealthAdviceModel>> data = snapshot.data!;
                if (data.status != false) {
                  List<HealthAdviceModel>? healthData = data.data;
                  return Expanded(
                    child: Scrollbar(
                      thickness: 2.0,
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return HealthAdviceCard(
                            data: healthData![index],
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                        itemCount: healthData!.length,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    width: double.maxFinite,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.warning,
                          color: Colors.red,
                          size: 25.0,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          data.message!,
                          style: TextStyle(
                            color: black,
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
          )
        ],
      ),
    );
  }
}
