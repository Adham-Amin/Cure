class PaymentResposne {
  int? id;
  String? brand;
  String? lastFour;
  int? expMonth;
  int? expYear;
  bool? isDefault;

  PaymentResposne({
    this.id,
    this.brand,
    this.lastFour,
    this.expMonth,
    this.expYear,
    this.isDefault,
  });

  factory PaymentResposne.fromJson(Map<String, dynamic> json) {
    return PaymentResposne(
      id: json['id'] as int?,
      brand: json['brand'] as String?,
      lastFour: json['last_four'] as String?,
      expMonth: json['exp_month'] as int?,
      expYear: json['exp_year'] as int?,
      isDefault: json['is_default'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'brand': brand,
    'last_four': lastFour,
    'exp_month': expMonth,
    'exp_year': expYear,
    'is_default': isDefault,
  };
}
