import 'package:flutter/material.dart';

class singleWorkout extends StatefulWidget {
  const singleWorkout({super.key,required this.singleWork});
  final Map<String,dynamic> singleWork;

  @override
  State<singleWorkout> createState() => _singleWorkoutState();
}

class _singleWorkoutState extends State<singleWorkout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
       Text('${widget.singleWork['name']}'),

    );
  }
}