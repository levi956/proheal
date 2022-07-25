class FeedbackModel {
  String? patientFeedback;
  String? imageUrl;
  DateTime? submissionTime;

  FeedbackModel({this.patientFeedback, this.submissionTime, this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'patientFeedback': patientFeedback,
      'imageUrl': imageUrl,
      'submissionTime': submissionTime,
    };
  }
}
