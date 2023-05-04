

import 'package:app_qlnh/GUI/Login.dart';
import 'package:flutter/material.dart';

class utilitie extends StatelessWidget{
  const utilitie({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(0),
      child: Container(
        
      )
      ) ,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow:[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 1),
                )
              ]
          ),
          padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
          child: Column(
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                   crossAxisCount: 2,
                    children:  [
                        for(int i =0 ;i < 6 ;i++)
                          const Box()
                    ],
                ),
              ),
              Container(
                child: ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                      },child: const Text('Đăng Xuất')),
              )
            ],
          ),
        ),
      ),

    );
  }

}
class Box extends StatelessWidget{
  const Box({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow:[
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 3,
                blurRadius: 3,
                offset: const Offset(0, 1),
              )
            ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Icon(Icons.account_circle,size: 60,color: Colors.blue,),
            Text('Thông Tin',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey)),

          ],
        ),
      ),

    );
  }

}
