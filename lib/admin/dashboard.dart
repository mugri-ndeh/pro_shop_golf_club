import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/admin/add_product.dart';
import 'package:pro_shop_golf_club/admin/all_products.dart';
import 'package:pro_shop_golf_club/admin/allusers.dart';
import 'package:pro_shop_golf_club/admin/create_pairing.dart';
import 'package:pro_shop_golf_club/models/product.dart';
import 'package:pro_shop_golf_club/models/user.dart';
import 'package:pro_shop_golf_club/util/constants/palette.dart';
import 'package:pro_shop_golf_club/util/helper/helper.dart';

class DashBoard extends StatefulWidget {
  DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

List<UserModel> users = [
  UserModel(
    uid: '72sdwx24-32',
    username: 'Maestro',
    firstName: 'Mugri',
    lastName: 'Ndeh',
    email: 'maestro@gmail.com',
  ),
  UserModel(
    uid: 'asdsax4-32',
    username: 'La Pulga',
    firstName: 'Lionel',
    lastName: 'Messi',
    email: 'messi@gmail.com',
  ),
  UserModel(
    uid: 'mnd7324-32',
    username: 'Pistolero',
    firstName: 'Lius',
    lastName: 'Suarez',
    email: 'suarez@gmail.com',
  ),
  UserModel(
    uid: '7djg324-32',
    username: 'El Nino',
    firstName: 'Fernando',
    lastName: 'Torres',
    email: 'torres@gmail.com',
  ),
  UserModel(
    uid: 'ytj34324-32',
    username: 'Mbe',
    firstName: 'Marcus',
    lastName: 'Rashford',
    email: 'marcus@gmail.com',
  ),
  UserModel(
    uid: '7qw324-32',
    username: 'Suiiiii',
    firstName: 'Cristiano',
    lastName: 'Ronaldo',
    email: 'suiii@gmail.com',
  ),
  UserModel(
    uid: 'sfsd4324-32',
    username: 'StarBor',
    firstName: 'Erling',
    lastName: 'Haaland',
    email: 'haaland@gmail.com',
  ),
];

final List<Product> products = [
  Product(
    id: 1,
    category: 'Golfing bag',
    name: "Golfing bag",
    price: "5000XAF",
    imageUrl: "assets/images/bag.jpg",
  ),
  Product(
    id: 2,
    category: 'Tee',
    name: "Tee",
    price: "5000XAF",
    imageUrl: "assets/images/tee.jpg",
  ),
  Product(
    id: 3,
    category: 'Golf Shirts',
    name: "Golf Shirts",
    price: "5000XAF",
    imageUrl: "assets/images/shirts.jpg",
  ),
  Product(
    id: 4,
    category: 'Multiple Iron',
    name: "Multiple Iron",
    price: "2000XAF",
    imageUrl: "assets/images/set.jpeg",
  ),
  Product(
    id: 5,
    category: 'Small Cart',
    name: "Small Cart",
    price: "300000XAF",
    imageUrl: "assets/images/smallcart.jpg",
  ),
  Product(
    id: 6,
    category: 'Iron',
    name: "Iron",
    price: "50000XAF",
    imageUrl: "assets/images/iron.jpg",
  ),
  Product(
    id: 7,
    category: 'Extended Iron',
    name: "Extended Iron",
    price: "50000XAF",
    imageUrl: "assets/images/iron1.jpg",
  ),
  Product(
    id: 8,
    category: 'Purple glove',
    name: "Purple glove'",
    price: "3500XAF",
    imageUrl: "assets/images/glove1.jpg",
  ),
  Product(
    id: 9,
    category: 'Clothing',
    name: "Black glove",
    price: "35000XAF",
    imageUrl: "assets/images/blackGlove.jpg",
  ),
  Product(
    id: 10,
    category: 'Clothing',
    name: "Big cart",
    price: "100000XAF",
    imageUrl: "assets/images/bigcart.jpg",
  ),
  Product(
    id: 11,
    category: 'Clothing',
    name: "Golf club",
    price: "7000XAF",
    imageUrl: "assets/images/club.png",
  ),
  Product(
    id: 12,
    category: 'Clothing',
    name: "Extended club",
    price: "10000XAF",
    imageUrl: "assets/images/club1.jpg",
  ),
];

List<Map<String, dynamic>> actions = [
  {
    "destination": AddProductsPage(),
    "icon": Icon(
      Icons.add,
      size: 50,
    ),
    "text": "Add Products"
  },
  {
    "destination": AllAdminProducts(
      products: products,
    ),
    "icon": Icon(
      Icons.shop,
      size: 50,
    ),
    "text": "View Products"
  },
  {
    "destination": AllAdminUsers(
      users: users,
    ),
    "icon": Icon(
      Icons.person,
      size: 50,
    ),
    "text": "View Users"
  },
  {
    "destination": CreatePairing(),
    "icon": Icon(
      Icons.add,
      size: 50,
    ),
    "text": "Create Pairing"
  }
];

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.scaffoldBg,
          elevation: 0,
          title: Text(
            'DASHBOARD',
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
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.0,
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          scrollDirection: Axis.vertical,
          itemCount: actions.length,
          itemBuilder: (c, i) => IntrinsicHeight(
            child: GestureDetector(
              onTap: () {
                push(context, actions[i]["destination"]);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white),
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 80,
                    child: Column(
                      children: [
                        Text(
                          actions[i]["text"],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        actions[i]["icon"],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
