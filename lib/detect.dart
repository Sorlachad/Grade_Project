import 'package:flutter/material.dart';

class detect extends StatefulWidget {
  detect({Key? key}) : super(key: key);

  @override
  Hdetect createState() => Hdetect();
}

class Hdetect extends State<detect> {
  @override
  Widget build(BuildContext context) {
    print("detect");
    bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
    return Scaffold(
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
                child:GridView.count(
                primary: true,
                padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration (
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade500.withOpacity(0.20),
                  border: Border.all(
                    width: 0.0,
                  ),),
                    child:InkWell(
                      onTap: (){
                      },
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.account_circle,size: 50,color: Colors.white,
                    ),
                    Text("ขวดที่1",style: TextStyle(fontSize: 20,color: Colors.white),)
                    ],
                    ),
                    ),
                    ),
                  Container(
                    decoration: BoxDecoration (
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade500.withOpacity(0.20),
                  border: Border.all(
                    width: 0.0,
                  ),),
                    child:InkWell(
                      onTap: (){
                      },
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.account_circle,size: 50,color: Colors.white,
                    ),
                    Text("ขวดที่2",style: TextStyle(fontSize: 20,color: Colors.white),)
                    ],
                    ),
                    ),
                    ),
                  Container(
                    decoration: BoxDecoration (
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade500.withOpacity(0.20),
                  border: Border.all(
                    width: 0.0,
                  ),),
                    child:InkWell(
                      onTap: (){
                      },
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.account_circle,size: 50,color: Colors.white,
                    ),
                    Text("ขวดที่3",style: TextStyle(fontSize: 20,color: Colors.white),)
                    ],
                    ),
                    ),
                    ),
                  Container(
                    decoration: BoxDecoration (
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade500.withOpacity(0.20),
                  border: Border.all(
                    width: 0.0,
                  ),),
                    child:InkWell(
                      onTap: (){
                      },
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.account_circle,size: 50,color: Colors.white,
                    ),
                    Text("ขวดที่4",style: TextStyle(fontSize: 20,color: Colors.white),)
                    ],
                    ),
                    ),
                    ),
                  Container(
                    decoration: BoxDecoration (
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade500.withOpacity(0.20),
                  border: Border.all(
                    width: 0.0,
                  ),),
                    child:InkWell(
                      onTap: (){
                      },
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.account_circle,size: 50,color: Colors.white,
                    ),
                    Text("ขวดที่5",style: TextStyle(fontSize: 20,color: Colors.white),)
                    ],
                    ),
                    ),
                    ),
                  Container(
                    decoration: BoxDecoration (
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade500.withOpacity(0.20),
                  border: Border.all(
                    width: 0.0,
                  ),),
                    child:InkWell(
                      onTap: (){
                      },
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.account_circle,size: 50,color: Colors.white,
                    ),
                    Text("ขวดที่6",style: TextStyle(fontSize: 20,color: Colors.white),)
                    ],
                    ),
                    ),
                    ),
                  Container(
                    decoration: BoxDecoration (
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade500.withOpacity(0.20),
                  border: Border.all(
                    width: 0.0,
                  ),),
                    child:InkWell(
                      onTap: (){
                      },
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.account_circle,size: 50,color: Colors.white,
                    ),
                    Text("ขวดที่7",style: TextStyle(fontSize: 20,color: Colors.white),)
                    ],
                    ),
                    ),
                    ),
                    Container(
                    decoration: BoxDecoration (
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade500.withOpacity(0.20),
                  border: Border.all(
                    width: 0.0,
                  ),),
                    child:InkWell(
                      onTap: (){
                      },
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.account_circle,size: 50,color: Colors.white,
                    ),
                    Text("ขวดที่8",style: TextStyle(fontSize: 20,color: Colors.white),)
                    ],
                    ),
                    ),
                    ),
                    Container(
                    decoration: BoxDecoration (
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade500.withOpacity(0.20),
                  border: Border.all(
                    width: 0.0,
                  ),),
                    child:InkWell(
                      onTap: (){
                      },
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.account_circle,size: 50,color: Colors.white,
                    ),
                    Text("ขวดที่9",style: TextStyle(fontSize: 20,color: Colors.white),)
                    ],
                    ),
                    ),
                    ),
                ],
         ),
            ) 
            ]
        )
    );
  }
}