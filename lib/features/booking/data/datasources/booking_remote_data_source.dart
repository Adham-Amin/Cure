import 'package:cure/core/services/api_service.dart';
import 'package:cure/features/booking/data/models/booking_model/booking_model.dart';

abstract class BookingRemoteDataSource {
  Future<List<BookingModel>> getBookings();
  Future<void> cancelBooking({required String id});
  Future<void> rescheduleBooking({required String id, required String date});
}

class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  final ApiService apiService;
  BookingRemoteDataSourceImpl({required this.apiService});
  @override
  Future<void> cancelBooking({required String id}) async {
    await apiService.delete(endPoint: '/patient/bookings/$id/cancel');
  }

  @override
  Future<List<BookingModel>> getBookings() async {
    final response = await apiService.get(endPoint: '/patient/bookings');

    List<BookingModel> bookings = [];

    for (var booking in response['data']['data']) {
      bookings.add(BookingModel.fromJson(booking));
    }
    return bookings;
  }

  @override
  Future<void> rescheduleBooking({
    required String id,
    required String date,
  }) async {
    await apiService.put(
      endPoint: '/patient/bookings/$id/reschedule',
      data: {'date_time': date},
    );
  }
}
