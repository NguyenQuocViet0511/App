// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:ffi';

import 'package:appoder/API/Const.dart';
import 'package:appoder/API/Users/APIbillinfo.dart';
import 'package:appoder/API/Users/APIcategory.dart';
import 'package:appoder/API/Users/APIfood.dart';
import 'package:appoder/GUI/Bill/WidgetBillinfo.dart';
import 'package:appoder/Models/Category/category.dart';
import 'package:appoder/Models/Category/categoryDao.dart';
import 'package:appoder/Models/Food/food.dart';
import 'package:appoder/Models/Food/foodDao.dart';
import 'package:appoder/Models/Table/table.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Models/Food/food.dart';





List<food>? foods;
List<food>? Search = foods!;

String ValueClick = "";

Future<foodData>? data;
Future<CategoryData>? categorys;

class Foods extends StatefulWidget {
  Function Call;

  Foods({super.key, required this.Call});

  @override
  State<Foods> createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
  bool _visibility = false;
  final cleartext = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    categorys = Getcategory();
    data = Getfood();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("" + tb.name.toString() + "/" + "Thêm Món Ăn")),
      body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Nhập tên cần tìm kiếm',
                        suffixIcon: Visibility(
                          visible: _visibility,
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  cleartext.clear();
                                  _visibility = false;
                                  Filter('');
                                });
                              },
                              child: Icon(Icons.close)),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          Filter(value);
                          if (value.isNotEmpty) {
                            _visibility = true;
                          } else {
                            _visibility = false;
                          }
                        });
                      },
                      controller: cleartext)),
              DropMenu(Call: Call),
              Expanded(child: FoodRows())
            ],
          )),
      bottomNavigationBar: Container(
        height: 45,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // Search!.clear();
                    });
                    Search = foods!;
                    widget.Call();
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      primary: Colors.white,
                      onPrimary: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0))),
                  child: const Text(
                    'Hủy Bỏ',
                    style: TextStyle(color: Colors.red),
                  )),
            ),
            Expanded(
              child: ElevatedButton(
                  onPressed: () async {
                    await Oder();
                    setState(() {
                      // Search!.clear();
                    });
                    Search = foods!;
                    widget.Call();
                    connectAndListen();
                    // Send();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0))),
                  child: const Text('Đồng Ý')),
            )
          ],
        ),
      ),
    );
  }

  Oder() async {
    if (checkChose()) {
      for (food item in Search!) {
        if (item.count! > 0) {
          oderFood.add(item!);
          await Insertbillinfo(tb.idBill.toString(), item.id.toString(), "",
              us.id.toString(), item.count.toString(), tb.id.toString());
        }
      }

      Fluttertoast.showToast(
          msg: "Thêm Thành Công",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 12.0);
      Navigator.pop(context);
      Navigator.push(
          context,
          PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  WidgetBillinfo()));
    } else {
      Fluttertoast.showToast(
          msg: "Thêm Không Thành Công",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 12.0);
    }

  }

  bool checkChose() {
    for (food item in Search!) {
      if (item.count! > 0) {
        return true;
      }
    }

    return false;
  }

  Call() {
    setState(() {
      Filter(ValueClick);
    });
  }

  void Filter(String value) {
    if (value.isEmpty) {
      Search = foods!;
    } else {
      final result = foods!
          .where((item) =>
              (item.name
                  .toString()
                  .toLowerCase()
                  .contains(value.toLowerCase())) ||
              item.idCategory
                  .toString()
                  .toLowerCase()
                  .contains(value.toLowerCase()))
          .toList();
      setState(() {
        Search = result;
      });
    }
  }
}

class DropMenu extends StatefulWidget {
  DropMenu({super.key, required this.Call});

  Function Call;

  @override
  State<DropMenu> createState() => _DropMenuState();
}

class _DropMenuState extends State<DropMenu> {
  List<Category>? categorylist;
  String Value = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<CategoryData>(
            future: categorys,
            builder: (context, categorydata) {
              if (categorydata.hasData) {
                categorylist = categorydata.data!.data!.data!;
                if (Value.isEmpty) {
                  Value = categorylist!.elementAt(0).id.toString();
                }
                return DropdownButton(
                  isExpanded: true,
                  items: categorylist!
                      .map((e) => DropdownMenuItem(
                            child: Center(
                                child: Text(e.name.toString(),
                                    textAlign: TextAlign.center)),
                            value: e.id,
                          ))
                      .toList(),
                  value: Value,
                  onChanged: (value) {
                    setState(() {
                      Value = value!;
                      ValueClick = value!;
                      widget.Call();
                    });
                  },
                );
              }
              return Center();
            }));
  }
}

class FoodRows extends StatefulWidget {
  const FoodRows({super.key});

  @override
  State<FoodRows> createState() => _FoodRowsState();
}

class _FoodRowsState extends State<FoodRows> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<foodData>(
            future: data,
            builder: (context, foodData) {
              if (foodData.hasData) {
                foods = foodData.data!.data!.data!;
                return ListView(
                  children: [
                    for (food item in Search!)
                      Container(
                        decoration: BoxDecoration(
                            // color: item.count > 0 ? const Color(0xFFe0e0e0) : Colors
                            //     .white,
                            border: Border.all(width: 0.1)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                imageFromBase64String(item.image.toString()),
                                // Image.asset(item.Images),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(item.name.toString(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.lerp(
                                                  FontWeight.w200,
                                                  FontWeight.w400,
                                                  2))),
                                      Text(item.price.toString(),
                                          style: const TextStyle(fontSize: 15))
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Visibility(
                                  visible: item.count! > 0 ? true : false,
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          int num = item.count!.toInt() - count;
                                          item.count = num;
                                          // arrange(FoodList);
                                        });
                                      },
                                      child: const Icon(Icons.do_not_disturb_on,
                                          size: 30,
                                          color: Colors.blue,
                                          shadows: [
                                            BoxShadow(
                                                color: Colors.black38,
                                                blurRadius: 20,
                                                offset: Offset(2, 2))
                                          ])),
                                ),
                                Visibility(
                                  visible: item.count! > 0 ? true : false,
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text(
                                        item.count.toString(),
                                        style: const TextStyle(fontSize: 20),
                                      )),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      int num = count + item.count!.toInt();
                                      item.count = num;
                                      // arrange(FoodList);
                                    });
                                  },
                                  child: const Icon(
                                    Icons.add_circle,
                                    size: 30,
                                    color: Colors.blue,
                                    shadows: [
                                      BoxShadow(
                                          color: Colors.black38,
                                          blurRadius: 20,
                                          offset: Offset(2, 2))
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                  ],
                );
              }
              return Center(child: CircularProgressIndicator());
            }));

    // void arrange(List<Food> List) {
    //   List.sort((Food item1, Food item2) => item2.count.compareTo(item1.count));
  }
}
