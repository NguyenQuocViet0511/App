
import 'package:appoder/GUI/Main/WidgetMenu.dart';
import 'package:flutter/material.dart';

import 'WidgetMap.dart';


class ManApp extends StatefulWidget{


  @override
  State<ManApp> createState() => _ManAppState();
}

class _ManAppState extends State<ManApp> {
  static const List<Widget> _widgetOptions = <Widget>[

    WidgetMap(),Text("data")


  ];
  int CurrentindexMenua = 0;

  Call(){
    setState(() {
       CurrentindexMenua = CurrentindexMenu;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
      child: Center(child: _widgetOptions.elementAt(CurrentindexMenua)),
      ) ,
    // bottomNavigationBar: WidgetMenu(Call: Call),

    );
  }
}