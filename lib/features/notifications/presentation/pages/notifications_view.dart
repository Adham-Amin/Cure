import 'package:cure/features/notifications/presentation/widgets/notifications_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop(),
        ),
        title: const Text('Notifications'),
      ),
      body: NotificationsViewBody(),
    );
  }
}