import 'package:proheal/app/models/feedback.dart';
import 'package:proheal/app/models/prescription.dart';

class User {
  String? fullName;
  String? email;
  String? phoneNumber;
  String? gender;
  String? height;
  String? weight;
  String? userDefaultChoiceoOption;
  String? femaleConcieved;
  String? bloodGroup;

  // probably to access the user prescription (map)
  Map<String, Prescription>? userPrescription;

  // user feedback (map)
  Map<String, FeedbackModel>? userFeedback;

  User(
      {this.fullName,
      this.email,
      this.bloodGroup,
      this.femaleConcieved,
      this.gender,
      this.height,
      this.phoneNumber,
      this.userDefaultChoiceoOption,
      this.userFeedback,
      this.userPrescription,
      this.weight});

  // but what am i copying ?
  User copyWith() {
    return User();
  }

  Map<String, dynamic> toMap() {
    return {
      'name': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'height': height,
      'weight': weight,
      'bloodGroup': bloodGroup,
      'userDefaultOption': userDefaultChoiceoOption,
      'femaleConcieved': femaleConcieved,
      'prescription': userPrescription,
      'feedback': userFeedback,
    };
  }
}
