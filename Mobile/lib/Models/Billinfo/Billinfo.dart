class billinfo{
  String? id;
  String? idBill;
  int? count;
  int? sum;
  String? note;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? billstatus;
  String? foodname;
  int? foodprice;
  String? tableid;
  String? timein;

  billinfo(
      {this.id,
        this.idBill,
        this.count,
        this.sum,
        this.note,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.billstatus,
        this.foodname,
        this.foodprice,
        this.tableid,
        this.timein});

  billinfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idBill = json['id_bill'];
    count = json['count'];
    sum = json['sum'];
    note = json['note'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    billstatus = json['billstatus'];
    foodname = json['foodname'];
    foodprice = json['foodprice'];
    tableid = json['Tableid'];
    timein = json['timein'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_bill'] = this.idBill;
    data['count'] = this.count;
    data['sum'] = this.sum;
    data['note'] = this.note;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['billstatus'] = this.billstatus;
    data['foodname'] = this.foodname;
    data['foodprice'] = this.foodprice;
    data['Tableid'] = this.tableid;
    data['timein'] = this.timein;
    return data;
  }
}