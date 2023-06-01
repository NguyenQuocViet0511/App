
import 'dart:convert';

import 'package:appoder/Models/Table/table.dart';
import 'package:appoder/Models/Table/talbeDao.dart';

import 'package:http/http.dart';

import '../Const.dart';

 Future<TableData> GetTable() async {
  Response response = await get(Uri.parse(url + "tables/list"));
  // data sample trả về trong response
  int statusCode = response.statusCode;
  Map<String, String> headers = response.headers;
  String json = response.body;
  TableData data = TableData.fromJson(jsonDecode(json));
  return data;

}

