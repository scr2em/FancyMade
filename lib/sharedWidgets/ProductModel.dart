import 'package:finalproject/ui/main/main_locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import "package:finalproject/models/Product.dart";
import "package:finalproject/ui/product/productScreen.dart";
import "package:finalproject/sharedWidgets/LanguageTextSwitcher.dart";
import 'package:provider/provider.dart';

class ProductThumbnail extends StatelessWidget {
  Product product;
  bool badges;

  ProductThumbnail({this.product, this.badges = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 8),
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
          children: [
            Image.network(
              product.image,
              height: 150,
              width: 190,
              fit: BoxFit.cover,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: LanguageTextSwitcher(
                        ar: product.arName,
                        en: product.enName,

                        // ar: product.arName.length > 80 ? product.arName.substring(0,27) + "..." : product.arName ,
                        // en:  product.enName.length > 80 ? product.enName.substring(0,27) + "..." : product.enName ,
                        style: Theme.of(context).textTheme.bodyText1,
                        maxline: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                ),
              ],
            ),
            Row(
              children: [
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
                      size: 14,
                    ),
                    //failed to combine them
                    Icon(
                        product.discount != null
                            ? product.discount != 0
                                ? Icons.local_offer_outlined
                                : null
                            : null,
                        color: Colors.grey,
                        size: 14),
                    Icon(
                        product.freeShipping != null
                            ? Icons.local_shipping_outlined
                            : null,
                        color: Colors.grey,
                        size: 14),
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
  double priceFontSize = 16;

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
                        ? '$value جنيه'
                        : '$value EGP',
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Color(0xffFF5959),
                        fontSize: priceFontSize,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
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
                        ? '$value جنيه'
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
