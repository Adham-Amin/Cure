import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DateFieldWidget extends StatelessWidget {
  const DateFieldWidget({
    super.key,
    required this.controller,
    required this.onTap,
  });

  final TextEditingController controller;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      hintText: 'Select a date',
      readOnly: true,
      prefixIcon: Padding(
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(AppAssets.svgsCalendar),
      ),
      onTap: onTap,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a date';
        }
        return null;
      },
    );
  }
}
