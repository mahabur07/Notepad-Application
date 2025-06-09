import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:note_pad/favourite_screen.dart';
import 'package:note_pad/note_model.dart';
import 'package:share_plus/share_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NoteDetalce extends StatelessWidget {
  NoteModel note;
  NoteDetalce(this.note);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: InkWell(
            onTap: ()=>Get.back(),
            child: Icon(Icons.arrow_back,color: Colors.white,)),
        title: Text("Note Detalce",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
        actions: [
          InkWell(
              onTap: (){
                Get.to(FavouriteScreen());
              },
              child: Icon(Icons.favorite,color: Colors.blue,)),
          SizedBox(width: 10,),
          InkWell(
              onTap: (){
                 Clipboard.setData(ClipboardData(text: note.content!));
                 Fluttertoast.showToast(msg: "Copied to Clipbord");
              },
              child: Icon(Icons.copy,color: Colors.red,)),
          SizedBox(width: 10,),
          InkWell(
              onTap: (){
                Share.share(note.content!,subject: note.title);

              },
              child: Icon(Icons.share,color: Colors.cyanAccent,))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(note.title!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                Text("Created at:"+note.date!,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                Text(note.content!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
