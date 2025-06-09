import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:note_pad/favourite_screen.dart';
import 'package:note_pad/note_controller.dart';
import 'package:note_pad/note_model.dart';
import 'package:note_pad/note_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> pages = [NoteScreen(), FavouriteScreen()];
  int _selected = 0;

  NoteController noteController = Get.put(NoteController());
  TextEditingController titleClt = TextEditingController();
  TextEditingController contentClt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          viewDialouge();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body: pages[_selected],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.note), label: "Notes"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favourite",
          ),
        ],
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: _selected,
        onTap: (index) {
          setState(() {
            _selected = index;
          });
        },
      ),
    );
  }

  viewDialouge() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              content: Column(
                children: [
                  TextField(
                    controller: titleClt,
                    decoration: InputDecoration(hintText: "Enter a Title"),
                  ),
                  TextField(
                    controller: contentClt,
                    decoration: InputDecoration(hintText: "Enter A Content"),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (titleClt.text.isNotEmpty &&
                        contentClt.text.isNotEmpty) {
                      DateTime now = DateTime.now();
                      String formatedDate = DateFormat(
                        'yy-MM - kk:mm',
                      ).format(now);

                      NoteModel note = NoteModel(
                        formatedDate,

                        titleClt.text,
                        contentClt.text,
                      );
                      noteController.addNote(note);
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
