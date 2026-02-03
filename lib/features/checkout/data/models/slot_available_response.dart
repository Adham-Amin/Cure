class SlotAvailableResponse {
  String? date;
  String? startTime;
  String? endTime;
  String? dayName;

  SlotAvailableResponse({
    this.date,
    this.startTime,
    this.endTime,
    this.dayName,
  });

  factory SlotAvailableResponse.fromJson(Map<String, dynamic> json) {
    return SlotAvailableResponse(
      date: json['date'] as String?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      dayName: json['day_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'date': date,
    'start_time': startTime,
    'end_time': endTime,
    'day_name': dayName,
  };
}
