import 'package:proheal/app/models/feedback.dart';
import 'package:proheal/app/models/prescription.dart';
import 'package:proheal/app/models/settings.dart';

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

  // probably to access the user prescription
  Prescription? userPrescription;

  // user device setting and all that sha
  Settings? userSettings;

  // user feedback (string, dynamic)
  FeedbackModel? userFeedback;

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
