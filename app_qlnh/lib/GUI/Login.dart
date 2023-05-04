import 'package:app_qlnh/GUI/Myapp.dart';
import 'package:app_qlnh/Models/users.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  bool Check = true;

   Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String Usersname = '' ;
  String Passwords = '';
  final List<Users> UsersList = [
    Users('admin', 'admin', 'đang hoạt động', '1'),
    Users('admin1', 'admin1', 'đang hoạt động', '1')
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              decoration:  BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/background.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
             Container(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              alignment: Alignment.center,
              child: Container(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: 500,
                    height: 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: const [
                            Text(
                              'Oder Food',
                              style:
                              TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'Chào Mừng Trở Lại',
                                style: TextStyle(fontSize: 30,color: Colors.white),
                              ),
                            ),
                            Text('Đăng nhập để tiếp tục!')
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: SizedBox(
                            width: 300,
                            child: TextField(

                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.blue)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.blue)),
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Colors.black,
                                ),
                                label: Text('Tên Tài Khoản'),
                              ),
                              onChanged: (text) {
                                setState(() {
                                  Usersname  = text;
                                });
                              },
                            ),
                          ),
                        ),
                        Padding (
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: SizedBox(
                            width: 300,
                            child: TextField(
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                              obscureText: Check ? true : false,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.key,
                                    color: Colors.black,
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blue, width: 1)),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blue, width: 1)),
                                  suffixIcon: IconButton(
                                      icon: Check
                                          ? const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      )
                                          : const Icon(Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          if (Check) {
                                            Check = false;
                                          } else {
                                            Check = true;
                                          }
                                        });
                                      }),
                                  label: const Text('Mật khẩu')),
                              onChanged: (text){
                                setState(() {
                                  Passwords = text;
                                });
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: ElevatedButton(
                            onPressed: () async {
                              bool Check = CheckLogin(Usersname, Passwords,UsersList);
                              if(Check)
                              {
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
                              }else
                              {
                                print('Lỗi');
                              }

                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 5,
                                primary: Color(0xFFFFF082).withOpacity(0.6),
                                fixedSize: const Size(300, 50)),
                            child: const Text('Đăng Nhập',
                                style: TextStyle(
                                  color: Colors.black,
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }

  bool CheckLogin(String UserName, String Password, List<Users> list) {
    for (Users item in list) {
      if (UserName.compareTo(item.Username) == 0 &&
          Password.compareTo(item.Password) == 0) {
          return true;
      }
    }
    return false;
  }

  void ShowAlert(BuildContext context) {
  }
}


