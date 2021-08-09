
import 'package:flutter/material.dart';
import 'package:flutter_project/firebase.dart';
import 'dart:async';
import 'Hometul.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'profile.dart';
import 'package:search_choices/search_choices.dart';
class Home extends StatefulWidget {
  Home({Key? key,required this.app,required this.path,required this.uid}) : super(key: key);
  @override
  final app;
  final path;
  final uid;
  Homepage createState() => Homepage();

}

class Homepage extends State<Home>{
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  List tu=[];
  List<String> tu2=[];
  List tu3=["sss","sssss","afafw","afsfafsa","gsagsag"];
  late DatabaseReference tuRef;
  late StreamSubscription<Event> tuSubscription;
  var valuetu;
  int a=1;
  DatabaseError? _error;
  String lis="";
  String? s;
  
void initState() {
    super.initState();
    
    final FirebaseDatabase database = FirebaseDatabase(app: widget.app);
    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(10000000);
    database.reference().child('user').child(widget.uid).get().then((DataSnapshot? snapshot) {
      print(
          'Connected to directly configured database and read ${snapshot!.value}');
    });
   // print(widget.p);
   // widget.firebase.reference().child(widget.p).child('ตู้').get().then((DataSnapshot? snapshot){
  //    print(snapshot!.value);
  //    print("Hello");
  // }
//);
 }
  Future<void>tull(BuildContext context) async{
    a=2;
    final FirebaseDatabase firebase = FirebaseDatabase(app:widget.app);
   // Future<void>tulll(BuildContext context,var a) async{
    //final FirebaseDatabase firebase = FirebaseDatabase();
       firebase.reference().child(widget.path).child('ตู้').get().then((DataSnapshot? snapshot){
       List a=snapshot!.value.keys.toList();
       setState(() {
         valuetu= snapshot.value;
         print(valuetu);
       });
      print(a);
      for (var item in a) {
        int c=0;
        print(item);
        var b = item.indexOf('ตู้');
        print(b);
        if(b>=0){
          print("hello");
          setState(() {
            tu.add(item);
            tu2.add(item.toString());
            print(tu2);
          });
          firebase.setPersistenceEnabled(true);
          firebase.setPersistenceCacheSizeBytes(10000000);
          tuRef =firebase.reference().child(widget.path).child('ตู้').child(tu[c]).child('name');
          tuSubscription = tuRef.onValue.listen((Event event) {
      setState(() {
        _error = null;
        valuetu[tu[c]]['name'] = event.snapshot.value ?? 0;
        print(valuetu[tu[c]]['name']);
      });
    }, onError: (Object o) {
      final DatabaseError error = o as DatabaseError;
      setState(() {
        _error = error;
      });
    });
        }
        b++;
      }
   },
   );
  //}
    }
    
  @override
  Widget build(BuildContext context) {
     if(a==1)
    tull(context);
    //var c=widget.path;
    //print(c);
    //Padding(padding: EdgeInsets.fromLTRB(0, 20, 20, 20));
    return Scaffold(
    backgroundColor:Colors.black.withOpacity(0.9),
       body: CustomScrollView(
         slivers: <Widget>[
           SliverAppBar(
            title: Container(
              child:Stack(
                children: <Widget>[
                  Row(children: <Widget>[
                    Text('Home',style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
                    Padding(padding: EdgeInsets.fromLTRB(100, 0, 0, 0)),
                  ],
                  ),
                ],
                ),
                ),
                
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 50.0,
            leading: IconButton(onPressed: (){
              Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return pro();
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0.0,-1.0),
                  end: Offset(0.0, 0.0),
                ).animate(animation),
                child: child,
              );
            },
            transitionDuration: Duration(milliseconds: 500)));

            }, icon: Icon(Icons.account_circle,size: 35,color: Colors.grey,)),
            backgroundColor:Colors.grey.shade500.withOpacity(0.20),
            flexibleSpace: const FlexibleSpaceBar(
            ),
           ),
            SliverToBoxAdapter(
              child:Padding(padding:EdgeInsets.only(top: 10,right: 15,left: 15  ),child: Card(
                child:Container(
                color: Color(0xFF1b1c1e),
                child: SearchChoices.single(
                items: tu.map((item){
                  return DropdownMenuItem(
                    child: Text(
                      item,
                      style: TextStyle(color: Colors.white), 
                    ),
                    value: item,
                    );
                }).toList(),
                value: s,
                iconSize: 24,
                padding: 5,
                hint: Text("select",style:TextStyle(color: Colors.white ) ,),
                searchHint: Text("select",style:TextStyle(color: Colors.white) ,),
                style: TextStyle(color: Colors.white,backgroundColor: Color(0xFF1b1c1e)),
                isExpanded: true,
                closeButton: TextButton(
                  onPressed: (){
                    Navigator.pop(
                        context
                      );
                  },
                  child: Text("close",style:TextStyle(color: Colors.white)),
                ),
                menuBackgroundColor: Color(0xFF1b1c1e),
                iconEnabledColor: Colors.white,
                iconDisabledColor: Colors.grey,
                onChanged: (value){
                  setState(() {
                    s=value;
                    print(value);
                  });
                },
                ),
              ),
              )
              )
          ),
           SliverPadding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            sliver:SliverFixedExtentList(
              itemExtent: 160.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                //Padding(padding: EdgeInsets.only(bottom: 20));
                return InkWell(
                 onTap:() {  
                   Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Hometul(value:valuetu[s==null?tu[index]:s],path:widget.path.toString()+"/"+tu[index].toString(),app:widget.app),
                ),);
                },
                  child :Padding(
                  padding: EdgeInsets.only(top: 30),
                  child:Container(
                  decoration: BoxDecoration (
                  borderRadius: BorderRadius.circular(25.7),
                  color: Colors.grey.shade500.withOpacity(0.20),
                  border: Border.all(
                    width: 0.0,
                  ),
                  ),
                 // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  width: 100,
                  child: Padding(
                    padding:EdgeInsets.fromLTRB(10, 10, 10, 10) ,
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(valuetu[s==null?tu[index]:s]['name'].toString()
                        ,style: TextStyle(color: Colors.white,fontSize: 20,fontStyle: FontStyle.italic),),
                        Text(valuetu[s==null?tu[index]:s]['plan']['plan1']['start'].toString()
                        ,style: TextStyle(color: Colors.white,fontSize: 20,fontStyle: FontStyle.italic),),
                        Text(valuetu[s==null?tu[index]:s]['sensor']['dht22']['tm1']['temp'].toString()
                        ,style: TextStyle(color: Colors.white,fontSize: 20,fontStyle: FontStyle.italic),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(valuetu[s==null?tu[index]:s]['sensor']['dht22']['tm1']['mois'].toString()
                            ,style: TextStyle(color: Colors.white,fontSize: 20,fontStyle: FontStyle.italic),),
                            Padding(padding: EdgeInsets.fromLTRB(125, 0, 0, 0)),
                            Text("รายละเอียด ...",style: TextStyle(color: Colors.grey,fontSize: 15,fontStyle: FontStyle.italic),),
                          ],
                        )
                      ],
                    ),
                    )
                ),
                ),
                );
              },
              childCount: s==null?tu.length:1,
            ),
          ),
           ),
         ],
         ),
    );
  }
}