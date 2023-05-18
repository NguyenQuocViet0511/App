
class table {
  String? id;
  String? name;
  String? status;
  String? idBill;
  String? createdBy;
  String? createdAt;
  String? updatedAt;

  table(
      {this.id,
        this.name,
        this.status,
        this.idBill,
        this.createdBy,
        this.createdAt,
        this.updatedAt});

  table.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    idBill = json['id_bill'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['id_bill'] = this.idBill;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}