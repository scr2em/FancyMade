import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../sharedWidgets/DashboardBottomBar.dart';

class StoreInfo extends StatelessWidget {
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamed('/');
          },
        ),
        // automaticallyImplyLeading: true
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CircleAvatar(
                      radius: 55,
                      backgroundImage: NetworkImage(
                          'https://th.bing.com/th/id/OIP.LC6JuWgA_1GxGH-nQJ1b0wHaHa?w=159&h=180&c=7&o=5&dpr=1.25&pid=1.7')),
                ),
                Text(
                  AppLocalizations.of(context).storeName,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    AppLocalizations.of(context).ownerName,
                    style: TextStyle(
                        fontSize: 16, color: Theme.of(context).accentColor),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Deliver Address, Governorate',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    AppLocalizations.of(context).avgRating,
                    style: TextStyle(
                        color: Theme.of(context).hintColor, fontSize: 20),
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
                        color: Theme.of(context).hintColor, fontSize: 20),
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
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Albert Flores",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
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
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "20 April 2020",
                          style: TextStyle(color: Theme.of(context).hintColor),
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
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Albert Flores",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
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
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "20 April 2020",
                          style: TextStyle(color: Theme.of(context).hintColor),
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
      ),
      bottomNavigationBar: DashboardBottomBar(),
    );
  }
}
