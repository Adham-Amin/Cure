import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cure/core/functions/navigate_to_tab.dart';
import 'package:cure/core/routes/app_routes.dart';
import 'package:cure/core/services/shared_preferences_service.dart';
import 'package:cure/core/utils/app_keys.dart';
import 'package:cure/core/widgets/custom_button.dart';
import 'package:cure/core/widgets/custom_snack_bar.dart';
import 'package:cure/features/checkout/data/models/book_appointment_request.dart';
import 'package:cure/features/checkout/data/models/transactions_request/amount.dart';
import 'package:cure/features/checkout/data/models/transactions_request/details.dart';
import 'package:cure/features/checkout/data/models/transactions_request/item.dart';
import 'package:cure/features/checkout/data/models/transactions_request/item_list.dart';
import 'package:cure/features/checkout/data/models/transactions_request/transactions_request.dart';
import 'package:cure/features/checkout/domain/entities/doctor_info_entity.dart';
import 'package:cure/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:go_router/go_router.dart';

class ButtonPayment extends StatelessWidget {
  const ButtonPayment({
    super.key,
    required this.indexPayment,
    required this.doctor,
  });

  final num indexPayment;
  final DoctorInfoEntity doctor;

  void _bookDirect(BuildContext context) {
    context.read<CheckoutCubit>().bookAppointment(
      book: BookAppointmentRequest(
        doctorId: doctor.id,
        dateTime: doctor.timeAppointment!,
      ),
    );
  }

  Future<void> _payWithStripe(BuildContext context) async {
    await context.read<CheckoutCubit>().paymentWithStripe(
      amount: '${(doctor.price * 100).toInt()}',
      currency: 'USD',
      customerId: Prefs.getCustomStripe(),
    );
  }

  void _payWithPaypal(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: AppKeys.paypalClientId,
          secretKey: AppKeys.paypalSecret,
          transactions: [
            TransactionsRequest(
              amount: Amount(
                currency: "USD",
                total: "${doctor.price}",
                details: Details(
                  subtotal: "${doctor.price}",
                  shipping: "0",
                  shippingDiscount: 0,
                ),
              ),
              description: "The payment transaction description.",
              itemList: ItemList(
                items: [
                  Item(
                    name: "Book Appointment With ${doctor.name}",
                    quantity: 1,
                    price: "${doctor.price}",
                    currency: "USD",
                  ),
                ],
              ),
            ).toJson(),
          ],
          note: "Payment for Appointment",
          onSuccess: (Map params) async {
            Navigator.pop(context);
            _bookDirect(context);
          },
          onError: (error) {
            Navigator.pop(context);
            customSnackBar(
              context: context,
              message: error.toString(),
              type: AnimatedSnackBarType.error,
            );
          },
          onCancel: () {
            Navigator.pop(context);
            customSnackBar(
              context: context,
              message: "Payment cancelled",
              type: AnimatedSnackBarType.error,
            );
          },
        ),
      ),
    );
  }

  VoidCallback _getAction(BuildContext context) {
    switch (indexPayment) {
      case 0:
        return () => _payWithStripe(context);
      case 1:
        return () => _payWithPaypal(context);
      default:
        return () => _bookDirect(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state is CheckoutLoaded) {
          customSnackBar(
            context: context,
            message: 'Appointment Booked Successfully',
            type: AnimatedSnackBarType.success,
          );
          context.go(AppRoutes.main);
          navigateToTab(context, 0);
        }

        if (state is CheckoutStripeLoaded) {
          _bookDirect(context);
        }

        if (state is CheckoutError) {
          customSnackBar(
            context: context,
            message: state.message,
            type: AnimatedSnackBarType.error,
          );
        }
      },

      builder: (context, state) {
        return CustomButton(
          isLoading: state is CheckoutLoading,
          title: 'Book Appointment',
          onTap: _getAction(context),
        );
      },
    );
  }
}
