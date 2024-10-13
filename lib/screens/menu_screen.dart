import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/models/food.dart';
import 'package:sushi_app/widgets/food_item.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List foodMenu = [
    Food(name: "ebi", image: 'lib/images/ebi.png', price: "20", rating: '5.0'),
    Food(
        name: "maki", image: 'lib/images/maki.png', price: "50", rating: '4.5'),
    Food(
        name: "nigiri",
        image: 'lib/images/nigiri.png',
        price: "30",
        rating: '2.0'),
    Food(
        name: "temaki",
        image: 'lib/images/temaki.png',
        price: "10",
        rating: '7.0'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.orange,
      appBar: AppBar(
        // backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text('Menu'),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
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
                        SizedBox(height: 10),
                        FilledButton(
                            style: FilledButton.styleFrom(
                                backgroundColor: Colors.orange),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text('Redeem'),
                                Icon(Icons.arrow_forward)
                              ],
                            ))
                      ],
                    ),
                    Container(
                        // padding: EdgeInsets.all(10),
                        height: 100,
                        child: Image.asset(
                          'lib/images/maki.png',
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // search
            TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    // border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          // color: Colors.orange,
                          // width: 2
                          ),
                    ))),
            SizedBox(height: 20),
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
                        ))),

            SizedBox(height: 20),
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
                                    Text("\$ 80.00")
                                  ]),
                              IconButton(
                                  style: IconButton.styleFrom(
                                      // fixedSize: Size.square(90)
                                      // backgroundColor: Colors.red
                                      ),
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite_outline, size: 30
                                      // color: Colors.white,
                                      ))
                            ])))),

            SizedBox(height: 20),
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
                                    Text("\$ 40.00")
                                  ]),
                              IconButton(
                                  style: IconButton.styleFrom(
                                      // fixedSize: Size.square(90)
                                      // backgroundColor: Colors.red
                                      ),
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite_outline, size: 30
                                      // color: Colors.white,
                                      ))
                            ]))))
          ],
        ),
      ),
    );
  }
}
