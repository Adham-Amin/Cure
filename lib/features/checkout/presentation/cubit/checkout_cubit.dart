import 'package:cure/features/checkout/domain/repo/checkout_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit({required this.checkoutRepo}) : super(CheckoutInitial());

  final CheckoutRepo checkoutRepo;

  Future<void> paymentWithStripe({
    required String amount,
    required String currency,
    required String customerId,
  }) async {
    emit(CheckoutLoading());
    final result = await checkoutRepo.paymentWithStripe(
      amount: amount,
      currency: currency,
      customerId: customerId,
    );
    result.fold(
      (l) => emit(CheckoutError(message: l.message)),
      (r) => emit(CheckoutLoaded()),
    );
  }
}
