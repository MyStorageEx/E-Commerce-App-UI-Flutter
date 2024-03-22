import 'package:ecommerce_shopping_app/screens/detail/order_confirm_screen.dart';
import 'package:ecommerce_shopping_app/utils/const.dart';
import 'package:ecommerce_shopping_app/utils/local_storage.dart';
import 'package:ecommerce_shopping_app/widgets/btn/container_button_model.dart';
import 'package:flutter/material.dart';

class ShippingAddressScreen extends StatelessWidget {
  const ShippingAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Shipping Address'),
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Fullname",
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Phone number",
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Address",
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "City",
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "State/Province/Region",
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Zip Code (Postal Code)",
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Country",
                  ),
                ),
                const SizedBox(height: 40),
                InkWell(
                  onTap: () => moveToOrderConfirmScreen(context),
                  child: ContainerButtonModel(
                    iText: "Confirm address",
                    containerWidth: MediaQuery.of(context).size.width,
                    bgColor: AssetsCustom.primaryColor,
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void moveToOrderConfirmScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderConfirmScreen(
          paymentMethodImg: LocalStorage.order_paymentMethod,
          nameUser: LocalStorage.order_userName,
          address: LocalStorage.order_address,
          subTotal: LocalStorage.subTotal,
          shippingFee: LocalStorage.shippingFee,
          totalPayment: LocalStorage.totalPayment,
        ),
      ),
    );
  }
}
