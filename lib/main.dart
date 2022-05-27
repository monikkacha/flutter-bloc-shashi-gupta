import 'package:flutter/material.dart';
import 'package:weather_project/ui/host/host_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SFL Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HostPage(),
    );
  }
}

