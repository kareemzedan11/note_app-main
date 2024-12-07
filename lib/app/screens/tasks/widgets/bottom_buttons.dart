import 'package:flutter/material.dart';
import 'package:provider/provider.dart';  
import 'package:todo_app/app/cubit/note_provider.dart';
import 'package:todo_app/app/data/hive_data_storage.dart'; 
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/strings.dart';

TextEditingController titleController = TextEditingController();
TextEditingController subtitleController = TextEditingController();
TextEditingController dateController = TextEditingController();
TextEditingController timeController = TextEditingController();

Widget bottomButtons(BuildContext context, {bool isUpdated = false, int? taskIndex}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Row(
      mainAxisAlignment: isUpdated ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
      children: [
        // Delete button for updating task
        isUpdated
            ? Container(
                width: 150,
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: MyColors.primaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  minWidth: 150,
                  height: 55,
                  onPressed: () async {
                    // Delete the note if updating
                    var noteNotifier = Provider.of<NoteNotifier>(context, listen: false);
                    if (taskIndex != null) {
                      noteNotifier.deleteNote(taskIndex);  // Delete the task
                    }
                    Navigator.pop(context);  
                  },
                  color: Colors.white,
                  child: const Row(
                    children: [
                      Icon(
                        Icons.delete,
                        color: MyColors.primaryColor,
                      ),
                      SizedBox(width: 5),
                      Text(
                        MyString.deleteTask,
                        style: TextStyle(
                          color: MyColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container(),
        // Add/Update button
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          minWidth: 150,
          height: 55,
          onPressed: () async {
            String title = titleController.text;
            String subtitle = subtitleController.text;
            String date = dateController.text;
            String time = timeController.text;

            var noteNotifier = Provider.of<NoteNotifier>(context, listen: false);

            if (isUpdated && taskIndex != null) {
              // Update the existing note
              var note = noteNotifier.notes[taskIndex];
              if (note != null) {
                note.title = title;
                note.subTitle = subtitle;
                note.date = date;
                note.time = time;
                noteNotifier.updateNote(taskIndex, note);  // Update the task
              }
            } else {
              // Add a new note
              var note = NoteModel(
                date: date,
                time: time,
                title: title,
                subTitle: subtitle,
              );
              noteNotifier.addNote(note);  // Add the new note
            }

            Navigator.pop(context);  // Close the modal
          },
          color: MyColors.primaryColor,
          child: Text(
            isUpdated ? MyString.updateTaskString : MyString.addTaskString,
            style: TextStyle(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        ),
      ],
    ),
  );
}

void _showBottomSheet(BuildContext context, {bool isUpdated = false, int? taskIndex}) {
  // Reset fields if adding a new note
  if (!isUpdated) {
    titleController.clear();
    subtitleController.clear();
    dateController.clear();
    timeController.clear();
  } else {
    // Populate fields for updating
    var noteNotifier = Provider.of<NoteNotifier>(context, listen: false);
    if (taskIndex != null) {
      var note = noteNotifier.notes[taskIndex];
      if (note != null) {
        titleController.text = note.title ?? '';
        subtitleController.text = note.subTitle ?? '';
        dateController.text = note.date ?? '';
        timeController.text = note.time ?? '';
      }
    }
  }

  // Show the bottom sheet for adding or editing a note
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: subtitleController,
              decoration: const InputDecoration(labelText: 'Subtitle'),
            ),
            TextField(
              controller: dateController,
              decoration: const InputDecoration(labelText: 'Date'),
            ),
            TextField(
              controller: timeController,
              decoration: const InputDecoration(labelText: 'Time'),
            ),
            const SizedBox(height: 20),
            bottomButtons(
              context,
              isUpdated: isUpdated,
              taskIndex: taskIndex,
            ),
          ],
        ),
      );
    },
  );
}
