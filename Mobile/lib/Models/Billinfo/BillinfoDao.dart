import 'package:appoder/Models/Billinfo/Billinfo.dart';


class BillinfoData {
  BiliinfoDao? data;

  BillinfoData({this.data});

  BillinfoData.fromJson(Map<String, dynamic> json) {

    data = json['data'] != null ? new BiliinfoDao.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class BiliinfoDao {
  int? total;
  List<billinfo>? data;

  BiliinfoDao({this.total, this.data});

  BiliinfoDao.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['data'] != null) {
      data = <billinfo>[];
      json['data'].forEach((v) {
        data!.add(new billinfo.fromJson(v));
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