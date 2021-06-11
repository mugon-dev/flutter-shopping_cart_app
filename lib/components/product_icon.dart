import 'package:flutter/material.dart';

import '../constants.dart';

class ProductIcon extends StatelessWidget {
  final IconData mIcon;

  const ProductIcon(
    this.mIcon, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        onPressed: () {
          print("클릭됨");
        },
        icon: Icon(
          mIcon,
          color: Colors.black,
        ),
      ),
    );
  }
}
