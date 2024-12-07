import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../tasks/task_view.dart';

class Fab extends StatelessWidget {
  const Fab({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (BuildContext context) {
            return TaskView(taskIndex: 0);  // Pass a default taskIndex value
          }),
        );
      },
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderOnForeground: true,
        type: MaterialType.circle,
        elevation: 15,
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: MyColors.primaryColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(
            CupertinoIcons.add,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
      ),
    );
  }
}
