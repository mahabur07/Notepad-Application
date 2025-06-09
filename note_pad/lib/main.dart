import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_pad/bottom_nav_bar.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_pad/note_model.dart' show NoteModelAdapter;

import 'note_screen.dart';

void main()async{

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
 Hive.registerAdapter(NoteModelAdapter());
 await Hive.openBox("notes");

  runApp(FastApp());
}
class FastApp extends StatelessWidget {
  const FastApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    );
  }
}
