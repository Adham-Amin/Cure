import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpireAndCvvFields extends StatelessWidget {
  const ExpireAndCvvFields({
    super.key,
    required this.monthController,
    required this.yearController,
    required this.cvvController,
    required this.onChanged,
  });

  final TextEditingController monthController;
  final TextEditingController yearController;
  final TextEditingController cvvController;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text('Expiration Date', style: AppStyles.textRegular14),
            ),
            8.ws,
            Expanded(child: Text('CVV Code', style: AppStyles.textRegular14)),
          ],
        ),
        4.hs,
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                controller: monthController,
                hintText: 'MM',
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return 'Please enter expiration month';
                  }
                  return null;
                },
                onChanged: (_) => onChanged(),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(2),
                ],
              ),
            ),
            8.ws,
            Expanded(
              child: CustomTextFormField(
                controller: yearController,
                hintText: 'YY',
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return 'Please enter expiration year';
                  }
                  return null;
                },
                onChanged: (_) => onChanged(),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(2),
                ],
              ),
            ),
            8.ws,
            Expanded(
              flex: 2,
              child: CustomTextFormField(
                controller: cvvController,
                hintText: 'CVV',
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return 'Please enter CVV number';
                  }
                  return null;
                },
                onChanged: (_) => onChanged(),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
