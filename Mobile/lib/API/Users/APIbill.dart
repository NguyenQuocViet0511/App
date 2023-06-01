
import 'dart:convert';

import 'package:appoder/Models/Bill/billDao.dart';


import 'package:http/http.dart';

import '../Const.dart';

Future<billData> GetbillSum() async {
  Response response = await get(Uri.parse(url + "bill/list"));
  // data sample trả về trong response
  int statusCode = response.statusCode;
  Map<String, String> headers = response.headers;
  String json = response.body;
  billData data = billData.fromJson(jsonDecode(json));
  return data;

}

Future<billData> GetbillByDate(String date)  async {
  // cài đặt tham số POST request
  Map<String, String> headers = {"Content-type": "application/json"};
  // tạo POST request
  Response response = await post(Uri.parse(url + "bill/GetBillByDate"), headers: headers, body: jsonEncode(<String, String>{
    'date': date,
  }));
  // kiểm tra status code của kết quả response
  int statusCode = response.statusCode;
  // API này trả về id của item mới được add trong body
  String body = response.body;
  billData data = billData.fromJson(jsonDecode(body));
  return data;

}
Future<billData> GetbillByDateFood(String id_bill)  async {
  // cài đặt tham số POST request
  Map<String, String> headers = {"Content-type": "application/json"};
  // tạo POST request
  Response response = await post(Uri.parse(url + "bill/GetBillByDate"), headers: headers, body: jsonEncode(<String, String>{
    'id_bill': id_bill,
  }));
  // kiểm tra status code của kết quả response
  int statusCode = response.statusCode;
  // API này trả về id của item mới được add trong body
  String body = response.body;
  billData data = billData.fromJson(jsonDecode(body));
  return data;

}