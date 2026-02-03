class FeedbackRequest {
  num? bookingId;
  num? rating;
  String? comment;

  FeedbackRequest({
    this.bookingId,
    this.rating,
    this.comment,
  });

  Map<String, dynamic> toJson() => {
    'booking_id': bookingId,
    'rating': rating,
    'comment': comment,
  };
}
