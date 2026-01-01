class AddPaymentRequest {
  String? cardholderName;
  String? cardNumber;
  int? expMonth;
  int? expYear;
  String? cvv;
  String? brand;
  String? gateway;

  AddPaymentRequest({
    this.cardholderName,
    this.cardNumber,
    this.expMonth,
    this.expYear,
    this.cvv,
    this.brand,
    this.gateway,
  });

  factory AddPaymentRequest.fromJson(Map<String, dynamic> json) {
    return AddPaymentRequest(
      cardholderName: json['cardholder_name'] as String?,
      cardNumber: json['card_number'] as String?,
      expMonth: json['exp_month'] as int?,
      expYear: json['exp_year'] as int?,
      cvv: json['cvv'] as String?,
      brand: json['brand'] as String?,
      gateway: json['gateway'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'cardholder_name': cardholderName,
    'card_number': cardNumber,
    'exp_month': expMonth,
    'exp_year': expYear,
    'cvv': cvv,
    'brand': brand,
    'gateway': gateway,
  };
}
