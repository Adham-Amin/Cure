import 'package:cure/features/notifications/presentation/widgets/notification_item.dart';
import 'package:flutter/material.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [NotificationItem()]);
  }
}
