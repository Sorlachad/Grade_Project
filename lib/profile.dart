import 'package:flutter/material.dart';

class pro extends StatefulWidget {
  pro({Key? key}) : super(key: key);

  @override
  prof createState() => prof();
}

class prof extends State<pro> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  @override
  Widget build(BuildContext context) {
    print("profile");
    return Scaffold(
      backgroundColor:Colors.black.withOpacity(0.9),
       body: CustomScrollView(
         slivers: <Widget>[
           SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            title: Text('profile',style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
            floating: _floating,
            expandedHeight: 0.0,
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
         Padding(padding: EdgeInsets.only(top: 20),child: Container (
            child: Align(
              child: Column(
                children: [
                  Icon(Icons.account_circle,size: 70,color: Colors.grey,),
                  Text("สรชัช  งามจารุสิน",style: TextStyle(color: Colors.white,fontSize: 20),),
                  Padding(padding: EdgeInsets.only(bottom: 5)),
                  Text("tue4748@hotmail.com",style: TextStyle(color: Colors.white,fontSize: 20))
                ],
                ),
            ),
        ),
         ),
        Expanded(
             child: ListView.builder(
               itemBuilder: (context,index){
                 return Container(
                 color: Color(0xFF1b1c1e),
                   child:ListTile(
                    // onTap: (){
                   //    Navigator.push(
                  //      context, 
                  //       builder: (context) => plan(path: widget.path, value: widget.value)
                 //      )
                   //    );
                    // },
                   title: Text(index==0?"สรชัช":index==1?'tue4748@hotmail.com':index==2?'Logout':"",style: TextStyle(fontSize: 20,color: Colors.white)),
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
             ]
           )
    );
}
}