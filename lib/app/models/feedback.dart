class Feedbackmodel {
  String? complain;
  String? imageUrl;
  DateTime? feedbackSubmit;

  Feedbackmodel({this.complain, this.feedbackSubmit, this.imageUrl});

  // probably a toJson to get the data to the database (server) with the time of it included
}
