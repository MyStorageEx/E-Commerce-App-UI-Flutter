import "package:ecommerce_shopping_app/model/product.dart";
import 'package:ecommerce_shopping_app/widgets/home/home_banner.dart';
import 'package:ecommerce_shopping_app/widgets/home/home_grid_product.dart';
import "package:ecommerce_shopping_app/widgets/home/home_list_product.dart";
import 'package:ecommerce_shopping_app/widgets/home/home_searchbar.dart';
import 'package:ecommerce_shopping_app/widgets/home/home_tabs.dart';
import "package:flutter/material.dart";

class HomeScreen extends StatelessWidget {
  List<String> tabs = ["All", "Category", "Top", "Recommended"];
  List<Product> products = [
    Product(
      id: '1',
      title: "Warm Zipper",
      imageLink: "assets/images/image1.jpg",
      price: 300,
      reviews: 54,
    ),
    Product(
      id: '2',
      title: "Knitted Woo",
      imageLink: "assets/images/image2.jpg",
      price: 650,
      reviews: 120,
    ),
    Product(
        id: '3',
        title: "Zipper Win",
        imageLink: "assets/images/image3.jpg",
        price: 50,
        reviews: 120),
    Product(
      id: '4',
      title: "Child Win",
      imageLink: "assets/images/image4.jpg",
      price: 100,
      reviews: 534,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // ],
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const HomeSearchBar(),
                const SizedBox(height: 20),
                const HomeBanner(imageBanner: "assets/images/freed.png"),
                const SizedBox(height: 20),
                HomeTabs(tabs: tabs),
                const SizedBox(height: 20),
                HomeListProduct(products: products),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Newest Products",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                HomeGridProduct(products: products),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
