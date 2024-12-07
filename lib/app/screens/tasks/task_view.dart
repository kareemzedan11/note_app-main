import 'package:flutter/material.dart';
import 'widgets/bottom_buttons.dart';
import 'widgets/build_text_field_and_date_time_picker.dart';
import 'widgets/my_app_bar.dart';
import 'widgets/top_text_widget.dart';

class TaskView extends StatefulWidget {
  final int taskIndex;  // Add taskIndex as a parameter

  const TaskView({super.key, required this.taskIndex});  // Pass taskIndex to the constructor

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  void initState() {
    super.initState();
    // You can now access the taskIndex here using widget.taskIndex
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const MyAppBar(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const TopTextWidget(),
                BuildTextFieldAndDateTimePicker(
                  titleController: titleController,
                  noteController: subtitleController,  // Or use a separate controller for notes
                ),
                bottomButtons(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
