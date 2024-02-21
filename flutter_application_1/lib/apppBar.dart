import 'package:flutter/material.dart';
import 'package:flutter_application_1/selectingExercise.dart';

class Appbar extends StatefulWidget implements PreferredSizeWidget {
  const Appbar({super.key, required this.title});
  
final String title;
  @override
  State<Appbar> createState() => _AppbarState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppbarState extends State<Appbar> {
  bool? isappBar;
  void initState(){
    super.initState();
    if(widget.title=="My Activities"){
      isappBar=true;
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
     AppBar(
      backgroundColor: Color.fromARGB(255, 207, 195, 240),
      title:  Text(widget.title),
      centerTitle: true,
     actions: isappBar == true
            ? [
                IconButton(
                  icon: const Icon(Icons.calendar_month_sharp),
                  tooltip: 'Open shopping cart',
                  onPressed: () => {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>selectingExercises()))
                  },
                ),
              ]
            : [],
    ));
    
  }
}
