import 'birthdate.dart';

class ExtraData {
  Birthdate? birthdate;

  ExtraData({this.birthdate});

  factory ExtraData.fromJson(Map<String, dynamic> json) => ExtraData(
    birthdate: json['birthdate'] == null
        ? null
        : Birthdate.fromJson(json['birthdate'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {'birthdate': birthdate?.toJson()};
}
