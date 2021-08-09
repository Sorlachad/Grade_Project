import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/editplan.dart';
import 'package:flutter_project/plan.dart';
import 'package:cupertino_list_tile/cupertino_list_tile.dart';
class selectplan extends StatefulWidget {
  selectplan({Key? key,required this.path,required this.value}) : super(key: key);
  final path;
  final value;
  @override
  _selectplanState createState() => _selectplanState();
}

class _selectplanState extends State<selectplan> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  List select=[];
  @override
  void initState() {
    super.initState();
      setState(() {
        select=widget.value['plan'].keys.toList();
        print(select);
      });
    }
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child:Scaffold(
      backgroundColor:Colors.black.withOpacity(0.9),
       body: CustomScrollView(
         slivers: <Widget>[
           SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            title: Text('ขวดเพาะเลี้ยง',style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
            floating: _floating,
            expandedHeight: 50.0,
            backgroundColor: Color.fromRGBO(32, 33, 36,0.2),
            flexibleSpace: Container(
               ),
            ),
           SliverToBoxAdapter(
             ),
           SliverFillRemaining(
             child:Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,

                 ),
                 Padding(padding:EdgeInsets.fromLTRB(10, 30, 0, 0) ,child:Container(padding:EdgeInsets.fromLTRB(0,0,10,0),child:Text("เลือกแผน",style: TextStyle(fontSize: 20,color: Colors.white),),),),
             Expanded(
             child: ListView.builder(
               itemBuilder: (context,index){
                 return Container(
                 color: Color(0xFF1b1c1e),
                   child:ListTile(
                     onTap: (){
                       Navigator.push(
                        context, 
                       MaterialPageRoute(
                         builder: (context) => plan(path: widget.path, value: widget.value)
                       )
                       );

                     },
                   title: Text(select[index].toString(),style: TextStyle(fontSize: 20,color: Colors.white)),
                   trailing: Icon(Icons.arrow_forward_ios,size: 20,color: Colors.grey,),
                 )
                 );
               },
               itemCount: select.length,
               ),
             ),
               ],
             )
           )
         ]
       )
    )
    );
  }
}