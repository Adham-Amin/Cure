import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cure/core/routes/app_routes.dart';
import 'package:cure/core/services/shared_preferences_service.dart';
import 'package:cure/core/widgets/custom_button.dart';
import 'package:cure/features/intro/onbording/data/model/onbording_model.dart';

class ButtonNext extends StatelessWidget {
  const ButtonNext({super.key, required this.currentPage});

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: currentPage == OnbordingModel.onbordingList.length - 1,
      maintainState: true,
      maintainAnimation: true,
      maintainSize: true,
      child: CustomButton(
        onTap: () {
          Prefs.setBool('SeenOn', true);
          context.go(AppRoutes.login);
        },
        title: 'Get Started',
      ),
    );
  }
}
