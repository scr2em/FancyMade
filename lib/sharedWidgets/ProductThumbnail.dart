import "package:finalproject/models/Product.dart";
import "package:finalproject/sharedWidgets/LanguageTextSwitcher.dart";
import 'package:finalproject/ui/main/main_locale_provider.dart';
import "package:finalproject/ui/product/productScreen.dart";
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductThumbnail extends StatelessWidget {
  Product product;
  bool badges;

  ProductThumbnail({this.product, this.badges = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10, left: 10),
      width: 190.0,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductScreen(
                      product: product,
                    )),
          );
        },
        child: Wrap(
          // alignment: WrapAlignment.center,
          children: [
            FadeInImage.assetNetwork(
              width: 190,
              height: 150,
              fit: BoxFit.cover,
              placeholder: 'assets/Spinner-1s-200px.gif',
              image: product.image,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: LanguageTextSwitcher(
                      ar: product.arName,
                      en: product.enName,

                      // ar: product.arName.length > 80 ? product.arName.substring(0,27) + "..." : product.arName ,
                      // en:  product.enName.length > 80 ? product.enName.substring(0,27) + "..." : product.enName ,
                      style: Theme.of(context).textTheme.bodyText1,
                      maxline: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                // ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: RatingBarIndicator(
                      rating: 2.75,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 10,
                      direction: Axis.horizontal,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Price(
                  value: product.price,
                  discount: product.discount,
                ),
                Row(
                  children: [
                    Icon(
                      product.verifiedStore != null
                          ? Icons.beenhere_outlined
                          : null,
                      color: Colors.grey,
                      size: 8,
                    ),
                    //failed to combine them
                    Icon(
                        product.discount != null
                            ? product.discount != 0
                                ? Icons.local_offer_outlined
                                : null
                            : null,
                        color: Colors.grey,
                        size: 8),
                    Icon(
                        product.freeShipping != null
                            ? Icons.local_shipping_outlined
                            : null,
                        color: Colors.grey,
                        size: 8),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Price extends StatelessWidget {
  int value;
  int discount;
  double priceFontSize = 14;

  Price({this.value, this.discount = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          children: discount != 0
              ? [
                  Text(
                    Provider.of<MainLocaleProvider>(context)
                                .applicationLocale
                                .languageCode ==
                            "ar"
                        ? '$value ????????'
                        : '$value EGP',
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Color(0xffFF5959),
                        fontSize: priceFontSize,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Text(
                      '${((1 - (discount / 100)) * value).toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ]
              : [
                  Text(
                    Provider.of<MainLocaleProvider>(context)
                                .applicationLocale
                                .languageCode ==
                            "ar"
                        ? '$value ????????'
                        : '$value EGP',
                    style: TextStyle(
                        color: Color(0xffFF5959),
                        fontSize: priceFontSize,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
    );
  }
}
