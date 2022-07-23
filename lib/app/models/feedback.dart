class FeedbackModel {
  String? patientFeedback;
  String? imageUrl;
  DateTime? submissionTime;

  FeedbackModel({this.patientFeedback, this.submissionTime, this.imageUrl});

  // probably a toJson to get the data to the database (server) with the time of it included

  Map<String, dynamic> toMap() {
    return {
      'patientFeedback': patientFeedback,
      'imageUrl': imageUrl,
      'submissionTime': submissionTime,
    };
  }
}
