// ignore: unused_import
// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_project/firebase.dart';
// ignore: unused_import
import 'package:flutter_project/main.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp();
  runApp(MaterialApp(
    title: 'flutter app test',
    home: MyHomePage(title: 'Flutter Demo Home Page',app:app),
    builder: EasyLoading.init(),
  ));
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title,required this.app}) : super(key: key);
  final String title;
  final FirebaseApp app;
  
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final emailController = TextEditingController();
  final passController2 = TextEditingController();
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passController2.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       appBar: AppBar(
         title: Text(widget.title),
       ),
          body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Text("USER LOGIN",style: TextStyle(fontSize: 20))
            ),),
            Center(child: Container(
              width: 300,
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: TextFormField(
                //obscureText: true,
                controller: emailController,
                cursorColor: Colors.blue,
                //obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.grey.withOpacity(0.20),
                  filled: true,
                  labelText: "Email or Username",
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.7),
                    borderSide: BorderSide(width:0.0,style: BorderStyle.none),
                  ),
                focusedBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.7),
                borderSide: new BorderSide(width: 0.0, style: BorderStyle.none)),
                contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                ) ,
              )
            )),
            Center(child: Container(
              padding: EdgeInsets.fromLTRB(20,10,20,10),
              width: 300,
              child: TextFormField(
                controller: passController2,
                cursorColor: Colors.blue,
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.grey.withOpacity(0.20),
                  filled: true,
                  labelText: "Password",
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.7),
                    borderSide: BorderSide(width:0.0,style: BorderStyle.none),
                  ),
                focusedBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.7),
                borderSide: new BorderSide(width: 0.0, style: BorderStyle.none)),
                contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                ),
              ),
            ),),
            Center(child :TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                primary: Colors.blue,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed:  () async{
              addNewuser(context);
              EasyLoading.show(status: 'loading...');
              EasyLoading.addStatusCallback((status) {
              print('EasyLoading Status $status');
              });
              await Future.delayed(Duration(seconds: 1));
              EasyLoading.dismiss();
              showDialog(context: context, builder: (content){
                return AlertDialog(
                  content: Text(emailController.text+","+passController2.text),
                );
              },
              );
            },
              child: Text("Login"),),),
          ]
        ),
       );
  }
  void addNewuser(BuildContext context) async{
  final FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential result =
        await auth.signInWithEmailAndPassword(email: emailController.text, password: passController2.text);
    final User user = result.user!;
    print(user);
} 
  
  }