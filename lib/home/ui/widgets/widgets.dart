import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/home/ui/product_detail.dart';
import 'package:pro_shop_golf_club/models/product.dart';
import 'package:pro_shop_golf_club/util/constants/palette.dart';
import 'package:pro_shop_golf_club/util/helper/helper.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({Key? key, required this.height})
      : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: height,
      color: Palette.white,
    );
  }
}

class CustomButton extends StatefulWidget {
  const CustomButton({Key? key, required this.child, required this.onTap})
      : super(key: key);
  final Widget child;
  final Function()? onTap;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      width: size.width,
      decoration: BoxDecoration(
          color: Palette.primaryGreen,
          boxShadow: [
            BoxShadow(
              offset: const Offset(2, 5),
              color: Palette.primaryGreen.withOpacity(0.1),
              blurRadius: 15,
            )
          ],
          borderRadius: BorderRadius.circular(32)),
      child: ElevatedButton(
        onPressed: widget.onTap,
        child: Center(child: widget.child),
      ),
    );
  }
}

class CustomHorizontalDivider extends StatelessWidget {
  const CustomHorizontalDivider({Key? key, this.padding}) : super(key: key);
  final double? padding;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 0),
      child: Container(
        width: size.width,
        height: 1,
        color: Colors.grey,
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        push(context, ProductDetail(product: product));
      },
      child: SizedBox(
          height: 240,
          child: Container(
            decoration: BoxDecoration(
                color: isDarkMode(context) ? Palette.black : Palette.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 2.0,
                      spreadRadius: 0.8)
                ]),
            child: Stack(
              // alignment: Alignment.centerRight,
              children: [
                Container(
                  color: Palette.white,
                  height: 140,
                  width: 200,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: Image.asset(
                        product.imageUrl,
                        fit: BoxFit.contain,
                      )),
                ),
                Positioned(
                  top: 140,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    color: isDarkMode(context) ? Palette.black : Palette.white,
                    height: 100,
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          product.price,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
