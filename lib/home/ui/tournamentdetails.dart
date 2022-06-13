import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/util/constants/palette.dart';
import 'package:pro_shop_golf_club/util/helper/helper.dart';

import 'tournament_confirm.dart';

class TournamentDetails extends StatefulWidget {
  const TournamentDetails(
      {Key? key,
      required this.size,
      required this.title,
      required this.location,
      required this.maxPersons,
      required this.date})
      : super(key: key);
  final Size size;
  final String title;
  final String location;
  final String maxPersons;
  final String date;

  @override
  State<TournamentDetails> createState() => _TournamentDetailsState();
}

class _TournamentDetailsState extends State<TournamentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.scaffoldBg,
        elevation: 0,
        title: const Text(
          'Game Details',
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
        child: SingleChildScrollView(
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
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 500,
                width: widget.size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade500.withOpacity(0.1).withOpacity(0.1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(Icons.favorite_outline),
                              Icon(Icons.share)
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text('Max ${widget.maxPersons} persons'),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month_outlined),
                        const SizedBox(width: 5),
                        Text(widget.date)
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Icon(Icons.location_on),
                        const SizedBox(width: 5),
                        Text(widget.location)
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: const [
                        Icon(Icons.check_circle_outline),
                        SizedBox(width: 5),
                        Text('Booked')
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 10,
                          child: CircleAvatar(
                              radius: 28,
                              foregroundColor: Colors.transparent,
                              backgroundColor: Palette.white,
                              child: Image.asset('assets/icons/courses.png')),
                        ),
                        const SizedBox(width: 5),
                        const Text('18 Holes')
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: const [
                        Icon(Icons.attach_money_rounded),
                        SizedBox(width: 5),
                        Text('USD 35')
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          child: CircleAvatar(
                              radius: 28,
                              foregroundColor: Colors.transparent,
                              backgroundColor: Palette.white,
                              child: Image.asset('assets/images/logo.png')),
                        ),
                        const SizedBox(width: 5),
                        const Text('Hosted by'),
                        const SizedBox(width: 5),
                        const Text(
                          'Buea Golf Court Cameroon',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('Joined'),
                            Text('4'),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Guests'),
                            Text('0'),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Slots remaining'),
                            Text('4'),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                push(
                                    context,
                                    ConfirmationPage(
                                      date: widget.date,
                                      club: 'Buea Golf Club',
                                      tournament: widget.title,
                                    ));
                              },
                              child: Text('Join This game')),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
