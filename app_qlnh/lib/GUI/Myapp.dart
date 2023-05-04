import 'package:app_qlnh/GUI/MapFood.dart';
import 'package:app_qlnh/GUI/Oder.dart';
import 'package:app_qlnh/GUI/utilitie.dart';
import 'package:flutter/material.dart';

int _CurrentindexMenu = 0;

class MyApp extends StatefulWidget {
  MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const List<Widget> _widgetOptions = <Widget>[

    MapFood(),
    Oder(),
    utilitie()

  ];
  Call(){
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_CurrentindexMenu)),
      bottomNavigationBar: MenuBottomNavigation(Call: Call),
    );
  }

}

// khởi tạo menu
class MenuBottomNavigation extends StatefulWidget {
  Function Call;
  MenuBottomNavigation({super.key,required this.Call});

  @override
  State<MenuBottomNavigation> createState() => _MenuBottomNavigationState();
}

class _MenuBottomNavigationState extends State<MenuBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Sơ Đồ'),
        BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: 'Gọi Món'),
        BottomNavigationBarItem(
            icon: Icon(Icons.menu_open_outlined), label: 'Tiện ích')
      ],
      currentIndex: _CurrentindexMenu,
      selectedItemColor: Colors.lightBlue,
      onTap: _CurrentIndexMenu,
    );
  }

  void _CurrentIndexMenu(int index) {
    setState(() {
        widget.Call();
      _CurrentindexMenu = index;
    });
  }
}
