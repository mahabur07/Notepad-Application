import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:note_pad/note_controller.dart';
import 'package:note_pad/note_detalce.dart';
import 'package:note_pad/note_model.dart';

class NoteScreen extends StatelessWidget {

  final Box box=Hive.box("notes");

 NoteScreen({super.key});

 NoteController noteController=Get.put(NoteController());
 TextEditingController titleClt=TextEditingController();
 TextEditingController contentClt=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        backgroundColor: Colors.blue,
        title: Text("Note Screen",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context,box,child) {
          return GetBuilder<NoteController>(
              builder: (_){
                return box.keys.length==0? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.note,color: Colors.grey,),
                      Text("Empty Note!!",style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                ):
                ListView.separated(
                    separatorBuilder: (context,index)=>Divider(color: Colors.grey,indent: 20,endIndent: 20,),
                    itemCount: noteController.box.length,
                    itemBuilder: (context,index){

                      NoteModel note=box.getAt(index);

                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[400],
                          child: Text((index+1).toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                        ),
                        title: Text(note.title.toString()),
                        subtitle: Text(note.content.toString()),
                        trailing:SizedBox(width: 60,
                        child: Row(
                          children: [
                            InkWell(
                                onTap: (){
                                  viewDialouge(context,index);
                                },
                                child: Icon(Icons.edit,color: Colors.blue,)),
                          SizedBox(width: 10,),
                          InkWell(
                              onTap: (){
                                noteController.deletNote(index);
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.delete,color: Colors.red,))
                          ],
                        ),
                        ),
                        onTap: (){
                          Get.to(NoteDetalce(note));
                        },
                      );
                    }
                    );
              }
              );
        }
      ),
    );
  }
 viewDialouge(context,index){
   showDialog(context: context, builder: (BuildContext context){
     return Center(
       child: SingleChildScrollView(
         child: AlertDialog(
           content: Column(
             children: [
               TextField(
                 controller: titleClt,
                 decoration: InputDecoration(
                     hintText: "Enter a Title"
                 ),
               ),
               TextField(
                 controller: contentClt,
                 decoration: InputDecoration(
                     hintText: "Enter A Content"
                 ),
               )
             ],
           ),
           actions: [
             TextButton(
                 style: TextButton.styleFrom(backgroundColor: Colors.blue,foregroundColor: Colors.white),
                 onPressed: (){
                   if(titleClt.text.isNotEmpty && contentClt.text.isNotEmpty){

                     DateTime now=DateTime.now();
                     String formatedDate=DateFormat('yy-MM - kk:mm').format(now);

                     NoteModel note=NoteModel(formatedDate, titleClt.text, contentClt.text);
                     noteController.updateNote(index,note);
                     Navigator.pop(context);
                   }
                 }, child: Text("Updated",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
             TextButton(
                 style: TextButton.styleFrom(backgroundColor: Colors.purple,foregroundColor: Colors.white),
                 onPressed: (){
                   Navigator.pop(context);
                 }, child: Text("Cancel",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
           ],
         ),
       ),
     );
   });
 }
}
