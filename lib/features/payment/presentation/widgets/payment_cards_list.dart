import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/widgets/custom_button.dart';
import 'package:cure/features/payment/domain/entities/payment_entity.dart';
import 'package:cure/features/payment/presentation/widgets/credit_item.dart';
import 'package:flutter/material.dart';

class PaymentCardsList extends StatelessWidget {
  const PaymentCardsList({super.key, required this.cards});

  final List<PaymentEntity> cards;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        24.hs,
        Expanded(
          child: ListView.separated(
            itemCount: cards.length,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => 16.hs,
            itemBuilder: (context, index) => CreditItem(card: cards[index]),
          ),
        ),
        CustomButton(title: 'Add New Card', onTap: () {}),
        32.hs,
      ],
    );
  }
}
