
import 'package:appoder/Models/Users/users.dart';

class usersData {
  usersDao? data;

  usersData({this.data});

  usersData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new usersDao.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class usersDao {
  late int total;
  late List<users> data;

  usersDao({required this.total, required this.data});

  usersDao.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['data'] != null) {
      data = <users>[];
      json['data'].forEach((v) {
        data!.add(new users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

