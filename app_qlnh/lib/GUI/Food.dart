// ignore_for_file: non_constant_identifier_names

import 'package:app_qlnh/GUI/OderFood.dart';
import 'package:flutter/material.dart';

import '../Models/Food.dart';

List<Food> Search = FoodList;

List<String> Index = ["1", "2", "3", "4", "5"];

class Foods extends StatefulWidget {
  const Foods({super.key});

  @override
  State<Foods> createState() => _FoodsState();

}


class _FoodsState extends State<Foods> {
  bool _visibility = false;
  final cleartext = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(

      ),

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
                DropButton(),
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
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      fixedSize: Size(0, MediaQuery
                          .of(context)
                          .size
                          .height),
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
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => OderFood(OderList: FoodList)));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      fixedSize: Size(0, MediaQuery
                          .of(context)
                          .size
                          .height),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0))),
                  child: const Text('Đồng Ý')),
            )
          ],
        ),
      ),
    );
  }


  void Filter(String value) {
    if (value.isEmpty) {
      Search = FoodList;
    } else {
      final result = Search.where((item) =>
          item.FoodName.toLowerCase().contains(value.toLowerCase())).toList();
      setState(() {
        Search = result;
      });
    }
  }
}

class DropButton extends StatefulWidget {
  DropButton({super.key});

  @override
  State<DropButton> createState() => _DropButtonState();
}

class _DropButtonState extends State<DropButton> {
  String Value = Index.first;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        focusColor: Colors.white,
        items: Index.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Center(child: Text(value, textAlign: TextAlign.center)),
          );
        }).toList(),
        value: Value,
        onChanged: (String? value) {
          setState(() {
            Value = value!;
          });
        },
      ),
    );
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
    return ListView(
      children: [
        for(Food item in Search)
          Container(
            decoration: BoxDecoration(
                color: item.count > 0 ? const Color(0xFFe0e0e0) : Colors
                    .white,
                border: Border.all(width: 0.1)),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(item.Images),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.FoodName,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.lerp(
                                      FontWeight.w200, FontWeight.w400, 2))),
                          Text(item.prince.toString(),
                              style: const TextStyle(fontSize: 15))
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Visibility(
                      visible: item.count > 0 ? true : false,
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              int num = item.count - count;
                              item.count = num;
                              arrange(FoodList);
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
                      visible: item.count > 0 ? true : false,
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            item.count.toString(),
                            style: const TextStyle(fontSize: 20),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          int num = count + item.count;
                          item.count = num;
                          arrange(FoodList);
                          // _Visibility = true;
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


  void arrange(List<Food> List) {
    List.sort((Food item1, Food item2) => item2.count.compareTo(item1.count));
  }
}


