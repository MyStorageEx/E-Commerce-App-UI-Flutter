import 'package:ecommerce_shopping_app/screens/auth/login_screen.dart';
import 'package:ecommerce_shopping_app/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
      bodyTextStyle: TextStyle(fontSize: 18),
      bodyPadding: EdgeInsets.fromLTRB(16, 16, 16, 16),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      showSkipButton: false,
      showDoneButton: false,
      showBackButton: true,
      showNextButton: true,
      back: const Text(
        'Back',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: AssetsCustom.primaryColor,
        ),
      ),
      next: const Text(
        'Next',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: AssetsCustom.primaryColor,
        ),
      ),
      done: const Text(
        'Done',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: AssetsCustom.primaryColor,
        ),
      ),
      skip: const Text(
        'Skip',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: AssetsCustom.primaryColor,
        ),
      ),
      onDone: () {},
      onSkip: () {},
      dotsDecorator: DotsDecorator(
          size: const Size.square(10),
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3),
          activeSize: const Size(20, 10),
          activeColor: AssetsCustom.primaryColor,
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          )),
      pages: [
        PageViewModel(
          title: "Show Now",
          body:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
          image: Image.asset("assets/images/splash_1.png", width: 200),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Big Discount",
          body: "🎉 Exciting news! Get ready for our OPENSHOP event! "
              "🎉 Enjoy incredible savings and unbeatable prices on your favorite products. "
              "This is your chance to shop smart and make the most of exclusive discounts. "
              "From fashion to electronics, find everything you need at prices that will leave you smiling. "
              "Don't miss out on the opportunity to grab big savings. "
              "It's time to shop with joy during our OPENSHOP sale! 🛍️",
          image: Image.asset("assets/images/splash_2.png", width: 200),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Free Delivery",
          body: "Enjoy the luxury of free delivery on all orders! 🚚🎉 "
              "Shop now and experience hassle-free shopping at its best. "
              "No more delivery charges – just great deals delivered to your doorstep. "
              "Shop smart, shop with us! 🛍️ #FreeDelivery #ShopSmart",
          image: Image.asset("assets/images/splash_3.png", width: 200),
          decoration: pageDecoration,
          footer: Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
            child: ElevatedButton(
              onPressed: () => moveToLogInScreen(context),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(55),
                backgroundColor: AssetsCustom.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Let's Shopping",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void moveToLogInScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }
}
