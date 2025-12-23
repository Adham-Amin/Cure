import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyFav extends StatelessWidget {
  const EmptyFav({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.svgsEmptyFav),
          24.hs,
          Text('No Favorites', style: AppStyles.textSemiBold24),
          12.hs,
          Text(
            'Add your favorite to find it easily',
            style: AppStyles.textRegular16,
          ),
        ],
      ),
    );
  }
}
