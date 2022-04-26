import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/util/constants/palette.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key, required this.onTap, required this.text, this.color})
      : super(key: key);

  final Function() onTap;
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        primary: color == null ? Palette.primaryGreen : color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
