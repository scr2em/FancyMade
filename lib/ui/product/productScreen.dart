import 'dart:ui';
import 'package:finalproject/models/CartProduct.dart';
import 'package:finalproject/models/Product.dart';
import 'package:finalproject/sharedWidgets/CustomTextFormField.dart';
import 'package:finalproject/sharedWidgets/LanguageTextSwitcher.dart';
import 'package:finalproject/ui/main/CartProvider.dart';
import 'package:finalproject/ui/main/main_locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../../sharedWidgets/CustomBottomBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import "package:finalproject/services/store_service.dart";
import '../../sharedWidgets/CustomButton.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  ProductScreen({this.product});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int multiplier = 1;

  increaseMultiplier() {
    setState(() {
      multiplier = multiplier + 1;
    });
  }

  decreaseMultiplier() {
    if (multiplier > 1) {
      setState(() {
        multiplier = multiplier - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: LanguageTextSwitcher(
              ar: widget.product.arName,
              en: widget.product.enName,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black)),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color(0xff273147)),
        ),
        body: Column(children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(children: [
                Stack(children: [
                  Container(
                    decoration: new BoxDecoration(color: Colors.white),
                    alignment: Alignment.topCenter,
                    child: ClipRRect(
                        child: Image.network(
                      widget.product.image,
                      fit: BoxFit.fitHeight,
                      height: 300,
                    )),
                  ),
                  Container(
                    child: widget.product.discount != null
                        ? widget.product.discount != 0
                            ? Positioned(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 8, bottom: 8, right: 40, left: 40),
                                  decoration: BoxDecoration(
                                    color: Colors.red[400],
                                  ),
                                  child: Text(
                                    '${widget.product.discount}%',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                ),
                                bottom: 50,
                                right: 0,
                              )
                            : null
                        : null,
                  )
                ]),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "${AppLocalizations.of(context).category} / ${widget.product.category ?? AppLocalizations.of(context).uncategorized} ",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11),
                              ),
                            ),
                            Row(
                              children: [
                                FloatingActionButton(
                                    mini: true,
                                    child: Icon(
                                      Icons.favorite_border_rounded,
                                      color: Colors.red[400],
                                    ),
                                    backgroundColor: Colors.white,
                                    onPressed: () {}),
                                FloatingActionButton(
                                    mini: true,
                                    child: Icon(
                                      Icons.share,
                                      color: Colors.black,
                                    ),
                                    backgroundColor: Colors.white,
                                    onPressed: () {}),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: LanguageTextSwitcher(
                                ar: widget.product.arName,
                                en: widget.product.enName,
                                maxline: 4,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, right: 10, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                                children: widget.product.discount != 0
                                    ? [
                                        Text(
                                          Provider.of<MainLocaleProvider>(
                                                          context)
                                                      .applicationLocale
                                                      .languageCode ==
                                                  "ar"
                                              ? '${widget.product.price} جنيه'
                                              : '${widget.product.price} EGP',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 20,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: Text(
                                            '${((1 - (widget.product.discount / 100)) * widget.product.price).toStringAsFixed(2)}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30,
                                                color: Theme.of(context)
                                                    .accentColor),
                                          ),
                                        ),
                                      ]
                                    : [
                                        Text(
                                          Provider.of<MainLocaleProvider>(
                                                          context)
                                                      .applicationLocale
                                                      .languageCode ==
                                                  "ar"
                                              ? '${widget.product.price} جنيه'
                                              : '${widget.product.price} EGP',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                              color: Theme.of(context)
                                                  .accentColor),
                                        ),
                                      ]),
                            RatingBarIndicator(
                              rating: 2.75,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 20,
                              direction: Axis.horizontal,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, left: 10, bottom: 20),
                              child: LanguageTextSwitcher(
                                  ar: widget.product.arDesc,
                                  en: widget.product.enDesc,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff5F5F5F),
                                  ))),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Expanded(
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                AppLocalizations.of(context).details,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    height: 1.5),
                              ),
                            ),
                            Text(
                                '${AppLocalizations.of(context).availability}: ${widget.product.itemsAvailable} ${AppLocalizations.of(context).instock}'),
                            Text(
                                '${AppLocalizations.of(context).maxquan}: ${widget.product.maxQuantityPerOrder}'),
                            Text(
                                '${AppLocalizations.of(context).discDur}: ${widget.product.discountDuration} ${AppLocalizations.of(context).minutes}'),
                            Text(
                                '${AppLocalizations.of(context).shippedby}: ${widget.product.shipment}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              AppLocalizations.of(context).userReviews,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  height: 1.5),
                            ),
                          ),
                        ],
                      ),
                      // CustomTextFormField(
                      //   hintText: AppLocalizations.of(context).yourOpinion,
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        maxRadius: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, left: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Albert Flores",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            RatingBarIndicator(
                                              rating: 2.75,
                                              itemBuilder: (context, index) =>
                                                  Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              itemCount: 5,
                                              itemSize: 20,
                                              direction: Axis.horizontal,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "20 April 2020",
                                    style: TextStyle(
                                        color: Theme.of(context).hintColor),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia",
                                  style: TextStyle(fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        maxRadius: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, left: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Albert Flores",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            RatingBarIndicator(
                                              rating: 2.75,
                                              itemBuilder: (context, index) =>
                                                  Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              itemCount: 5,
                                              itemSize: 20,
                                              direction: Axis.horizontal,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "20 April 2020",
                                    style: TextStyle(
                                        color: Theme.of(context).hintColor),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  "harum quisquam eius sed odit fugiat iusto fuga praesentiumoptio, eaque rerum! Provident",
                                  style: TextStyle(fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Text(
                          AppLocalizations.of(context).requestAspecialItem,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                        ),
                      ),
                      CustomTextFormField(
                        maxLines: 5,
                        hintText: AppLocalizations.of(context)
                            .describeYourRequestedItem,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: CustomButton(
                                elevation: 0,
                                // height: 60,
                                width: 150,
                                primary: Theme.of(context).accentColor,
                                text: AppLocalizations.of(context).request,
                                onpress: () {
                                  Navigator.of(context).pushNamed('/product');
                                }),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.aspectRatio + 3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FutureBuilder(
                    future: StoreService().getStoreInfo(widget.product.storeId),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final data = snapshot.data;
                        final store = data["store"];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, left: 7),
                                  child: Text(
                                    AppLocalizations.of(context).storeInfo,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        height: 1.5),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 55,
                                              backgroundImage:
                                                  NetworkImage(store["image"]),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10, left: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  LanguageTextSwitcher(
                                                      ar: store["arName"],
                                                      en: store["enName"],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16)),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5, bottom: 5),
                                                    child: Row(
                                                      children: [
                                                        RatingBarIndicator(
                                                          rating: 2.75 / 5,
                                                          itemBuilder: (context,
                                                                  index) =>
                                                              Icon(
                                                            Icons.star,
                                                            color: Colors.amber,
                                                          ),
                                                          itemCount: 1,
                                                          itemSize: 20,
                                                          direction:
                                                              Axis.horizontal,
                                                        ),
                                                        Text(
                                                          " 2.75",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 16),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                    "95% ${AppLocalizations.of(context).positivefeedback}",
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .hintColor,
                                                        fontSize: 14),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Theme.of(context).hintColor,
                                          ),
                                          onPressed: () {},
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
                ),
              ]),
            ),
          ),
          Consumer<CartProvider>(builder: (context, cartProvider, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: cartProvider.cartproducts
                                .where((x) => x.id == widget.product.id)
                                .length ==
                            0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // width: 100,
                                    // height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color:
                                            Color(0xff283148).withOpacity(.2),
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                      color: Color(0xff283148).withOpacity(.2),
                                    ),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              if (multiplier > 1) {
                                                setState(() {
                                                  multiplier = multiplier - 1;
                                                });
                                              }
                                            },
                                            style: ButtonStyle(
                                                minimumSize:
                                                    MaterialStateProperty.all(
                                                        Size(10, 2))),
                                            child: Text(
                                              "-",
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 15),
                                            color: Colors.white,
                                            child: Center(
                                              child: Text(
                                                "${multiplier}",
                                                style: TextStyle(
                                                  fontSize: 22,
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                multiplier = multiplier + 1;
                                              });
                                            },
                                            style: ButtonStyle(
                                                minimumSize:
                                                    MaterialStateProperty.all(
                                                        Size(10, 2))),
                                            child: Text("+",
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.black)),
                                          )
                                        ]),
                                  )
                                ],
                              ),
                              CustomButton(
                                  elevation: 0,
                                  // height: 60,
                                  width: 150,
                                  primary: Theme.of(context).accentColor,
                                  text: AppLocalizations.of(context).addtocart,
                                  onpress: () {
                                    var productToAdd = Cartproduct(
                                        id: widget.product.id,
                                        price: widget.product.price,
                                        arName: widget.product.arName,
                                        enName: widget.product.enName,
                                        multiplier: multiplier,
                                        imageURL: widget.product.image);
                                    cartProvider.addProductToCart(productToAdd);
                                    // Navigator.of(context).pushNamed('/profileSettings');
                                  })
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                CustomButton(
                                    elevation: 0,
                                    // height: 60,
                                    width: 150,
                                    primary: Theme.of(context).accentColor,
                                    text: AppLocalizations.of(context)
                                        .removeFromCart,
                                    onpress: () {
                                      cartProvider.deleteProductFromCart(
                                          id: widget.product.id);
                                      setState(() {
                                        multiplier = 1;
                                      });

                                      // Navigator.of(context).pushNamed('/profileSettings');
                                    })
                              ]),
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            );
          })
        ]),
        bottomNavigationBar: Container(child: CustomBottomBar()));
  }
}
