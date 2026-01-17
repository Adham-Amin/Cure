import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/features/checkout/domain/entities/doctor_info_entity.dart';
import 'package:cure/features/checkout/presentation/widgets/header_checkout.dart';
import 'package:cure/features/checkout/presentation/widgets/payment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({
    super.key,
    required this.doctor,
    required this.selectedIndex,
    required this.onSelect,
  });

  final DoctorInfoEntity doctor;
  final int selectedIndex;
  final Function(int) onSelect;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.hs,
          HeaderCheckout(doctor: doctor),
          32.hs,
          Row(
            children: [
              SvgPicture.asset(AppAssets.svgsCalendar),
              8.ws,
              Text(doctor.dateTimeFormatted!, style: AppStyles.textRegular16),
            ],
          ),
          32.hs,
          Text(
            'Payment Method',
            style: AppStyles.textRegular20.copyWith(
              fontFamily: AppStyles.fontGeorgia,
            ),
          ),
          16.hs,
          PaymentItem(
            index: 0,
            indexPayment: onSelect,
            isSelected: selectedIndex == 0,
            title: 'Credit Card',
            icon: AppAssets.svgsBrandicoVisa,
          ),
          8.hs,
          PaymentItem(
            index: 1,
            indexPayment: onSelect,
            isSelected: selectedIndex == 1,
            title: 'PayPal',
            icon: AppAssets.svgsIcPaypal,
          ),
          8.hs,
          PaymentItem(
            index: 2,
            indexPayment: onSelect,
            isSelected: selectedIndex == 2,
            title: 'Cash',
          ),
        ],
      ),
    );
  }
}
