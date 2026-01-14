import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/features/checkout/domain/entities/doctor_info_entity.dart';
import 'package:cure/features/checkout/presentation/widgets/button_book_appointment.dart';
import 'package:cure/features/checkout/presentation/widgets/header_checkout.dart';
import 'package:cure/features/checkout/presentation/widgets/select_date_time_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookAppointmentViewBody extends StatefulWidget {
  const BookAppointmentViewBody({super.key, required this.doctor});

  final DoctorInfoEntity doctor;

  @override
  State<BookAppointmentViewBody> createState() =>
      _BookAppointmentViewBodyState();
}

class _BookAppointmentViewBodyState extends State<BookAppointmentViewBody> {
  String selectedDate = '';
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                24.hs,
                HeaderCheckout(doctor: widget.doctor),
                24.hs,
                Text(
                  'Select a day',
                  style: AppStyles.textRegular20.copyWith(
                    fontFamily: AppStyles.fontGeorgia,
                  ),
                ),
                16.hs,
                SelectDateTimeForm(
                  onDateTimeSelected: (dateTime) {
                    setState(() {
                      selectedDate = dateTime;
                    });
                  },
                ),
                180.hs,
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ButtonBookAppointment(
              doctor: widget.doctor,
              selectedDate: selectedDate,
            ),
          ),
        ],
      ),
    );
  }
}
