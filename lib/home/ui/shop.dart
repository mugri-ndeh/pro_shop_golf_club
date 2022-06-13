import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/home/all_products.dart';
import 'package:pro_shop_golf_club/home/cart/cart_provider.dart';
import 'package:pro_shop_golf_club/home/cart/cart_screen.dart';
import 'package:pro_shop_golf_club/home/ui/widgets/widgets.dart';
import 'package:pro_shop_golf_club/models/product.dart';
import 'package:pro_shop_golf_club/util/constants/palette.dart';
import 'package:pro_shop_golf_club/util/helper/helper.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> imgList = [
    'https://m.media-amazon.com/images/I/71NXSf-hLjL._AC_SL1500_.jpg',
    'https://m.media-amazon.com/images/I/71XHqEy1KPL._AC_SY550._SX._UX._SY._UY_.jpg',
    'https://m.media-amazon.com/images/I/81bqVxhPaTL._AC_SL1500_.jpg',
    'https://m.media-amazon.com/images/I/71DP2fOXDpL._AC_SL1500_.jpg'
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Consumer<CartHelper>(builder: (_, cart, __) {
        return Stack(
          children: [
            FloatingActionButton(
              backgroundColor: Palette.primaryGreen,
              onPressed: () {
                push(context, const CartPage());
              },
              child: Icon(
                Icons.shopping_cart_outlined,
                color: Palette.white,
              ),
              tooltip: 'Cart',
            ),
            Positioned(
                right: 0,
                child: CircleAvatar(
                  radius: 10,
                  child: Text(
                    '${cart.cartItems.length}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        );
      }),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider(
                    items: imgList
                        .map((item) => Center(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: CachedNetworkImage(
                                    imageUrl: item,
                                    fit: BoxFit.cover,
                                  )),
                            ))
                        .toList(),
                    carouselController: _controller,
                    options: CarouselOptions(
                        enableInfiniteScroll: false,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                  Positioned(
                    top: 190,
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                          color: Palette.primaryGreen.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          'latest',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Palette.primaryGreen
                                        : Palette.primaryGreen)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'New Products',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
                TextButton(
                    onPressed: () {
                      push(context, AllProducts(products: products));
                    },
                    child: const Text(
                      'View all',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ))
              ],
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.0,
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                scrollDirection: Axis.vertical,
                itemCount: 4,
                itemBuilder: (c, i) => IntrinsicHeight(
                  child: GestureDetector(
                    onTap: () {},
                    child: ProductCard(product: products[i]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
