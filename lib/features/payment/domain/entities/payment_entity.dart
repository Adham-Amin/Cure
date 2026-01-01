class PaymentEntity {
  final String token;
  final String cardHolderName;
  final String maskedCard;
  final num expMonth;
  final num expYear;

  PaymentEntity({
    required this.cardHolderName,
    required this.maskedCard,
    required this.token,
    required this.expMonth,
    required this.expYear,
  });
}
