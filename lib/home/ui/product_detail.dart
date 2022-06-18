import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/home/cart/cart_provider.dart';
import 'package:pro_shop_golf_club/home/cart/cart_screen.dart';
import 'package:pro_shop_golf_club/models/product.dart';
import 'package:pro_shop_golf_club/util/constants/palette.dart';
import 'package:pro_shop_golf_club/util/helper/helper.dart';

import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250,
                width: size.width,
                child: Stack(
                  children: [
                    CustomContainer(
                      width: size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          widget.product.imageUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: CistomCircularButton(
                        icon: Icons.arrow_back,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        outlined: true,
                      ),
                    )
                  ],
                ),
              ),
              Text(
                widget.product.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.product.price} ',
                    style: TextStyle(
                        color: Palette.primaryGreen,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 100,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CistomCircularButton(
                          icon: Icons.remove,
                          outlined: true,
                          onTap: () {
                            setState(() {
                              if (qty > 1) {
                                qty--;
                              }
                            });
                          },
                        ),
                        Text(
                          '$qty',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        CistomCircularButton(
                          icon: Icons.add,
                          outlined: false,
                          onTap: () {
                            setState(() {
                              qty++;
                            });
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: Consumer<CartHelper>(builder: (_, cart, __) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                    ),
                    onPressed: () {
                      bool onCart = cart.isCartitem(widget.product);
                      if (onCart) {
                        showAlertDialog(
                            context, 'Error', 'Item is already on cart');
                      } else {
                        CartItem item = CartItem(
                          item: widget.product.toJson(),
                          qty: qty,
                          id: (cart.cartItems.length + 1).toString(),
                        );
                        cart.addToCart(item);
                        // showSnackBar(context, 'Item added successfully');
                        showAlertDialog(
                            context, 'Success', 'Item added successfully');
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Icon(
                            Icons.shopping_cart,
                            color: Palette.primaryGreen,
                          ),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Palette.scaffoldBg,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text('Add to cart'),
                      ],
                    ),
                  );
                }),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class CistomCircularButton extends StatelessWidget {
  const CistomCircularButton({
    Key? key,
    required this.outlined,
    required this.onTap,
    required this.icon,
    this.color,
  }) : super(key: key);
  final bool outlined;
  final Function() onTap;
  final Color? color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 30,
          width: 30,
          decoration: outlined
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Palette.primaryGreen),
                  color: Palette.scaffoldBg)
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Palette.primaryGreen),
          child: Icon(
            icon,
            color: outlined ? Palette.primaryGreen : Colors.white,
          )),
    );
  }
}

class CustomContainer extends StatefulWidget {
  const CustomContainer(
      {Key? key, this.height, this.width, this.child, this.padding})
      : super(key: key);
  final double? height;
  final Widget? child;
  final double? width;
  final double? padding;

  @override
  State<CustomContainer> createState() => _CustomContainer();
}

class _CustomContainer extends State<CustomContainer> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: widget.padding == null
            ? EdgeInsets.zero
            : const EdgeInsets.symmetric(horizontal: 4),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 1),
                color: Colors.grey.shade200,
                blurRadius: 18),
          ],
        ),
        child: widget.child);
  }
}
