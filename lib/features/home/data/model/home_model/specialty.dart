class Specialty {
  num? id;
  String? name;

  Specialty({this.id, this.name});

  factory Specialty.fromJson(Map<String, dynamic> json) =>
      Specialty(id: json['id'] as num?, name: json['name'] as String?);

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
