import 'package:finalproject/sharedWidgets/CustomBottomBar.dart';
import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Order #114224')),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "Details :",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Text(
              '• Cash on delivery: 200EGP',
              style: TextStyle(fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 10),
              child: Text(
                'Items :',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        // color: Color(0xffD8D8D8),
                        border: Border.all(
                          width: 1,
                          color: Color(0xffD8D8D8),
                        ),
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  'https://i.pinimg.com/564x/2d/02/4b/2d024bf61c604b7db70e9bc4a4cfa1fe.jpg',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  'NikeCourt Lite 2',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              Text(
                                'Color: Blue',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).hintColor,
                                    height: 1.5),
                              ),
                              Text(
                                'Size: 37',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).hintColor,
                                    height: 1.5),
                              ),
                              Text(
                                'Qty: 1',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).hintColor,
                                    height: 1.5),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '\$67',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5,
                                  color: Color(0xff495057)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        // color: Color(0xffD8D8D8),
                        border: Border.all(
                          width: 1,
                          color: Color(0xffD8D8D8),
                        ),
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  'https://i.pinimg.com/564x/2d/02/4b/2d024bf61c604b7db70e9bc4a4cfa1fe.jpg',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  'NikeCourt Lite 2',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              Text(
                                'Color: Blue',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).hintColor,
                                    height: 1.5),
                              ),
                              Text(
                                'Size: 37',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).hintColor,
                                    height: 1.5),
                              ),
                              Text(
                                'Qty: 1',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).hintColor,
                                    height: 1.5),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '\$67',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5,
                                  color: Color(0xff495057)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Color(0xffE2E2E2),
                ),
                constraints: BoxConstraints.expand(
                  height: Theme.of(context).textTheme.headline4.fontSize * 1.1 +
                      400.0,
                ),
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.694,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.shopping_cart,
                            color: Theme.of(context).backgroundColor,
                          ),
                          backgroundColor:
                              Theme.of(context).accentColor.withOpacity(.37),
                          maxRadius: 30,
                        ),
                        title: Text(
                          'Order Placed',
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                        ),
                        subtitle: Text("June 10, 2021  | 03:48am"),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.694,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.shopping_cart,
                            color: Theme.of(context).backgroundColor,
                          ),
                          backgroundColor: Color(0xff3498DB).withOpacity(.37),
                          maxRadius: 30,
                        ),
                        title: Text(
                          'Order Placed',
                          style: TextStyle(color: Color(0xff3498DB)),
                        ),
                        subtitle: Text("June 10, 2021  | 03:48am"),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.694,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.done_rounded,
                            color: Theme.of(context).backgroundColor,
                            size: 40,
                          ),
                          backgroundColor: Color(0xff3CAF47).withOpacity(.37),
                          maxRadius: 30,
                        ),
                        title: Text('Order Placed',
                            style: TextStyle(color: Color(0xff3CAF47))),
                        subtitle: Text("June 10, 2021  | 03:48am"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
