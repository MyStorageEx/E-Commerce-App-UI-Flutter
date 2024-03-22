import 'package:ecommerce_shopping_app/utils/const.dart';
import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          height: 50,
          width: MediaQuery.of(context).size.width / 1.5,
          decoration: BoxDecoration(
            color: Colors.black12.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black12.withOpacity(0.05),
            //     blurRadius: 2,
            //     spreadRadius: 1,
            //   ),
            // ],
          ),
          child: TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: AssetsCustom.primaryColor,
                ),
                border: InputBorder.none,
                hintText: "Find your product"),
          ),
        ),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width / 6,
          decoration: BoxDecoration(
            color: Colors.black12.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black12.withOpacity(0.05),
            //     blurRadius: 2,
            //     spreadRadius: 1,
            //   ),
            // ],
          ),
          child: const Center(
            child: Icon(
              Icons.notifications_none,
              color: AssetsCustom.primaryColor,
            ),
          ),
        )
      ],
    );
  }
}
