// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/apppBar.dart';
// import 'package:flutter_application_1/navDrawer.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:http/http.dart' as http;
// class myActivities extends StatefulWidget {
//   const myActivities({super.key});

//   @override
//   State<myActivities> createState() => _myActivitiesState();
// }

// class _myActivitiesState extends State<myActivities> {
//   List<Map<String, dynamic>>? myRoutine;
//   List<Map<String, dynamic>>? fetchedData = [
//   {
//     "typeofExercise": "65d31b01d393844c37f47ce7",
//     "date": "2024-02-24T00:00:00.000Z",
//     "day": "Saturday",
//     "weekNumber": 4,
//     "_id": "65d46af451582f6e003559b4"
//   },
//   {
//     "typeofExercise": "65d3263cd76a8ca434deba57",
//     "date": "2024-02-27T00:00:00.000Z",
//     "day": "Tuesday",
//     "weekNumber": 5,
//     "_id": "65d46b4e0696b60416e13bd0"
//   }
// ];

//    CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;
//   List<bool> isButtonPressed = List.generate(7, (index) => false);
//   void initState() {
//     super.initState();

//     //fetchData();
//   }
// //   Future<void> fetchData() async {
// //     print("Hello");
// //   try {
// //     var response = await http.get(Uri.parse("http://10.0.2.2:1000/fitness/fitnessroutine"));

// //     if (response.statusCode == 200) {
// //       setState(() {
// //         myRoutine = jsonDecode(response.body);
// //         print(myRoutine);
// //       });
// //     } else {
// //       print("Filed to fetch");
// //       throw Exception("Failed to fetch");
// //     }
// //   } catch (error) {
// //     print("Error fetching data: $error");
// //     // Handle the error accordingly, e.g., show a message to the user
// //   }
// // }
//     _gotoWeek(int index) {
//   setState(() {
//     // Reset all buttons to false
//     for (int i = 1; i <= 6; i++) {
//       isButtonPressed[i] = false;
//     }

//     // Set the pressed button to true
//     isButtonPressed[index] = true;
//   });
// }

//   Color getButtonColor(int buttonIndex) {
//     switch (buttonIndex) {
//       case 1:
//         return isButtonPressed[buttonIndex] ? Colors.red : Colors.grey;
//       case 2:
//         return isButtonPressed[buttonIndex] ? Colors.red : Colors.grey;
//       case 3:
//         return isButtonPressed[buttonIndex]  ? Colors.red : Colors.grey;
//       case 4:
//         return isButtonPressed[buttonIndex] ? Colors.red : Colors.grey;
//       case 5:
//         return isButtonPressed[buttonIndex]  ? Colors.red : Colors.grey;
//       case 6:
//         return isButtonPressed[buttonIndex]  ? Colors.red : Colors.grey;
//       default:
//         return Colors.purpleAccent;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold (
//       appBar: Appbar(title: "My Activities"),
//       drawer: navDrawer(),
//       body:SafeArea(
//       child:Column(
//         children: <Widget>[
//           Container(
//             height: 55,
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: 5,
//               scrollDirection: Axis.horizontal,

//               itemBuilder: (context,index)
//               {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: getButtonColor(index+1)
//                   ),
//                   onPressed:()=> _gotoWeek(index+1),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("Week"),
//                   ),
//                 ),
//               );
//               }
//               ),
//           ),
//           Expanded(

//             child: ListView.builder(
//               itemCount: 17,
//               itemBuilder: (context,index){
//                 return(
//                   Text("Sunday",style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold
//                   ),)

//                 );
//               }),
//           ),
// TableCalendar(
//   firstDay:DateTime.now(),
//   lastDay: DateTime.utc(2030, 3, 14),
//   focusedDay: _focusedDay,
//   calendarFormat: _calendarFormat,
//  selectedDayPredicate: (day) {
//   return isSameDay(_selectedDay, day);
// },
// onDaySelected: (selectedDay, focusedDay) {
//   setState(() {
//     _selectedDay = selectedDay;
//     _focusedDay = focusedDay; // update `_focusedDay` here as well
//     print(_selectedDay);
//   });
// },
//  onFormatChanged: (format) {
//           if (_calendarFormat != format) {
//             // Call `setState()` when updating calendar format
//             setState(() {
//               _calendarFormat = format;
//             });
//           }
//         },
//         onPageChanged: (focusedDay) {
//           // No need to call `setState()` here
//           _focusedDay = focusedDay;
//         },
// ),
//         ],
//       )

//       )
//       );
//   }
// }

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/apppBar.dart';
import 'package:flutter_application_1/navDrawer.dart';
import 'package:flutter_application_1/particularRoutine.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

class myActivities extends StatefulWidget {
  const myActivities({super.key});

  @override
  State<myActivities> createState() => _myActivitiesState();
}

class _myActivitiesState extends State<myActivities> {
  List<Map<String, dynamic>>? myRoutine;
  List<Map<String, dynamic>>? fetchedData = [
    {
      "_id": "65d31b01d393844c37f47ce7",
      "name": "Exercise1",
      "day": "Saturday",
      "weekNumber": 4,
      "date": "2024-02-24T00:00:00.000Z",
      "completed":true,
    },
    {
      "_id": "65d3263cd76a8ca434deba57",
      "name": "Exercise2",
      "day": "Tuesday",
      "weekNumber": 5,
      "date": "2024-02-27T00:00:00.000Z",
      "completed":true,

    },
    {
      "_id": "65d3263cd76a8ca434deba57",
      "name": "Exercise2",
      "day": "Tuesday",
      "weekNumber": 5,
      "date": "2024-02-27T00:00:00.000Z",
      "completed":true,
    },
    {
      "_id": "65d3263cd76a8ca434deba57",
      "name": "Exercise2",
      "day": "Tuesday",
      "weekNumber": 5,
      "date": "2024-02-27T00:00:00.000Z",
      "completed":true,
    },
    {
      "_id": "65d3263cd76a8ca434deba57",
      "name": "Exercise2",
      "day": "Tuesday",
      "weekNumber": 5,
      "date": "2024-02-27T00:00:00.000Z",
      "completed":false,
    },
    {
      "_id": "65d3263cd76a8ca434deba57",
      "name": "Exercise2",
      "day": "Tuesday",
      "weekNumber": 5,
      "date": "2024-02-27T00:00:00.000Z",
      "completed":false,
    }
  ];
  int? particularWeek = 1;

  List<bool> isButtonPressed = List.generate(7, (index) => false);
  Map<int, List<Map<String, dynamic>>> groupedByWeek = {};

  void initState() {
    super.initState();
    isButtonPressed[1] = true;
    // fetchData();
    organizeDataByWeek();
    print(groupedByWeek);
  }

  void organizeDataByWeek() {
    groupedByWeek.clear();
    for (var exercise in fetchedData!) {
      int weekNumber = exercise['weekNumber'];
      if (!groupedByWeek.containsKey(weekNumber)) {
        groupedByWeek[weekNumber] = [];
      }
      groupedByWeek[weekNumber]!.add(exercise);
    }
  }

  _gotoWeek(int index) {
    setState(() {
      particularWeek = index;
      for (int i = 1; i <= 6; i++) {
        isButtonPressed[i] = false;
      }
      isButtonPressed[index] = true;
    });
  }

  Color getButtonColor(int buttonIndex) {
    return isButtonPressed[buttonIndex] ? Colors.red : Colors.grey;
  }

  void _gotoParticularroutine(Map<String, dynamic>? exercise) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => particularRoutine(exercise:exercise)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbar(title: "My Activities"),
      drawer: navDrawer(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 55,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: getButtonColor(index + 1),
                      ),
                      onPressed: () {
                        setState(() {
                          _gotoWeek(index + 1);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Week ${index + 1}"),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: groupedByWeek[particularWeek]?.length ?? 0,
                  itemBuilder: (context, index) {
                    var exercise = groupedByWeek[particularWeek]?[index];
            
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(color: Color.fromARGB(255, 220, 213, 213)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(exercise?['day'],style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),),
                            ),
                             Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox.fromSize(
                                  size: Size.fromRadius(30),
                                  child: Image(
                                      image: AssetImage("./assets/images.jpg"),
                                      fit: BoxFit.cover)),
                              Column(
                              
                                children: [
                                  Text(
                                    '${exercise?['name']}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(exercise?['completed'] ?"Completed":"Not completed"),
                               
                                ],
                              ),
                              ElevatedButton(
                                  onPressed:()=> _gotoParticularroutine(exercise),
                                  child: Text("See More")),
                                     Checkbox(
                                    checkColor: Colors.white,
                                    fillColor:
                                        MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.disabled)) {
                                        return Colors.orange.withOpacity(.32);
                                      }
                                      return Colors.orange;
                                    }),
                                    value: exercise?['completed'],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        exercise?['completed']=!exercise?['completed'];
                                      });
                                    },
                                  )
                            ],
                          ),
                          ]
                        ),
                      ),
                    );
                  }),
            ),
            
          ],
        ),
      ),
    );
  }
}
