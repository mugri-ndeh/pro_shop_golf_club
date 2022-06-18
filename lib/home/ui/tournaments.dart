import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/auth/widgets/input_fields.dart';
import 'package:pro_shop_golf_club/home/ui/tournamentdetails.dart';
import 'package:pro_shop_golf_club/util/constants/palette.dart';
import 'package:pro_shop_golf_club/util/helper/helper.dart';

class Tournaments extends StatefulWidget {
  Tournaments({Key? key}) : super(key: key);

  @override
  State<Tournaments> createState() => _TournamentsState();
}

class _TournamentsState extends State<Tournaments> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Find the most Exciting',
                            style: TextStyle(fontSize: 20)),
                        Text(
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
                const SizedBox(height: 20),
                InputField(
                  hint: 'Search for games',
                  icon: const Icon(Icons.search),
                ),
                const SizedBox(height: 20),
                const Text('Join Tournaments'),
                const SizedBox(height: 20),
                HomeCard(
                  size: size,
                  title: 'Grand Buea Open',
                  maxPersons: '8',
                  date: 'Monday 13 June',
                  location: 'Buea, Golf club',
                ),
                const SizedBox(height: 20),
                HomeCard(
                  size: size,
                  title: 'The Cameroon Classic',
                  maxPersons: '12',
                  date: 'Tuesday, 14 June',
                  location: 'Buea, Golf club',
                ),
                const SizedBox(height: 20),
                HomeCard(
                  size: size,
                  title: 'Tiko Open',
                  maxPersons: '8',
                  date: 'Monday 13 June',
                  location: 'Buea, Golf club',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
    required this.size,
    required this.title,
    required this.location,
    required this.maxPersons,
    required this.date,
  }) : super(key: key);

  final Size size;
  final String title;
  final String location;
  final String maxPersons;
  final String date;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        push(
            context,
            TournamentDetails(
              size: size,
              title: title,
              location: location,
              maxPersons: maxPersons,
              date: date,
            ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 300,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Palette.primaryGreen.withOpacity(0.4).withOpacity(0.2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
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
            Text('Max $maxPersons persons'),
            const SizedBox(height: 20),
            Row(
              children: [const Icon(Icons.calendar_month_outlined), Text(date)],
            ),
            const SizedBox(height: 20),
            Row(
              children: [const Icon(Icons.location_on), Text(location)],
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
            )
          ],
        ),
      ),
    );
  }
}
