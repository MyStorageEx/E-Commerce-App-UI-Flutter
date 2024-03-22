import 'package:ecommerce_shopping_app/screens/home/cart_screen.dart';
import 'package:ecommerce_shopping_app/utils/const.dart';
import 'package:ecommerce_shopping_app/widgets/btn/container_button_model.dart';
import 'package:flutter/material.dart';

class ProductDetailPopup extends StatelessWidget {
  final iStyle = const TextStyle(
    color: Colors.black87,
    fontWeight: FontWeight.w800,
    fontSize: 18,
  );

  List<Color> clrs = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => Container(
          height: MediaQuery.of(context).size.height / 2.2,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Size: ", style: iStyle),
                        const SizedBox(height: 20),
                        Text("Color: ", style: iStyle),
                        const SizedBox(height: 20),
                        Text("Total: ", style: iStyle),
                        const SizedBox(height: 20),
                      ],
                    ),
                    const SizedBox(width: 30),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 20),
                            Text("S", style: iStyle),
                            const SizedBox(width: 20),
                            Text("M", style: iStyle),
                            const SizedBox(width: 20),
                            Text("L", style: iStyle),
                            const SizedBox(width: 20),
                            Text("XL", style: iStyle),
                            const SizedBox(width: 20),
                            Text("XXL", style: iStyle),
                            const SizedBox(width: 20),
                            Text("XXL", style: iStyle),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            for (var color in clrs)
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const SizedBox(width: 20),
                            Text('-', style: iStyle),
                            const SizedBox(width: 20),
                            Text('1', style: iStyle),
                            const SizedBox(width: 20),
                            Text('+', style: iStyle),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Payment", style: iStyle),
                    const Text(
                      "\$40.00",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AssetsCustom.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () => moveToCartScreen(context),
                  child: ContainerButtonModel(
                    containerWidth: MediaQuery.of(context).size.width,
                    iText: 'Checkout',
                    bgColor: AssetsCustom.primaryColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      child: ContainerButtonModel(
        containerWidth: MediaQuery.of(context).size.width / 1.5,
        iText: "Buy Now",
        bgColor: AssetsCustom.primaryColor,
      ),
    );
  }

  void moveToCartScreen(
    BuildContext context,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartScreen(),
      ),
    );
  }
}
