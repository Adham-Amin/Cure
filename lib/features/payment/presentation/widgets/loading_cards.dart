import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/widgets/custom_button.dart';
import 'package:cure/features/payment/data/models/payment_resposne.dart';
import 'package:cure/features/payment/presentation/widgets/credit_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingCards extends StatelessWidget {
  const LoadingCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: [
          24.hs,
          ListView.separated(
            itemCount: 3,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) => 16.hs,
            itemBuilder: (context, index) => CreditItem(
              card: PaymentResposne(
                id: 0,
                expMonth: 0,
                expYear: 0,
                isDefault: false,
              ),
            ),
          ),
          Spacer(),
          CustomButton(title: 'Add New Card', onTap: () {}),
          32.hs,
        ],
      ),
    );
  }
}
