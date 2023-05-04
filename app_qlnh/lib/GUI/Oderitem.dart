import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class oderitem extends StatelessWidget {
  const oderitem({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            // width: ,width
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                            bottomLeft: Radius.zero,
                            bottomRight: Radius.zero)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('oder : 1.1',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 0, right: 0, bottom: 0, top: 5),
                              child: Text('Đang Phục Vụ',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text('8', style: TextStyle(color: Colors.white)),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 0, right: 0, bottom: 0, top: 5),
                              child: Text('251.000',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),bottomLeft: Radius.circular(5),topRight: Radius.zero,topLeft: Radius.zero)
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: Colors.black.withOpacity(0.5),width: 0.1
                                )
                              )
                            )
                            ,child: IconButton(onPressed: (){

                            }, icon: Icon(Icons.cookie_rounded)),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  width: 0.1,color: Colors.black.withOpacity(0.5)
                                )
                              )
                            ),
                            child: IconButton(onPressed: (){
                            }, icon: Icon(Icons.edit_note)),
                          ),
                        ),
                        Expanded(
                          child: IconButton(onPressed: (){

                          }, icon: Icon(Icons.more_vert)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
