import 'package:appoder/Models/Bill/bill.dart';

class billData {

  billDao? data;
  billData({this.data});

  billData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new billDao.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class billDao {
  int? total;
  List<bill>? data;

  billDao({this.total, this.data});

  billDao.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['data'] != null) {
      data = <bill>[];
      json['data'].forEach((v) {
        data!.add(new bill.fromJson(v));
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