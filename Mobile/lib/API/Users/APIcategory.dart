import 'dart:convert';

import 'package:appoder/Models/Category/categoryDao.dart';
import 'package:http/http.dart';

import '../Const.dart';



Future<CategoryData> Getcategory() async {
  Response response = await get(url + "category/list");
  // data sample trả về trong response
  int statusCode = response.statusCode;
  Map<String, String> headers = response.headers;
  String json = response.body;
  CategoryData data = CategoryData.fromJson(jsonDecode(json));
  return data;

}
