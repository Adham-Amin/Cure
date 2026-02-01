class Birthdate {
  int? day;
  int? month;
  int? year;

  Birthdate({this.day, this.month, this.year});

  factory Birthdate.fromJson(Map<String, dynamic> json) => Birthdate(
    day: json['Day'] as int?,
    month: json['Month'] as int?,
    year: json['Year'] as int?,
  );

  Map<String, dynamic> toJson() => {'Day': day, 'Month': month, 'Year': year};
}
