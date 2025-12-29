import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class FaqItem extends StatelessWidget {
  const FaqItem({
    super.key,
    required this.question,
    required this.answer,
    required this.isExpanded,
    required this.onExpansionChanged,
  });

  final String question;
  final String answer;
  final bool isExpanded;
  final ValueChanged<bool> onExpansionChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightCard,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ExpansionTile(
        shape: const Border(),
        collapsedShape: const Border(),
        onExpansionChanged: onExpansionChanged,
        trailing: Icon(isExpanded ? Icons.remove : Icons.add),
        title: Text(
          question,
          style: AppStyles.textMedium18.copyWith(
            fontFamily: AppStyles.fontGeorgia,
          ),
        ),
        childrenPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        children: [
          Text(
            answer,
            style: AppStyles.textMedium16.copyWith(color: AppColors.darkGrey),
          ),
        ],
      ),
    );
  }
}
