  
import 'package:flutter/material.dart';
import 'package:register_shopping/pages/welcome.dart';


void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample APP',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
    home: new WelcomePage(),  
    );
  }
}