import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_project/firebase.dart';
import 'package:flutter_project/main.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'flutter app test',
    home: MyHomePage(title: 'Flutter Demo Home Page'),
  ));
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text(widget.title),
       ),
       body: Center(
        child: Text(
          'testfutter',
          style: TextStyle(color:Colors.amberAccent,fontSize: 20  ),
        ),
       ),
    );
  }
}
