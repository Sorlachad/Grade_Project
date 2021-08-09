import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
class Historyhome extends StatefulWidget {
  Historyhome({Key? key, required this.path, required this.app}) : super(key: key);
  final path;
  final app;
  @override
  Hishome createState() => Hishome();
}

class Hishome extends State<Historyhome> {
  var history;
  int a=1;
  @override
  Future<void>Htul(BuildContext context) async{
    a=2;
    final FirebaseDatabase firebase = FirebaseDatabase(app:widget.app);
    firebase.reference().child('user').child(widget.path).get().then((DataSnapshot? snapshot){
      setState(() {
        history=snapshot!.value;
      });
    }
    );
  }
  Widget build(BuildContext context) {
    if(a==1)Htul(context);
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
    print(history);
    return Scaffold(
      backgroundColor:Colors.black.withOpacity(0.9),
       body: CustomScrollView(
         slivers: <Widget>[
           SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            title: Text('หน้าประวัติ',style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
            floating: _floating,
            expandedHeight: 50.0,
            backgroundColor: Color.fromRGBO(32, 33, 36,0.2),
            flexibleSpace: Container(
               ),
            ),
           SliverToBoxAdapter(
             ),
           SliverFillRemaining(
                child:GridView.count(
                primary: true,
                padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                  decoration: BoxDecoration (
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade500.withOpacity(0.20),
                  border: Border.all(
                    width: 0.0,
                  ),
                  ),
                  child: Align(alignment: Alignment.center,child:Text("อุณหภูมิ",style: TextStyle(fontSize: 20,color: Colors.white),)),
                  ),
                  Container(
                  decoration: BoxDecoration (
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade500.withOpacity(0.20),
                  border: Border.all(
                    width: 0.0,
                  ),
                  ),
                  child: Align(alignment: Alignment.center,child:Text("ความชื้น",style: TextStyle(fontSize: 20,color: Colors.white))),
                  ),
                  Container(
                  decoration: BoxDecoration (
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade500.withOpacity(0.20),
                  border: Border.all(
                    width: 0.0,
                  ),
                  ),
                  child: Align(alignment: Alignment.center,child:Text("สถานะประตู",style: TextStyle(fontSize: 20,color: Colors.white))),
                  ),
                  Container(
                  decoration: BoxDecoration (
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade500.withOpacity(0.20),
                  border: Border.all(
                    width: 0.0,
                  ),
                  ),
                  child: Align(alignment: Alignment.center,child:Text("การให้แสงสว่าง",style: TextStyle(fontSize: 20,color: Colors.white))),
                  ),
                  Container(
                  decoration: BoxDecoration (
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade500.withOpacity(0.20),
                  border: Border.all(
                    width: 0.0,
                  ),
                  ),
                  child: Align(alignment: Alignment.center,child:Text("โอโซน",style: TextStyle(fontSize: 20,color: Colors.white))),
                  ),
                  Container(
                  decoration: BoxDecoration (
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade500.withOpacity(0.20),
                  border: Border.all(
                    width: 0.0,
                  ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child:Text("ตรวจเชื้อรา",style: TextStyle(fontSize: 20,color: Colors.white))),
                  ),
                ],
         ),
            ) 
            ]
        )
    );
  }
}