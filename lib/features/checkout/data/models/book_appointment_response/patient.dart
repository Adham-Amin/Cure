class Patient {
  int? id;
  String? name;
  dynamic image;

  Patient({this.id, this.name, this.image});

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    id: json['id'] as int?,
    name: json['name'] as String?,
    image: json['image'] as dynamic,
  );

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'image': image};
}
