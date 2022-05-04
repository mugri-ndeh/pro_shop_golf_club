import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/auth/auth_provider.dart';
import 'package:pro_shop_golf_club/util/constants/palette.dart';
import 'package:provider/provider.dart';
import 'package:emojis/emojis.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Authentication auth;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth = Provider.of<Authentication>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var emoji = Emojis.wavingHandDarkSkinTone;

    return Scaffold(
      body: Container(
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                child: Stack(children: [
                  Container(
                    height: 130,
                    decoration: BoxDecoration(
                      color: Palette.scaffoldBg,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 1),
                            color: Palette.primaryGreen.withOpacity(0.09),
                            blurRadius: 2),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hey ${auth.loggedUser?.username} $emoji',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const Text('Let\'s play some golf today!',
                                  style: TextStyle(
                                    fontSize: 16,
                                  )),
                            ],
                          ),
                          CircleAvatar(
                            radius: 26,
                            child: CircleAvatar(
                                radius: 24,
                                foregroundColor: Colors.transparent,
                                backgroundColor: Palette.white,
                                child: Image.asset('assets/images/logo.png')),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Palette.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 1),
                                    color:
                                        Palette.primaryGreen.withOpacity(0.1),
                                    blurRadius: 4),
                              ],
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Image.asset(
                                          'assets/icons/courses.png')),
                                  Text(
                                    'Courses',
                                    style: TextStyle(color: Palette.black),
                                  )
                                ]),
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Palette.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 1),
                                    color:
                                        Palette.primaryGreen.withOpacity(0.1),
                                    blurRadius: 4),
                              ],
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Image.asset(
                                          'assets/icons/handicap.png')),
                                  Text(
                                    'Handicap',
                                    style: TextStyle(color: Palette.black),
                                  )
                                ]),
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Palette.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 1),
                                    color:
                                        Palette.primaryGreen.withOpacity(0.1),
                                    blurRadius: 4),
                              ],
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 50,
                                      width: 50,
                                      child:
                                          Image.asset('assets/icons/shop.png')),
                                  Text(
                                    'Shop history',
                                    style: TextStyle(color: Palette.black),
                                  )
                                ]),
                          )
                        ],
                      ),
                    ),
                  )
                ]),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Courses'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 180,
                  width: size.width,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 170,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Palette.secondaryColor
                                    .withOpacity(0.4)
                                    .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    child: Image.asset(
                                        'assets/images/golf${index + 1}.png'),
                                  )
                                ],
                              ),
                            ),
                          )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
