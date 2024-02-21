import 'package:flutter/material.dart';
import 'package:flutter_application_1/apppBar.dart';
import 'package:flutter_application_1/navDrawer.dart';
import 'package:flutter_application_1/workOuts.dart';
class Fitness extends StatefulWidget {
  const Fitness({super.key});

  @override
  State<Fitness> createState() => _FitnessState();
}

class _FitnessState extends State<Fitness> {
  List<Map<String,dynamic>> myWorkOuts=[
    {"name":"Yoga","aasans":25,"time":62},
    {"name":"Pilates","aasans":20,"time":61},
    {"name":"Stretching","aasans":22,"time":59},
    {"name":"Full Body","aasans":19,"time":33},
    {"name":"Gymnastics","aasans":19,"time":33},
    {"name":"Old People","aasans":19,"time":33},
    {"name":"Jumba","aasans":19,"time":33},
    ];

    List<Map<String,dynamic>> filteredworkOuts=[];
    @override
    void initState() {
    filteredworkOuts=myWorkOuts;
    super.initState();
  }
  void _runFilter( String value){
    List<Map<String, dynamic>> results = [];
    if(value.isEmpty){
  results = myWorkOuts;
    }else{
      results=myWorkOuts
              .where((element) => element['name'].toLowerCase().contains(value.toLowerCase())).toList();
    }
    setState(() {
      filteredworkOuts=results;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(title: "Fitness Page"),
      drawer: navDrawer(),
      body: SafeArea(child: 
      Column(
        children:[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              height:45,
              child: TextField(
                onChanged: (value)=>_runFilter(value),
                      decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
               // borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)
              ),
              hintText: "Search workouts",
              labelText: 'Search',
              suffixIcon: Icon(Icons.search)
                      ),
              ),
            ),
          ),
      Expanded(
        child: ListView.builder(
          itemCount: filteredworkOuts.length,
          itemBuilder: (context,index){
            return workOuts(myWorkouts:filteredworkOuts[index]);
        }),
      )
        ]
      ),
      ) 
    );
  }
}