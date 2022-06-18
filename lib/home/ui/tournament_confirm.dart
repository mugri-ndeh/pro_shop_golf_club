import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/util/constants/palette.dart';
import 'package:pro_shop_golf_club/util/helper/helper.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage(
      {Key? key,
      required this.date,
      required this.club,
      required this.tournament})
      : super(key: key);
  final String date;
  final String club;
  final String tournament;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.scaffoldBg,
        elevation: 0,
        title: const Text(
          'Confirmation',
          style: TextStyle(color: Colors.black),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/golf3.png'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(date + ' 8:00am'),
            const SizedBox(height: 20),
            Text('You are now Joining $tournament'),
            Expanded(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                showAlertDialog(context, 'Success',
                                    'You have successfully joined this tournament');
                              },
                              child: const Text('Confirm')),
                        ),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
