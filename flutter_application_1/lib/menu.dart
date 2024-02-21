import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key, required this.menu});
final String menu;
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width:250,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 230, 207, 141),
          borderRadius: BorderRadius.circular(20),

        ),
        child: Center(child: Text("Hello")),
      ),
    );
  }
}