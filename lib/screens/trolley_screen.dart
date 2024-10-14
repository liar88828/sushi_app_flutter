import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/models/food.dart';
import 'package:sushi_app/models/shop.dart';

class TrolleyScreen extends StatefulWidget {
  const TrolleyScreen({super.key});

  @override
  State<TrolleyScreen> createState() => _TrolleyScreenState();
}

class _TrolleyScreenState extends State<TrolleyScreen> {
  @override
  Widget build(BuildContext context) {
    // final shop = context.read<Shop>();
    // final cart = shop.cart;
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            leading: BackButton(),
            title: Text('My Cart'),
          ),
          body: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: value.cart.length,
              itemBuilder: (context, index) {
                final Food food = value.cart[index];
                return Card(
                  color: Colors.grey[200],
                  child: ListTile(
                    trailing: IconButton(
                        onPressed: () => value.removeToCart(food),
                        icon: const Icon(Icons.delete)),
                    title: Text(
                      food.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(food.price.toString()),
                  ),
                );
              })),
    );
  }
}
