class AddPaymentRequest {
  String? lastFour;
  int? expMonth;
  int? expYear;
  AddPaymentRequest({this.lastFour, this.expMonth, this.expYear});

  factory AddPaymentRequest.fromJson(Map<String, dynamic> json) {
    return AddPaymentRequest(
      lastFour: json['last_four'] as String?,
      expMonth: json['exp_month'] as int?,
      expYear: json['exp_year'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'provider_token': 'pm_card_mastercard',
    'brand': 'MasterCard',
    'last_four': lastFour,
    'exp_month': expMonth,
    'exp_year': expYear,
    'is_default': true,
  };
}
