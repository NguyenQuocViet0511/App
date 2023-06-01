import 'dart:convert';

import 'package:http/http.dart';

import '../../Models/Food/foodDao.dart';
import '../Const.dart';



Future<foodData> Getfood() async {
  Response response = await get(Uri.parse(url + "food/list"));
  // data sample trả về trong response
  int statusCode = response.statusCode;
  Map<String, String> headers = response.headers;
  String json = response.body;
  foodData data = foodData.fromJson(jsonDecode(json));
  return data;

}
