import 'package:flutter/material.dart';
import 'package:flutter_application_1/Fitness.dart';
import 'package:flutter_application_1/apppBar.dart';
import 'package:flutter_application_1/menu.dart';
import 'package:flutter_application_1/navDrawer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Hoomepage extends StatefulWidget {
  const Hoomepage({super.key});

  @override
  State<Hoomepage> createState() => _HoomepageState();
}

class _HoomepageState extends State<Hoomepage> {
  _buttonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Fitness()),
    );
  }

  double? progessValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(231, 223, 223, 1),
        appBar: const Appbar(title: "HomePage"),
        drawer: navDrawer(),
        body: SafeArea(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Hello Motu,\nLets see how is your fitness",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.75,
                  ),
                  Container(
                      child: ClipOval(
                    child: SizedBox.fromSize(
                        size: Size.fromRadius(30),
                        child: Image(
                          image: AssetImage("./assets/images.jpg"),
                          fit: BoxFit.cover,
                        )),
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 240, 231, 231),
                    ),
                    child: Column(children: [
                      Text("Your Score:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: SfRadialGauge(
                          axes: <RadialAxis>[
                            RadialAxis(
                              minimum: 0,
                              maximum: 100,
                              radiusFactor: 0.9,
                              showLabels: false,
                              showTicks: false,
                              centerX: 0.5,
                              centerY: 0.5,
                              pointers: <GaugePointer>[
                                RangePointer(
                                  value: progessValue!,
                                  cornerStyle: CornerStyle.bothCurve,
                                  width: 0.2,
                                  sizeUnit: GaugeSizeUnit.factor,
                                )
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                    positionFactor: 0.05,
                                    angle: 96,
                                    widget: Container(
                                      child: Text(
                                        progessValue!.toStringAsFixed(0) +
                                            ' / 100\n Works Done',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ))
                              ],
                              axisLineStyle: AxisLineStyle(
                                thickness: 0.2,
                                cornerStyle: CornerStyle.bothCurve,
                                color: Color.fromARGB(218, 11, 199, 237),
                                thicknessUnit: GaugeSizeUnit.factor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.12,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Text("Calories Burnt",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                             ClipOval(
                    child: SizedBox.fromSize(
                        size: Size.fromRadius(20),
                        child: Image(
                          image: AssetImage("./assets/calories.jpg"),
                          fit: BoxFit.cover,
                        )),
                  ),
                              Text("763"),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.12,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 240, 233, 233),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Text("Time Spent",style: TextStyle(fontWeight: FontWeight.bold),),
                              Icon(Icons.lock_clock),
                              Text("62 minutes"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Text(
                  "Explore fintess freak",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Menu(menu: "mymenu");
                  }),
            )
          ],
        )));
  }
}
