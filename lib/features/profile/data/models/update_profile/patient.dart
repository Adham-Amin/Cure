class Patient {
  num? patientId;
  String? birthdate;
  dynamic medicalNotes;

  Patient({this.patientId, this.birthdate, this.medicalNotes});

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    patientId: json['patient_id'] as num?,
    birthdate: json['birthdate'] as String?,
    medicalNotes: json['medical_notes'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
    'patient_id': patientId,
    'birthdate': birthdate,
    'medical_notes': medicalNotes,
  };
}
