import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/auth/auth_provider.dart';
import 'package:pro_shop_golf_club/home/cart/cart_provider.dart';
import 'package:pro_shop_golf_club/home/util/widgets.dart';
import 'package:pro_shop_golf_club/models/product.dart';
import 'package:pro_shop_golf_club/models/user.dart';
import 'package:pro_shop_golf_club/util/constants/palette.dart';
import 'package:pro_shop_golf_club/util/helper/helper.dart';

import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int total = 0;
  getTotal(CartHelper cart) {
    total = 0;
    for (int i = 0; i < cart.cartItems.length; i++) {
      CartItem item = CartItem.fromJson(cart.cartItems[i]);
      Product foodItem = Product.fromJson(item.item!);
      total = total + int.parse(foodItem.price.replaceAll('XAF', '').trim());
    }
    print(total);
  }

  late CartHelper cart;
  late UserModel user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cart = Provider.of<CartHelper>(context, listen: false);
    user = Provider.of<Authentication>(context, listen: false).loggedUser!;
    getTotal(cart);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Consumer<CartHelper>(builder: (_, cart, __) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: cart.cartItems.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      CartItem item = CartItem.fromJson(cart.cartItems[index]);
                      Product foodItem = Product.fromJson(item.item!);
                      print(item.item);
                      return Container(
                        margin: const EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                            color: Palette.white,
                            borderRadius: BorderRadius.circular(24)),
                        height: 100,
                        width: size.width,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: Image.asset(
                                    foodItem.imageUrl,
                                    fit: BoxFit.contain,
                                  )),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      foodItem.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      foodItem.category,
                                      style:
                                          const TextStyle(color: Colors.grey),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      foodItem.price,
                                      style: TextStyle(
                                          color: Palette.primaryGreen),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: SizedBox(
                                  width: 120,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          cart.remove(index);
                                          setState(() {
                                            getTotal(cart);
                                          });
                                        },
                                        icon: const Icon(Icons.close),
                                        color: Palette.primaryGreen,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Quantity: ',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          Text(
                                            item.qty.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          const SizedBox(width: 10),
                                        ],
                                      )
                                    ],
                                  )),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              Text('Total = ' + total.toString() + 'XAF'),
              const SizedBox(height: 10),
              CustomButton(
                  text: 'Checkout',
                  onTap: () async {
                    cart.clearItems();
                    showAlertDialog(context, 'Success',
                        'Your Order has been placed successfully');
                  }),
              const SizedBox(height: 10),
            ],
          );
        }),
      )),
    );
  }
}

class CartItem {
  String id;
  Map<String, dynamic>? item;
  int qty;
  CartItem({
    this.id = '',
    this.item,
    this.qty = 0,
  });
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      qty: json['qty'],
      item: json['item'],
    );
  }

  toJson() {
    return {
      'item': item,
      'qty': qty,
    };
  }
}
