import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_pad/bottom_nav_bar.dart';
import 'package:note_pad/note_detalce.dart';
import 'package:note_pad/note_screen.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Favourite Screen",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              color: Colors.purple,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: FlutterLogo(
                      size: 50,
                    ),
                  ),
                  Text("Flutter Logo",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Get.to(BottomNavBar());
              },
              child: ListTile(
                leading: Icon(Icons.home,color: Colors.blueGrey,),
                title: Text("Home Page",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
              ),
            ),
            ListTile(
              leading: Icon(Icons.notes,color: Colors.blueGrey,),
              title: Text("Detailce Page",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
            ),
            InkWell(
              onTap: (){Get.to(FavouriteScreen());},
              child: ListTile(
                leading: Icon(Icons.favorite,color: Colors.blueGrey,),
                title: Text("Favourite Page",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout,color: Colors.blueGrey,),
              title: Text("LogOut Page",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
            ),
          ],
        ),
      ),
    );
  }
}
