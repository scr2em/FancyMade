import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/models/Product.dart';
import 'package:finalproject/models/Store.dart';
import 'package:finalproject/services/store_service.dart';
import 'package:finalproject/sharedWidgets/CustomButton.dart';
import 'package:finalproject/sharedWidgets/CustomTextFormField.dart';
import 'package:finalproject/sharedWidgets/ProductModel.dart';
import 'package:finalproject/ui/cart/Cart.dart';
import 'package:finalproject/ui/inbox/inboxscreen.dart';
import 'package:finalproject/ui/store/Store.dart';
import "package:flutter/material.dart";
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import "../../sharedWidgets/CustomAppBar.dart";
import "../../sharedWidgets/CustomBottomBar.dart";
import 'package:flutter/cupertino.dart';
import 'package:ndialog/ndialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import "package:finalproject/services/products_service.dart";

// var obj = new CartState();

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
                    children: _listTile,
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
                                        CircleAvatar(
                                          radius: 55,
                                          backgroundImage:
                                              NetworkImage(store["image"]),
                                        ),
                                        Text("${store["enName"]}"),
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
                      Text(AppLocalizations.of(context).nearbyStore,
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
                      return ProductThumbnail(
                        product: Product.fromJson(snapshot.data[index].data()),
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

List<Widget> _listTile = <Widget>[
  Stack(alignment: AlignmentDirectional.bottomStart, children: [
    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        'assets/images/categories/accessories.jpg',
        fit: BoxFit.fill,
      ),
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
  Stack(alignment: AlignmentDirectional.bottomStart, children: [
    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        'assets/images/categories/dolls.jpg',
        fit: BoxFit.fill,
      ),
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
  Stack(alignment: AlignmentDirectional.bottomStart, children: [
    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        'assets/images/categories/Jewelry.jpg',
        fit: BoxFit.fill,
      ),
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
  Stack(alignment: AlignmentDirectional.bottomStart, children: [
    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        'assets/images/categories/Paintings.jpg',
        fit: BoxFit.fill,
      ),
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
];

// Padding(
//   padding: const EdgeInsets.all(10),
//   child: Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         ElevatedButton(
//           onPressed: () {
//             // // Navigate back to first screen when tapped.
//             Navigator.of(context).pushNamedAndRemoveUntil(
//                 '/order', (Route<dynamic> route) => false);
//           },
//           child: Text('home'),
//         ),
//         CustomButton(
//           text: 'test1',
//           onpress: () {
//             NAlertDialog(
//               content: Cart(),
//               blur: 2,
//             ).show(context,
//                 transitionType: DialogTransitionType.Bubble);
//           },
//         ),
//         CustomButton(
//           text: 'test2',
//           height: 20,
//           onpress: () {
//             Navigator.of(context).pushNamedAndRemoveUntil(
//                 '/signup', (Route<dynamic> route) => false);
//           },
//         ),
//         CustomButton(
//           text: 'test3',
//           height: 20,
//           onpress: () {
//             Navigator.of(context).pushNamedAndRemoveUntil(
//                 '/signin', (Route<dynamic> route) => false);
//           },
//         ),
//         CustomButton(
//           text: 'test4',
//           height: 20,
//           onpress: () {
//             Navigator.of(context).pushNamedAndRemoveUntil(
//                 '/loginProfileWrapper',
//                 (Route<dynamic> route) => false);
//           },
//         ),
//         CustomButton(
//           text: 'test5',
//           height: 20,
//           onpress: () {
//             Navigator.of(context).pushNamedAndRemoveUntil(
//                 '/product', (Route<dynamic> route) => false);
//           },
//         ),
//         CustomButton(
//           text: 'test6',
//           height: 20,
//           onpress: () {
//             Navigator.of(context).pushNamedAndRemoveUntil(
//                 '/CreateStoreForm', (Route<dynamic> route) => false);
//           },
//         ),
//         CustomButton(
//           text: 'test7',
//           height: 20,
//           onpress: () {
//             Navigator.of(context).pushNamedAndRemoveUntil(
//                 '/profileInfo', (Route<dynamic> route) => false);
//           },
//         ),
//         CustomButton(
//           text: 'test8',
//           height: 20,
//           onpress: () {
//             Navigator.of(context).pushNamedAndRemoveUntil(
//                 '/profileSettings', (Route<dynamic> route) => false);
//           },
//         ),
//         CustomButton(
//           text: 'test9',
//           height: 20,
//           onpress: () {
//             Navigator.of(context).pushNamedAndRemoveUntil(
//                 '/store', (Route<dynamic> route) => false);
//           },
//         ),
//         CustomButton(
//           text: 'test10',
//           height: 20,
//           onpress: () {
//             Navigator.of(context).pushNamedAndRemoveUntil(
//                 '/order', (Route<dynamic> route) => false);
//           },
//         ),
//         CustomButton(
//           text: 'test11',
//           height: 20,
//           onpress: () {
//             Navigator.of(context).pushNamedAndRemoveUntil(
//                 '/productlisting', (Route<dynamic> route) => false);
//           },
//         ),
//         CustomButton(
//           text: 'test12',
//           height: 20,
//           onpress: () {
//             Navigator.of(context).pushNamedAndRemoveUntil(
//                 '/productReview', (Route<dynamic> route) => false);
//           },
//         ),
//         CustomButton(
//           text: 'test13',
//           height: 20,
//           onpress: () {
//             Navigator.of(context).pushNamedAndRemoveUntil(
//                 '/store-info', (Route<dynamic> route) => false);
//           },
//         ),
//         CustomButton(
//           text: 'test14',
//           height: 20,
//           onpress: () {
//             Navigator.of(context).pushNamedAndRemoveUntil(
//                 '/checkout', (Route<dynamic> route) => false);
//           },
//         ),
//         CustomButton(
//           text: 'test15',
//           height: 20,
//           onpress: () {
//             Navigator.of(context).pushNamedAndRemoveUntil(
//                 '/checkout-success', (Route<dynamic> route) => false);
//           },
//         ),
//         CustomButton(
//           text: 'test17',
//           height: 20,
//           onpress: () {
//             Navigator.of(context).pushNamedAndRemoveUntil(
//                 '/store-dashboard', (Route<dynamic> route) => false);
//           },
//         ),
//         CustomButton(
//           text: 'test18',
//           height: 20,
//           onpress: () {
//             Navigator.of(context).pushNamedAndRemoveUntil(
//                 '/store-inventory', (Route<dynamic> route) => false);
//           },
//         ),
//         CustomButton(
//           text: 'test19',
//           height: 20,
//           onpress: () {
//             Navigator.of(context).pushNamedAndRemoveUntil(
//                 '/', (Route<dynamic> route) => false);
//           },
//         ),
//         CustomButton(
//           text: 'test20',
//           height: 20,
//           onpress: () {
//             Navigator.of(context).pushNamedAndRemoveUntil(
//                 '/contactUs', (Route<dynamic> route) => false);
//           },
//         ),
//         CustomButton(
//           text: 'test21',
//           height: 20,
//           onpress: () {
//             Navigator.of(context).pushNamedAndRemoveUntil(
//                 '/faq', (Route<dynamic> route) => false);
//           },
//         ),
//         CustomButton(
//           text: 'test22',
//           height: 20,
//           onpress: () {
//             Navigator.of(context).pushNamedAndRemoveUntil(
//                 '/req-msgs', (Route<dynamic> route) => false);
//           },
//         ),
//         CustomButton(
//           text: 'test23',
//           height: 20,
//           onpress: () {
//             Navigator.of(context).pushNamedAndRemoveUntil(
//                 '/notfound', (Route<dynamic> route) => false);
//           },
//         ),
//       ],
//     ),
//   ),
// ),
