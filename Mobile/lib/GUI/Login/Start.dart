
import 'package:flutter/material.dart';

import 'Login.dart';

class Start extends StatelessWidget{

  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration:  const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(20, 100, 0, 0),
              child: const Text(
                "Chào Mừng Đên Với Ứng Dụng Oder!",
                style: TextStyle(
                color: Colors.white,
                fontSize:36, fontWeight: FontWeight.bold))
              ),

          Container(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                      primary: Color(0xFFFFF082).withOpacity(0.6),
                      fixedSize: const Size(350, 50),),
                  child: const Text('Tiếp tục để đăng nhập',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
        ],
      ),
      );
  }


}