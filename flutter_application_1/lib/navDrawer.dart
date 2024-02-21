import 'package:flutter/material.dart';
import 'package:flutter_application_1/Fitness.dart';
import 'package:flutter_application_1/Hoomepage.dart';
import 'package:flutter_application_1/myActivities.dart';

class navDrawer extends StatefulWidget {
  const navDrawer({super.key});

  @override
  State<navDrawer> createState() => _navDrawerState();
}

class _navDrawerState extends State<navDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 231, 230, 223),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
         ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          onTap: (){ //Navigator.push(context,  MaterialPageRoute(builder: (context) => const Hoomepage()));
          Navigator.popUntil(context, ModalRoute.withName("/"));
          },
         ),
          ListTile(
          leading: Icon(Icons.fitness_center),
          title: Text("Fitness"),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder:(context)=>Fitness()));
          },
         ),
          ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text("Quit"),
          
         ),
          ListTile(
          leading: Icon(Icons.info),
          title: Text("My Profile"),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder:(context)=>myActivities()));
          },
         ),
         
         
        ],
      ),
    );
  }
}