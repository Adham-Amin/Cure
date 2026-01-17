import 'package:cure/core/functions/extentions.dart';
import 'package:cure/features/checkout/presentation/widgets/calendar_picker.dart';
import 'package:cure/features/checkout/presentation/widgets/date_field_widget.dart';
import 'package:cure/features/checkout/presentation/widgets/time_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectDateTimeForm extends StatefulWidget {
  const SelectDateTimeForm({
    super.key,
    required this.onDateTimeSelected,
    required this.onDateTimeSelectedFormat,
  });

  final ValueChanged<String> onDateTimeSelected;
  final ValueChanged<String> onDateTimeSelectedFormat;

  @override
  State<SelectDateTimeForm> createState() => _SelectDateTimeFormState();
}

class _SelectDateTimeFormState extends State<SelectDateTimeForm> {
  void emitDateTimeString() {
    if (selectedDate == null || selectedTime.isEmpty) return;

    final timeParts = selectedTime.split(' ');
    final hourMinute = timeParts[0].split(':');

    int hour = int.parse(hourMinute[0]);
    int minute = int.parse(hourMinute[1]);

    final isPm = timeParts[1] == 'PM';

    if (isPm && hour != 12) hour += 12;
    if (!isPm && hour == 12) hour = 0;

    final combinedDateTime = DateTime(
      selectedDate!.year,
      selectedDate!.month,
      selectedDate!.day,
      hour,
      minute,
    );

    final result = DateFormat('yyyy-M-d HH:mm:ss').format(combinedDateTime);
    final displayFormat = dateController.text;

    widget.onDateTimeSelected(result);
    widget.onDateTimeSelectedFormat(displayFormat);
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController dateController;

  bool showDatePicker = false;
  DateTime? selectedDate;
  String selectedTime = '';

  final List<String> times = const [
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM',
    '5:00 PM',
  ];

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
            visible: selectedDate != null,
            times: times,
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
