import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/features/booking/domain/entities/booking_entity.dart';
import 'package:cure/features/booking/presentation/widgets/booking_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BookingLoadingList extends StatelessWidget {
  const BookingLoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 24, bottom: 16),
        itemCount: 3,
        separatorBuilder: (_, __) => 16.hs,
        itemBuilder: (context, index) => BookingItem(
          booking: BookingEntity(
            id: index,
            dateTimeFormatted: 'Mon, Jun 21 - 10:00 AM',
            statusLabel: 'Pending',
            doctorClinicAddress: '123, Main Street',
            doctorName: 'Adham Amin',
            doctorSpecialty: 'Dentist',
          ),
          image: AppAssets.imagesDocOne,
        ),
      ),
    );
  }
}
