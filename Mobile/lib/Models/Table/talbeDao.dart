
import 'package:appoder/Models/Table/table.dart';

class TableData {
  tableDao? data;
  TableData({required this.data});

  TableData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new tableDao.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
class tableDao {
    int? total;
    List<table>? data;

  tableDao({required this.total,required this.data});

  tableDao.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['data'] != null) {
      data = <table>[];
      json['data'].forEach((v) {
        data!.add(new table.fromJson(v));
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