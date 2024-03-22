import '../model/product.dart';

class LocalStorage {
  static List<Product> items = [
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

  // static int radioGroupPayment = 1;
  static String order_address =
      "3 Newbridge Court, Chino Hills, CA, 97545, United States";
  static String order_userName = "Tran Nguyen Loc";
  static String order_paymentMethod = "assets/images/masterCard.png";
  static num subTotal = 0;
  static num shippingFee = 0;
  static num totalPayment = 0;
}
