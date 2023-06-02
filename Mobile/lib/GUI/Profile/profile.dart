import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../API/Const.dart';
import '../../API/Users/APIuser.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final password = TextEditingController();
  bool _validatepassword = false;
  bool checkcickshow = false;

  void SetCheck(setState) {
    setState(() {
      if (checkcickshow) {
        checkcickshow = false;
      } else {
        checkcickshow = true;
      }
    });
  }

  Future<void> Change(String password)
  async {
    await Changepassword(us.id.toString(),password);
    Fluttertoast.showToast(
        msg: "đổi mật khẩu Thành Công",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 12.0);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        title: Text("Thông tin cá nhân"),
      ),
      body: Container(
        margin: EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 0),
        color: Colors.white.withOpacity(0.6),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
              Container(
                width: 200,
                height: 150,
                child: imageFromBase64String(us.image.toString()),


              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  us.name.toString(),
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Container(
                padding: const EdgeInsetsDirectional.symmetric(
                    vertical: 20, horizontal: 20),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23)),
                      elevation: 5,
                      primary: Color(0xFFFFF082),
                      disabledBackgroundColor:
                          Color(0xFFFFF082).withOpacity(0.5),
                      fixedSize: Size(MediaQuery.of(context).size.width, 50)),
                  icon: const Icon(Icons.perm_identity, color: Colors.red),
                  label: Text("chức Vụ : " + us.idRole.toString(),
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  onPressed: null,
                ),
              ),
              Container(
                padding: const EdgeInsetsDirectional.symmetric(
                    vertical: 0, horizontal: 20),
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Card(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.date_range),
                            Padding(
                              padding: const EdgeInsetsDirectional.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Text(
                                "Ngày Sinh: " + us.date.toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.transgender),
                            Padding(
                              padding: const EdgeInsetsDirectional.symmetric(
                                  vertical: 5, horizontal: 20),
                              child: Text(
                                "Giới tính: " + us.sex.toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.phone),
                            Padding(
                              padding: const EdgeInsetsDirectional.symmetric(
                                  vertical: 5, horizontal: 20),
                              child: Text(
                                "Số điện thoại: " + us.number.toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.location_city),
                            Padding(
                              padding: const EdgeInsetsDirectional.symmetric(
                                  vertical: 5, horizontal: 20),
                              child: Text(
                                "Địa chỉ: " + us.address.toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.check),
                            Padding(
                              padding: const EdgeInsetsDirectional.symmetric(
                                  vertical: 5, horizontal: 20),
                              child: Text(
                                "Trạng thái tài khoản: " + us.status.toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsetsDirectional.symmetric(
                    vertical: 30, horizontal: 20),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23)),
                      elevation: 5,
                      primary: Color(0xFFFFF082),
                      disabledBackgroundColor: Color(0xFFFFF082),
                      fixedSize: Size(MediaQuery.of(context).size.width,40)),
                  icon: const Icon(Icons.key, color: Colors.red),
                  label: Text("Đổi mật khẩu",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: StatefulBuilder(builder:
                                (BuildContext context, StateSetter setState) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height / 3.6,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5))),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("Nhập vào mật khẩu Mới",
                                          style: TextStyle(fontSize: 18)),
                                      Container(
                                        margin: EdgeInsetsDirectional.symmetric(
                                            horizontal: 20, vertical: 20),
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional.centerEnd,
                                          children: <Widget>[
                                            TextField(
                                              controller: password,
                                              obscureText:
                                                  checkcickshow ? false : true,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    width:  1
                                                  )
                                                ),
                                                label: Text('Mật Khẩu'),
                                                errorText: _validatepassword
                                                    ? 'mật khẩu không thể dể trống'
                                                    : null,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                                              child: InkWell(
                                                child: checkcickshow
                                                    ? Icon(Icons.visibility)
                                                    : Icon(Icons.visibility_off),
                                                onTap: () {
                                                  SetCheck(setState);
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsetsDirectional.symmetric(
                                            horizontal: 20, vertical: 0),
                                        child: ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              elevation: 5,
                                              primary: Color(0xFFFFF082),
                                              disabledBackgroundColor:
                                                  Color(0xFFFFF082)
                                                      .withOpacity(0.5),
                                              fixedSize: Size(
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  40)),
                                          icon: const Icon(Icons.check,
                                              color: Colors.red),
                                          label: Text("Đồng Ý",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          onPressed: () {
                                            Change(password.text.toString());
                                            password.clear();
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
