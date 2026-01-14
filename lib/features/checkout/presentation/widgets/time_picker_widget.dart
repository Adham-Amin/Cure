import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/features/checkout/presentation/widgets/time_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimePickerWidget extends StatelessWidget {
  const TimePickerWidget({
    super.key,
    required this.visible,
    required this.times,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  final bool visible;
  final List<String> times;
  final String selectedTime;
  final Function(String) onTimeSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: !visible
          ? const SizedBox.shrink()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Time',
                  style: AppStyles.textRegular20.copyWith(
                    fontFamily: AppStyles.fontGeorgia,
                  ),
                ),
                16.hs,
                SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 16.w,
                    runSpacing: 16.h,
                    children: times
                        .map(
                          (time) => GestureDetector(
                            onTap: () => onTimeSelected(time),
                            child: TimeItem(
                              title: time,
                              selected: selectedTime == time,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
    );
  }
}
