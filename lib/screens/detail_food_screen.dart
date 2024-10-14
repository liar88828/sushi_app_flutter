import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/models/food.dart';
import 'package:sushi_app/models/shop.dart';

class DetailFoodScreen extends StatefulWidget {
  final Food food;
  const DetailFoodScreen({super.key, required this.food});

  @override
  State<DetailFoodScreen> createState() => _DetailFoodScreenState();
}

class _DetailFoodScreenState extends State<DetailFoodScreen> {
  int qtyCount = 0;
  // decrement
  void decrement() {
    setState(() {
      if (qtyCount > 0) {
        qtyCount--;
      }
    });
  }

// increment
  void increment() {
    setState(() {
      qtyCount++;
    });
  }

// add trolley
  void addTrolley() {
    if (qtyCount > 0) {
      final shop = context.read<Shop>();
      shop.addToCart(widget.food, qtyCount);
      // Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Success"),
          content: const Text("Added to cart"),
          actions: [
            // will close dialog
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.done)),
            // const Text("Added to cart"),
            // will redirect
            //   TextButton(
            //       onPressed: () {
            //         Navigator.pop(context);
            //       },
            //       child: const Text("OK"))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 150,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        color: Colors.orange,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$ ${widget.food.price}",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Row(
                  children: [
                    IconButton(
                        style: IconButton.styleFrom(
                            backgroundColor: Colors.orange[700]),
                        onPressed: decrement,
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        )),
                    SizedBox(width: 10),
                    Text(
                      qtyCount.toString(),
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                        style: IconButton.styleFrom(
                            backgroundColor: Colors.orange[700]),
                        onPressed: increment,
                        icon: const Icon(Icons.add, color: Colors.white))
                  ],
                )
              ],
            ),
            SizedBox(height: 10),
            FilledButton(
                style: FilledButton.styleFrom(
                  fixedSize: Size(double.maxFinite, 50),
                  backgroundColor: Colors.orange[700],
                ),
                onPressed: addTrolley,
                child: const Text(
                  'Add To Cart',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ))
          ],
        ),
      ),
      appBar: AppBar(
          leading: const BackButton(),
          centerTitle: true,
          title: const Text('Detail Food')),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                widget.food.image,
                height: 200,
              ),
            ),
            Row(children: [
              const Icon(Icons.star, color: Colors.yellow),
              Text(widget.food.rating)
            ]),
            Text(widget.food.name,
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text('Description',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 10),
            Text(
              textAlign: TextAlign.justify,
              widget.food.description,
              style: TextStyle(color: Colors.grey[600], height: 2),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
