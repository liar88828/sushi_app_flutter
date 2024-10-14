import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/models/food.dart';

class FoodItem extends StatelessWidget {
  final Food food;
  final VoidCallback navigationToDetail;

  const FoodItem(
      {super.key, required this.food, required this.navigationToDetail});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 20,
      // height: 80,
      child: InkWell(
        onTap: navigationToDetail,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          // color: Colors.orange[100],
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  width: 200,
                  child: Image.asset(
                    food.image,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    width: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(food.name,
                            style: GoogleFonts.dmSerifDisplay(
                                fontSize: 26, fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("\$ ${food.price}",
                                style:
                                    GoogleFonts.dmSerifDisplay(fontSize: 20)),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.yellow),
                                Text(food.rating,
                                    style: const TextStyle(fontSize: 18))
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
