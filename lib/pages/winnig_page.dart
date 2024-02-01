import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tap_race2/pages/start_page.dart';
import 'package:tap_race2/provider/car_height_provider.dart';
import 'package:tap_race2/provider/winner_provider.dart';

class WinningPage extends ConsumerWidget {
  const WinningPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Image image = ref.read(winnerProvider) == 1
        ? Image.asset(
            "assets/images/car1.png",
          )
        : Image.asset("assets/images/car2.png");
    String winner =
        ref.read(winnerProvider) == 1 ? "SEXY FEMALE !" : "SEXY MALE!";
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 300, child: image),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "winner is ",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              winner,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  ref.read(car1Height.notifier).state = 0;
                  ref.read(car2Height.notifier).state = 0;

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const StartingPage())));
                },
                child: const Text("Play Again ==>>"))
          ],
        ),
      ),
    );
  }
}
