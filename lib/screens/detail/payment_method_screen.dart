import 'package:ecommerce_shopping_app/model/product.dart';
import 'package:ecommerce_shopping_app/screens/detail/shipping_address_screen.dart';
import 'package:ecommerce_shopping_app/utils/const.dart';
import 'package:ecommerce_shopping_app/utils/local_storage.dart';
import 'package:ecommerce_shopping_app/widgets/btn/container_button_model.dart';
import 'package:ecommerce_shopping_app/widgets/detail/radio_payment_item.dart';
import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int _type = 1;
  num shippingFee = 0;
  num subTotal = 0;
  num totalPayment = 0;

  void _handleRadio(Object? e) {
    setState(() {
      _type = e as int;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    subTotal = totalPaymentCalc(LocalStorage.items) * 0.01;
    shippingFee = totalPaymentCalc(LocalStorage.items) * 0.05;
    totalPayment =
        totalPaymentCalc(LocalStorage.items) + shippingFee + subTotal;

    LocalStorage.subTotal = subTotal;
    LocalStorage.shippingFee = shippingFee;
    LocalStorage.totalPayment = totalPayment;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Method'),
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
                const SizedBox(height: 40),
                RadioButtonItem(
                  value: 1,
                  text: "Amazon Pay",
                  imageAsset: "assets/images/amazonPay.png",
                  groupValue: _type,
                  onChanged: _handleRadio,
                ),
                const SizedBox(height: 15),
                RadioButtonItem(
                  value: 2,
                  text: "Google Pay",
                  imageAsset: "assets/images/gPay.png",
                  groupValue: _type,
                  onChanged: _handleRadio,
                ),
                const SizedBox(height: 15),
                RadioButtonItem(
                  value: 3,
                  text: "Master Card",
                  imageAsset: "assets/images/masterCard.png",
                  groupValue: _type,
                  onChanged: _handleRadio,
                ),
                const SizedBox(height: 15),
                RadioButtonItem(
                  value: 4,
                  text: "Paypal",
                  imageAsset: "assets/images/payPal.png",
                  groupValue: _type,
                  onChanged: _handleRadio,
                ),
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Sub-Total",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "\$$subTotal",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Shipping Fee",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "\$$shippingFee",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 30,
                  thickness: 1,
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Total Payment",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "\$$totalPayment",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AssetsCustom.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 70),
                InkWell(
                  onTap: () => moveToShipingAddressScreen(context),
                  child: ContainerButtonModel(
                    iText: "Confirm Payment",
                    containerWidth: size.width,
                    bgColor: AssetsCustom.primaryColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void moveToShipingAddressScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ShippingAddressScreen(),
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
