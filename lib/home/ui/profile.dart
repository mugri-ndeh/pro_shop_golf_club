import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/auth/auth_provider.dart';
import 'package:pro_shop_golf_club/home/ui/widgets/widgets.dart';
import 'package:pro_shop_golf_club/util/constants/palette.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<Authentication>(
        builder: (_, auth, __) => SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Positioned(
                  top: 50,
                  child: Container(
                    height: size.height,
                    width: size.width * 0.9,
                    decoration: decoration,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 70.0),
                      child: Column(
                        children: [
                          Text(
                              '${auth.loggedUser!.firstName} ${auth.loggedUser!.lastName}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          Text(
                            '@${auth.loggedUser!.username}',
                          ),
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
                                    children: const [
                                      Text(
                                        '95',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('Avg score'),
                                    ],
                                  ),
                                  const CustomVerticalDivider(height: 25),
                                  Column(
                                    children: const [
                                      Text('21',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text('Rounds'),
                                    ],
                                  ),
                                  const CustomVerticalDivider(height: 25),
                                  Column(
                                    children: const [
                                      Text('28',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text('Handicap'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text('User information')),
                          ),
                          const SizedBox(height: 4),
                          const CustomHorizontalDivider(
                            padding: 8,
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.phone_outlined,
                              color: Palette.black,
                            ),
                            title: Text(
                              auth.loggedUser!.phoneNumber,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.mail_outline,
                              color: Palette.black,
                            ),
                            title: Text(
                              auth.loggedUser!.email,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.calendar_month_outlined,
                              color: Palette.black,
                            ),
                            title: Text(
                              auth.loggedUser!.dob,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Other information')),
                          ),
                          const SizedBox(height: 4),
                          const CustomHorizontalDivider(
                            padding: 8,
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.wallet_membership_outlined,
                              color: Palette.black,
                            ),
                            title: Text('Membership'),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.help_outline,
                              color: Palette.black,
                            ),
                            title: Text(
                              'Help',
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.privacy_tip_outlined,
                              color: Palette.black,
                            ),
                            title: Text(
                              'Privacy Policy',
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.document_scanner_outlined,
                              color: Palette.black,
                            ),
                            title: Text(
                              'Terms of use',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: CircleAvatar(
                    backgroundColor: Palette.secondaryColor
                        .withOpacity(0.4)
                        .withOpacity(0.1),
                    radius: 50,
                    child: Image.asset(
                      'assets/images/golf1.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  var decoration = BoxDecoration(
    color: Palette.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        offset: Offset(2, 4),
        blurStyle: BlurStyle.outer,
        blurRadius: 10,
        spreadRadius: 3,
        color: Color.fromARGB(255, 228, 222, 222).withOpacity(0.2),
      ),
    ],
  );
}
