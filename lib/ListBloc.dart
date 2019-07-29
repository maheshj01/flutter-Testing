import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testproject/ProductModel.dart';

class ProductListBloc {
  List<ProductModel> list =
      new List<ProductModel>.generate(20, (id) => ProductModel(id));

  List<ProductModel> favouriteList = [];

  //StreamCOntroller to control the list stream and Behavior Subject to listen to the stream that has already been listened
  final _listcontroller = BehaviorSubject<List<ProductModel>>();

// to control the increment stream
  final _increment = BehaviorSubject<ProductModel>();

//to control the decrement stream
  final _decrement = BehaviorSubject<ProductModel>();

  final _favourite_list = BehaviorSubject<List<ProductModel>>();

  final _product_liked = BehaviorSubject<ProductModel>();

// get the latest productlist added to the stream
  Stream<List<ProductModel>> get productListStream => _listcontroller.stream;

//adds the list to stream that is recently modifed
  StreamSink<List<ProductModel>> get productListSink => _listcontroller.sink;

  //adds each modified item to _increment stream using the sink method
  StreamSink<ProductModel> get incrementProductPrice => _increment.sink;

  //adds each modified item to the _decrement stream using the sink method
  StreamSink<ProductModel> get decrementProductPrice => _decrement.sink;

  StreamSink<List<ProductModel>> get favouriteListSink => _favourite_list.sink;

  Stream<List<ProductModel>> get favouriteListStream => _favourite_list.stream;

  StreamSink<ProductModel> get liked_product_model => _product_liked.sink;

  Stream<ProductModel> get get_like_product => _product_liked.stream;

  ProductListBloc() {
    // initializes the list with ProductModels
    print("list not generated");
    // adds the list to the streams
    _listcontroller.sink.add(list);
    // watch out if any data is pushed in the increment stream ? if so call _incrementprice method
    _increment.stream.listen(_incrementPrice);
    // watch out if any data has been pushd in the decrement stream ? if so call _decrementprice method
    _decrement.stream.listen(_decrementPrice);

    _product_liked.stream.listen(_updateFavourite);
  }

  // Business Logic Implemented in the below two functions

  void _incrementPrice(ProductModel product) {
    list[product.id].price = product.price + 1;
    productListSink.add(list);
  }

  void _decrementPrice(ProductModel product) {
    list[product.id].price = product.price - 1;
    productListSink.add(list);
  }

  void _updateFavourite(ProductModel product) {
    if (product.fav_color == Colors.white) {
      list[product.id].fav_color = Colors.red;
      favouriteList.add(product);
      print("fav list = " + favouriteList.length.toString());
    } else {
      favouriteList.remove(product);
      list[product.id].fav_color = Colors.white;
    }
    // upudate current page list item with appropriate color
    productListSink.add(list);
    favouriteListSink.add(favouriteList);
  }

  void _updateList(List<ProductModel> list) {
    favouriteList = list;
  }
// it is important to close all the streams that have been opened so as to avoid memory leaks or breaks

  void dispose() {
    _listcontroller.close();
    _decrement.close();
    _increment.close();
    _favourite_list.close();
    _product_liked.close();
  }
}
