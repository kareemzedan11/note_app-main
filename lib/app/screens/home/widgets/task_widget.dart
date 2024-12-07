import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/utils/colors.dart';
import '../../tasks/task_view.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/app/data/hive_data_storage.dart';  // Ensure you import the Hive model

class TaskWidget extends StatelessWidget {
  final String taskTitle;
  final String taskSubtitle;
  final String taskDate;
  final String taskTime;
  final int taskIndex;

  // Constructor to pass the data
  const TaskWidget({
    required this.taskTitle,
    required this.taskSubtitle,
    required this.taskDate,
    required this.taskTime,
    required this.taskIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (BuildContext context) {
              return TaskView(
                taskIndex: taskIndex,  // Pass the task index to TaskView
              );
            },
          ),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 900),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(1),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          leading: InkWell(
            onTap: () {},
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: MyColors.primaryColor.withOpacity(.7),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                  width: .8,
                ),
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
              ),
            ),
          ),
          title: Text(
            taskTitle,   
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              decoration: taskSubtitle.isEmpty ? TextDecoration.none : TextDecoration.lineThrough,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskSubtitle.isNotEmpty ? taskSubtitle : "No details",
                style: const TextStyle(
                  color: Color.fromARGB(255, 164, 164, 164),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      taskTime,  // Directly display task time (AM/PM)
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 164, 164, 164),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(               
                             taskTime,  // Directly display task time (AM/PM)
    style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 164, 164, 164),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
