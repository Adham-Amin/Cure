import 'package:cure/core/functions/extentions.dart';
import 'package:cure/features/payment/data/models/add_payment_request.dart';
import 'package:cure/features/payment/presentation/widgets/card_holder_field.dart';
import 'package:cure/features/payment/presentation/widgets/card_number_field.dart';
import 'package:cure/features/payment/presentation/widgets/card_preview.dart';
import 'package:cure/features/payment/presentation/widgets/expire_and_cvv_fields.dart';
import 'package:cure/features/payment/presentation/widgets/save_payment_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPaymentCardViewBody extends StatefulWidget {
  const AddPaymentCardViewBody({super.key});

  @override
  State<AddPaymentCardViewBody> createState() => _AddPaymentCardViewBodyState();
}

class _AddPaymentCardViewBodyState extends State<AddPaymentCardViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final _cardholderNameController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _cvvController = TextEditingController();
  final _expireYearController = TextEditingController();
  final _expireMonthController = TextEditingController();

  @override
  void dispose() {
    _cardholderNameController.dispose();
    _cardNumberController.dispose();
    _cvvController.dispose();
    _expireYearController.dispose();
    _expireMonthController.dispose();
    super.dispose();
  }

  void _refreshCard() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.hs,
            CardPreview(
              cardNumber: _cardNumberController.text,
              cardHolder: _cardholderNameController.text,
              expMonth: _expireMonthController.text,
              expYear: _expireYearController.text,
            ),
            24.hs,
            CardHolderField(
              controller: _cardholderNameController,
              onChanged: _refreshCard,
            ),
            16.hs,
            CardNumberField(
              controller: _cardNumberController,
              onChanged: _refreshCard,
            ),
            16.hs,
            ExpireAndCvvFields(
              monthController: _expireMonthController,
              yearController: _expireYearController,
              cvvController: _cvvController,
              onChanged: _refreshCard,
            ),
            32.hs,
            SavePaymentButton(
              formKey: _formKey,
              onInvalid: () {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              },
              getCardData: () => AddPaymentRequest(
                lastFour: _cardNumberController.text.substring(15, 19),
                expMonth: int.parse(_expireMonthController.text),
                expYear: int.parse('20${_expireYearController.text}'),
              ),
            ),
            32.hs,
          ],
        ),
      ),
    );
  }
}
