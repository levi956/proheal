import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proheal/app/models/feedback.dart';
import 'package:proheal/app/models/prescription.dart';
import 'package:proheal/app/models/schedule.dart';
import 'package:proheal/app/models/user.dart';

import '../http_service/response_model.dart';

class DatabaseCreate {
  static final CollectionReference _refUsers =
      FirebaseFirestore.instance.collection('users');

  static final CollectionReference _refUsersAppointment =
      FirebaseFirestore.instance.collection('appointments');

  static final CollectionReference _wRef = FirebaseFirestore.instance
      .collection("appointment")
      .doc('userID')
      .collection("userAppointment");

  // check if the email has been used before later on

  Future<ServiceResponse> registerUser(User user) async {
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
        message: _.toString(),
      );
    }
  }

  Future<ServiceResponse> sendFeeback(FeedbackModel patientFeedback) async {
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

  Future<ServiceResponse> sendPrescription(
      Prescription userPrescription) async {
    try {
      await _refUsers
          .doc('userId')
          .update({'prescription': userPrescription.toMap()});
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
      await _wRef.add(userAppointment.toMap());
      await _refUsers
          .doc('userId')
          .update({'appointment': userAppointment.toMap()});
      return ServiceResponse(status: true, message: "success");
    } on FirebaseException catch (_) {
      if (_ is SocketException) {
        return ServiceResponse(
            status: false, message: "Check your internet connection");
      }
      return ServiceResponse(
        status: false,
        message: _.toString(),
      );
    }
  }

  // authentication when you register your user

  // check the email if it exists within the database if it exists

  // check the collection "users", in each document if email== inputEmail, then prompt accordingly

}
