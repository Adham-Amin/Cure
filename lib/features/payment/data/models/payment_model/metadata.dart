class Metadata {
  String? cardholderName;
  String? maskedCard;

  Metadata({this.cardholderName, this.maskedCard});

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    cardholderName: json['cardholder_name'] as String?,
    maskedCard: json['masked_card'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'cardholder_name': cardholderName,
    'masked_card': maskedCard,
  };
}
