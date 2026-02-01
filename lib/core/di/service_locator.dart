import 'package:cure/features/booking/data/datasources/booking_remote_data_source.dart';
import 'package:cure/features/booking/data/repositories/booking_repo_impl.dart';
import 'package:cure/features/booking/domain/repositories/booking_repo.dart';
import 'package:cure/features/change_password/data/datasources/change_password_remote_data_source.dart';
import 'package:cure/features/change_password/data/repositories/change_password_repo_impl.dart';
import 'package:cure/features/change_password/domain/repositories/change_password_repo.dart';
import 'package:cure/features/checkout/data/datasource/checkout_remote_data_source.dart';
import 'package:cure/features/checkout/data/repo/checkout_repo_impl.dart';
import 'package:cure/features/checkout/domain/repo/checkout_repo.dart';
import 'package:cure/features/doctor_details/data/datasources/doctor_details_remote_data_source.dart';
import 'package:cure/features/doctor_details/data/repositories/doctor_details_repo_impl.dart';
import 'package:cure/features/doctor_details/domain/repositories/doctor_details_repo.dart';
import 'package:cure/features/doctors/data/data_source/doctors_remote_data_source.dart';
import 'package:cure/features/doctors/data/repos/doctors_repo_impl.dart';
import 'package:cure/features/doctors/domain/repo/doctor_repo.dart';
import 'package:cure/features/faqs/data/datasources/faq_remote_data_source.dart';
import 'package:cure/features/faqs/data/repositories/faq_repo_impl.dart';
import 'package:cure/features/faqs/domain/repositories/faq_repo.dart';
import 'package:cure/features/favourite/data/datasources/favourite_remote_data_source.dart';
import 'package:cure/features/favourite/data/repositories/favourite_repo_impl.dart';
import 'package:cure/features/favourite/domain/repositories/favourite_repo.dart';
import 'package:cure/features/feedback/data/datasources/feedback_remote_data_source.dart';
import 'package:cure/features/feedback/data/repositories/feedback_repo_impl.dart';
import 'package:cure/features/feedback/domain/repositories/feedback_repo.dart';
import 'package:cure/features/home/data/data_source/home_remote_data_source.dart';
import 'package:cure/features/home/data/repos/home_repo_impl.dart';
import 'package:cure/features/home/domain/repos/home_repo.dart';
import 'package:cure/features/payment/data/datasources/payment_remote_data_source.dart';
import 'package:cure/features/payment/data/repositories/payment_repo_impl.dart';
import 'package:cure/features/payment/domain/repositories/payment_repo.dart';
import 'package:cure/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:cure/features/profile/data/repositories/profile_repo_impl.dart';
import 'package:cure/features/profile/domain/repositories/profile_repo.dart';
import 'package:cure/features/search/data/datasources/search_remote_data_source.dart';
import 'package:cure/features/search/data/repositories/search_repo_impl.dart';
import 'package:cure/features/search/domain/repositories/search_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:cure/core/services/api_service.dart';
import 'package:cure/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:cure/features/auth/data/repos/auth_repo_impl.dart';
import 'package:cure/features/auth/domain/repo/auth_repo.dart';

final getIt = GetIt.instance;

void serverLocator() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authRemoteDataSource: getIt<AuthRemoteDataSource>()),
  );

  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(homeRemoteDataSource: getIt<HomeRemoteDataSource>()),
  );

  getIt.registerLazySingleton<DoctorsRemoteDataSource>(
    () => DoctorsRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<DoctorsRepo>(
    () => DoctorsRepoImpl(
      doctorsRemoteDataSource: getIt<DoctorsRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<SearchRemoteDataSource>(
    () => SearchRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<SearchRepo>(
    () =>
        SearchRepoImpl(searchRemoteDataSource: getIt<SearchRemoteDataSource>()),
  );

  getIt.registerLazySingleton<FavouriteRemoteDataSource>(
    () => FavouriteRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<FavouriteRepo>(
    () => FavouriteRepoImpl(
      favouriteRemoteDataSource: getIt<FavouriteRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<DoctorDetailsRemoteDataSource>(
    () => DoctorDetailsRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<DoctorDetailsRepo>(
    () => DoctorDetailsRepoImpl(
      doctorDetailsRemoteDataSource: getIt<DoctorDetailsRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(
      profileRemoteDataSource: getIt<ProfileRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<FaqRemoteDataSource>(
    () => FaqRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<FaqRepo>(
    () => FaqRepoImpl(faqRemoteDataSource: getIt<FaqRemoteDataSource>()),
  );

  getIt.registerLazySingleton<ChangePasswordRemoteDataSource>(
    () => ChangePasswordRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<ChangePasswordRepo>(
    () => ChangePasswordRepoImpl(
      changePasswordRemoteDataSource: getIt<ChangePasswordRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<PaymentRemoteDataSource>(
    () => PaymentRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<PaymentRepo>(
    () => PaymentRepoImpl(
      paymentRemoteDataSource: getIt<PaymentRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<BookingRemoteDataSource>(
    () => BookingRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<BookingRepo>(
    () => BookingRepoImpl(
      bookingRemoteDataSource: getIt<BookingRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<FeedbackRemoteDataSource>(
    () => FeedbackRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<FeedbackRepo>(
    () => FeedbackRepoImpl(
      feedbackRemoteDataSource: getIt<FeedbackRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<CheckoutRemoteDataSource>(
    () => CheckoutRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<CheckoutRepo>(
    () => CheckoutRepoImpl(
      checkoutRemoteDataSource: getIt<CheckoutRemoteDataSource>(),
    ),
  );
}
