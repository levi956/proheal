import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:proheal/app/models/health_advice.dart';
import 'package:proheal/app/pages/web/web_view.dart';
import 'package:proheal/core/navigation/navigation.dart';
import 'package:proheal/core/style/color_contants.dart';

class HealthAdviceCard extends StatelessWidget {
  final HealthAdviceModel? data;
  const HealthAdviceCard({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => pushTo(context, HealthAdvicesWebView(data: data!.urlH)),
      child: Container(
        width: double.maxFinite,
        color: grey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(LineAwesomeIcons.newspaper),
              Text(
                data!.titleH,
                style: const TextStyle(
                  height: 1.5,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
