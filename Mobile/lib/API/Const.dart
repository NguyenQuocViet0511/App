
import 'dart:convert';
import 'dart:io';

import 'package:appoder/Models/Billinfo/Billinfo.dart';
import 'package:appoder/Models/Table/table.dart';
import 'package:appoder/Models/Users/users.dart';
import 'package:flutter/material.dart';

import '../Models/Billinfo/Billinfo.dart';
import '../Models/Food/food.dart';

String url = "http://10.0.2.2:8000/api/";
users us = new users();
table tb = new table();
late Socket sock;
List<food> oderFood = [];
billinfo bill = new billinfo();


Future<void> connectAndListen() async {
   sock = await Socket.connect('10.0.2.2', 9999);
   sock.add(utf8.encode('changdata'));


}
Image imageFromBase64String(String base64String) {
   return Image.memory(base64Decode(base64String.replaceAll(RegExp(r'\s'), '')));
}


