import 'package:finalproject/models/Product.dart';
import 'package:finalproject/services/products_service.dart';
import 'package:finalproject/sharedWidgets/ProductModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../.../../../sharedWidgets/CustomBottomBar.dart';
import '../.../../../sharedWidgets/CustomAppBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryScreen extends StatefulWidget {
  String category;

  CategoryScreen({this.category});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category, style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),

      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(child: CustomSearchInput()),
                        IconButton(
                            icon: Icon(Icons.filter_alt_outlined),
                            onPressed: () {})
                      ],
                    ),
                  ),
                  // featured
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Featured",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Text(AppLocalizations.of(context).viewall,
                                style: Theme.of(context).textTheme.bodyText1),
                          ],
                        ),
                      ),
                      // Container(
                      //   height: 220,
                      //   child: FutureBuilder(
                      //     future: ProductsService().getInventory(
                      //         uid: Provider.of<MainLocaleProvider>(context)
                      //             .user
                      //             .storeId),
                      //     builder: (context, snapshot) {
                      //       if (snapshot.hasData) {
                      //         final docs = snapshot.data.docs;
                      //         return ListView(
                      //           scrollDirection: Axis.horizontal,
                      //           children: <Widget>[
                      //             // ProductThumbnail(
                      //             //   price: 100,
                      //             //   discount: 10,
                      //             //   badges: false,
                      //             // ),
                      //             // ProductThumbnail(
                      //             //   price: 200,
                      //             //   discount: 20,
                      //             //   badges: false,
                      //             // ),
                      //             // ProductThumbnail(
                      //             //   price: 150,
                      //             //   badges: false,
                      //             // ),
                      //             // ProductThumbnail(
                      //             //   price: 120,
                      //             //   badges: false,
                      //             // ),
                      //           ],
                      //         );
                      //       } else if (snapshot.hasError) {
                      //         return Container(
                      //             child: Center(
                      //                 child: Text(
                      //                     "${AppLocalizations.of(context).error} ${AppLocalizations.of(context).somthingWrong} ${AppLocalizations.of(context).pleasereload}...")));
                      //       } else {
                      //         return Container(
                      //             child: Center(
                      //                 child: CircularProgressIndicator()));
                      //       }
                      //     },
                      //   ),
                      // )
                    ],
                  ),

// //more

                  //grid
                  // FutureBuilder(
                  //     future:
                  //         ProductsService().getInventory(uid: widget.store.id),
                  //     builder: (context, snapshot) {
                  //       if (snapshot.hasData) {
                  //         return Column(
                  //           children: [
                  //             Container(
                  //               margin: EdgeInsets.only(bottom: 8),
                  //               child: Row(
                  //                 children: [
                  //                   Text(
                  //                     "${AppLocalizations.of(context).more} (${snapshot.data.docs.length})",
                  //                     style:
                  //                         Theme.of(context).textTheme.headline2,
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             GridView.builder(
                  //               itemCount: snapshot.data.docs.length,
                  //               shrinkWrap: true,
                  //               physics: NeverScrollableScrollPhysics(),
                  //               gridDelegate:
                  //                   SliverGridDelegateWithFixedCrossAxisCount(
                  //                 childAspectRatio: 2 / 3,
                  //                 crossAxisSpacing: 10,
                  //                 // mainAxisSpacing: 1,
                  //                 crossAxisCount: 2,
                  //               ),
                  //               itemBuilder: (context, index) {
                  //                 // return Product(data:snapshot.data[index]);
                  //                 return ProductThumbnail(
                  //                   product: Product.fromJson(
                  //                       snapshot.data.docs[index].data()),
                  //                 );
                  //               },
                  //             ),
                  //           ],
                  //         );
                  //       } else if (snapshot.hasError) {
                  //         return Container(
                  //             child: Center(
                  //                 child: Text(
                  //                     "${AppLocalizations.of(context).error} ${AppLocalizations.of(context).somthingWrong} ${AppLocalizations.of(context).pleasereload}...")));
                  //       } else {
                  //         return Container(
                  //             child:
                  //                 Center(child: CircularProgressIndicator()));
                  //       }
                  //     }),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
