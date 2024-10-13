import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(
            'SUSHI APP',
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 28, color: Colors.white, //fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Image.asset('lib/images/maki.png'),
              ),
              const SizedBox(height: 40),
              Text(
                'THE BEST RESTAURANT OF JAPANESE FOOD',
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 34, color: Colors.white),
              ),
              const SizedBox(height: 20),
              Text(
                  'Feel the taste of Japanese cuisine here in Sushi App ! Enjoy the best sushi in town with Sushi App !',
                  style: TextStyle(color: Colors.grey[300], height: 2)),
              const SizedBox(height: 20),
              FilledButton(
                style: FilledButton.styleFrom(
                    fixedSize: const Size.fromHeight(50),
                    backgroundColor: Colors.orange[700]),
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Get Statrted'),
                    Icon(Icons.arrow_right),
                  ],
                ),
              )
            ])));
  }
}
