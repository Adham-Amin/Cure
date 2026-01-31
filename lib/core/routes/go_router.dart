import 'package:cure/core/di/service_locator.dart';
import 'package:cure/core/routes/app_routes.dart';
import 'package:cure/features/auth/presentation/views/forgot_password_view.dart';
import 'package:cure/features/auth/presentation/views/login_view.dart';
import 'package:cure/features/auth/presentation/views/otp_view.dart';
import 'package:cure/features/auth/presentation/views/register_view.dart';
import 'package:cure/features/auth/presentation/views/reset_password_view.dart';
import 'package:cure/features/auth/presentation/views/verify_phone_view.dart';
import 'package:cure/features/booking/domain/entities/booking_entity.dart';
import 'package:cure/features/change_password/presentation/pages/change_password_view.dart';
import 'package:cure/features/checkout/domain/entities/doctor_info_entity.dart';
import 'package:cure/features/checkout/presentation/views/book_appointment_view.dart';
import 'package:cure/features/checkout/presentation/views/checkout_view.dart';
import 'package:cure/features/doctor_details/presentation/pages/doctor_deatails_view.dart';
import 'package:cure/features/doctors/presentation/views/doctors_view.dart';
import 'package:cure/features/faqs/presentation/pages/faq_view.dart';
import 'package:cure/features/favourite/presentation/views/fav_view.dart';
import 'package:cure/features/feedback/presentation/pages/feedback_view.dart';
import 'package:cure/features/intro/onbording/presentation/views/onbording_view.dart';
import 'package:cure/features/intro/splash/presentation/views/splash_view.dart';
import 'package:cure/features/main/main_view.dart';
import 'package:cure/features/notifications/presentation/pages/notifications_view.dart';
import 'package:cure/features/payment/domain/repositories/payment_repo.dart';
import 'package:cure/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:cure/features/payment/presentation/pages/add_payment_card_view.dart';
import 'package:cure/features/payment/presentation/pages/payment_view.dart';
import 'package:cure/features/profile/presentation/pages/edit_profile_view.dart';
import 'package:cure/features/update_number/presentation/pages/update_num_otp_view.dart';
import 'package:cure/features/update_number/presentation/pages/update_num_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppGoRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRoutes.onbording,
        builder: (context, state) => const OnbordingView(),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: AppRoutes.forgetPassword,
        builder: (context, state) => const ForgotPasswordView(),
      ),
      GoRoute(
        path: AppRoutes.otp,
        builder: (context, state) => OtpView(phone: state.extra as String),
      ),
      GoRoute(
        path: AppRoutes.resetPassword,
        builder: (context, state) =>
            ResetPasswordView(phone: state.extra as String),
      ),
      GoRoute(
        path: AppRoutes.verifyPhone,
        builder: (context, state) =>
            VerifyPhoneView(phone: state.extra as String),
      ),
      GoRoute(
        path: AppRoutes.main,
        builder: (context, state) => MainView(key: MainView.mainViewKey),
      ),
      GoRoute(
        path: AppRoutes.doctors,
        builder: (context, state) => DoctorsView(),
      ),
      GoRoute(
        path: AppRoutes.favourite,
        builder: (context, state) => FavView(),
      ),
      GoRoute(
        path: AppRoutes.doctorDetails,
        builder: (context, state) {
          var args = state.extra as Map<String, dynamic>;
          return DoctorDetailsView(id: args['id'], image: args['image']);
        },
      ),
      GoRoute(
        path: AppRoutes.editProfile,
        builder: (context, state) {
          return const EditProfileView();
        },
      ),
      GoRoute(
        path: AppRoutes.changePassword,
        builder: (context, state) {
          return const ChangePasswordView();
        },
      ),
      GoRoute(
        path: AppRoutes.faq,
        builder: (context, state) {
          return const FaqView();
        },
      ),
      GoRoute(
        path: AppRoutes.feedback,
        builder: (context, state) {
          return FeedbackView(booking: state.extra as BookingEntity);
        },
      ),
      GoRoute(
        path: AppRoutes.updateNum,
        builder: (context, state) {
          return UpdateNumView();
        },
      ),
      GoRoute(
        path: AppRoutes.updateVerifyPhone,
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          return ChangeNumOtpView(num: args['num'], newNum: args['newNum']);
        },
      ),
      ShellRoute(
        builder: (context, state, child) => BlocProvider(
          create: (context) =>
              PaymentCubit(paymentRepo: getIt<PaymentRepo>())
                ..getPaymentCards(),
          child: child,
        ),
        routes: [
          GoRoute(
            path: AppRoutes.payment,
            builder: (context, state) {
              return const PaymentView();
            },
          ),
          GoRoute(
            path: AppRoutes.addPaymentCard,
            builder: (context, state) {
              return const AddPaymentCardView();
            },
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.bookAppointment,
        builder: (context, state) {
          return BookAppointmentView(doctor: state.extra as DoctorInfoEntity);
        },
      ),
      GoRoute(
        path: AppRoutes.checkout,
        builder: (context, state) {
          return CheckoutView(doctor: state.extra as DoctorInfoEntity);
        },
      ),
      GoRoute(
        path: AppRoutes.notifications,
        builder: (context, state) {
          return NotificationsView();
        },
      ),
    ],
  );
}
