
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:appoder/GUI/Login/Start.dart';
import 'package:flutter/material.dart';

import 'API/Const.dart';

void main()  {

  runApp( const MaterialApp(
    debugShowCheckedModeBanner: false,
    home:   Start(),
  ));
  connectAndListen();
}


  




