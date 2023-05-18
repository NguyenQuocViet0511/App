
import 'package:appoder/API/Const.dart';
import 'package:http/http.dart';
import 'package:appoder/Models/Users/users.dart';
import 'package:appoder/Models/Users/usersDao.dart';
import 'dart:convert';
// _makeGetRequest() async {
//     // tạo GET request
//     String url = 'https://jsonplaceholder.typicode.com/posts';
//     Response response = await get(url);
//     // data sample trả về trong response
//     int statusCode = response.statusCode;
//     Map<String, String> headers = response.headers;
//     String json = response.body;
//     print(json);
//     // Thực hiện convert json to object...
//   }


void Getusers() async {
  // Navigator.push(context, MaterialPageRoute(builder: (context) => ManApp()));
  Response response = await get(url + "tables/list");
  // data sample trả về trong response
  int statusCode = response.statusCode;
  Map<String, String> headers = response.headers;
  String json = response.body;
  print(json);
}

Future<usersData> Getlogin (String username,String password)  async {
  // cài đặt tham số POST request
  Map<String, String> headers = {"Content-type": "application/json"};
  // tạo POST request
  Response response = await post(url + "users/login", headers: headers, body: jsonEncode(<String, String>{
    'username': username,
    'password': password
  }));
  // kiểm tra status code của kết quả response
  int statusCode = response.statusCode;
  // API này trả về id của item mới được add trong body
  String body = response.body;
  usersData data = usersData.fromJson(jsonDecode(body));

  return data;
}

