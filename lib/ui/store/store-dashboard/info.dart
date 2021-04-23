import 'package:finalproject/sharedWidgets/LanguageTextSwitcher.dart';
import 'package:finalproject/ui/main/main_locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import "package:finalproject/models/CustomUser.dart";
import 'package:provider/provider.dart';
import '../../../sharedWidgets/DashboardBottomBar.dart';
import "package:finalproject/services/store_service.dart";

class StoreInfo extends StatelessWidget {
  final String storeId;

  StoreInfo({this.storeId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).storeInfo,
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff273147)),
      ),
      body: FutureBuilder(
          future: StoreService().getStoreInfo(storeId),
          builder: (context, snapshot) {

            if (snapshot.hasData) {
              final data = snapshot.data;
              final CustomUser owner = data["owner"];
              final store = data["store"];
              return Padding(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: CircleAvatar(
                              radius: 55,
                              backgroundImage: NetworkImage(store["image"])),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LanguageTextSwitcher(
                              ar: store["arName"],
                              en: store["enName"],
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Text(
                            "${owner.name}",
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).accentColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Text(
                            "${store["arDesc"]}",
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).accentColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Text(
                            AppLocalizations.of(context).avgRating,
                            style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: 20),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(AppLocalizations.of(context).quality),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(AppLocalizations.of(context).price),
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
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            AppLocalizations.of(context).reviews,
                            style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: 20),
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                "user review user review user review user review user review user review ",
                                style: TextStyle(fontSize: 16),
                              ),
                            )
                          ],
                        ),
                        Divider(),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                "user review user review user review user review user review user review ",
                                style: TextStyle(fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
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
          }),
      bottomNavigationBar: DashboardBottomBar(selectedIndex: 3),
    );
  }
}
