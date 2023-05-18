class food {
  String? id;
  String? name;
  int? price;
  int? discount;
  int? count;
  String? image;
  String? status;
  String? idCategory;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  String? category;
  String? username;
  String? categoryStatus;

  food(
      {this.id,
        this.name,
        this.price,
        this.discount,
        this.count,
        this.image,
        this.status,
        this.idCategory,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.category,
        this.username,
        this.categoryStatus});

  food.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discount = json['discount'];
    count = json['count'];
    image = json['image'];
    status = json['status'];
    idCategory = json['id_category'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'];
    username = json['username'];
    categoryStatus = json['category_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['count'] = this.count;
    data['image'] = this.image;
    data['status'] = this.status;
    data['id_category'] = this.idCategory;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['category'] = this.category;
    data['username'] = this.username;
    data['category_status'] = this.categoryStatus;
    return data;
  }
}