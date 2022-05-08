import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/auth/auth_provider.dart';
import 'package:pro_shop_golf_club/home/ui/base.dart';
import 'package:pro_shop_golf_club/home/ui/widgets/widgets.dart';
import 'package:pro_shop_golf_club/util/constants/palette.dart';
import 'package:provider/provider.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: SafeArea(
        child: Consumer<Authentication>(builder: (_, auth, __) {
          return Stack(
            children: [
              ClipRRect(
                  child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Palette.white.withOpacity(0.4)),
                ),
              )),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          child: Image.asset('assets/images/golf1.png'),
                          backgroundColor: Palette.secondaryColor
                              .withOpacity(0.4)
                              .withOpacity(0.1),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Good day',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '@${auth.loggedUser!.username}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const CustomHorizontalDivider(padding: 8),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('User setting')),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Card(
                      color: Palette.white.withOpacity(0.3),
                      elevation: 0,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.person_outlined,
                              color: Palette.black,
                            ),
                            title: Text(
                              'Profile',
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.card_membership_outlined,
                              color: Palette.black,
                            ),
                            title: Text(
                              'Membership',
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.abc_outlined,
                              color: Palette.black,
                            ),
                            title: Text(
                              'About',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Card(
                      color: Palette.white.withOpacity(0.3),
                      elevation: 0,
                      child: Column(
                        children: [
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
                              'Terms of use',
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.document_scanner_outlined,
                              color: Palette.black,
                            ),
                            title: Text(
                              'Privacy policy',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Consumer<Authentication>(builder: (_, auth, __) {
                          return ListTile(
                            onTap: () {
                              auth.logout();
                            },
                            leading: Icon(
                              Icons.logout_outlined,
                              color: Palette.primaryGreen,
                            ),
                            title: const Text(
                              'Log Out',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          );
                        })),
                  )
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> with TickerProviderStateMixin {
  bool sideBarActive = false;
  late AnimationController rotationController;
  @override
  void initState() {
    rotationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(60)),
                        color: Theme.of(context).backgroundColor),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border:
                                    Border.all(color: const Color(0xffD8D9E4))),
                            child: CircleAvatar(
                              radius: 22.0,
                              backgroundColor:
                                  Theme.of(context).backgroundColor,
                              child: ClipRRect(
                                child: Image.asset('assets/images/golf1.png'),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Carol Black",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Text(
                                "Seattle Washington",
                                style: Theme.of(context).textTheme.bodyText1,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    navigatorTitle("Home", true),
                    navigatorTitle("Profile", false),
                    navigatorTitle("Accounts", false),
                    navigatorTitle("Transactions", false),
                    navigatorTitle("Stats", false),
                    navigatorTitle("Settings", false),
                    navigatorTitle("Help", false),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Icon(
                      Icons.power_settings_new,
                      size: 24,
                      color: Theme.of(context).iconTheme.color,
                      // color: sideBarActive ? Colors.black : Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Logout",
                      style: Theme.of(context).textTheme.headline6,
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Ver 2.0.1",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              )
            ],
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: (sideBarActive) ? MediaQuery.of(context).size.width * 0.6 : 0,
            top: (sideBarActive) ? MediaQuery.of(context).size.height * 0.2 : 0,
            child: RotationTransition(
              turns: (sideBarActive)
                  ? Tween(begin: -0.05, end: 0.0).animate(rotationController)
                  : Tween(begin: 0.0, end: -0.05).animate(rotationController),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: (sideBarActive)
                    ? MediaQuery.of(context).size.height * 0.7
                    : MediaQuery.of(context).size.height,
                width: (sideBarActive)
                    ? MediaQuery.of(context).size.width * 0.8
                    : MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: sideBarActive
                      ? const BorderRadius.all(Radius.circular(40))
                      : const BorderRadius.all(Radius.circular(0)),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: sideBarActive
                      ? const BorderRadius.all(Radius.circular(40))
                      : const BorderRadius.all(Radius.circular(0)),
                  child: BaseScreen(),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 20,
            child: (sideBarActive)
                ? IconButton(
                    padding: const EdgeInsets.all(30),
                    onPressed: closeSideBar,
                    icon: Icon(
                      Icons.close,
                      color: Theme.of(context).iconTheme.color,
                      size: 30,
                    ),
                  )
                : InkWell(
                    onTap: openSideBar,
                    child: Container(
                      margin: const EdgeInsets.all(17),
                      height: 30,
                      width: 30,
                    ),
                  ),
          )
        ],
      ),
    );
  }

  Row navigatorTitle(String name, bool isSelected) {
    return Row(
      children: [
        (isSelected)
            ? Container(
                width: 5,
                height: 40,
                color: const Color(0xffffac30),
              )
            : const SizedBox(
                width: 5,
                height: 40,
              ),
        const SizedBox(
          width: 10,
          height: 45,
        ),
        Text(
          name,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontSize: 16,
                fontWeight: (isSelected) ? FontWeight.w700 : FontWeight.w400,
              ),
        ),
      ],
    );
  }

  void closeSideBar() {
    sideBarActive = false;
    setState(() {});
  }

  void openSideBar() {
    sideBarActive = true;
    setState(() {});
  }
}
