import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalendarPicker extends StatelessWidget {
  const CalendarPicker({
    super.key,
    required this.visible,
    required this.selectedDate,
    required this.onDateSelected,
  });

  final bool visible;
  final DateTime? selectedDate;
  final Function(DateTime) onDateSelected;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: !visible
          ? const SizedBox.shrink()
          : Card(
              elevation: 4,
              color: isDark ? AppColors.darkCard : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SfDateRangePicker(
                    selectionMode: DateRangePickerSelectionMode.single,
                    minDate: DateTime.now(),
                    maxDate: DateTime.now().add(const Duration(days: 30)),
                    initialSelectedDate: selectedDate ?? DateTime.now(),
                    showNavigationArrow: true,

                    backgroundColor: isDark ? AppColors.darkCard : Colors.white,

                    selectableDayPredicate: (date) {
                      return date.weekday != DateTime.saturday &&
                          date.weekday != DateTime.friday;
                    },

                    headerStyle: DateRangePickerHeaderStyle(
                      backgroundColor: isDark
                          ? AppColors.darkCard
                          : AppColors.white,
                      textAlign: TextAlign.center,
                      textStyle: AppStyles.textMedium18.copyWith(
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),

                    monthViewSettings: const DateRangePickerMonthViewSettings(
                      firstDayOfWeek: 6,
                      dayFormat: 'EEE',
                      viewHeaderHeight: 48,
                      showTrailingAndLeadingDates: true,
                    ),

                    monthCellStyle: DateRangePickerMonthCellStyle(
                      todayTextStyle: TextStyle(
                        color: isDark ? Colors.white : AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      todayCellDecoration: BoxDecoration(
                        border: Border.all(
                          color: isDark ? Colors.white70 : AppColors.primary,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      cellDecoration: BoxDecoration(
                        color: isDark
                            ? AppColors.darkCard.withOpacity(0.7)
                            : AppColors.lightCard,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      textStyle: TextStyle(
                        color: isDark ? Colors.white : Colors.black,
                      ),
                      disabledDatesTextStyle: TextStyle(
                        color: isDark ? Colors.grey : Colors.grey.shade400,
                      ),
                    ),

                    selectionShape: DateRangePickerSelectionShape.rectangle,
                    selectionColor: isDark
                        ? AppColors.primary
                        : AppColors.primary,

                    onSelectionChanged: (args) {
                      onDateSelected(args.value);
                    },
                  ),
                ),
              ),
            ),
    );
  }
}
