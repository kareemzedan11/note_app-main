import 'package:flutter/material.dart';

import '../../../../core/utils/strings.dart';

class TopTextWidget extends StatelessWidget {
  const TopTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme texttheme = Theme.of(context).textTheme;
    bool isupdated = false;
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 50,
            child: Divider(thickness: 2),
          ),
          RichText(
            text: TextSpan(
              text:
                  isupdated ? MyString.addNewTask : MyString.updateCurrentTask,
              style: texttheme.titleLarge,
              children: const [
                TextSpan(
                  text: MyString.taskString,
                  style: TextStyle(fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 50,
            child: Divider(thickness: 2),
          )
        ],
      ),
    );
  }
}
