import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pro_shop_golf_club/auth/login/login.dart';
import 'package:pro_shop_golf_club/util/constants/palette.dart';
import 'package:pro_shop_golf_club/util/helper/helper.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((value) {
      push(context, LoginScreen());
    });
  }

  // setGreenStausBar() {
  //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //       statusBarColor: Palette.primaryGreen,
  //       statusBarIconBrightness: Brightness.light));
  // }

  // discardStatusbar() {
  //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //       statusBarColor: Palette.scaffoldBg,
  //       statusBarIconBrightness: Brightness.dark));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Palette.primaryGreen,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png'),
          Text(
            'GolfHub',
            style: TextStyle(
                color: Palette.primaryGreen,
                fontSize: 32,
                fontWeight: FontWeight.w400),
          )
        ],
      )),
    );
  }
}
