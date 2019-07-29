import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ProductModel {
  int id;
  double price;
  bool favourite;
  Color fav_color = Colors.white;

  ProductModel(int id) {
    this.id = id;
    this.price = 100.00;
  }
  int get productId => this.id;

  double get productPrice => this.price;

  bool get liked => this.favourite;
}
