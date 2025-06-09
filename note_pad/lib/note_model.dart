import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
part 'note_model.g.dart';
@HiveType(typeId: 0)
class NoteModel{
@HiveField(0)
  String? date;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String?content;

  NoteModel(this.date,this.title,this.content);
}