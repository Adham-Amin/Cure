import 'package:cure/core/services/api_service.dart';
import 'package:cure/features/payment/data/models/add_payment_request.dart';
import 'package:cure/features/payment/data/models/payment_model/payment_model.dart';

abstract class PaymentRemoteDataSource {
  Future<List<PaymentModel>> getPaymentCards();
  Future<void> addPaymentCard({required AddPaymentRequest card});
  Future<void> deletePaymentCard({required String id});
  Future<void> setDefaultPaymentCard({required String id});
}

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  final ApiService apiService;
  PaymentRemoteDataSourceImpl({required this.apiService});

  @override
  Future<void> addPaymentCard({required AddPaymentRequest card}) async {
    await apiService.post(endPoint: '/payment-methods', data: card.toJson());
  }

  @override
  Future<void> deletePaymentCard({required String id}) async {
    await apiService.delete(endPoint: '/payment-methods/$id');
  }

  @override
  Future<List<PaymentModel>> getPaymentCards() async {
    final response = await apiService.get(endPoint: '/payment-methods');

    List<PaymentModel> cards = [];

    for (var card in response['data']) {
      cards.add(PaymentModel.fromJson(card));
    }
    return cards;
  }

  @override
  Future<void> setDefaultPaymentCard({required String id}) async {
    await apiService.put(endPoint: '/payment-methods/25/default');
  }
}
