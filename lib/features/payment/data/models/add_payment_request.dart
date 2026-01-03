class AddPaymentRequest {
  String? cardholderName;
  String? cardNumber;
  int? expMonth;
  int? expYear;
  String? cvv;

  AddPaymentRequest({
    this.cardholderName,
    this.cardNumber,
    this.expMonth,
    this.expYear,
    this.cvv,
  });

  Map<String, dynamic> toJson() => {
    'cardholder_name': cardholderName,
    'card_number': cardNumber,
    'exp_month': expMonth,
    'exp_year': expYear,
    'cvv': cvv,
    'brand': 'VISA',
    'gateway': 'stripe',
  };
}
