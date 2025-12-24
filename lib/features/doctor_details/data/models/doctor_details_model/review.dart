import 'package:cure/features/doctor_details/domain/entities/review_entity.dart';

import 'user.dart';

class Review {
  num? id;
  num? rating;
  String? comment;
  User? user;
  String? createdAt;

  Review({this.id, this.rating, this.comment, this.user, this.createdAt});

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    id: json['id'] as num?,
    rating: json['rating'] as num?,
    comment: json['comment'] as String?,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    createdAt: json['created_at'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'rating': rating,
    'comment': comment,
    'user': user?.toJson(),
    'created_at': createdAt,
  };

  ReviewEntity toEntity() => ReviewEntity(
    rating: rating ?? 0,
    name: user?.name ?? '',
    review: comment ?? '',
    createdAt: createdAt ?? '',
  );
}
