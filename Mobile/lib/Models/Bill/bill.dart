class bill {
  String? id;
  String? timein;
  String? timeout;
  int? discount;
  int? sum;
  String? status;
  String? idUser;
  String? createdAt;
  String? updatedAt;

  bill(
      {this.id,
        this.timein,
        this.timeout,
        this.discount,
        this.sum,
        this.status,
        this.idUser,
        this.createdAt,
        this.updatedAt});

  bill.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    timein = json['timein'];
    timeout = json['timeout'];
    discount = json['discount'];
    sum = json['sum'];
    status = json['status'];
    idUser = json['id_user'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['timein'] = this.timein;
    data['timeout'] = this.timeout;
    data['discount'] = this.discount;
    data['sum'] = this.sum;
    data['status'] = this.status;
    data['id_user'] = this.idUser;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}