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

class WidgetBillinfo extends StatefulWidget {
  WidgetBillinfo({super.key}); // cach truyen

  double Sum = 0;

  @override
  State<WidgetBillinfo> createState() => _OderFoodState();
}

class _OderFoodState extends State<WidgetBillinfo> {
  @override
  void initState() {
    Billinfos = Getbillinfo(tb.idBill.toString(), tb.id.toString());
    super.initState();
  }

  Call() {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("${tb.name}/Hóa đơn "),
        automaticallyImplyLeading: false,
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
                        RowFoods(Item: item, Call: set)
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
                  Expanded(
                    child: Container(
                      alignment: Alignment.topRight,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        Foods(Call: Call)));
                          },
                          child: const Text('+ Thêm Món Mới')),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(3, 3),
                                  blurRadius: 10)
                            ]),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        )),
                  ),
                  Row(
                    children: [
                      Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(3, 3),
                                    blurRadius: 10)
                              ]),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title:
                                          const Text('gửi món ăn cho bếp bar'),
                                      content: const Text(
                                          "bạn có muốn gửi để chế biến không"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              SendCook();
                                              Navigator.pop(context);
                                              set();
                                            },
                                            child: const Text("Có")),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Không"))
                                      ],
                                    );
                                  });
                            },
                            child: const Icon(
                              Icons.takeout_dining,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> SendCook() async {
    await updatebillinfo(tb.idBill.toString(), bill.id.toString());
    Fluttertoast.showToast(
        msg: "gửi  Thành Công",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 12.0);
  }

  void set() {
    setState(() {
      Billinfos = Getbillinfo(tb.idBill.toString(), tb.id.toString());
    });
  }
}

class RowFoods extends StatefulWidget {
  billinfo Item;
  Function Call;

  RowFoods({super.key, required this.Item, required this.Call});

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
                              color: Colors.blue,
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: _Visibility,
          child: SizedBox(
            height: 50,
            child: Container(
                color: const Color(0xFFe0e0e0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Visibility(
                            // visible: item.count > 0 ? true : false,
                            child: InkWell(
                                onTap: () async {
                                  if (widget.Item.status == "Yes") {
                                    Fluttertoast.showToast(
                                        msg:
                                            "Không Thể hành động khi đã gửi bếp",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        textColor: Colors.white,
                                        fontSize: 12.0);
                                  } else {
                                    await Insertbillinfo(
                                        bill.idBill.toString(),
                                        widget.Item.id.toString(),
                                        widget.Item.note.toString(),
                                        us.id.toString(),
                                        "-1",
                                        tb.id.toString());
                                    widget.Call();
                                  }
                                  setState(() {});
                                },
                                child: const Icon(
                                  Icons.do_not_disturb_on,
                                  size: 30,
                                  color: Colors.blue,
                                )),
                          ),
                          Visibility(
                            // visible: item.count > 0 ? true : false,
                            child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(widget.Item.count.toString())),
                          ),
                          InkWell(
                            onTap: () async {
                              if (widget.Item.status == "Yes") {
                                Fluttertoast.showToast(
                                    msg: "Không Thể hành động khi đã gửi bếp",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    textColor: Colors.white,
                                    fontSize: 12.0);
                              } else {
                                await Insertbillinfo(
                                    bill.idBill.toString(),
                                    widget.Item.id.toString(),
                                    widget.Item.note.toString(),
                                    us.id.toString(),
                                    1.toString(),
                                    tb.id.toString());
                                widget.Call();
                              }
                            },
                            child: const Icon(
                              Icons.add_circle,
                              size: 30,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                              onTap: () async {
                                if (widget.Item.status == "Yes") {
                                  Fluttertoast.showToast(
                                      msg: "Không Thể hành động khi đã gửi bếp",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      textColor: Colors.white,
                                      fontSize: 12.0);
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text('ghi chú món ăn'),
                                          actions: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextField(
                                                controller: note,
                                              ),
                                            ),
                                            TextButton(
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                  await Insertbillinfo(
                                                      bill.idBill.toString(),
                                                      widget.Item.id.toString(),
                                                      note.text.toString(),
                                                      us.id.toString(),
                                                      0.toString(),
                                                      tb.id.toString());
                                                  note.clear();
                                                  widget.Call();
                                                },
                                                child: const Text("đồng ý")),
                                          ],
                                        );
                                      });
                                }
                              },
                              child: const Icon(
                                Icons.edit,
                                color: Colors.blue,
                              )),
                          InkWell(
                            onTap: () {
                              if (widget.Item.status == "Yes") {
                                Fluttertoast.showToast(
                                    msg: "Không Thể hành động khi đã gửi bếp",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    textColor: Colors.white,
                                    fontSize: 12.0);
                              } else {}
                            },
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Nhập Vào lí do hủy món'),
                                        actions: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.all(8.0),
                                            child: TextField(
                                              controller: note,
                                            ),
                                          ),
                                          TextButton(
                                              onPressed: () async {
                                                // Navigator.pop(context);
                                                // await Insertbillinfo(
                                                //     bill.idBill.toString(),
                                                //     widget.Item.id.toString(),
                                                //     "hủy món :" + note.text.toString(),
                                                //     us.id.toString(),
                                                //     0.toString(),
                                                //     tb.id.toString());
                                                // note.clear();
                                                // widget.Call();
                                              },
                                              child: const Text("đồng ý")),
                                        ],
                                      );
                                    });
                              },
                              child: const Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
