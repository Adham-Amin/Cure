import 'package:cure/core/services/shared_preferences_service.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SelectBirthDate extends StatelessWidget {
  const SelectBirthDate({super.key, required this.controller});

  final TextEditingController controller;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2003),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      controller.text =
          '${pickedDate.year.toString().padLeft(4, '0')}-'
          '${pickedDate.month.toString().padLeft(2, '0')}-'
          '${pickedDate.day.toString().padLeft(2, '0')}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: Prefs.getUser()!.birthdate ?? 'Select Birth Date',
      controller: controller,
      readOnly: true,
      prefixIcon: const Icon(Icons.calendar_month_outlined),
      suffixIcon: const Icon(
        Icons.open_in_new_rounded,
        color: AppColors.primary,
      ),
      onTap: () => _selectDate(context),
    );
  }
}
