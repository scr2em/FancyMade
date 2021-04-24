import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/models/Product.dart';
import "package:finalproject/services/products_service.dart";
import 'package:finalproject/services/store_service.dart';
import 'package:finalproject/sharedWidgets/LanguageTextSwitcher.dart';
import 'package:finalproject/sharedWidgets/ProductThumbnail.dart';
import 'package:finalproject/ui/category/CategoryScreen.dart';
import 'package:finalproject/ui/store/Store.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import "../../sharedWidgets/CustomAppBar.dart";
import "../../sharedWidgets/CustomBottomBar.dart";

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: FutureBuilder(
          future: ProductsService().getHomePageProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.all(10),
                child: ListView(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context).categories,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          )),
                      InkWell(
                        child: Text(
                          AppLocalizations.of(context).viewall,
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 16),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/');
                        },
                      )
                    ],
                  ),
                  Container(
                      child: StaggeredGridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    staggeredTiles: _cardTile,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return CategoryScreen(
                                category: "accessories",
                              );
                            }),
                          );
                        },
                        child: Stack(
                            alignment: AlignmentDirectional.bottomStart,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/categories/accessories.jpg',
                                      ),
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              Text('Accessories',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 3.0,
                                        )
                                      ]))
                            ]),
                      ),
                      Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/categories/dolls.jpg',
                                    ),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            Text('Dolls',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 3.0,
                                      )
                                    ]))
                          ]),
                      Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/categories/Jewelry.jpg',
                                    ),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            Text('Jewelry',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 3.0,
                                      )
                                    ]))
                          ]),
                      Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/categories/Paintings.jpg',
                                    ),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            Text('Paintings',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 3.0,
                                      )
                                    ]))
                          ]),
                    ],
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context).latestStores,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          )),
                      InkWell(
                        child: Text(
                          AppLocalizations.of(context).viewall,
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 16),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/');
                        },
                      )
                    ],
                  ),
                  FutureBuilder(
                    future: StoreService().getLatestStores(5),
                    builder: (context, snapshot2) {
                      if (snapshot2.hasData) {
                        final List<QueryDocumentSnapshot> docs =
                            snapshot2.data.docs;
                        return Container(
                          height: 150,
                          child: ListView.builder(
                            itemCount: docs.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final store = docs[index];

                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => StoreScreen(
                                              store: store,
                                            )),
                                  );
                                },
                                child: SizedBox(
                                  height: 150,
                                  width: 100,
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(55.0),
                                          child: FadeInImage.assetNetwork(
                                            width: 80,
                                            height: 80,
                                            fit: BoxFit.cover,
                                            placeholder:
                                                'assets/Spinner-1s-200px.gif',
                                            image: store["image"],
                                          ),
                                        ),
                                        Container(
                                          // width: 10,

                                          child: LanguageTextSwitcher(
                                            ar: store["arName"],
                                            en: store["enName"],
                                            maxline: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else if (snapshot2.hasError) {
                        return Container(
                            child: Center(
                                child: Text(
                                    "${AppLocalizations.of(context).error} ${AppLocalizations.of(context).somthingWrong} ${AppLocalizations.of(context).pleasereload}...")));
                      } else {
                        return Container(
                            child: Center(child: CircularProgressIndicator()));
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context).topProducts,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          )),
                      InkWell(
                        child: Text(
                          AppLocalizations.of(context).viewall,
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 16),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/');
                        },
                      )
                    ],
                  ),
                  GridView.builder(
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 10,
                      // mainAxisSpacing: 1,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      // return Product(data:snapshot.data[index]);
                      Product product1 =
                          Product.fromJson(snapshot.data[index].data());
                      product1.id = snapshot.data[index].id;
                      return ProductThumbnail(
                        product: product1,
                      );
                    },
                  ),
                ]),
              );
            } else if (snapshot.hasError) {
              return Container(
                  child: Center(
                      child: Text(
                          "${AppLocalizations.of(context).error} ${AppLocalizations.of(context).somthingWrong} ${AppLocalizations.of(context).pleasereload}...")));
            } else {
              return Container(
                  child: Center(child: CircularProgressIndicator()));
            }
          },
        ),
        bottomNavigationBar: CustomBottomBar(
          selectedIndex: 0,
        ));
  }
}

List<StaggeredTile> _cardTile = <StaggeredTile>[
  const StaggeredTile.count(2, 1),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
];

class CategoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
