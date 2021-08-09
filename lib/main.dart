// ignore: unused_import
// ignore: avoid_web_libraries_in_flutter
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_project/Home.dart';
// ignore: unused_import
import 'package:flutter_project/firebase.dart';
// ignore: unused_import
import 'package:flutter_project/main.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'Home.dart';
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
  final erroremail = TextEditingController();
  final errorpass = TextEditingController();
  String email="tue4749@hotmail.com";
  String pass="014935169";
  late String path="";
  bool _validate=false;
  late String senduid="";
  late StreamSubscription<User?> _adduser;
  bool distextfield=true;
  void initState() {
    super.initState();
    _adduser = 
    FirebaseAuth.instance.authStateChanges().listen((User? user){
      if(user==null){
        print("Please Login");
      }
      else{
        print("Success");
      }
    // do whatever you want based on the firebaseUser state
  });
    
  }
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passController2.dispose();
    errorpass.dispose();
    erroremail.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
     Future<void> addNewuser(BuildContext context) async{
  final FirebaseAuth auth = FirebaseAuth.instance;
      try{
  UserCredential result =
        await auth.createUserWithEmailAndPassword(email: email, password: pass)
        ;
        final User user = result.user!;
        print(user.uid);
    } on FirebaseAuthException catch(e){
      if(e.code=='email-already-in-use'){
        print("Email already use");

      }
    }
    catch(e){
      print(e);

    }    
      if(_adduser == null){
        showDialog(context: context, builder: (build){
        return AlertDialog(
          content: const Text(
            'Error not addUser',
          ),
        );},);
    }
}
void login2(BuildContext context){
  try{
  final FirebaseAuth auth3 = FirebaseAuth.instance;
      auth3.signInWithEmailAndPassword(email: email, password: pass).then((result3){
        final User user2 = result3.user!;
        print(user2.uid);
        setState(() {
          senduid=user2.uid;
          _validate=false;
        });
        final FirebaseDatabase refuid = FirebaseDatabase(app: widget.app);
        refuid.reference().child('user').once().then((DataSnapshot? snapshot){
        List a=snapshot!.value.keys.toList();
        for (var e in a){
          bool bk=true; //bk out loop
        try{
          refuid.reference().child('user').child(e).child('user').once().then((DataSnapshot? snapshot2){
          List b=snapshot2!.value.keys.toList();
          for(final i in b){
            try{
            if(i==user2.uid){
              setState(() {
                path='user/'+e;
                print(path);
                if(_validate==false){
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(app:widget.app,path: path,uid:senduid),
                ),);
              EasyLoading.dismiss();
              distextfield=true;
                }
              }
              );
              bk=false;
              distextfield=true;
              break;
            }
          }catch(e){
            EasyLoading.dismiss();
            distextfield=true;
            
          }
          }
        }
        );
        if(bk==false)break;
                }catch(e){
                  EasyLoading.dismiss();
                  distextfield=true;

        }
        }
        }
        );
      }
      );
  }on FirebaseAuthException catch(e){
     print(e.code);
      if(e.code=='wrong-password'){
        print("Password wrong");
        setState(() {
        errorpass.text="Password wrong";
        _validate=true;
        EasyLoading.dismiss();
        distextfield=true;
      });}
      else if(e.code=='user-not-found'){
        print("Email wrong");
        setState(() {
        erroremail.text="email wrong";
        _validate=true;
        EasyLoading.dismiss();
        distextfield=true;
      });}
      else{
        print(e.code);
      setState(() {
        errorpass.text="email or pass Wrong";
        _validate=true;
        EasyLoading.dismiss();
        distextfield=true;
      });
    }

  }
  catch(e){
      print(e);
      distextfield=true;
    }         
}
    return Scaffold(
          body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(child: Container(
              padding: EdgeInsets.fromLTRB(20, 150, 20, 20),
              child: Text("USER LOGIN",style: TextStyle(fontSize: 20))
            ),),
            Center(child: Container(
              width: 300,
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: TextFormField(
                //obscureText: true,
                enabled: distextfield,
                controller: emailController,
                cursorColor: Colors.blue,
                //obscureText: true,0
                decoration: InputDecoration(
                  fillColor: Colors.grey.withOpacity(0.20),
                  filled: true,
                  labelText: "Email or Username",
                  errorText: _validate?erroremail.text:null,
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.7),
                    borderSide: BorderSide(width:0.0,style: BorderStyle.none),
                  ),
                focusedBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.7),
                borderSide: new BorderSide(width: 0.0, style: BorderStyle.none)),
                contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0)
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
                enabled: distextfield,
                decoration: InputDecoration(
                  fillColor: Colors.grey.withOpacity(0.20),
                  filled: true,
                  labelText: "Password",
                  errorText: _validate?errorpass.text:null,
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
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Center(child:TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                primary: Colors.blue,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed:  () async{
                distextfield==false?null:
              login2(context);
              distextfield=false;
              EasyLoading.show(status: 'loading...');
             // await Future.delayed(Duration(seconds: 2));
              
              
            },
              child: Text("Login"),
              ),
              ),
              TextButton(
                    style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                primary: Colors.blue,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed:  () async{
              EasyLoading.show(status: 'loading...');
              await FirebaseAuth.instance.signOut();
              EasyLoading.dismiss();
            },
              child: Text("Register"),
              ),
              ]
              ),
          ]
        ),
       );
  }
  }