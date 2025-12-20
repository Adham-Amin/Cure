import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SpecialtiesCard extends StatelessWidget {
  const SpecialtiesCard({
    super.key,
    required this.onTap,
    required this.title,
    this.isSelected,
  });

  final void Function() onTap;
  final String title;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ?? false ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.grey),
        ),
        child: Text(
          title,
          style: AppStyles.textRegular16.copyWith(
            color: isSelected ?? false ? AppColors.white : AppColors.black,
          ),
        ),
      ),
    );
  }
}
