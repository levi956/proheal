class ScheduleModel {
  String? patientName;
  String? surgeryType;
  String? additonalNotes;
  DateTime? scheduleDate;
  bool? isAvailabe;

  ScheduleModel(
      {this.additonalNotes,
      this.isAvailabe,
      this.patientName,
      this.scheduleDate,
      this.surgeryType});

  // probably a method toJson factory method to parse and push to server (database)
}
