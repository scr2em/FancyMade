import 'package:finalproject/sharedWidgets/CustomBottomBar.dart';
import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: const Color(323232),
      body: Stack(
        children: [
          Positioned(
            top: 24,
            bottom: 200,
            left: 24,
            right: 24,
            child: Container(
              child: Image.asset('images/brain.png'),
            ),
          ),
          Positioned(
            top: 150,
            bottom: 0,
            left: 24,
            right: 24,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                const Text(
                  'OOPS!\n404',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 50,
                      letterSpacing: 2,
                      color: const Color(0xffEEEEEE),
                      fontFamily: 'Anton',
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Page not found!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: const Color(0xffEEEEEE),
                  ),
                ),
                // CustomBottomBar()
              ],
            ),
          )
        ],
      ),
    );
  }
}
