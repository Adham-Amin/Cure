import 'package:cure/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerWithShadow extends StatelessWidget {
  const ContainerWithShadow({super.key, required this.child, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withValues(alpha: 0.8),
            offset: const Offset(0, 0),
            blurRadius: 6.r,
          ),
        ],
      ),
      child: InkWell(onTap: onTap, child: child),
    );
  }
}
