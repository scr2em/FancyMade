import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Product extends StatelessWidget {
  int price;
  int discount;
  bool badges;

  Product({this.price, this.discount = 0, this.badges = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 8),
      width: 190.0,
      child: Wrap(
        children: [
          Placeholder(
            fallbackHeight: 150,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text("Product name ",
                style: Theme.of(context).textTheme.bodyText1),
          ),
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
          Price(
            value: price,
            discount: discount,
          ),
          Icon(
            badges ? Icons.beenhere_outlined : null,
            color: Colors.grey,
            size: 18,
          ),
          Icon(badges ? Icons.local_offer_outlined : null,
              color: Colors.grey, size: 18),
          Icon(badges ? Icons.local_shipping_outlined : null,
              color: Colors.grey, size: 18),
        ],
      ),
    );
  }
}

class Price extends StatelessWidget {
  int value;
  int discount;
  double priceFontSize = 18;

  Price({this.value, this.discount = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          children: discount != 0
              ? [
                  Text(
                    '$value EGP',
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
                    '$value EGP',
                    style: TextStyle(
                        color: Color(0xffFF5959),
                        fontSize: priceFontSize,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
    );
  }
}
