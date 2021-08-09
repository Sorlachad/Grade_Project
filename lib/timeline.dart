import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
class timeline extends StatefulWidget {
  timeline({Key? key}) : super(key: key);

  @override
  Htimeline createState() => Htimeline();
}

class Htimeline extends State<timeline> {
  @override
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  Widget build(BuildContext context) {
    print("timeline");
    return Scaffold(
       backgroundColor:Colors.black.withOpacity(0.9),
       body: CustomScrollView(
         slivers: <Widget>[
           SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            title: Text('timeline',style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
            floating: _floating,
            expandedHeight: 50.0,
            backgroundColor: Color.fromRGBO(32, 33, 36,0.2),
            flexibleSpace: Container(
               ),
            ),
           SliverToBoxAdapter(
             ),
           SliverFillRemaining( 
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.fromLTRB(0, 30, 40, 0),child:  Text("Timeline",style: TextStyle(fontSize: 20,color: Colors.white),),),
              _Timeline1(),
            ],
          ),
        ),
      ),  
    ),
         ]
    ),
    );
  }
}
class _Timeline1 extends StatelessWidget {
  @override
  var kTileHeight = 170.0;
  List pro=[2,3,3];
  Widget build(BuildContext context) {
    final data = _TimelineStatus.values;
    return Flexible(
      child: Timeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0,
          connectorTheme: ConnectorThemeData(
            thickness: 3.0,
            color: Color(0xffd3d3d3),
          ),
          indicatorTheme: IndicatorThemeData(
            size: 15.0,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 10.0),
        builder: TimelineTileBuilder.connected(
          contentsBuilder: (_, __) => Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0),child:_EmptyContents()),
          connectorBuilder: (_, index, __) {
            if (pro[index] == 2) {
              return SolidLineConnector(color: Color(0xffebcb62));
            } else {
              return SolidLineConnector();
            }
          },
          indicatorBuilder: (_, index) {
            switch (pro[index]) {
              case 0:
                return DotIndicator(
                  color: Color(0xff6ad192),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 10.0,
                  ),
                );
              case 1:
                return DotIndicator(
                  color: Color(0xff193fcc),
                  child: Icon(
                    Icons.sync,
                    size: 10.0,
                    color: Colors.white,
                  ),
                );
              case 2:
                return OutlinedDotIndicator(
                  color: Color(0xffa7842a),
                  borderWidth: 2.0,
                  backgroundColor: Color(0xffebcb62),
                );
              case 3:
              default:
                return OutlinedDotIndicator(
                  color: Color(0xffbabdc0),
                  backgroundColor: Color(0xffe6e7e9),
                );
            }
          },
          itemExtentBuilder: (_, __) => kTileHeight,
          itemCount: 3,
        ),
      ),
    );
  }
}
enum _TimelineStatus {
  done,
  sync,
  inProgress,
  todo,
}

extension on _TimelineStatus {
  bool get isInProgress => this == _TimelineStatus.inProgress;
}
class _EmptyContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget>[
    Container(
      margin: EdgeInsets.only(left: 10.0),
      width: 300,
      height: 130,
      decoration: BoxDecoration (
                  borderRadius: BorderRadius.circular(25.7),
                  color: Colors.grey.shade500.withOpacity(0.20),
                  border: Border.all(
                    width: 0.0,
                  ),
                  ),
    )
  ]
    );
  }
}