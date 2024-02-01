import 'package:flutter/material.dart';
import 'package:tap_race2/pages/game_page.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.jpg', // Replace with your actual logo image
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 50),
            const Text(
              'TAP RACE',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the game screen
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) => const GamePage()));
              },
              child: const Text(
                'START GAME',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
