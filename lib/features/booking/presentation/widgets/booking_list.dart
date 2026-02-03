import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/features/booking/domain/entities/booking_entity.dart';
import 'package:cure/features/booking/presentation/widgets/booking_item.dart';
import 'package:flutter/material.dart';

class BookingList extends StatelessWidget {
  const BookingList({super.key, required this.bookings});

  final List<BookingEntity> bookings;

  @override
  Widget build(BuildContext context) {
    final sortedBookings = bookings
      ..sort((a, b) => b.dateTimeFormatted.compareTo(a.dateTimeFormatted));
    return ListView.separated(
      reverse: true,
      padding: const EdgeInsets.only(top: 24, bottom: 16),
      physics: const BouncingScrollPhysics(),
      itemCount: bookings.length,
      separatorBuilder: (_, __) => 16.hs,
      itemBuilder: (context, index) => BookingItem(
        booking: sortedBookings[index],
        image: AppAssets.imagesDocOne,
      ),
    );
  }
}
