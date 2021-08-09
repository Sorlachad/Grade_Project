import 'package:flutter/material.dart';
import 'package:flutter_project/editplan.dart';
import 'dropdown.dart';
import 'package:dropdown_below/dropdown_below.dart';
class plan extends StatefulWidget {
  plan({Key? key,required this.path,required this.value}) : super(key: key);
  final path;
  final value;
  @override
  Hplan createState() => Hplan();
}

class Hplan extends State<plan> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  String pat = "";
  List sel=[];
  List<DropdownMenuItem<Object?>> _dropdownTestItems = [];
  var _selectedTest;
  String? name="";
  String? sdate="";
  String? edate="";
  String? maxt="";
  String? mint="";
  String? maxh="";
  String? minh="";
  String? lig="";
  @override
  void initState() {
    super.initState();
    
    setState(() {
        sel=widget.value['plan'].keys.toList();
        print(sel);
        _selectedTest=sel[1];
      });
    _dropdownTestItems = buildDropdownTestItems(sel);
    }
    void dispose() {
    super.dispose();
  }
  List<DropdownMenuItem<Object?>> buildDropdownTestItems(List _testList) {
    List<DropdownMenuItem<Object?>> items = [];
    for (var i in _testList) {
      print(i);
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i),
        ),
      );
    }
    return items;
  }
  onChangeDropdownTests(selectedTest) {
    print(selectedTest);
    setState(() {
      try{
      _selectedTest = selectedTest;
      name=widget.value['plan'][_selectedTest.toString()]['name']['name'].toString();
      sdate=widget.value['plan'][_selectedTest.toString()]['start'].toString();
      edate=widget.value['plan'][_selectedTest.toString()]['end'].toString();
      maxt=widget.value['plan'][_selectedTest.toString()]['name']['name'].toString();
      mint=widget.value['plan'][_selectedTest.toString()]['name']['name'].toString();
      maxh=widget.value['plan'][_selectedTest.toString()]['name']['name'].toString();
      minh=widget.value['plan'][_selectedTest.toString()]['name']['name'].toString();
      lig=widget.value['plan'][_selectedTest.toString()]['name']['name'].toString();
      }on Exception catch(e){
        name="error";
        sdate="error";
        edate="error";
        maxt="error";
        mint="error";
        maxh="error";
        minh="error";
        lig="";
        print(e);
      }
    });
  }
  Widget build(BuildContext context) {
    print("plan");
    print(widget.value['plan']);
    return Scaffold(
      backgroundColor:Colors.black.withOpacity(0.9),
       body: CustomScrollView(
         slivers: <Widget>[
           SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            title: Text('plan',style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
            floating: _floating,
            expandedHeight: 50.0,
            backgroundColor: Color.fromRGBO(32, 33, 36,0.2),
            flexibleSpace: Container(
               ),
            ),
           SliverToBoxAdapter(
             ),
           SliverFillRemaining(
                child:ListView (
              children: <Widget>[
                Center(
            child: DropdownBelow(
          itemWidth: 300,
          itemTextstyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
          boxTextstyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white54),
          boxPadding: EdgeInsets.fromLTRB(13, 12, 13, 12),
          boxWidth: 300,
          boxHeight: 45,
          boxDecoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(width: 1, color: Colors.white54)),
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.white54,
          ),
          hint: Text('เลือกแผน'),
          value: _selectedTest,
          items: _dropdownTestItems,
          onChanged: onChangeDropdownTests,
        )
        ),
                InkWell(
                child:Padding(padding: EdgeInsets.all(10),
                child:Container(
                  padding:EdgeInsets.fromLTRB(10,10,10,10),
                  decoration: BoxDecoration (
                  borderRadius: BorderRadius.circular(25.7),
                  color: Colors.grey.shade500.withOpacity(0.20),
                  border: Border.all(
                    width: 0.0,
                  ),
                  ),
                  width: 100,
                  height: 230,
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:<Widget>[
                       Text("ชื่อแผน :"+name.toString()
                        ,style: TextStyle(color: Colors.white,fontSize: 17,fontStyle: FontStyle.italic),),
                       Text("วันเริ่ม "+sdate.toString()+"   วันสิ้นสุด"+edate.toString()
                       ,style: TextStyle(color: Colors.white,fontSize: 17,fontStyle: FontStyle.italic),),
                       Text("ระยะที่  ..."
                        ,style: TextStyle(color: Colors.white,fontSize: 17,fontStyle: FontStyle.italic),),
                        Text("อุณหภูมิสูงสุด :"+maxt.toString()
                        ,style: TextStyle(color: Colors.white,fontSize: 17,fontStyle: FontStyle.italic),),
                       Text("อุณหภูมิต่ำสุด"+mint.toString()
                        ,style: TextStyle(color: Colors.white,fontSize: 17,fontStyle: FontStyle.italic),),
                        Text("ความชื้นสูงสุด"+maxh.toString()
                        ,style: TextStyle(color: Colors.white,fontSize: 17,fontStyle: FontStyle.italic),),
                        Text("ความชื้นต่ำสุด"+minh.toString()
                        ,style: TextStyle(color: Colors.white,fontSize: 17,fontStyle: FontStyle.italic),),
                        Text("การให้แสงสว่าง : "+lig.toString()
                        ,style: TextStyle(color: Colors.white,fontSize: 17,fontStyle: FontStyle.italic),),
                      ],
                    ),
                    ),
                    )
                ),
                    Padding(padding: EdgeInsets.only(bottom: 30)),
                    Divider(color: Colors.white,height: 0.1,),
                    Container(
                      width: 100,
                      height: 50,
                      color: Color(0xFF1b1c1e),
                      child: ListTile(
                        onTap: (){
                              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => editplan(),
                ),);
                            },
                        title:Text("แก้ไขแผนการเพาะเลี้ยง"
                       ,style: TextStyle(color: Colors.white,fontSize: 15),),
                       leading: Icon(Icons.camera,size: 30,color: Colors.white,),
                       trailing: Icon(Icons.arrow_forward_ios,size: 20,color: Colors.grey,),
                      ),
                    ),
                    Divider(color: Colors.white,height: 0.1,),
              ]
              )
           )
         ],
         ),
    );
  }
}