import 'package:cure/features/checkout/domain/entities/doctor_info_entity.dart';
import 'package:cure/features/checkout/presentation/widgets/button_checkout.dart';
import 'package:cure/features/checkout/presentation/widgets/payment_methods.dart';
import 'package:flutter/material.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key, required this.doctor});

  final DoctorInfoEntity doctor;

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  int paymentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          PaymentMethods(
            doctor: widget.doctor,
            selectedIndex: paymentIndex,
            onSelect: (index) {
              setState(() {
                paymentIndex = index;
              });
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ButtonCheckout(
              doctor: widget.doctor,
              indexPayment: paymentIndex,
            ),
          ),
        ],
      ),
    );
  }
}
