

import 'dart:convert';

import 'package:appoder/API/Const.dart';
import 'package:appoder/GUI/Main/Manager.dart';
import 'package:appoder/Models/Users/users.dart';
import 'package:appoder/Models/Users/usersDao.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../API/Users/APIuser.dart';
import '../Main/Home.dart';
import '../Main/ManApp.dart';

Future<void> Dologin(String username,String password,bool Check)
async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setBool('check', Check);
  await prefs.setString('username', username);
  await prefs.setString('password', password);

}


class Login extends StatefulWidget{
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final username = TextEditingController();
  final password = TextEditingController();
  bool _validateusername = false;
  bool _validatepassword = false;
  bool checkcickshow = true;
  bool isChecked = false;

  Future<void> DoComback()
  async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username  = prefs.getString('username');
    String?password  = prefs.getString('password');
    bool?Check  = prefs.getBool('check');

    setState(() {
      if(Check == true){
        this.username.text = username!;
        this.password.text = password!;
        this.isChecked = Check!;

      }
    });



  }

  @override
  void initState() {
    super.initState();
    DoComback();
  }
  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }
  @override
  void didUpdateWidget(covariant Login oldWidget) {
    username.text  = "";
    password.text  = "";
    super.didUpdateWidget(oldWidget);


  }
  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
    body: Container(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0,horizontal: 60),
        child: SingleChildScrollView(
          child:
            Column(
              children: [
                const Text("Xin Chào!",style: TextStyle(
                color: Colors.black,
                fontSize: 45, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
                  const Text("Đăng nhập để tiếp tục",style:TextStyle(
                    fontSize: 15
                  ),),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 30),
                    width: 400,
                  height: 100,
                  decoration:  const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/logo.png")
                )
                  )
                  ),
                TextField(
                  controller: username,
                  decoration: InputDecoration(
                    label: Text('Tên Tài Khoản'),
                    errorText: _validateusername ? 'tài khoản Không thể dể trống' : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,30,0,0),
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[
                      TextField(
                        controller: password,
                        obscureText: checkcickshow ? true : false,
                        decoration:  InputDecoration(
                          label: Text('Mật Khẩu'),
                          errorText: _validatepassword ? 'mật khẩu không thể dể trống' : null,
                        ),
                      ),

                      InkWell
                        (child: checkcickshow ? Icon(Icons.visibility_off) : Icon(Icons.visibility) ,
                        onTap: () {
                          setState(() {
                            if(checkcickshow)
                            {
                              checkcickshow = false;
                            }
                            else
                            {
                              checkcickshow = true;

                            }
                          });

                        },
                      )
                    ],

                  ),
                ),
                  CheckboxListTile(title: Text("Ghi Nhớ Tài Khoản",style: TextStyle(
                  fontSize: 14
                ),),value: isChecked, onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });

              },controlAffinity: ListTileControlAffinity.leading),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: ElevatedButton(
                    onPressed: ()   async {
                      setState(()  {
                        username.text.isEmpty ? _validateusername = true : _validateusername = false;
                        password.text.isEmpty ? _validatepassword = true : _validatepassword = false;
                          });
                      showDialog(context: context, builder: (context) {
                        return Center(child: CircularProgressIndicator());
                      });
                        if(username.text.isNotEmpty && password.text.isNotEmpty) {
                          usersData data = await Getlogin(username.text, password.text);
                          if (data.data!.total > 0) {
                            for (users item in data.data!.data) {
                              us = item;
                              Dologin(item.username.toString(),password.text,isChecked);
                            }
                            Fluttertoast.showToast(
                                msg: "Đăng Nhập Thành công",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                textColor: Colors.white,
                                fontSize: 12.0
                            );
                            if(us.idRole == 'supperadmin' || us.idRole == 'manager')
                              {
                                Navigator.pop(context);
                                Navigator.push(context, PageRouteBuilder(pageBuilder: (
                                    context, animation, secondaryAnimation) =>
                                    const Manager()));
                              }
                            else
                              {
                                Navigator.pop(context);
                                Navigator.push(context, PageRouteBuilder(pageBuilder: (
                                    context, animation, secondaryAnimation) =>
                                    const Home()));
                              }


                          }
                          else{
                            Fluttertoast.showToast(
                                msg: "Đăng Nhập Thất bại Sai Tên Tài Khoản hoặc mật khẩu",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                textColor: Colors.white,
                                fontSize: 12.0
                            );
                            Navigator.of(context).pop();

                          }
                          }else
                            {
                              Navigator.of(context).pop();

                            }

                      // }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      primary: Color(0xFFFFF082),
                      fixedSize: Size(MediaQuery.of(context).size.width,40))
                    ,
                    child: const Text('Đăng nhập',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],

            ),

        ),
      ),
    ),
    );
  }
}