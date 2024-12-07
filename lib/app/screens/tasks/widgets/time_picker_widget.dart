import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

Widget timePickerWidget(BuildContext context) {
  // متغير لتخزين الوقت المختار
  DateTime selectedTime = DateTime.now();

  return Container(
    height: 300,
    color: Theme.of(context).scaffoldBackgroundColor,
    child: Column(
      children: [
        SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time,
            initialDateTime: selectedTime, // تعيين الوقت الأولي
            onDateTimeChanged: (DateTime value) {
              // تحديث الوقت المختار
              selectedTime = value;
            },
          ),
        ),
        CupertinoButton(
          borderRadius: BorderRadius.circular(50),
          child: const Text(
            'Done',
            style: TextStyle(
              color: MyColors.primaryColor,
              fontSize: 20,
            ),
          ),
          onPressed: () {
            // إغلاق الـ Dialog وعرض الوقت
            Navigator.of(context).pop(selectedTime); // تمرير الوقت المختار
            FocusManager.instance.primaryFocus?.unfocus();
          },
        )
      ],
    ),
  );
}
