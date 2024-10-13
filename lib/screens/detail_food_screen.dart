import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/models/food.dart';

class DetailFoodScreen extends StatelessWidget {
  const DetailFoodScreen({super.key});

  static Food foodMenu = Food(
      name: "Ebi Furai",
      image: 'lib/images/ebi.png',
      price: "20.00",
      rating: '5.0',
      description:
          'is a breaded and deep-fried prawn dish, of darker and crunchy texture. Traditionally kuruma ebi was used, but many stores have started using cheaper black tiger shrimp.');

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
                  "\$ ${foodMenu.price}",
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
                        onPressed: () {},
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        )),
                    SizedBox(width: 10),
                    Text(
                      3.toString(),
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                        style: IconButton.styleFrom(
                            backgroundColor: Colors.orange[700]),
                        onPressed: () {},
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
                onPressed: () {},
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
                foodMenu.image,
                height: 200,
              ),
            ),
            Row(children: [
              const Icon(Icons.star, color: Colors.yellow),
              Text(foodMenu.rating)
            ]),
            Text(foodMenu.name,
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text('Description',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 10),
            Text(
              textAlign: TextAlign.justify,
              foodMenu.description,
              style: TextStyle(color: Colors.grey[600], height: 2),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
