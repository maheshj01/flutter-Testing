import 'package:flutter/material.dart';
import 'package:testproject/bloc/listBloc.dart';
import 'package:testproject/model/product_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build rerun");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: <Widget>[
                Text(
                  "Product List",
                  key: Key("ProductPage"),
                  style: TextStyle(fontSize: 18),
                ),
                Text("Favourite List",key: Key("FavouratePage") ,style: TextStyle(fontSize: 18))
              ],
            ),
            title: Text("Products Home"),
          ),
          body: TabBarView(
            children: <Widget>[ProductList(), Fav_list_widget()],
          ),
        ),
      ),
    );
  }
}

final bloc = new ProductListBloc();
// final fav_bloc = new Favourite_bloc();

Widget Fav_list_widget() {
  return StreamBuilder<List<ProductModel>>(
    key: Key("Favourates"),
    stream: bloc.favouriteListStream,
    builder:
        (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
      if (snapshot.data == null) {
        return Center(child: Text("Empty :("));
      } else {
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int item) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    key: Key("thumb_up" + snapshot.data[item].id.toString()),
                    icon: Icon(
                      Icons.thumb_up,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      //   bloc.incrementProductPrice.add(snapshot.data[item]);
                    },
                  ),
                  Container(
                      child: Column(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "Product ${snapshot.data[item].id}",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          )),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "👏 ${snapshot.data[item].price}",
                          key: Key("claps" + snapshot.data[item].id.toString()),
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  )),
                  IconButton(
                    icon: Icon(
                      Icons.thumb_down,
                      key:
                          Key("thumb_down" + snapshot.data[item].id.toString()),
                      color: Colors.red,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 30,
                      )),
                ],
              ),
              height: MediaQuery.of(context).size.width / 4,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            );
          },
        );
      }
    },
  );
}

Widget ProductList() {
  return Scaffold(
      key: Key("HomePage"),
      body: Column(
        children: <Widget>[
          Expanded(
              child: StreamBuilder<List<ProductModel>>(
            stream: bloc.productListStream,
            builder: (BuildContext context,
                AsyncSnapshot<List<ProductModel>> snapshot) {
              if (snapshot.data == null) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int item) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButton(
                            key: Key(
                                "thumb_up" + snapshot.data[item].id.toString()),
                            icon: Icon(
                              Icons.thumb_up,
                              color: Colors.green,
                            ),
                            onPressed: () {
                              bloc.incrementProductPrice
                                  .add(snapshot.data[item]);
                            },
                          ),
                          Container(
                              child: Column(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "Product ${snapshot.data[item].id}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "👏 ${snapshot.data[item].price}",
                                  key: Key("claps" +
                                      snapshot.data[item].id.toString()),
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ],
                          )),
                          IconButton(
                            icon: Icon(
                              Icons.thumb_down,
                              key: Key("thumb_down" +
                                  snapshot.data[item].id.toString()),
                              color: Colors.red,
                            ),
                            onPressed: () {
                              bloc.decrementProductPrice
                                  .add(snapshot.data[item]);
                            },
                          ),
                          IconButton(
                            key: Key("like"+snapshot.data[item].id.toString()),
                            onPressed: () {
                              print("liked");
                              bloc.liked_product_model.add(snapshot.data[item]);
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: snapshot.data[item].favColor,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      height: MediaQuery.of(context).size.width / 4,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    );
                  },
                );
              }
            },
          ))
        ],
      ));
}
