import 'patient.dart';

class ReviewsResponse {
  int? id;
  int? rating;
  String? comment;
  String? doctorResponse;
  String? createdAt;
  dynamic respondedAt;
  Patient? patient;

  ReviewsResponse({
    this.id,
    this.rating,
    this.comment,
    this.doctorResponse,
    this.createdAt,
    this.respondedAt,
    this.patient,
  });

  factory ReviewsResponse.fromJson(Map<String, dynamic> json) {
    return ReviewsResponse(
      id: json['id'] as int?,
      rating: json['rating'] as int?,
      comment: json['comment'] as String?,
      doctorResponse: json['doctor_response'] as String?,
      createdAt: json['created_at'] as String?,
      respondedAt: json['responded_at'] as dynamic,
      patient: json['patient'] == null
          ? null
          : Patient.fromJson(json['patient'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'rating': rating,
    'comment': comment,
    'doctor_response': doctorResponse,
    'created_at': createdAt,
    'responded_at': respondedAt,
    'patient': patient?.toJson(),
  };
}
