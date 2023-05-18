import 'package:flutter/material.dart';

class users  extends ChangeNotifier{
  String? id;
  String? name;
  String? username;
  String? password;
  String? email;
  String? emailVerifiedAt;
  String? sex;
  String? date;
  String? number;
  String? image;
  String? address;
  String? status;
  String? idRole;
  String? createdAt;
  String? updatedAt;

  users(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.password,
        this.emailVerifiedAt,
        this.sex,
        this.date,
        this.number,
        this.image,
        this.address,
        this.status,
        this.idRole,
        this.createdAt,
        this.updatedAt});

  void signIn(String id,String name){
    this.id = id;
    this.name = name;
    notifyListeners();
  }

  users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    sex = json['sex'];
    date = json['date'];
    number = json['number'];
    image = json['image'];
    address = json['address'];
    status = json['status'];
    idRole = json['id_role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['password'] = this.password;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['sex'] = this.sex;
    data['date'] = this.date;
    data['image'] = this.image;
    data['number'] = this.number;
    data['address'] = this.address;
    data['status'] = this.status;
    data['id_role'] = this.idRole;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

}
