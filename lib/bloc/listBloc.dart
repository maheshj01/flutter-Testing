import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testproject/model/product_model.dart';

class ProductListBloc {
  List<ProductModel> list;
  List<ProductModel> favouriteList = [];

  //StreamCOntroller to control the list stream and Behavior Subject to listen to the stream that has already been listened
  final _listcontroller = BehaviorSubject<List<ProductModel>>();

// to control the increment stream
  final _increment = BehaviorSubject<ProductModel>();

//to control the decrement stream
  final _decrement = BehaviorSubject<ProductModel>();

  final _favourite_list = BehaviorSubject<List<ProductModel>>();

  final _product_liked = BehaviorSubject<ProductModel>();

  final favCount = BehaviorSubject<int>();

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

  StreamSink<ProductModel> get likedProductModel => _product_liked.sink;

  Stream<ProductModel> get get_like_product => _product_liked.stream;

  ProductListBloc() {
    list = new List<ProductModel>.generate(100000, (id) => ProductModel(id));
    // initializes the list with ProductModels
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
    if (!product.isFavourite) {
      list[product.id].isFavourite = true;
      favouriteList.add(product);
      print("fav list = " + favouriteList.length.toString());
    } else {
      favouriteList.remove(product);
      list[product.id].isFavourite = false;
    }
    // update favourate List and  Product List
    favCount.sink.add(favouriteList.length);
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
    favCount.close();
  }
}
