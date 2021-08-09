import 'package:flutter/material.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter_project/plan.dart';


class dropdown extends StatefulWidget {
  dropdown({Key? key,required this.value,required this.path}) : super(key: key);
  final value;
  final path;
  @override
  _dropdownState createState() => _dropdownState();
}

class _dropdownState extends State<dropdown> {
  List sel=[];
  List _testList = [
    {'no': 1, 'keyword': 'blue'},
    {'no': 2, 'keyword': 'black'},
    {'no': 3, 'keyword': 'red'}
  ];
  List<DropdownMenuItem<Object?>> _dropdownTestItems = [];
  var _selectedTest;

  @override
  void initState() {
    setState(() {
        sel=widget.value['plan'].keys.toList();
        print(sel);
      });
    _dropdownTestItems = buildDropdownTestItems(sel);
    super.initState();
  }

  @override
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
      _selectedTest = selectedTest;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
            Icons.settings,
            color: Colors.white54,
          ),
          hint: Text('เลือกวัน'),
          value: _selectedTest,
          items: _dropdownTestItems,
          onChanged: onChangeDropdownTests,
        )
        );
  }
}