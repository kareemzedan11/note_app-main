import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/strings.dart';
import 'custom_text_form_field.dart';
import 'date_picker_widget.dart';
import 'time_picker_widget.dart';
class BuildTextFieldAndDateTimePicker extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController noteController;

  const BuildTextFieldAndDateTimePicker({
    required this.titleController,
    required this.noteController,
    super.key,
  });

  @override
  _BuildTextFieldAndDateTimePickerState createState() =>
      _BuildTextFieldAndDateTimePickerState();
}

class _BuildTextFieldAndDateTimePickerState
    extends State<BuildTextFieldAndDateTimePicker> {
  DateTime selectedTime = DateTime.now();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      width: double.infinity,
      height: 495,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              MyString.titleOfTitleTextField,
              style: const TextTheme().headlineMedium,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: CustomTextFormField(
              hintText: '',
              maxLines: 6,
              cursorHeight: 50,
              controller: widget.titleController,  // Use the passed controller
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              title: TextFormField(
                controller: widget.noteController,  // Use the passed controller
                style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.bookmark_border,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  counter: Container(),
                  hintText: MyString.addNote,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              final selectedTimeFromPicker =
                  await showCupertinoModalPopup<DateTime>(
                context: context,
                builder: (context) {
                  return timePickerWidget(context);
                },
              );
              if (selectedTimeFromPicker != null) {
                setState(() {
                  selectedTime = selectedTimeFromPicker;
                });
              }
            },
            child: Container(
              margin: const EdgeInsets.only(
                  left: 20, top: 20, right: 20, bottom: 10),
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(color: Colors.grey.shade300, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      MyString.timeString,
                      style: const TextTheme().headlineSmall,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 80,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      DateFormat('hh:mm a').format(selectedTime),
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.center,
                    )),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              final selectedDateFromPicker =
                  await showCupertinoModalPopup<DateTime>(
                context: context,
                builder: (BuildContext context) {
                  return datePickerWidget(context);
                },
              );
              if (selectedDateFromPicker != null) {
                setState(() {
                  selectedDate = selectedDateFromPicker;
                });
              }
            },
            child: Container(
              margin: const EdgeInsets.only(
                  left: 20, top: 20, right: 20, bottom: 10),
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(color: Colors.grey.shade300, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      MyString.dateString,
                      style: const TextTheme().headlineSmall,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 120,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      DateFormat.yMMMd().format(selectedDate),
                      style: Theme.of(context).textTheme.titleSmall,
                    )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
