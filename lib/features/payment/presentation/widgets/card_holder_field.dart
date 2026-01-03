import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/functions/validators.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CardHolderField extends StatelessWidget {
  const CardHolderField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Cardholder Name', style: AppStyles.textRegular14),
        4.hs,
        CustomTextFormField(
          controller: controller,
          hintText: 'Cardholder Name',
          keyboardType: TextInputType.name,
          validator: Validators.name,
          onChanged: (_) => onChanged(),
        ),
      ],
    );
  }
}
