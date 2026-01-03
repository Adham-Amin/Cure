class PaymentEntity {
  final num id;
  final String token;
  final String cardHolderName;
  final String maskedCard;
  final num expMonth;
  final num expYear;
  final bool isDefault;

  PaymentEntity({
    required this.id,
    required this.isDefault,
    required this.cardHolderName,
    required this.maskedCard,
    required this.token,
    required this.expMonth,
    required this.expYear,
  });
}
