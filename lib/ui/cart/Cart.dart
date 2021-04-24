import 'package:finalproject/models/CartProduct.dart';
import 'package:finalproject/sharedWidgets/CustomButton.dart';
import 'package:finalproject/sharedWidgets/LanguageTextSwitcher.dart';
import 'package:finalproject/ui/main/CartProvider.dart';
import 'package:finalproject/ui/main/main_locale_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  @override
  CartState createState() => CartState();
}

class CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cartProvider, child) {
      List<Cartproduct> cartproducts = cartProvider.cartproducts;
      String languageCode = Provider.of<MainLocaleProvider>(context)
          .applicationLocale
          .languageCode;
      return Container(
        height: MediaQuery.of(context).size.height * .75,
        width: MediaQuery.of(context).size.width,
        child: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height),
            child: Scaffold(
                appBar: PreferredSize(
                    preferredSize: Size.fromHeight(34),
                    child: AppBar(
                        elevation: 0,
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.white,
                        flexibleSpace: SafeArea(
                            minimum: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Text(AppLocalizations.of(context).cart,
                                    textAlign: TextAlign.left,
                                    style:
                                        Theme.of(context).textTheme.headline1),
                                Spacer(),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(
                                    Icons.cancel,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            )))),
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: cartproducts.length == 0
                        ? [
                            Image.asset("assets/images/emptyCart.png"),
                          ]
                        : [
                            ListView.builder(
                                itemCount: cartproducts.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.black12))),
                                    child: GestureDetector(
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(1),
                                                          border: Border.all(
                                                              color: Colors
                                                                  .grey[100])),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        child: Image.network(
                                                            cartproducts[index]
                                                                .imageURL,
                                                            height: 90,
                                                            width: 90.0,
                                                            fit: BoxFit.fill),
                                                      )),
                                                  SizedBox(
                                                    width: 16,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.transparent,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          LanguageTextSwitcher(
                                                              ar: cartproducts[
                                                                      index]
                                                                  .arName,
                                                              en: cartproducts[
                                                                      index]
                                                                  .enName,
                                                              style: TextStyle(
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),

                                                          SizedBox(
                                                            height: 7,
                                                          ),
                                                          // should be localized
                                                          Text(
                                                            '${AppLocalizations.of(context).price}:${cartproducts[index].price} ${AppLocalizations.of(context).lE}',
                                                            style: TextStyle(
                                                              fontSize: 10,
                                                              color: Colors.grey
                                                                  .shade600,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),

                                                          Container(
                                                              width: 112,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  border: Border.all(
                                                                      color: Colors
                                                                              .grey[
                                                                          300])),
                                                              child: Row(
                                                                children: [
                                                                  CustomButton(
                                                                      width:
                                                                          37.5,
                                                                      height:
                                                                          23,
                                                                      text: '-',
                                                                      fontsize:
                                                                          12,
                                                                      primary:
                                                                          Colors.grey[
                                                                              300],
                                                                      onprimary:
                                                                          Colors
                                                                              .black,
                                                                      radiusbotleft: (languageCode == 'en'
                                                                              ? 4
                                                                              : 0)
                                                                          .toDouble(),
                                                                      radiustopleft: (languageCode == 'en'
                                                                              ? 4
                                                                              : 0)
                                                                          .toDouble(),
                                                                      radiustbotright:
                                                                          0,
                                                                      radiustopright:
                                                                          0,
                                                                      bordercolor:
                                                                          Colors
                                                                              .transparent,
                                                                      onpress:
                                                                          () {
                                                                        cartProvider.decreaseQty(
                                                                            1,
                                                                            index);
                                                                      }),
                                                                  Container(
                                                                    width: 35,
                                                                    child: Text(
                                                                      '${cartproducts[index].multiplier}',
                                                                      textScaleFactor:
                                                                          1.1,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                  ),
                                                                  CustomButton(
                                                                      width:
                                                                          37.5,
                                                                      height:
                                                                          23,
                                                                      text: '+',
                                                                      fontsize:
                                                                          12,
                                                                      primary:
                                                                          Colors.grey[
                                                                              300],
                                                                      onprimary:
                                                                          Colors
                                                                              .black,
                                                                      radiusbotleft:
                                                                          0,
                                                                      radiustopleft:
                                                                          0,
                                                                      radiustbotright: (languageCode == 'en'
                                                                              ? 4
                                                                              : 0)
                                                                          .toDouble(),
                                                                      radiustopright: (languageCode == 'en'
                                                                              ? 4
                                                                              : 0)
                                                                          .toDouble(),
                                                                      bordercolor:
                                                                          Colors
                                                                              .transparent,
                                                                      onpress:
                                                                          () {
                                                                        cartProvider.increaseQty(
                                                                            1,
                                                                            index);
                                                                      }),
                                                                ],
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Column(children: [
                                                    IconButton(
                                                      icon: Icon(
                                                        Icons
                                                            .delete_forever_outlined,
                                                        color: Colors.red,
                                                        size: 20,
                                                      ),
                                                      onPressed: () {
                                                        cartProvider
                                                            .deleteProductFromCart(
                                                                id: cartproducts[
                                                                        index]
                                                                    .id);

                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(SnackBar(
                                                                content: Text(
                                                                    "${AppLocalizations.of(context).itemremoved}")));
                                                      },
                                                    ),
                                                    SizedBox(
                                                      height: 60,
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        '${cartProvider.onload(index)} ${AppLocalizations.of(context).lE}',
                                                        textScaleFactor: 0.9,
                                                      ),
                                                    )
                                                  ])
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                            SizedBox(
                              height: 100,
                            )
                          ],
                  ),
                ),
                bottomSheet: Container(
                  padding: EdgeInsets.zero,
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 5.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                          width: 150,
                          height: 40,
                          //need localization
                          text:
                              '${cartproducts.length == 0 ? AppLocalizations.of(context).continueShopping : AppLocalizations.of(context).checkout}',
                          fontsize: 12,
                          primary: Theme.of(context).accentColor,
                          onprimary: Colors.white,
                          bordercolor: Colors.transparent,
                          onpress: () {
                            if (cartproducts.length == 0) {
                              Navigator.of(context).pushNamed('/');
                            } else {
                              Navigator.of(context).pushNamed('/checkout');
                            }
                          }),
                      SizedBox(
                        width: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: 12),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              '${AppLocalizations.of(context).total}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              '${cartproducts.length == 0 ? "0" : cartproducts.map((e) => e.price * e.multiplier).reduce((value, element) => value + element)}',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ))),
      );
    });
  }
}
