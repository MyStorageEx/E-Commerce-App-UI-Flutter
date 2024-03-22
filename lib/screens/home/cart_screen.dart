import 'package:ecommerce_shopping_app/model/product.dart';
import 'package:ecommerce_shopping_app/screens/detail/payment_method_screen.dart';
import 'package:ecommerce_shopping_app/utils/const.dart';
import 'package:ecommerce_shopping_app/utils/local_storage.dart';
import 'package:ecommerce_shopping_app/widgets/btn/container_button_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<bool> _isCheckedList =
      List.filled(LocalStorage.items.length, false);
  bool _selectAllCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: LocalStorage.items.length,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(
                            splashRadius: 20,
                            activeColor: AssetsCustom.primaryColor,
                            value: _isCheckedList[index],
                            onChanged: (val) {
                              setState(() {
                                _isCheckedList[index] = !_isCheckedList[index];
                              });
                            },
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              LocalStorage.items[index].imageLink,
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LocalStorage.items[index].title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Hooded Jacket",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black26,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "\$${LocalStorage.items[index].price.toInt().toString()}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: AssetsCustom.primaryColor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Icon(
                                CupertinoIcons.minus,
                                color: Colors.greenAccent,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "1",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                CupertinoIcons.plus,
                                color: AssetsCustom.primaryColor,
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Select All",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Checkbox(
                      splashRadius: 20,
                      activeColor: AssetsCustom.primaryColor,
                      value: _selectAllCheck,
                      onChanged: (val) {
                        setState(() {
                          _selectAllCheck = !_selectAllCheck;
                        });
                      },
                    ),
                  ],
                ),
                const Divider(
                  height: 20,
                  thickness: 2,
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Payment",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "\$${totalPaymentCalc(LocalStorage.items)}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: AssetsCustom.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () => moveToPaymentMethodScreen(context),
                  child: ContainerButtonModel(
                    iText: 'Checkout',
                    containerWidth: MediaQuery.of(context).size.width,
                    bgColor: AssetsCustom.primaryColor,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void moveToPaymentMethodScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentMethodScreen(),
      ),
    );
  }

  num totalPaymentCalc(List<Product> items) {
    num total = 0;
    for (Product item in items) {
      total += item.price;
    }
    return total;
  }
}
