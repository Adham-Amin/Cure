import 'package:cure/core/routes/app_routes.dart';
import 'package:cure/features/auth/presentation/views/forgot_password_view.dart';
import 'package:cure/features/auth/presentation/views/login_phone_view.dart';
import 'package:cure/features/auth/presentation/views/login_view.dart';
import 'package:cure/features/auth/presentation/views/otp_view.dart';
import 'package:cure/features/auth/presentation/views/register_view.dart';
import 'package:cure/features/auth/presentation/views/reset_password_view.dart';
import 'package:cure/features/auth/presentation/views/verify_phone_view.dart';
import 'package:cure/features/doctor_details/presentation/pages/doctor_deatails_view.dart';
import 'package:cure/features/doctors/presentation/views/doctors_view.dart';
import 'package:cure/features/favourite/presentation/views/fav_view.dart';
import 'package:cure/features/intro/onbording/presentation/views/onbording_view.dart';
import 'package:cure/features/intro/splash/presentation/views/splash_view.dart';
import 'package:cure/features/main/main_view.dart';
import 'package:cure/features/specialties/presentation/views/doctors_specialty_view.dart';
import 'package:cure/features/specialties/presentation/views/specialties_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppGoRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: <GoRoute>[
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
        builder: (context, state) => OtpView(email: state.extra as String),
      ),
      GoRoute(
        path: AppRoutes.resetPassword,
        builder: (context, state) =>
            ResetPasswordView(email: state.extra as String),
      ),
      GoRoute(
        path: AppRoutes.phoneLogin,
        builder: (context, state) => LoginPhoneView(),
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
        path: AppRoutes.specialties,
        builder: (context, state) =>
            SpecialtiesView(specialties: state.extra as List<String>),
      ),
      GoRoute(
        path: AppRoutes.doctorsBySpecialties,
        builder: (context, state) =>
            DoctorsBySpecialtyView(specialty: state.extra as String),
      ),
      GoRoute(
        path: AppRoutes.doctors,
        builder: (context, state) =>
            DoctorsView(specialties: state.extra as List<String>),
      ),
      GoRoute(
        path: AppRoutes.favourite,
        builder: (context, state) => FavView(),
      ),
      GoRoute(
        path: AppRoutes.doctorDetails,
        builder: (context, state) =>
            DoctorDetailsView(id: state.extra as String),
      ),
    ],
  );
}
