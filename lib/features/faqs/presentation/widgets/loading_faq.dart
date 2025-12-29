import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingFaq extends StatelessWidget {
  const LoadingFaq({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Padding(
        padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
        child: ListView.separated(
          itemCount: 3,
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (context, index) => 16.hs,
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              color: AppColors.lightCard,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ExpansionTile(
              shape: const Border(),
              trailing: Icon(Icons.add),
              title: Text(
                'What is this app used for?',
                style: AppStyles.textMedium18.copyWith(
                  fontFamily: AppStyles.fontGeorgia,
                ),
              ),
              childrenPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              children: [
                Divider(height: 1),
                12.hs,
                Text(
                  'This app allows you to search for doctors, book appointments, and consult in person easily from your phone.',
                  style: AppStyles.textMedium16.copyWith(
                    color: AppColors.darkGrey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
