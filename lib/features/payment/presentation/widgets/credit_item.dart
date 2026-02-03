import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/core/widgets/custom_snack_bar.dart';
import 'package:cure/features/payment/data/models/payment_resposne.dart';
import 'package:cure/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CreditItem extends StatelessWidget {
  const CreditItem({super.key, required this.card});

  final PaymentResposne card;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(card.id.toString()),
      background: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(8.r),
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 16),
        child: const Icon(Icons.star, color: Colors.white),
      ),
      secondaryBackground: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8.r),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          context.read<PaymentCubit>().deletePaymentCard(
            id: card.id.toString(),
          );
          return true;
        }
        if (direction == DismissDirection.startToEnd) {
          context.read<PaymentCubit>().setDefaultPaymentCard(
            id: card.id.toString(),
          );
          customSnackBar(
            context: context,
            message: 'Card set as primary',
            type: AnimatedSnackBarType.success,
          );
          return false;
        }
        return false;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.lightCard,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            SvgPicture.asset(AppAssets.svgsBrandicoVisa),
            8.ws,
            Text(
              '${card.brand} •••• ${card.lastFour}',
              style: AppStyles.textRegular16.copyWith(color: AppColors.black),
            ),
            const Spacer(),
            if (card.isDefault == true)
              Text(
                'Primary',
                style: AppStyles.textRegular16.copyWith(
                  color: AppColors.primary,
                  fontFamily: AppStyles.fontGeorgia,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
