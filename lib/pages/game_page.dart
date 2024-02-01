import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tap_race2/pages/winnig_page.dart';
import 'package:tap_race2/provider/car_height_provider.dart';
import 'package:tap_race2/provider/winner_provider.dart';

class GamePage extends ConsumerWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double scwidth = MediaQuery.of(context).size.width;
    double scheight = MediaQuery.of(context).size.height;
    var heightOfCar1 = ref.watch(car1Height);
    var heightOfCar2 = ref.watch(car2Height);
    final AudioPlayer audioPlayer = AudioPlayer();

    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.only(top: 24),
      decoration: const BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage('assets/images/road.jpg'),
      )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: scwidth * 0.33,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () async {
                  await audioPlayer.play(AssetSource("audio/audio1.mp3"));

                  ref.read(car1Height.notifier).state =
                      ref.read(car1Height.notifier).state + 10;

                  if (ref.read(car1Height) >= scheight - 150) {
                    ref.read(winnerProvider.notifier).state = 1;
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const WinningPage()));
                  }
                },
                child: const Image(
                  image: AssetImage("assets/images/car1.png"),
                  width: 55,
                ),
              ),
              SizedBox(
                height: heightOfCar1,
              )
            ],
          ),
          SizedBox(
            width: scwidth * .06,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () async {
                  await audioPlayer.play(AssetSource("audio/audio2.mp3"));
                  ref.read(car2Height.notifier).state =
                      ref.read(car2Height.notifier).state + 10;

                  if (ref.read(car2Height) >= scheight - 150) {
                    ref.read(winnerProvider.notifier).state = 2;
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const WinningPage()));
                  }
                },
                child: const Image(
                  image: AssetImage("assets/images/car2.png"),
                  width: 55,
                ),
              ),
              SizedBox(
                height: heightOfCar2,
              )
            ],
          )
        ],
      ),
    ));
  }
}
