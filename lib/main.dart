import 'package:cure/core/di/service_locator.dart';
import 'package:cure/core/functions/theme_dark.dart';
import 'package:cure/core/functions/theme_light.dart';
import 'package:cure/core/routes/go_router.dart';
import 'package:cure/core/services/custom_observer_bloc.dart';
import 'package:cure/core/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Prefs.init();
  serverLocator();
  Bloc.observer = CustomObserverBloc();
  runApp(const Cure());
}

class Cure extends StatelessWidget {
  const Cure({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: themeLight(),
        darkTheme: themeDark(),
        routerConfig: AppGoRouter.router,
      ),
    );
  }
}
