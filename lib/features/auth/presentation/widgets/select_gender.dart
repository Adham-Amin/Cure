import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/core/widgets/custom_text_form_field.dart';
import 'package:cure/features/auth/presentation/widgets/gender_item.dart';
import 'package:flutter/material.dart';

class SelectGender extends StatelessWidget {
  const SelectGender({super.key, required this.controller});

  final TextEditingController controller;

  void _showGenderSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Text('Select Gender', style: AppStyles.textSemiBold16),
              const Divider(),
              GenderItem(
                title: 'Male',
                onTap: () {
                  controller.text = 'male';
                  Navigator.pop(context);
                },
              ),
              GenderItem(
                title: 'Female',
                onTap: () {
                  controller.text = 'female';
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'Select Gender',
      controller: controller,
      readOnly: true,
      suffixIcon: const Icon(Icons.keyboard_arrow_down),
      onTap: () => _showGenderSheet(context),
    );
  }
}
