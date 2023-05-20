import 'dart:core';

import 'package:appoder/API/Users/APIbillinfo.dart';
import 'package:appoder/GUI/Food/Food.dart';
import 'package:appoder/Models/Billinfo/Billinfo.dart';
import 'package:appoder/Models/Billinfo/BillinfoDao.dart';
import 'package:appoder/Models/Food/food.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../API/Const.dart';
import '../../Models/Table/table.dart';

Future<BillinfoData>? Billinfos;

class SeeBillinfo extends StatefulWidget {
  String idbill = '';
  SeeBillinfo({super.key,required this.idbill}); // cach truyen

  double Sum = 0;

  @override
  State<SeeBillinfo> createState() => _SeeBillinfo();
}

class _SeeBillinfo extends State<SeeBillinfo> {
  @override
  void initState() {
    Billinfos = GetbillByID(widget.idbill, tb.id.toString());
    super.initState();
  }

  Call() {

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.idbill}/Hóa đơn "),
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text("Danh Sách Thông Tin Món Ăn",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight:
                  FontWeight.lerp(FontWeight.w200, FontWeight.w400, 2))),
        ),
        Expanded(
          child: FutureBuilder<BillinfoData>(
              future: Billinfos,
              builder: (context, BillinfoData) {
                if (BillinfoData.hasData) {
                  return ListView(
                    children: [
                      for (billinfo item in BillinfoData.data!.data!.data!)
                        RowFoods(Item: item)
                    ],
                  );
                }
                return Center(child: CircularProgressIndicator());
              }),
        ),
      ]),
      bottomNavigationBar: Container(
        height: 120,
        // color: Colors.red,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(Icons.money_off_outlined),
                      const Text(
                        'Tông Tiền : ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      FutureBuilder<BillinfoData>(
                          future: Billinfos,
                          builder: (context, BillinfoData) {
                            if (BillinfoData.hasData) {
                              widget.Sum = 0;
                              for (billinfo item
                              in BillinfoData.data!.data!.data!) {
                                tb.idBill = item.idBill;
                                bill.id = item.id;
                                widget.Sum += item.sum!;
                              }
                              return Text(
                                widget.Sum.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                    fontSize: 17),
                              );
                            }

                            return Text(
                              widget.Sum.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: 17),
                            );
                          }),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class RowFoods extends StatefulWidget {
  billinfo Item;
  RowFoods({super.key, required this.Item});

  @override
  State<RowFoods> createState() => _RowFoodsState();
}

class _RowFoodsState extends State<RowFoods> {
  bool _Visibility = false;
  final note = TextEditingController();
  static const int count = 1;

  @override
  void dispose() {
    note.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              if (_Visibility) {
                _Visibility = false;
              } else {
                _Visibility = true;
              }
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Visibility(
                        visible: widget.Item.status == "No" ? false : true,
                        child: const Icon(
                          Icons.takeout_dining,
                          color: Colors.black,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.Item.foodname.toString(),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.lerp(
                                      FontWeight.w200, FontWeight.w400, 2))),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 5),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue,
                              ),
                              child: Row(
                                children: [
                                  Text(widget.Item.count.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 14)),
                                  const Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('X',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14)),
                                  ),
                                  Text(
                                    widget.Item.foodprice.toString(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.Item.note.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Wrap(
                  spacing: 10,
                  children: [
                    const Text('=',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Text(
                          (("" + (widget.Item.sum.toString() + " vnd")))
                              .toString(),
                          style: const TextStyle(
                              color: Colors.blue, fontSize: 17,fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
