import 'package:appoder/API/Const.dart';
import 'package:appoder/GUI/Login/Login.dart';
import 'package:appoder/GUI/Profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../Bill/station.dart';
import 'ManApp.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
late IO.Socket socket;


class Manager extends StatefulWidget {
  const Manager({super.key});

  @override
  State<Manager> createState() => _Manager();
}

class _Manager extends State<Manager> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connectAndListen();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 0,horizontal: 20),
            alignment: Alignment.center,
            color: Colors.white,
            child:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(child: const Image(image: AssetImage("images/logo.png"))),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Chào mừng bạn trở lại!",
                    style: TextStyle(fontSize: 30, color: Colors.black)),
              ),
              Text(
                us.name.toString(),
                style: const TextStyle(color: Colors.black38, fontSize: 20),
              ),

              Padding(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 20,horizontal: 0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23)
                      ),
                      elevation: 5,
                      primary: Color(0xFFFFF082),
                      fixedSize: Size(MediaQuery.of(context).size.width, 50)),
                  onPressed: () {
                    Navigator.push(context, PageRouteBuilder(pageBuilder: (
                        context, animation, secondaryAnimation) =>
                        profile()));
                  },
                  icon:  const Icon(Icons.person_rounded ,color: Colors.black),
                  label: const Text('Thông Tin Cá Nhân',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 10,horizontal: 0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23)
                      ),
                      elevation: 5,
                      primary: Color(0xFFFFF082),
                      fixedSize: Size(MediaQuery.of(context).size.width, 50)),
                  onPressed: () {
                    Navigator.push(context, PageRouteBuilder(pageBuilder: (
                        context, animation, secondaryAnimation) =>
                        Station()));
                  },
                  icon:  const Icon(Icons.baby_changing_station ,color: Colors.black),
                  label: const Text('Xem Thống Kê',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 10,horizontal: 0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23)
                      ),
                      elevation: 5,
                      primary:  Color(0xFFFFF082).withOpacity(0.7),
                      fixedSize: Size(MediaQuery.of(context).size.width, 50)),
                  onPressed: () {
                    Navigator.pop(context);
                    Fluttertoast.showToast(
                        msg: "Đăng Xuất Thành công",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        fontSize: 12.0
                    );

                  },
                  icon:  const Icon(Icons.logout ,color: Colors.red),
                  label: const Text('Đăng Xuất',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ])));
  }
}
