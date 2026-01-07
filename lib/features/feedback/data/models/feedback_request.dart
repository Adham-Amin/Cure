class FeedbackRequest {
  num? bookingId;
  num? patientId;
  num? doctorId;
  num? rating;
  String? comment;

  FeedbackRequest({
    this.bookingId,
    this.patientId,
    this.doctorId,
    this.rating,
    this.comment,
  });

  factory FeedbackRequest.fromJson(Map<String, dynamic> json) {
    return FeedbackRequest(
      bookingId: json['booking_id'] as num?,
      patientId: json['patient_id'] as num?,
      doctorId: json['doctor_id'] as num?,
      rating: json['rating'] as num?,
      comment: json['comment'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'booking_id': bookingId,
    'patient_id': patientId,
    'doctor_id': doctorId,
    'rating': rating,
    'comment': comment,
  };
}
