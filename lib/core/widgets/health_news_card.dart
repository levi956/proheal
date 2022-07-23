import 'package:flutter/material.dart';
import 'package:proheal/app/models/health_news.dart';
import 'package:proheal/app/pages/web/web_view.dart';
import 'package:proheal/core/navigation/navigation.dart';

import '../style/color_contants.dart';

class HealthNewsCard extends StatelessWidget {
  const HealthNewsCard({
    Key? key,
    required this.size,
    this.data,
  }) : super(key: key);

  final Size size;
  final HealthNews? data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => pushTo(
          context,
          WebViewPage(
            data: data!.url,
          )),
      child: Container(
        height: 122,
        width: size.width * 0.82,
        // color: black,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(5), color: black),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data!.title!,
                style: TextStyle(
                  color: white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                data!.newsDesctiption,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  // color: Color(0xFF999A9D),
                  color: white,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
