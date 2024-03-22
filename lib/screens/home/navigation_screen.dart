import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ecommerce_shopping_app/screens/home/cart_screen.dart';
import 'package:ecommerce_shopping_app/screens/home/favorites_screen.dart';
import 'package:ecommerce_shopping_app/screens/home/home_screen.dart';
import 'package:ecommerce_shopping_app/screens/home/profile_screen.dart';
import 'package:ecommerce_shopping_app/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int pageIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    CartScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  List<IconData> iconPages = [
    CupertinoIcons.home,
    CupertinoIcons.cart,
    CupertinoIcons.square_favorites,
    CupertinoIcons.profile_circled,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Colors.blueGrey.withOpacity(0.1),
        icons: iconPages,
        activeIndex: pageIndex,
        inactiveColor: Colors.black.withOpacity(0.4),
        activeColor: AssetsCustom.primaryColor,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        iconSize: 25,
        elevation: 0,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
      floatingActionButton: SafeArea(
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AssetsCustom.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(45),
          ),
          child: const Icon(
            Icons.qr_code,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
