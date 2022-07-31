// i am reading my appointments
// i am reading my prescriptions

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proheal/app/models/schedule.dart';

import '../http_service/response_model.dart';

class DatabaseRead {
  static final CollectionReference _refUsers =
      FirebaseFirestore.instance.collection('users');

  static final CollectionReference _refUsersAppointment =
      FirebaseFirestore.instance.collection('appointments');

  static final CollectionReference _wRef = FirebaseFirestore.instance
      .collection("appointment")
      .doc('userID')
      .collection("userAppointment");

  static Future<ServiceResponse> getUserAppointments() async {
    try {
      DocumentSnapshot response =
          await _refUsersAppointment.doc('userId').get();
      if (response.exists) {
        return ServiceResponse(
          status: true,
          message: "Success",
          data: ScheduleModel.fromJson(response.data() as Map<String, dynamic>),
        );
      } else {
        return ServiceResponse(status: false, message: "No document");
      }
    } on FirebaseException catch (_) {
      print(_);
    }
    return ServiceResponse(
      status: false,
      message: "Something went wrong",
    );
  }

  // get user stream collection collection
  static Stream<List<ScheduleModel>> getData() {
    return _wRef.snapshots().map((snapshot) => snapshot.docs
        .map(
            (doc) => ScheduleModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList());
  }
}
