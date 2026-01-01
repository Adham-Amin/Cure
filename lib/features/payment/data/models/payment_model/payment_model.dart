import 'package:cure/features/payment/domain/entities/payment_entity.dart';

import 'metadata.dart';

class PaymentModel {
  int? id;
  String? provider;
  String? brand;
  String? last4;
  int? expMonth;
  int? expYear;
  String? gateway;
  String? token;
  bool? isDefault;
  Metadata? metadata;
  String? createdAt;
  String? updatedAt;

  PaymentModel({
    this.id,
    this.provider,
    this.brand,
    this.last4,
    this.expMonth,
    this.expYear,
    this.gateway,
    this.token,
    this.isDefault,
    this.metadata,
    this.createdAt,
    this.updatedAt,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
    id: json['id'] as int?,
    provider: json['provider'] as String?,
    brand: json['brand'] as String?,
    last4: json['last4'] as String?,
    expMonth: json['exp_month'] as int?,
    expYear: json['exp_year'] as int?,
    gateway: json['gateway'] as String?,
    token: json['token'] as String?,
    isDefault: json['is_default'] as bool?,
    metadata: json['metadata'] == null
        ? null
        : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'provider': provider,
    'brand': brand,
    'last4': last4,
    'exp_month': expMonth,
    'exp_year': expYear,
    'gateway': gateway,
    'token': token,
    'is_default': isDefault,
    'metadata': metadata?.toJson(),
    'created_at': createdAt,
    'updated_at': updatedAt,
  };

  PaymentEntity toEntity() => PaymentEntity(
    token: token ?? '',
    cardHolderName: metadata?.cardholderName ?? '',
    maskedCard: metadata?.maskedCard ?? '',
    expMonth: expMonth ?? 0,
    expYear: expYear ?? 0,
  );
}
