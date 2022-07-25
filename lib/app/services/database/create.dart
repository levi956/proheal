import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proheal/app/models/feedback.dart';
import 'package:proheal/app/models/schedule.dart';
import 'package:proheal/app/models/user.dart';

import '../http_service/response_model.dart';

class DatabaseCreate {
  static final CollectionReference _refUsers =
      FirebaseFirestore.instance.collection('users');

  static final CollectionReference _refUsersAppointment =
      FirebaseFirestore.instance.collection('appointment');

  // static Future<dynamic> checkEmail(String email) async {
  //   final isUsed = _refUsers.where('email', isEqualTo: email).get();
  //   print(isUsed);
  // }

  static Future<ServiceResponse> registerUser(User user) async {
    try {
      await _refUsers.doc('userId').set(user.toMap());
      return ServiceResponse(
        status: true,
        message: "Success",
      );
    } on FirebaseException catch (_) {
      if (_ is SocketException) {
        return ServiceResponse(
          status: false,
          message: "Check your internet connection",
        );
      }
      return ServiceResponse(
        status: false,
        message: "Something went wrong",
      );
    }
  }

  static Future<ServiceResponse> sendFeeback(
      FeedbackModel patientFeedback) async {
    try {
      await _refUsers
          .doc('userId')
          .update({'feedback': patientFeedback.toMap()});
      return ServiceResponse(
        status: true,
        message: "Success",
      );
    } on FirebaseException catch (_) {
      if (_ is SocketException) {
        return ServiceResponse(
          status: false,
          message: "Check your internet connection",
        );
      }
      return ServiceResponse(
        status: false,
        message: "Something went wrong",
      );
    }
  }

  Future<ServiceResponse> scheduleAppointment(
      ScheduleModel userAppointment) async {
    try {
      await _refUsersAppointment.doc('userId').set(userAppointment.toMap());
      return ServiceResponse(status: true, message: "success");
    } on FirebaseException catch (_) {
      if (_ is SocketException) {
        return ServiceResponse(
            status: false, message: "Check your internet connection");
      }
      return ServiceResponse(
        status: false,
        message: "something went wrong",
      );
    }
  }

  // authentication when you register your user

  // check the email if it exists within the database if it exists

  // check the collection "users", in each document if email== inputEmail, then prompt accordingly

}
