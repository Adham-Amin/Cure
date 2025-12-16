import 'package:cure/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class GenderItem extends StatelessWidget {
  const GenderItem({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: AppStyles.textMedium14),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      onTap: onTap,
    );
  }
}
