class Prescription {
  String? drugName;
  String? dosage;
  String? additionalNotes;

  Prescription({this.additionalNotes, this.drugName, this.dosage});

  Map<String, dynamic> toMap() {
    return {
      'drugName': drugName,
      'dosage': dosage,
      'additionalNotes': additionalNotes
    };
  }
}


// similar logic to a to do list and all that