import 'package:cure/core/services/api_service.dart';
import 'package:cure/features/payment/data/models/add_payment_request.dart';
import 'package:cure/features/payment/data/models/payment_resposne.dart';

abstract class PaymentRemoteDataSource {
  Future<List<PaymentResposne>> getPaymentCards();
  Future<void> addPaymentCard({required AddPaymentRequest card});
  Future<void> deletePaymentCard({required String id});
  Future<void> setDefaultPaymentCard({required String id});
}

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  final ApiService apiService;
  PaymentRemoteDataSourceImpl({required this.apiService});

  @override
  Future<void> addPaymentCard({required AddPaymentRequest card}) async {
    await apiService.post(endPoint: '/saved-cards', data: card.toJson());
  }

  @override
  Future<void> deletePaymentCard({required String id}) async {
    await apiService.delete(endPoint: '/saved-cards/$id');
  }

  @override
  Future<List<PaymentResposne>> getPaymentCards() async {
    final response = await apiService.get(endPoint: '/saved-cards');

    List<PaymentResposne> cards = [];

    for (var card in response['data']) {
      cards.add(PaymentResposne.fromJson(card));
    }
    return cards;
  }

  @override
  Future<void> setDefaultPaymentCard({required String id}) async {
    await apiService.put(endPoint: '/saved-cards/$id/default');
  }
}
