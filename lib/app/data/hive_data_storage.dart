import 'package:hive/hive.dart';

part 'hive_data_storage.g.dart';

@HiveType(typeId: 0)
class NoteModel {
  @HiveField(0)
    String title;

  @HiveField(1)
    String subTitle;

  @HiveField(2)
    String date;

  @HiveField(3)
    String time;

  NoteModel({
    required this.title,
    required this.subTitle,
    required this.date,
    required this.time,
  });
}
