import 'package:cloud_firestore/cloud_firestore.dart';

class ScheduleModel {
  String? patientName;
  String? additonalNotes;
  DateTime? scheduleDate;
  bool? scheduleStatus;
  String? userId;

  String get remarks => additonalNotes ?? 'No remarks made';

  ScheduleModel({
    this.additonalNotes,
    this.scheduleStatus,
    this.patientName,
    this.scheduleDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'patientName': patientName,
      'additionalNotes': additonalNotes,
      // so here it is parsed to a timestamp
      'scheduledDate': Timestamp.fromDate(scheduleDate!),
      'approved': scheduleStatus
    };
  }

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
        patientName: json['patientName'],
        scheduleStatus: json['approved'],
        scheduleDate: json['scheduledDate'].toDate());
  }
}
