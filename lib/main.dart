import 'package:flutter/material.dart';
import 'package:sushi_app/models/shop.dart';
import 'package:sushi_app/screens/detail_food_screen.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/screens/intro_screen.dart';

void main() {
  // runApp(const MyApp());
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: const IntroScreen()

        //  const DetailFoodScreen()

        );
  }
}
