import 'food.dart';

class foodData {
  foodDao? data;

  foodData({ this.data});

  foodData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new foodDao.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
class foodDao {
  int? total;
  List<food>? data;

  foodDao({this.total, this.data});

  foodDao.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['data'] != null) {
      data = <food>[];
      json['data'].forEach((v) {
        data!.add(new food.fromJson(v));
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