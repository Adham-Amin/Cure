class Specialty {
  int? id;
  String? name;

  Specialty({this.id, this.name});

  factory Specialty.fromJson(Map<String, dynamic> json) =>
      Specialty(id: json['id'] as int?, name: json['name'] as String?);

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
