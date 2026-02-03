import 'package:cure/core/services/api_service.dart';
import 'package:cure/features/booking/data/models/booking_response/booking_response.dart';

abstract class BookingRemoteDataSource {
  Future<List<BookingResponse>> getBookings();
  Future<void> cancelBooking({required String id});
  Future<void> rescheduleBooking({
    required String id,
    required String appointmentDate,
    required String appointmentTime,
  });
}

class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  final ApiService apiService;
  BookingRemoteDataSourceImpl({required this.apiService});
  @override
  Future<void> cancelBooking({required String id}) async {
    await apiService.post(
      endPoint: '/bookings/$id/cancel',
      data: {"cancellation_reason": "N/A"},
    );
  }

  @override
  Future<List<BookingResponse>> getBookings() async {
    final response = await apiService.get(endPoint: '/bookings');

    List<BookingResponse> bookings = [];

    for (var booking in response['data']) {
      bookings.add(BookingResponse.fromJson(booking));
    }
    return bookings;
  }

  @override
  Future<void> rescheduleBooking({
    required String id,
    required String appointmentDate,
    required String appointmentTime,
  }) async {
    await apiService.put(
      endPoint: '/bookings/$id',
      data: {
        "appointment_date": appointmentDate,
        "appointment_time": appointmentTime,
        "notes": "Rescheduled for now"
      },
    );
  }
}
