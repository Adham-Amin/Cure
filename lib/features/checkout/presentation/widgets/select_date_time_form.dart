import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/widgets/custom_snack_bar.dart';
import 'package:cure/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:cure/features/checkout/presentation/widgets/calendar_picker.dart';
import 'package:cure/features/checkout/presentation/widgets/date_field_widget.dart';
import 'package:cure/features/checkout/presentation/widgets/time_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SelectDateTimeForm extends StatefulWidget {
  const SelectDateTimeForm({
    super.key,
    required this.onSoltSelected,
    required this.onDateTimeSelectedFormat,
    required this.onDateSelected,
  });

  final ValueChanged<String> onSoltSelected;
  final ValueChanged<String> onDateSelected;
  final ValueChanged<String> onDateTimeSelectedFormat;

  @override
  State<SelectDateTimeForm> createState() => _SelectDateTimeFormState();
}

class _SelectDateTimeFormState extends State<SelectDateTimeForm> {
  void emitDateTimeString() {
    if (selectedDate == null || selectedTime.isEmpty) return;

    final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);

    widget.onDateSelected(formattedDate);
    widget.onSoltSelected(selectedTime);
    final displayFormat = dateController.text;
    widget.onDateTimeSelectedFormat(displayFormat);
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController dateController;

  bool showDatePicker = false;
  DateTime? selectedDate;
  String selectedTime = '';

  List<String> availableTimes = [];

  @override
  void initState() {
    super.initState();
    dateController = TextEditingController();
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  void onDateSelected(DateTime date) {
    setState(() {
      selectedDate = date;
      selectedTime = '';
      dateController.text = DateFormat('EEEE, MMMM d').format(date);
      final selectedDateString = DateFormat('yyyy-MM-dd').format(date);
      availableTimes = context
          .read<CheckoutCubit>()
          .slots
          .where((element) => element.date == selectedDateString)
          .map((e) => e.startTime!)
          .toList();
      if (availableTimes.isEmpty) {
        showDatePicker = false;
        customSnackBar(
          context: context,
          message: 'No slots available',
          type: AnimatedSnackBarType.error,
        );
      }
      showDatePicker = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DateFieldWidget(
            controller: dateController,
            onTap: () {
              setState(() {
                showDatePicker = !showDatePicker;
              });
            },
          ),
          16.hs,
          CalendarPicker(
            visible: showDatePicker,
            selectedDate: selectedDate,
            onDateSelected: onDateSelected,
          ),
          24.hs,
          TimePickerWidget(
            visible: selectedDate != null && availableTimes.isNotEmpty,
            times: availableTimes,
            selectedTime: selectedTime,
            onTimeSelected: (time) {
              setState(() {
                selectedTime = time;
                emitDateTimeString();
              });
            },
          ),
        ],
      ),
    );
  }
}
