import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/home/ui/product_detail.dart';
import 'package:pro_shop_golf_club/home/ui/widgets/widgets.dart';
import 'package:pro_shop_golf_club/models/product.dart';
import 'package:pro_shop_golf_club/util/constants/palette.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({Key? key, required this.products}) : super(key: key);

  final List<Product> products;

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.scaffoldBg,
        elevation: 0,
        title: Text(
          'Products',
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
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.9,
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 12,
                ),
                scrollDirection: Axis.vertical,
                itemCount: widget.products.length,
                itemBuilder: (c, i) => IntrinsicHeight(
                    child: ProductCard(
                  product: widget.products[i],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
