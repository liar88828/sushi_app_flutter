import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/models/food.dart';
import 'package:sushi_app/models/shop.dart';
import 'package:sushi_app/screens/detail_food_screen.dart';
import 'package:sushi_app/screens/trolley_screen.dart';
import 'package:sushi_app/widgets/food_item.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  void navigationToDetail(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailFoodScreen(food: foodMenu[index])));
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    return Scaffold(
      // backgroundColor: Colors.orange,

      appBar: AppBar(
        // backgroundColor: Colors.orange,
        actions: [
          Consumer<Shop>(
              builder: (context, value, child) => IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TrolleyScreen()),
                      );
                    },
                    icon: Badge.count(
                      count: value.lengthCart(),
                      child: Icon(Icons.shopping_cart),
                    ),
                  ))
        ],
        centerTitle: true,
        title: const Text('Menu'),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.,
          children: [
            // card menu promo
            Card(
              color: Colors.orange[100],
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Get 24% Promo',
                          style: GoogleFonts.dmSerifDisplay(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        FilledButton(
                            style: FilledButton.styleFrom(
                                backgroundColor: Colors.orange),
                            onPressed: () {},
                            child: const Row(
                              children: [
                                Text('Redeem'),
                                Icon(Icons.arrow_forward)
                              ],
                            ))
                      ],
                    ),
                    SizedBox(
                        // padding: EdgeInsets.all(10),
                        height: 100,
                        child: Image.asset(
                          'lib/images/maki.png',
                        ))
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // search
            TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search',
                    // border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                          // color: Colors.orange,
                          // width: 2
                          ),
                    ))),
            const SizedBox(height: 20),
            Text(
              'Food Menu',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey[800]),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: foodMenu.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => FoodItem(
                          food: foodMenu[index],
                          navigationToDetail: () => navigationToDetail(index),
                        ))),

            const SizedBox(height: 20),
            Container(
                child: Card(
                    color: Colors.white,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 8),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'lib/images/ebi.png',
                                height: 100,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ebi Furai',
                                      style: GoogleFonts.dmSerifDisplay(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text("\$ 80.00")
                                  ]),
                              IconButton(
                                  style: IconButton.styleFrom(
                                      // fixedSize: Size.square(90)
                                      // backgroundColor: Colors.red
                                      ),
                                  onPressed: () {},
                                  icon: const Icon(Icons.favorite_outline,
                                      size: 30
                                      // color: Colors.white,
                                      ))
                            ])))),

            const SizedBox(height: 20),
            Container(
                child: Card(
                    color: Colors.white,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 8),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'lib/images/maki.png',
                                height: 100,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Salmon Egg',
                                      style: GoogleFonts.dmSerifDisplay(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text("\$ 40.00")
                                  ]),
                              IconButton(
                                  style: IconButton.styleFrom(
                                      // fixedSize: Size.square(90)
                                      // backgroundColor: Colors.red
                                      ),
                                  onPressed: () {},
                                  icon: const Icon(Icons.favorite_outline,
                                      size: 30
                                      // color: Colors.white,
                                      ))
                            ]))))
          ],
        ),
      ),
    );
  }
}
