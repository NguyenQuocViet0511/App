import 'package:flutter/cupertino.dart';

class Food {
  String _FoodID;

  String get FoodID => _FoodID;

  set FoodID(String value) {
    _FoodID = value;
  }

  String _FoodName;

  String get FoodName => _FoodName;

  set FoodName(String value) {
    _FoodName = value;
  }

  double _prince;

  double get prince => _prince;

  set prince(double value) {
    _prince = value;
  }

  int _count;

  int get count => _count;

  set count(int value) {
    _count = value;
  }

  String _Images;

  String get Images => _Images;

  set Images(String value) {
    _Images = value;
  }

  Food(this._FoodID, this._FoodName, this._prince, this._count, this._Images);
}

List<Food> FoodList = [
  Food('T1', 'Gà Heo Quay 1', 200000, 0, "images/diet.png"),
  Food('T1', 'Gà Heo Quay 2', 200000, 0, "images/diet.png"),
  Food('T1', 'Gà Heo Quay 3', 200000, 0, 'images/diet.png'),
  Food('T1', 'Gà Heo Quay 4', 200000, 0, 'images/diet.png'),
  Food('T1', 'Gà Heo Quay 5', 200000, 0, 'images/diet.png'),
  Food('T1', 'Gà Heo Quay 5', 200000, 0, 'images/diet.png'),
  Food('T1', 'Gà Heo Quay 5', 200000, 0, 'images/diet.png'),
  Food('T1', 'Gà Heo Quay 5', 200000, 0, 'images/diet.png'),
  Food('T1', 'Gà Heo Quay 5', 200000, 0, 'images/diet.png'),
  Food('T1', 'Gà Heo Quay 5', 200000, 0, 'images/diet.png'),
  Food('T1', 'Gà Heo Quay 5', 200000, 0, 'images/diet.png'),
  Food('T1', 'Gà Heo Quay 5', 200000, 0, 'images/diet.png'),
  Food('T1', 'Gà Heo Quay 5', 200000, 0, 'images/diet.png'),
  Food('T1', 'Gà Heo Quay 5', 200000, 0, 'images/diet.png'),
  Food('T1', 'Gà Heo Quay 5', 200000, 0, 'images/diet.png'),
];
