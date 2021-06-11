import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/constants.dart';

import 'components/color_icon.dart';
import 'components/product_icon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      home: ShoppingCartPage(),
    );
  }
}

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  int selectedIconNum = 0;
  List<String> selectPic = [
    "assets/p1.jpeg",
    "assets/p2.jpeg",
    "assets/p3.jpeg",
    "assets/p4.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
            color: Colors.black,
          ),
          SizedBox(width: 16),
        ],
        //app bar 하단 줄 제거
        elevation: 0.0,
      ),
      body: Column(
        children: [
          _productPic(),
          _productSelector(),
          _productDetails(),
        ],
      ),
    );
  }

  Widget _productDetails() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Urban Soft AL 10.0",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$699",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Spacer(),
                    Text("review "),
                    Text(
                      "(26)",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text("Color Options"),
                SizedBox(height: 10),
                Row(
                  children: [
                    ColorIcon(Colors.black),
                    ColorIcon(Colors.green),
                    ColorIcon(Colors.orange),
                    ColorIcon(Colors.grey),
                    ColorIcon(Colors.white),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  child: TextButton(
                    onPressed: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) => CupertinoAlertDialog(
                          title: Text("장바구니에 담으시겠습니까?"),
                          actions: [
                            CupertinoDialogAction(
                              child: Text("확인"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: kAccentColor,
                      minimumSize: Size(300, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _productSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ProductIcon(0, selectedIconNum, Icons.directions_bike, changeIcon),
          ProductIcon(1, selectedIconNum, Icons.motorcycle, changeIcon),
          ProductIcon(
              2, selectedIconNum, CupertinoIcons.car_detailed, changeIcon),
          ProductIcon(3, selectedIconNum, CupertinoIcons.airplane, changeIcon),
        ],
      ),
    );
  }

  Widget _productPic() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 5 / 3,
        child: Image.asset(
          selectPic[selectedIconNum],
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void changeIcon(int num) {
    setState(() {
      selectedIconNum = num;
    });
  }
}
