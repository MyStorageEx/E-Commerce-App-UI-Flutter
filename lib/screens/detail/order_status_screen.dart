import 'package:ecommerce_shopping_app/screens/home/navigation_screen.dart';
import 'package:ecommerce_shopping_app/utils/const.dart';
import 'package:ecommerce_shopping_app/widgets/btn/container_button_model.dart';
import 'package:flutter/material.dart';

class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/orderSuccess.png",
                height: 200,
              ),
              const SizedBox(height: 10),
              const Text(
                'Success',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Your order will be delivered soon.',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                'Thank you for choosing our app.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(30),
            child: InkWell(
              onTap: () => moveToNavigationScreen(context),
              child: ContainerButtonModel(
                iText: "Continue Shopping",
                containerWidth: MediaQuery.of(context).size.width,
                bgColor: AssetsCustom.primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  void moveToNavigationScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NavigationScreen(),
      ),
    );
  }
}
