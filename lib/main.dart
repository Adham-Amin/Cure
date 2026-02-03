import 'package:cure/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:cure/core/di/service_locator.dart';
import 'package:cure/core/functions/theme_dark.dart';
import 'package:cure/core/functions/theme_light.dart';
import 'package:cure/core/routes/go_router.dart';
import 'package:cure/core/services/custom_observer_bloc.dart';
import 'package:cure/core/services/shared_preferences_service.dart';
import 'package:cure/core/utils/app_keys.dart';
import 'package:cure/features/favourite/domain/repositories/favourite_repo.dart';
import 'package:cure/features/favourite/presentation/cubit/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = AppKeys.stripePublishableKey;
  await Prefs.init();
  serverLocator();
  Bloc.observer = CustomObserverBloc();
  runApp(const Cure());
}

class Cure extends StatelessWidget {
  const Cure({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => ThemeCubit()),
      BlocProvider(
      create: (context) =>
          FavouriteCubit(favouriteRepo: getIt<FavouriteRepo>())..getFavourite(),
    ),
    ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(428, 926),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) => MaterialApp.router(
              debugShowCheckedModeBanner: false,
              themeMode: state,
              theme: themeLight(),
              darkTheme: themeDark(),
              routerConfig: AppGoRouter.router,
            ),
          );
        },
      ),
    );
  }
}
