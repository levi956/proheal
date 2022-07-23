import 'package:dio/dio.dart';
import 'package:proheal/app/models/health_advice.dart';
import 'package:proheal/app/models/health_news.dart';

import 'package:proheal/app/services/http_service/base.dart';
import 'package:proheal/app/services/http_service/response_model.dart';

class HttpClient {
  // get health advice
  Future<ServiceResponse<List<HealthAdviceModel>>> getHealthAdvice(
      String topic) async {
    try {
      var response = await Dio().get(ProHeal.topicsUrl + topic);

      // parse
      var parseOne = response.data['Result']['Resources'];
      var parseTwo = parseOne['Resource'];
      var parseThree = parseTwo[0]['RelatedItems'];
      List<dynamic> parseFour = parseThree['RelatedItem'];

      List<HealthAdviceModel> data = parseFour
          .map((dynamic item) => HealthAdviceModel.fromJson(item))
          .toList();

      return ServiceResponse(
        status: true,
        message: "success",
        data: data,
      );
    } on DioError catch (_) {
      if (_.message.contains('SocketException')) {
        return ServiceResponse(
          status: false,
          message: "Check your internet connection and try again",
        );
      }

      return ServiceResponse(
        status: false,
        message: _.error.toString(),
      );
    }
  }

  // throw the health nwws here

  Future<ServiceResponse<List<HealthNews>>> getHealthNews() async {
    try {
      final response = await Dio().get(
        ProHeal.healthNewsUrl,
        options: Options(headers: ProHeal.headers),
      );
      List<dynamic> body = response.data['articles'];
      List<HealthNews> articles =
          body.map((dynamic item) => HealthNews.fromJson(item)).toList();

      return ServiceResponse(
        status: true,
        message: "worked",
        data: articles,
      );
    } on DioError catch (_) {
      if (_.message.contains('SocketException')) {
        return ServiceResponse(
            status: false, message: "Check your connection and try again");
      }
      return ServiceResponse(status: false, message: _.message.toString());
    }
  }
}
