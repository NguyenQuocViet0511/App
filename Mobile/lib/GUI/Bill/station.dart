
import 'package:appoder/GUI/Bill/BillByDate.dart';
import 'package:appoder/GUI/Bill/SeeBillinfo.dart';
import 'package:appoder/Models/Bill/bill.dart';
import 'package:flutter/material.dart';

import '../../API/Users/APIbill.dart';
import '../../Models/Bill/billDao.dart';

Future<billData>? billDatas;
List<bill>? bills;
class Station extends StatelessWidget{
  const Station({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Thống Kê'),
      ),
      body: Container(
          margin: EdgeInsetsDirectional.symmetric(vertical: 10,horizontal: 0),
        child:Column(
          children: [
            Expanded(child: RowBill())
          ],
        ),

      ),
    );
  }

}
class RowBill extends StatefulWidget {
  const RowBill({super.key});

  @override
  State<RowBill> createState() => _RowBill();
}


class _RowBill extends State<RowBill> {
  int count = 1;

  @override
  void initState() {
    billDatas = GetbillSum();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<billData>(
            future: billDatas,
            builder: (context, billData) {
              if (billData.hasData) {
                return ListView(
                  children: [
                    for (bill item in billData!.data!.data!.data!)
                      InkWell(
                        onTap: () {
                          Navigator.push(context, PageRouteBuilder(pageBuilder: (
                              context, animation, secondaryAnimation) =>
                              BillByDate(date: item.timein.toString())));
                        },
                        child: Container(
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
                                        Text(item.timein.toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.lerp(
                                                    FontWeight.w200,
                                                    FontWeight.w400,
                                                    2))),
                                        Text("Tổng Tiền : " + item.sum.toString(),
                                            style: const TextStyle(fontSize: 15))
                                      ],
                                    ),
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
              return Center(child: CircularProgressIndicator());
            }));
  }
}
