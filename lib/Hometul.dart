
import 'package:flutter/material.dart';
import 'package:flutter_project/detect.dart';
import 'package:flutter_project/editplan.dart';
import 'package:flutter_project/noti.dart';
import 'package:flutter_project/plan.dart';
import 'package:flutter_project/selectplan.dart';
import 'package:flutter_project/timeline.dart';
import 'Historyhome.dart';
class Hometul extends StatefulWidget {
  Hometul({Key? key,required this.path,required this.value,required this.app}) : super(key: key);
  @override
  final path;
  final app;
  final value;
  Homepagetul createState() => Homepagetul();
}

class Homepagetul extends State<Hometul> {
   bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  @override
  Widget build(BuildContext context) {
    print(widget.path);
    print(widget.value);
    return Scaffold(
      backgroundColor:Colors.black.withOpacity(0.9),
       body: CustomScrollView(
         physics: NeverScrollableScrollPhysics(),
         slivers: <Widget>[
           SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            title: Row(children:[
              Text(widget.value['name'].toString(),style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic)
              ,),
              Padding(padding: EdgeInsets.only(left: 170),),
              InkWell(
                onTap: (){
                  Navigator.push(context, 
                  PageRouteBuilder(
                    pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return noti();
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(1.0,0.0),
                  end: Offset(0.0, 0.0),
                ).animate(animation),
                child: child,
              );
            },
            transitionDuration: Duration(milliseconds: 300)
                  )
                  );
                },
                child:Stack(
                children: <Widget>[
      new Icon(Icons.notifications,size: 30,),
      new Positioned(
        right: 0,
        child: new Container(
          padding: EdgeInsets.all(1),
          decoration: new BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(6),
          ),
          constraints: BoxConstraints(
            minWidth: 15,
            minHeight: 15,
          ),
          child: new Text(
            '1',
            style: new TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      )
    ],
              ),
              )
              ],),
            floating: _floating,
            expandedHeight: 50.0,
            backgroundColor: Color.fromRGBO(32, 33, 36,0.2),
            flexibleSpace: Container(
               ),
            ),
           SliverToBoxAdapter(
             
             ),
           SliverFillRemaining(
             hasScrollBody:true,
                child:Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 50),child:InkWell(
                  onTap: (){
                              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Historyhome(path: widget.path,app: widget.app,),
                ),);
                            },
                child:Container(
                  padding:EdgeInsets.fromLTRB(10,10,10,10),
                  decoration: BoxDecoration (
                  borderRadius: BorderRadius.circular(25.7),
                  color: Colors.grey.shade500.withOpacity(0.20),
                  border: Border.all(
                    width: 0.0,
                  ),
                  ),
                  width: 400,
                  height: 200,
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:<Widget>[
                       Text(widget.value['name'].toString()
                        ,style: TextStyle(color: Colors.white,fontSize: 17,fontStyle: FontStyle.italic),),
                       Text(widget.value['plan']['plan1']['start'].toString()+"   วันสิ้นสุด"+widget.value['plan']['plan1']['end'].toString()
                       ,style: TextStyle(color: Colors.white,fontSize: 17,fontStyle: FontStyle.italic),),
                       Text("จำนวนขวดเพาะเลี้ยง ..."
                        ,style: TextStyle(color: Colors.white,fontSize: 17,fontStyle: FontStyle.italic),),
                       Text("อุณหภูมิ"+widget.value['sensor']['dht22']['tm1']['temp'].toString()
                        ,style: TextStyle(color: Colors.white,fontSize: 17,fontStyle: FontStyle.italic),),
                        Text("ความชื้น"+widget.value['sensor']['dht22']['tm1']['mois'].toString()
                        ,style: TextStyle(color: Colors.white,fontSize: 17,fontStyle: FontStyle.italic),),
                        Text("การให้แสงสว่าง"+widget.value['light']['lightP'].toString()
                        ,style: TextStyle(color: Colors.white,fontSize: 17,fontStyle: FontStyle.italic),),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                          Text("สถานะโอโซน"
                          ,style: TextStyle(color: Colors.white,fontSize: 17,fontStyle: FontStyle.italic),),
                          Padding(padding: EdgeInsets.fromLTRB(190, 0, 0, 20)),
                          Text("ดูประวัติ ...",style: TextStyle(color: Colors.grey,fontSize: 17,fontStyle: FontStyle.italic),),
                          ],
                        )
                      ],
                    ),
                    ),
                    )
                ),
                    Expanded(
             child: ListView.builder(
               physics: NeverScrollableScrollPhysics(),
               itemBuilder: (context,index){
                 return Container(
                 color: Color(0xFF1b1c1e),
                   child:ListTile(
                     onTap: (){
                       Navigator.push(
                        context, 
                        MaterialPageRoute(
                         builder: (context) => index==0?timeline():
                         index==1?plan(path: widget.path,value: widget.value,):index==2?detect():Padding(padding: EdgeInsets.only(bottom: 0),)
                        )
                       );
                     },
                   title: index==0?Text("ไทม์ไลน์การเพาะเลี้ยง",style: TextStyle(fontSize: 20,color: Colors.white)):
                   index==1?Text("แผนการเพาะเลี้ยง ",style: TextStyle(fontSize: 20,color: Colors.white)):
                   index==2?Text("ตรวจจับเชื้อรา",style: TextStyle(fontSize: 20,color: Colors.white)):
                   Padding(padding:EdgeInsets.all(0),),
                   trailing: Icon(Icons.arrow_forward_ios,size: 20,color: Colors.grey,),
                 )
                 );
               },
               itemCount: 3,
               ),
                      ),
              ]
              )
             )
         ],
         ),
    );
  }
}


