

import 'package:flutter/material.dart';

import '../../API/Const.dart';

int CurrentindexMenu = 0;

class WidgetMenu extends StatefulWidget {
  Function Call;
  WidgetMenu({super.key,required this.Call});

  @override
  State<WidgetMenu> createState() => _WidgetMenuState();
}

  class _WidgetMenuState extends State<WidgetMenu> {
  @override
  Widget build(BuildContext context) {
  // TODO: implement build
  return BottomNavigationBar(
  items: const <BottomNavigationBarItem>[
  BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Sơ Đồ'),
  // BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: 'Gọi Món'),
  BottomNavigationBarItem(
  icon: Icon(Icons.menu_open_outlined), label: 'Tiện ích')
  ],
  currentIndex: CurrentindexMenu,
  selectedItemColor: Colors.lightBlue,
  onTap: (value) {
    _CurrentIndexMenu(value);
    widget.Call();

  },
  );
  }
  void _CurrentIndexMenu(int index) {
    setState(() {
      CurrentindexMenu = index;
    print(CurrentindexMenu);
    });
  }
  }
