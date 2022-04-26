import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/auth/widgets/input_fields.dart';
import 'package:pro_shop_golf_club/util/constants/palette.dart';

class Tournaments extends StatefulWidget {
  Tournaments({Key? key}) : super(key: key);

  @override
  State<Tournaments> createState() => _TournamentsState();
}

class _TournamentsState extends State<Tournaments> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Find the most Exciting',
                            style: TextStyle(fontSize: 20)),
                        const Text(
                          'Games to play',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        )
                      ],
                    ),
                    CircleAvatar(
                      radius: 30,
                      child: CircleAvatar(
                          radius: 28,
                          foregroundColor: Colors.transparent,
                          backgroundColor: Palette.white,
                          child: Image.asset('assets/images/logo.png')),
                    )
                  ],
                ),
                SizedBox(height: 20),
                InputField(
                  hint: 'Search for games',
                  icon: Icon(Icons.search),
                )
                // Container(,
                //   child: ElevatedButton(
                //     child: Text('Logout'),
                //     onPressed: () {
                //       auth.logout();
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
