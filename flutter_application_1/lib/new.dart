import 'package:flutter/material.dart';
import 'package:flutter_application_1/apppBar.dart';
import 'package:flutter_application_1/navDrawer.dart';
import 'package:table_calendar/table_calendar.dart';

class myActivities extends StatefulWidget {
  const myActivities({Key? key}) : super(key: key);

  @override
  State<myActivities> createState() => _myActivitiesState();
}

class _myActivitiesState extends State<myActivities> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Individual state variables for each button
  bool isButton1Pressed = false;
  bool isButton2Pressed = false;
  bool isButton3Pressed = false;
  bool isButton4Pressed = false;
  bool isButton5Pressed = false;
  bool isButton6Pressed = false;

  _gotoWeek(int buttonIndex) {
    setState(() {
      // Update the corresponding state variable based on the button index
      switch (buttonIndex) {
        case 1:
          isButton1Pressed = true;
          break;
        case 2:
          isButton2Pressed = true;
          break;
        case 3:
          isButton3Pressed = true;
          break;
        case 4:
          isButton4Pressed = true;
          break;
        case 5:
          isButton5Pressed = true;
          break;
        case 6:
          isButton6Pressed = true;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(title: "My Activities"),
      drawer: navDrawer(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 55,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: getButtonColor(index + 1),
                      ),
                      onPressed: () => _gotoWeek(index + 1),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Week"),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Rest of your code...
          ],
        ),
      ),
    );
  }

  // Function to get the color based on the button index
  Color getButtonColor(int buttonIndex) {
    switch (buttonIndex) {
      case 1:
        return isButton1Pressed ? Colors.red : Colors.purpleAccent;
      case 2:
        return isButton2Pressed ? Colors.red : Colors.purpleAccent;
      case 3:
        return isButton3Pressed ? Colors.red : Colors.purpleAccent;
      case 4:
        return isButton4Pressed ? Colors.red : Colors.purpleAccent;
      case 5:
        return isButton5Pressed ? Colors.red : Colors.purpleAccent;
      case 6:
        return isButton6Pressed ? Colors.red : Colors.purpleAccent;
      default:
        return Colors.purpleAccent;
    }
  }
}
