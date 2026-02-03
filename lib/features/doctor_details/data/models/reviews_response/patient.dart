class Patient {
  int? id;
  String? name;
  dynamic photo;

  Patient({this.id, this.name, this.photo});

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    id: json['id'] as int?,
    name: json['name'] as String?,
    photo: json['photo'] as dynamic,
  );

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'photo': photo};
}
