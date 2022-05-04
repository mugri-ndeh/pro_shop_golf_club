import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/util/constants/palette.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({Key? key, required this.height})
      : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: height,
      color: Palette.white,
    );
  }
}

class CustomHorizontalDivider extends StatelessWidget {
  const CustomHorizontalDivider({Key? key, this.padding}) : super(key: key);
  final double? padding;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 0),
      child: Container(
        width: size.width,
        height: 1,
        color: Colors.grey,
      ),
    );
  }
}
