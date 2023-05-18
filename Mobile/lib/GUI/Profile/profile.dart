


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../API/Const.dart';

class profile extends StatelessWidget{
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            color: Colors.black
        ),        titleTextStyle: TextStyle(color: Colors.black,fontSize: 20),
        title: Text("Thông tin cá nhân"),

      ),
      body: Container(
        color : Colors.white.withOpacity(0.6),
        alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 150,
              child: CircleAvatar(
                backgroundImage: AssetImage('images/user.png'),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(us.name.toString(),style: TextStyle(
                fontSize: 25),),
            ),

            Container(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 20,horizontal: 20),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23)
                    ),
                    elevation: 5,
                    primary:  Color(0xFFFFF082),
                    disabledBackgroundColor:  Color(0xFFFFF082),
                    fixedSize: Size(MediaQuery.of(context).size.width, 50)),


                icon:  const Icon(Icons.perm_identity ,color: Colors.red),
                label:  Text("chức Vụ : " + us.idRole.toString(),
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)), onPressed: null,
              ),
            ),
            Container(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 0,horizontal: 20),
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Card(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Icon(Icons.date_range),
                        Padding(
                          padding: const EdgeInsetsDirectional.symmetric(vertical: 10,horizontal: 20),
                          child: Text("Ngày Sinh: " + us.date.toString(),style: TextStyle(fontSize: 20),),
                        )
                        ],
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.transgender),
                        Padding(
                          padding: const EdgeInsetsDirectional.symmetric(vertical: 5,horizontal: 20),
                          child: Text("Giới tính: " + us.sex.toString(),style: TextStyle(fontSize: 20),),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.phone),
                        Padding(
                          padding: const EdgeInsetsDirectional.symmetric(vertical: 5,horizontal: 20),
                          child: Text("Số điện thoại: " + us.number.toString(),style: TextStyle(fontSize: 20),),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_city),
                        Padding(
                          padding: const EdgeInsetsDirectional.symmetric(vertical: 5,horizontal: 20),
                          child: Text("Địa chỉ: " + us.address.toString(),style: TextStyle(fontSize: 20),),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check),
                        Padding(
                          padding: const EdgeInsetsDirectional.symmetric(vertical: 5,horizontal: 20),
                          child: Text("Trạng thái tài khoản: " + us.status.toString(),style: TextStyle(fontSize: 20),),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
          ),
      ),

    );
  }

  Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }
}