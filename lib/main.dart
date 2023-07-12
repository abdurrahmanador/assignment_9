import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'api.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(primarySwatch:Colors.deepPurple),
      home: const CreateWeatherApp(),
    );
  }
}
