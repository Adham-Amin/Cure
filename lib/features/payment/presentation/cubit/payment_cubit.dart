import 'package:cure/features/payment/data/models/add_payment_request.dart';
import 'package:cure/features/payment/domain/entities/payment_entity.dart';
import 'package:cure/features/payment/domain/repositories/payment_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({required this.paymentRepo}) : super(PaymentInitial());

  final PaymentRepo paymentRepo;

  Future<void> getPaymentCards() async {
    emit(PaymentLoading());
    final result = await paymentRepo.getPaymentCards();
    result.fold(
      (l) => emit(PaymentError(message: l.message)),
      (r) => emit(PaymentLoaded(cards: r)),
    );
  }

  Future<void> addPaymentCard({required AddPaymentRequest card}) async {
    emit(PaymentLoading());
    final result = await paymentRepo.addPaymentCard(card: card);
    result.fold((l) => emit(PaymentError(message: l.message)), (r) async {
      await getPaymentCards();
    });
  }

  Future<void> deletePaymentCard({required String id}) async {
    final result = await paymentRepo.deletePaymentCard(id: id);
    result.fold((l) => emit(PaymentError(message: l.message)), (r) async {
      await getPaymentCards();
    });
  }

  Future<void> setDefaultPaymentCard({required String id}) async {
    final result = await paymentRepo.setDefaultPaymentCard(id: id);
    result.fold((l) => emit(PaymentError(message: l.message)), (r) async {
      await getPaymentCards();
    });
  }
}
