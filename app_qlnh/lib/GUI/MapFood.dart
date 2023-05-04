import 'package:app_qlnh/GUI/Food.dart';
import 'package:app_qlnh/Models/Food.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/Table.dart';
import 'Oderitem.dart';

class MapFood extends StatefulWidget {
  const MapFood({super.key});

  @override
  State<MapFood> createState() => _MapFoodState();
}

class _MapFoodState extends State<MapFood> {
  bool _CurentCheck = false;
  final List<tableItems> TableList = [
    tableItems('1', 'Bàn 1', 'Đã có'),
    tableItems('2', 'Bàn 2', 'không'),
    tableItems('3', 'Bàn 3', 'không'),
    tableItems('4', 'Bàn 12', 'Đã có'),
    tableItems('5', 'Bàn 13', 'Đã có'),
    tableItems('6', 'Bàn 14', 'Đã có'),
    tableItems('7', 'Bàn 15', 'Đã có'),
    tableItems('8', 'Bàn 16', 'Đã có'),
    tableItems('9', 'Bàn 37', 'không'),
    tableItems('10', 'Bàn 38', 'không'),
    tableItems('11', 'Bàn 39', 'không'),
    tableItems('12', 'Bàn 30', 'không'),
    tableItems('13', 'Bàn 31', 'không'),
    tableItems('14', 'Bàn 32', 'không'),
    tableItems('15', 'Bàn 33', 'không'),
    tableItems('16', 'Bàn 34', 'không'),
    tableItems('17', 'Bàn 32', 'other'),
    tableItems('18', 'Bàn 33', 'không'),
    tableItems('19', 'Bàn 34', 'other'),
    tableItems('20', 'Bàn 35', 'không'),
  ];
  late Food item;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sơ Đồ'),
      ),
      body: Column(
        children: [
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
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        width: 15,
                        height: 15,
                        color: Colors.orange,
                      ),
                      const Text('Đặt trước'),
                    ],
                  ),

                ],
              ),
            ),
          ),
          Visibility(
            visible: true,
            child: Row(
              children: [

              ],
            )),

          Expanded(
            child: GridView.count(
                // primary: false,
                mainAxisSpacing: 20,
                padding: const EdgeInsets.all(10),
                crossAxisSpacing: 10,
                crossAxisCount: 4,
                children: [
                  for (tableItems items in TableList)
                    Stack(
                      children: [
                        Center(
                          child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              child: items.TrangThai.compareTo("Đã có") == 0
                                  ? Image.asset("images/table.png")
                                      // color: Colors.grey.withOpacity(0.4))
                                  : items.TrangThai.compareTo("other") == 0
                                      ? Image.asset("images/table.png",)
                                          // color: Colors.orange.withOpacity(0.5))
                                      : Image.asset("images/table.png",))
                                          // color: Colors.blue.withOpacity(0.8))),
                        ),
                        TextButton(
                          onPressed: () async {
                            switch (items.TrangThai) {
                              case 'Đã có':
                                print('oke');
                                break;
                              case 'không':
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Foods()));
                                break;
                              case 'other':
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        child: Container(
                                          height: MediaQuery.of(context).size.height / 3.1,
                                          width: double.infinity,
                                          decoration:  BoxDecoration(
                                            color: Colors.grey.withOpacity(0.2),
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(5))),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: const BoxDecoration(
                                                      color: Colors.blue,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(5),
                                                              topRight: Radius
                                                                  .circular(5),
                                                              bottomLeft:
                                                                  Radius.zero,
                                                              bottomRight:
                                                                  Radius.zero)),
                                                  child: const Text('Bàn :',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight
                                                              .bold))),
                                              const oderitem(),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 25),
                                                alignment:
                                                    Alignment.centerRight,
                                                child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary:
                                                                Colors.white,
                                                            onPrimary:
                                                                Colors.blue),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      'Đóng',
                                                      style: TextStyle(
                                                          color: Colors.red),
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
                              child: Text(items.Tablename.toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20))),
                        )
                      ],
                    )
                ]),
          ),


        ],
      ),
    );
  }
}
