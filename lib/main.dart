import 'package:assignment_3/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.routeName,
      routes:{HomeScreen.routeName:(context)=>HomeScreen(),
      } ,
    );
  }
}
