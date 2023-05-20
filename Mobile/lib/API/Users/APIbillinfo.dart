
import 'dart:convert';

import 'package:http/http.dart';

import '../../Models/Billinfo/BillinfoDao.dart';
import '../Const.dart';

Future<String> Insertbillinfo (String id_bill,String id_food,String note,String id_user,String count,String id_table)  async {
  // cài đặt tham số POST request
  Map<String, String> headers = {"Content-type": "application/json"};
  // tạo POST request
  Response response = await post(url + "BillInfo/CreateOrUpdate", headers: headers, body: jsonEncode(<String, String>{
    'id_bill': id_bill,
    'id': id_food,
    'note': note,
    'id_user' :  id_user,
    'count': count,
    'idTable' : id_table,

  }));
  // kiểm tra status code của kết quả response
  int statusCode = response.statusCode;
  // API này trả về id của item mới được add trong body
  String body = response.body;

  return body;
}
 Future<BillinfoData> Getbillinfo(String id_bill,String id_table)  async {
  // cài đặt tham số POST request
  Map<String, String> headers = {"Content-type": "application/json"};
  // tạo POST request
  Response response = await post(url + "BillInfo/show", headers: headers, body: jsonEncode(<String, String>{
    'id_bill': id_bill,
    'id_table': id_table,
  }));
  // kiểm tra status code của kết quả response
  int statusCode = response.statusCode;
  // API này trả về id của item mới được add trong body
  String body = response.body;
  BillinfoData data = BillinfoData.fromJson(jsonDecode(body));
  return data;

}
Future<BillinfoData> GetbillByID(String id_bill,String id_table)  async {
  // cài đặt tham số POST request
  Map<String, String> headers = {"Content-type": "application/json"};
  // tạo POST request
  Response response = await post(url + "BillInfo/GetBillByID", headers: headers, body: jsonEncode(<String, String>{
    'id_bill': id_bill,
    'id_table': id_table,
  }));
  // kiểm tra status code của kết quả response
  int statusCode = response.statusCode;
  // API này trả về id của item mới được add trong body
  String body = response.body;
  BillinfoData data = BillinfoData.fromJson(jsonDecode(body));
  return data;

}

Future<String> updatebillinfo(String id_bill,String id_food)  async {
  // cài đặt tham số POST request
  Map<String, String> headers = {"Content-type": "application/json"};
  // tạo POST request
  Response response = await post(url + "BillInfo/update", headers: headers, body: jsonEncode(<String, String>{
    'id_bill': id_bill,
    'id': id_food,
  }));
  // kiểm tra status code của kết quả response
  int statusCode = response.statusCode;
  // API này trả về id của item mới được add trong body
  String body = response.body;
  return body;

}