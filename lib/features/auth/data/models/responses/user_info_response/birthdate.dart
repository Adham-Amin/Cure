class Birthdate {
  dynamic day;
  dynamic month;
  dynamic year;

  Birthdate({this.day, this.month, this.year});

  factory Birthdate.fromJson(Map<String, dynamic> json) => Birthdate(
    day: json['Day'] as dynamic,
    month: json['Month'] as dynamic,
    year: json['Year'] as dynamic,
  );

  Map<String, dynamic> toJson() => {'Day': day, 'Month': month, 'Year': year};
}
