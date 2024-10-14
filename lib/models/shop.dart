import 'package:flutter/material.dart';
import 'package:sushi_app/models/food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _footMenu = [
    Food(
        name: "ebi",
        image: 'lib/images/ebi.png',
        price: "20",
        rating: '5.0',
        description:
            'Ebi furai, also known as ebi fry, is a popular Japanese dish that consists of deep-fried breaded prawns or shrimp. The preparation involves coating the shrimp with panko breadcrumbs and then deep-frying them until golden brown. It is often served with a side of tartar sauce or tonkatsu sauce.'),
    Food(
        name: "maki",
        image: 'lib/images/maki.png',
        price: "50",
        rating: '4.5',
        description:
            'Maki is a type of sushi roll that typically consists of vinegared rice and various ingredients, such as seafood or vegetables, wrapped in a sheet of seaweed called nori. When you take a bite of maki, you can expect a harmonious balance of flavors and textures.'),
    Food(
        name: "nigiri",
        image: 'lib/images/nigiri.png',
        price: "30",
        rating: '2.0',
        description:
            'Nigiri is a type of sushi that consists of a small ball of vinegared rice topped with a delicate piece of raw or cooked seafood, such as salmon, tuna, or shrimp. The word "nigiri" literally means "hand-formed" in Japanese, which reflects the careful preparation and presentation of each piece.'),
    Food(
        name: "temaki",
        image: 'lib/images/temaki.png',
        price: "10",
        rating: '7.0',
        description:
            'Temaki, also known as hand rolls, is a type of Japanese sushi that is shaped like a cone or a cylinder. Unlike maki, which is rolled using a bamboo mat, temaki is hand-rolled by the chef, creating a unique and rustic presentation.'),
  ];

// customer chrt
  List<Food> _cart = [];
  int _cartLength = 0;
  List<Food> get cart => _cart;
  List<Food> get foodMenu => _footMenu;
  int get cartlength => _cartLength;
// add to cart
  void addToCart(Food foodItem, int qty) {
    _cart.add(foodItem);
    notifyListeners();
  }

  // remove from cart
  void removeToCart(Food foodItem) {
    _cart.remove(foodItem);
    lengthCart();
    notifyListeners();
  }

  int lengthCart() {
    _cartLength = _cart.length;
    return _cartLength;
  }
}
