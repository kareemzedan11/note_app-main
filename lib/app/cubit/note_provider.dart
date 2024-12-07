import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/app/data/hive_data_storage.dart';

class NoteNotifier extends ChangeNotifier {
  NoteNotifier() {
    _fetchNotes();
  }

  final Box<NoteModel> _noteBox = Hive.box<NoteModel>('notes');
  List<NoteModel> _notes = [];

  List<NoteModel> get notes => _notes;

  void _fetchNotes() {
    _notes = _noteBox.values.toList();
    notifyListeners();
  }

  void addNote(NoteModel note) {
    _noteBox.add(note);
    _fetchNotes();
  }

  void updateNote(int index, NoteModel updatedNote) {
    _noteBox.putAt(index, updatedNote);
    _fetchNotes();
  }

  void deleteNote(int index) {
    _noteBox.deleteAt(index);
    _fetchNotes();
  }
  void deleteAllNotes() {
    _noteBox.clear();
    _fetchNotes();
  }
}
