import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/auth/auth_provider.dart';
import 'package:pro_shop_golf_club/home/ui/course_detail.dart';
import 'package:pro_shop_golf_club/models/course.dart';
import 'package:pro_shop_golf_club/util/constants/palette.dart';
import 'package:pro_shop_golf_club/util/helper/helper.dart';
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

  final List<Course> courses = [
    Course(
        id: 0,
        name: 'Mountain picth',
        holes: 0,
        location: 'Great Soppo',
        imgUrl: 'assets/images/pitch1.jpg',
        distance: '50KM'),
    Course(
        id: 2,
        name: 'Mini golf',
        holes: 0,
        location: 'Buea Town',
        imgUrl: 'assets/images/pitch2.jpg',
        distance: '50KM'),
    Course(
        id: 2,
        name: 'Molyko grand course',
        holes: 0,
        location: 'Molyko Buea',
        imgUrl: 'assets/images/pitch3.jpg',
        distance: '50KM'),
    Course(
        id: 3,
        name: 'Buea central course',
        holes: 0,
        location: 'Mile 16',
        imgUrl: 'assets/images/pitch4.jpg',
        distance: '50KM'),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var emoji = Emojis.wavingHandDarkSkinTone;

    return Scaffold(
      body: Container(
        height: size.height,
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
                                  color: Palette.primaryGreen.withOpacity(0.1),
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
                                  'Games',
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
                                  color: Palette.primaryGreen.withOpacity(0.1),
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
                                  color: Palette.primaryGreen.withOpacity(0.1),
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  width: size.width,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1,
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: courses.length,
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
                              child: CourseCard(
                                course: courses[index],
                              ),
                            ),
                          )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        push(context, CourseDetail(course: course));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                image: AssetImage(course.imgUrl), fit: BoxFit.cover)),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 60,
            child: Column(
              children: [
                Text(
                  course.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Text(
                  course.location,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
