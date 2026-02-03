import 'dart:developer';
import 'package:cure/features/checkout/data/models/ephermeral_keys_model/ephermeral_keys_model.dart';
import 'package:cure/features/checkout/data/models/payment_intents_model/payment_intents_model.dart';
import 'package:cure/features/checkout/domain/entities/ephermeral_keys_entity.dart';
import 'package:cure/features/checkout/domain/entities/payment_intents_entity.dart';
import 'package:cure/core/services/api_service.dart';
import 'package:cure/core/utils/app_keys.dart';
import 'package:cure/features/checkout/data/models/book_appointment_request.dart';
import 'package:cure/features/checkout/data/models/book_appointment_response/book_appointment_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

abstract class CheckoutRemoteDataSource {
  Future<BookAppointmentResponse> bookAppointment({
    required BookAppointmentRequest book,
  });
  Future<EphermeralKeysEntity> getEphermeralkey({required String customerId});
  Future<PaymentIntentsEntity> createPaymentIntent({
    required String amount,
    required String currency,
    required String customerId,
  });
  Future<void> initPaymentSheet({
    required String clinicSecret,
    required String ephemeralKey,
    required String customerId,
  });
  Future<void> showPaymentSheet();
}

class CheckoutRemoteDataSourceImpl implements CheckoutRemoteDataSource {
  final ApiService apiService;
  CheckoutRemoteDataSourceImpl({required this.apiService});

  @override
  Future<BookAppointmentResponse> bookAppointment({
    required BookAppointmentRequest book,
  }) async {
    var response = await apiService.post(
      endPoint: '/patient/bookings',
      data: book.toJson(),
    );
    return BookAppointmentResponse.fromJson(response['data']);
  }

  @override
  Future<EphermeralKeysEntity> getEphermeralkey({
    required String customerId,
  }) async {
    var response = await apiService.post(
      baseUrl: 'https://api.stripe.com/v1/',
      endPoint: 'ephemeral_keys',
      data: {'customer': customerId},
      options: Options(
        headers: {
          'Authorization': "Bearer ${AppKeys.stripeSecreteKey}",
          'Content-Type': 'application/x-www-form-urlencoded',
          'Stripe-Version': '2023-10-16',
        },
      ),
    );

    return EphermeralKeysModel.fromJson(response).toEntity();
  }

  @override
  Future<PaymentIntentsEntity> createPaymentIntent({
    required String amount,
    required String currency,
    required String customerId,
  }) async {
    var response = await apiService.post(
      baseUrl: 'https://api.stripe.com/v1/',
      endPoint: 'payment_intents',
      data: {'amount': amount, 'currency': currency, 'customer': customerId},
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: {'Authorization': "Bearer ${AppKeys.stripeSecreteKey}"},
      ),
    );

    return PaymentIntentsModel.fromJson(response).toEntity();
  }

  @override
  Future<void> initPaymentSheet({
    required String clinicSecret,
    required String ephemeralKey,
    required String customerId,
  }) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'Checkout Eng.Adham',
          paymentIntentClientSecret: clinicSecret,
          customerEphemeralKeySecret: ephemeralKey,
          customerId: customerId,
        ),
      );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> showPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }
}
