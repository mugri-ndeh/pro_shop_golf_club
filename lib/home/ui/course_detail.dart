import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/home/ui/input_score.dart';
import 'package:pro_shop_golf_club/home/ui/product_detail.dart';
import 'package:pro_shop_golf_club/home/ui/widgets/widgets.dart';
import 'package:pro_shop_golf_club/models/course.dart';
import 'package:pro_shop_golf_club/util/constants/palette.dart';
import 'package:pro_shop_golf_club/util/helper/helper.dart';

class CourseDetail extends StatefulWidget {
  CourseDetail({Key? key, required this.course}) : super(key: key);
  final Course course;

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDarkMode(context) ? Palette.white : Palette.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 240,
            width: size.width,
            child: CustomContainer(
              width: size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  widget.course.imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.course.name,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Icon(Icons.location_on),
                              const SizedBox(width: 5),
                              Text(widget.course.location),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey.shade300,
                                child: Icon(
                                  Icons.send,
                                  color: Palette.black,
                                  size: 18,
                                ),
                              ),
                              const SizedBox(width: 8),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey.shade300,
                                child: Icon(
                                  Icons.ios_share,
                                  color: Palette.black,
                                  size: 18,
                                ),
                              ),
                              const SizedBox(width: 8),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey.shade300,
                                child: Icon(
                                  Icons.calendar_today,
                                  color: Palette.black,
                                  size: 18,
                                ),
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const CustomHorizontalDivider(),
                        ],
                      ),
                    ),
                    IntrinsicHeight(
                      child: Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Information',
                              style: Theme.of(context).textTheme.headline5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        widget.course.distance,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text('Distance'),
                                    ],
                                  ),
                                  const CustomVerticalDivider(height: 25),
                                  Column(
                                    children: const [
                                      Text('7',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text('Players'),
                                    ],
                                  ),
                                  const CustomVerticalDivider(height: 25),
                                  Column(
                                    children: [
                                      const Icon(Icons.golf_course),
                                      Text('${widget.course.holes} holes'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus rhoncus, arcu quis finibus interdum, purus mi ultrices urna, sit amet mollis tellus velit vel massa. Quisque et augue non magna scelerisque scelerisque. Proin euismod aliquam felis nec viverra. Mauris vitae mauris nisl. Vivamus ultricies risus ac sem tincidunt suscipit. Proin consectetur lorem diam, vitae scelerisque mauris malesuada sed. Sed dignissim libero sit amet elementum dictum. Aenean facilisis facilisis lectus commodo pellentesque.')
                        ],
                      )),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                        child: Text('Start Round'),
                        onTap: () {
                          push(context, InputScore());
                        })
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
