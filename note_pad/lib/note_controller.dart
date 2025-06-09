import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:note_pad/note_model.dart';

class NoteController extends GetxController{

  final Box box=Hive.box("notes");


  void addNote(NoteModel note){
    box.add(note);
    update();
  }
  void deletNote(int index){
    box.deleteAt(index);
    update();
  }
  void updateNote(int index,NoteModel note){
    box.put(index, note);
    update();
  }

}