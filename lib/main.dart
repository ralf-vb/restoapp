import 'package:flutter/material.dart';
import 'package:restoapp/scr/screens/loginpage.dart';
import 'scr/screens/home.dart';
void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: loginpage(),
    );
  }
}