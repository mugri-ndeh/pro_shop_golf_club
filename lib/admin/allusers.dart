import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/home/ui/widgets/widgets.dart';
import 'package:pro_shop_golf_club/models/product.dart';
import 'package:pro_shop_golf_club/models/user.dart';
import 'package:pro_shop_golf_club/util/constants/palette.dart';

class AllAdminUsers extends StatefulWidget {
  const AllAdminUsers({Key? key, required this.users}) : super(key: key);

  final List<UserModel> users;

  @override
  State<AllAdminUsers> createState() => _AllAdminUsersState();
}

class _AllAdminUsersState extends State<AllAdminUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.scaffoldBg,
        elevation: 0,
        title: Text(
          'Users',
          style: const TextStyle(color: Colors.black),
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: widget.users.length,
                itemBuilder: (c, i) => IntrinsicHeight(
                    child: UserCard(
                  user: widget.users[i],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.user}) : super(key: key);
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 70,
      // width: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/user2.jpg'),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "username: ${user.username}",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Text("firstname: ${user.firstName}"),
              Text("lastname: ${user.lastName}"),
            ],
          ),
        ],
      ),
    );
  }
}
