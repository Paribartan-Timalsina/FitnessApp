import 'package:flutter/material.dart';
import 'package:flutter_application_1/singleWorkout.dart';
import 'package:getwidget/getwidget.dart';
class workOuts extends StatefulWidget {
  const workOuts({super.key,required this.myWorkouts});
  final Map<String,dynamic> myWorkouts;

  @override
  State<workOuts> createState() => _workOutsState();
}

class _workOutsState extends State<workOuts> {
  _gotoWorkout(){
    Navigator.push(
      context,
      MaterialPageRoute(builder:(context)=> singleWorkout(singleWork:widget.myWorkouts)),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: _gotoWorkout,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.amber
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.3,
                  child: Column(
                    children:[ 
                    Text('${widget.myWorkouts['name']}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.left,),
                    Text('${widget.myWorkouts['aasans']} aasans\n${widget.myWorkouts['time']} minutes',style: TextStyle(fontSize: 17),)
                    ]),
                ),
      
                Column(
                  children:[ 
                    Container(
                    width: MediaQuery.of(context).size.width*0.3,
                     child: GFProgressBar(
                      width: 100,
                             percentage: 0.5,
                        backgroundColor : Colors.pink,
                        progressBarColor: Colors.black,
                       
                     ),
                   ),
                   Text("10/20")
                   ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image(image: AssetImage("./assets/images.jpg"),
                  width: MediaQuery.of(context).size.width*0.3,
                  ),
                ),
                 
              ],
      
            ),
          ),
        ),
      ),
    );
  }
}