import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:appoder/API/Users/APItalbe.dart';
import 'package:appoder/Models/Table/talbeDao.dart';
import 'package:appoder/Models/Users/users.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/Const.dart';
import '../../Models/Table/table.dart';
import '../../Models/Table/table.dart';
import '../Bill/WidgetBillinfo.dart';
import '../Food/Food.dart';

Future<TableData>? data;

class WidgetMap extends StatefulWidget {
  const WidgetMap({super.key});

  @override
  State<WidgetMap> createState() => _MapFoodState();

}



class _MapFoodState extends State<WidgetMap> {
  bool _CurentCheck = false;
  table tables = table();
  late Socket sock;


  @override
  void initState() {

    data = GetTable();
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  Call()
  {
    setState(() {
      data = GetTable();
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Sơ đồ"),
        ),
        body: Container(
          child: Column(children: [
            Container(
              height: 50,
              color: Colors.grey.withOpacity(0.2),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          width: 15,
                          height: 15,
                          color: Colors.blue,
                        ),
                        const Text('Trống'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                            width: 15,
                            height: 15,
                            color: Colors.grey,
                          ),
                          const Text('Đang dùng'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FutureBuilder<TableData>(
                future: data,
                builder: (context, tabledata) {
                  if (tabledata.hasData) {
                    return Expanded(
                        child: GridView.count(
                            // primary: false,
                            mainAxisSpacing: 20,
                            padding: const EdgeInsets.all(10),
                            crossAxisSpacing: 10,
                            crossAxisCount: 4,
                            children: [
                          for (table item in tabledata.data!.data!.data!)
                            Stack(
                              children: [
                                Center(
                                    child: Container(
                                        color: item.status == "No" ? Colors.white : Colors.grey,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 5),
                                        child: Image.asset("images/table.png" ,color : item.status == "Yes" ? Colors.grey : Colors.blue))),
                                TextButton(
                                  onPressed: () async {
                                    switch (item.status) {
                                      case 'No':
                                        tb.id = item.id;
                                        tb.idBill = item.idBill;
                                        tb.idBill = item.idBill;
                                        tb.name = item.name;
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>  Foods(Call: Call)));
                                        break;
                                      case 'Yes':
                                        tb.id = item.id;
                                        tb.idBill = item.idBill;
                                        tb.idBill = item.idBill;
                                        tb.name = item.name;
                                        Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
                                            WidgetBillinfo()));
                                        break;
                                      case 'ko':
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Dialog(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5))),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      3.1,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      borderRadius:
                                                          const BorderRadius.all(
                                                              Radius.circular(
                                                                  5))),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  10),
                                                          width:
                                                              MediaQuery.of(context)
                                                                  .size
                                                                  .width,
                                                          decoration: const BoxDecoration(
                                                              color: Colors.blue,
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft:
                                                                      Radius.circular(
                                                                          5),
                                                                  topRight:
                                                                      Radius.circular(
                                                                          5),
                                                                  bottomLeft:
                                                                      Radius.zero,
                                                                  bottomRight:
                                                                      Radius
                                                                          .zero)),
                                                          child: const Text(
                                                              'Bàn :',
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold))),
// const oderitem(),
                                                      Container(
                                                        padding: const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 25),
                                                        alignment:
                                                            Alignment.centerRight,
                                                        child: ElevatedButton(
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    primary: Colors
                                                                        .white,
                                                                    onPrimary:
                                                                        Colors
                                                                            .blue),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                              'Đóng',
                                                              style: TextStyle(
                                                                  color:
                                                                      Colors.red),
                                                            )),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });

                                        break;
                                    }
                                  },
                                  child: Center(
                                    child: Text(item.name.toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                )
                              ],
                            )
                        ]));
                  }
                  return Container(
                    margin: EdgeInsetsDirectional.symmetric(vertical: 100),
                    alignment: Alignment.center,
                      child: CircularProgressIndicator());
                })
          ]),
        ));
  }
}
