import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/util/constants/palette.dart';

class AuthButton extends StatefulWidget {
  AuthButton({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Container(
        height: 50,
        width: size.width * 0.8,
        decoration: BoxDecoration(
            color: Palette.primaryGreen,
            boxShadow: [
              BoxShadow(
                  offset: Offset(2, 5),
                  color: Palette.primaryGreen.withOpacity(0.1),
                  blurRadius: 15)
            ],
            borderRadius: BorderRadius.circular(32)),
        child: Center(
            child: Text(
          widget.text,
          style: TextStyle(
              color: Palette.white, fontWeight: FontWeight.bold, fontSize: 24),
        )),
      ),
    );
  }
}
