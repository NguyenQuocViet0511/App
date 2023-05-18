
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:appoder/GUI/Login/Start.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

Socket? sock;

void main()  {
   // sock = await Socket.connect('10.0.2.2', 9999);
   //
   //
   //  Listen();
  runApp( const MaterialApp(
    debugShowCheckedModeBanner: false,
    home:   Start(),
  ));
}

 Listen(){
      sock!.listen((data) {

          print("client listen  : ${String.fromCharCodes(data).trim()}");

      });
    }
  




