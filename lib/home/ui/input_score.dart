import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/auth/auth_provider.dart';
import 'package:pro_shop_golf_club/auth/widgets/custom_auth_button.dart';
import 'package:pro_shop_golf_club/home/ui/product_detail.dart';
import 'package:pro_shop_golf_club/home/ui/widgets/widgets.dart';
import 'package:pro_shop_golf_club/models/user.dart';
import 'package:pro_shop_golf_club/util/constants/palette.dart';
import 'package:pro_shop_golf_club/util/helper/helper.dart';
import 'package:provider/provider.dart';

class InputScore extends StatefulWidget {
  InputScore({Key? key}) : super(key: key);

  @override
  State<InputScore> createState() => _InputScoreState();
}

class _InputScoreState extends State<InputScore> {
  int strokes = 0;
  int puts = 0;
  int sand = 0;
  int penalties = 0;
  late UserModel user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = Provider.of<Authentication>(context, listen: false).loggedUser!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        backgroundColor: Palette.scaffoldBg,
        elevation: 0,
        title: Text(
          'Input Score',
          style: TextStyle(color: Palette.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Hole 01',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Part 5 / 00:32:18',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            const CustomHorizontalDivider(),
            SizedBox(height: 10),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Player',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              'assets/images/user1.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            user.username,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                const CustomHorizontalDivider(),
                const SizedBox(height: 10),
                Column(
                  children: [
                    _valueRow(data: 'Strokes', value: strokes),
                    const SizedBox(height: 20),
                    _valueRow(data: 'How many were puts?', value: puts),
                    const SizedBox(height: 20),
                    _valueRow(data: 'Sand shots', value: sand),
                    const SizedBox(height: 20),
                    _valueRow(data: 'Penalties', value: penalties),
                    const SizedBox(height: 20),
                  ],
                ),
                const SizedBox(height: 10),
                CustomButton(child: const Text('Go to next hole'), onTap: () {})
              ],
            ))
          ],
        ),
      ),
    );
  }

  Row _valueRow({required String data, required int value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(data),
        SizedBox(
          width: 80,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CistomCircularButton(
                outlined: true,
                onTap: () {
                  setState(() {
                    if (value == 0) {
                      showSnackBar(context, 'Cannot be less than zero');
                    } else {
                      value--;
                    }
                  });
                },
                icon: Icons.remove),
            Text(
              value.toString(),
              style: TextStyle(fontSize: 20, color: Palette.primaryGreen),
            ),
            CistomCircularButton(
                outlined: true,
                onTap: () {
                  setState(() {
                    value++;
                    print(value);
                  });
                },
                icon: Icons.add),
          ]),
        ),
      ],
    );
  }
}
