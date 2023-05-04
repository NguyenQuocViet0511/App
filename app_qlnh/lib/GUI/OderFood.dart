import 'dart:core';
import 'dart:core';

import 'package:app_qlnh/GUI/Food.dart';
import 'package:flutter/material.dart';

import '../Models/Food.dart';

List<Food> test = [];

class OderFood extends StatefulWidget {
  List<Food> OderList;

  OderFood({super.key, required this.OderList}); // cach truyen

  double Sum = 0;

  @override
  State<OderFood> createState() => _OderFoodState();
}

class _OderFoodState extends State<OderFood> {
  Call() {
    setState(() {
      widget.Sum = 0;
      for (int i = 0; i < widget.OderList.length; i++) {
        if (widget.OderList[i].count > 0) {
          widget.Sum =
              widget.Sum + widget.OderList[i].prince * widget.OderList[i].count;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int sum;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('Oder')),
      body: Column(children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: const TextField(
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search), hintText: 'Nhập vào bàn'),
            )),
        Expanded(
            child: ListView(
              children: [
                for (Food item in widget.OderList) RowFoods(
                    Item: item, CallBack: Call)
              ],
            )),
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
                      Text(
                        'Tông Tiền : ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.Sum.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 17),
                      )
                    ],
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.topRight,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
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
                    onTap:(){
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
                          child: const Icon(
                            Icons.takeout_dining,
                            color: Colors.white,
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
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
                              Icons.money_off_csred,
                              color: Colors.white,
                            )),
                      ),
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
                          child: const Icon(
                            Icons.bakery_dining,
                            color: Colors.white,
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
}

class RowFoods extends StatefulWidget {
  Food Item;
  final Function CallBack;

  RowFoods({super.key, required this.Item, required this.CallBack});

  @override
  State<RowFoods> createState() => _RowFoodsState();
}

class _RowFoodsState extends State<RowFoods> {
  bool _Visibility = false;
  static const int count = 1;

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
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Visibility(
                        visible: true, child: Image.asset("images/table.png")),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.Item.FoodName,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.lerp(
                                      FontWeight.w200, FontWeight.w400, 2))),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
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
                                          color: Colors.white, fontSize: 10)),
                                  const Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('X',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10)),
                                  ),
                                  Text(
                                    widget.Item.prince.toString(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ],
                              ),
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
                    Text(
                        (((widget.Item.count.toDouble()) * widget.Item.prince))
                            .toString(),
                        style: const TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold)),
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
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Visibility(
                            // visible: item.count > 0 ? true : false,
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (widget.Item.count >= 1) {
                                      int num = widget.Item.count - count;
                                      widget.Item.count = num;
                                      widget.CallBack();
                                    }
                                  });
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
                            onTap: () {
                              setState(() {
                                int num = widget.Item.count + count;
                                widget.Item.count = num;
                                widget.CallBack();
                              });
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
                            onTap: () {},
                            child:  Text(
                             'Tạo tài khoản mới'
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.delete_forever,
                              color: Colors.red,
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
