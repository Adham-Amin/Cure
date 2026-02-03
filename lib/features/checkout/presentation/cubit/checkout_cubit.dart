import 'package:cure/features/checkout/data/models/book_appointment_request.dart';
import 'package:cure/features/checkout/data/models/slot_available_response.dart';
import 'package:cure/features/checkout/domain/repo/checkout_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit({required this.checkoutRepo}) : super(CheckoutInitial());

  final CheckoutRepo checkoutRepo;

  List<SlotAvailableResponse> slots = [];

  Future<void> bookAppointment({required BookAppointmentRequest book}) async {
    emit(CheckoutLoading());
    final result = await checkoutRepo.bookAppointment(book: book);
    result.fold(
      (l) => emit(CheckoutError(message: l.message)),
      (r) => emit(CheckoutLoaded()),
    );
  }

  Future<void> getSlotsDoctor({required String doctorId}) async {
    emit(CheckoutLoading());
    final result = await checkoutRepo.getSlotsDoctor(doctorId: doctorId);
    result.fold((l) => emit(CheckoutError(message: l.message)), (r) {
      slots = r;
      emit(CheckoutLoaded());
    });
  }

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
      (r) => emit(CheckoutStripeLoaded()),
    );
  }
}
