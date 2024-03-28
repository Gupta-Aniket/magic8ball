import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shake/shake.dart';
import 'dart:math';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: ballPage(),
      ),
    ),
  );
}

class ballPage extends StatefulWidget {
  const ballPage({super.key});

  @override
  State<ballPage> createState() => _ballPageState();
}

List<dynamic> s = [
  'Yes',
  'No',
  'Ask again later',
  'Cannot predict now',
  'Dont count on it',
  'Concentrate and ask again',
  'My sources say no',
  'Outlook not so good',
  'Reply hazy, try again',
  'Signs point to yes',
  'Yes, definitely',
  'No, definitely not',
  'Very doubtful',
  'It is certain',
  'Without a doubt',
  'Most likely',
  'Outlook good',
  'Better not tell you now',
  'Yes, in due time',
  'My reply is no'
];

String str = '';

class _ballPageState extends State<ballPage> {
  void showMagic() {
    // playFrom('assets/alert_swoosh.mp3');
    // player.stop();
    // player.play(AssetSource('alert_swoosh.mp3'));
    setState(() {
      int n = Random().nextInt(20);
      // print(s[n]);
      str = s[n];
    });
  }

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();

    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, -0.25),
          radius: 0.8,
          colors: <Color>[
            Colors.white70,
            Colors.black,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image(
                image: ResizeImage(
                    AssetImage(
                      'assets/images/a.png',
                    ),
                    height: 1000,
                    width: 1000,
                    allowUpscaling: true),
              ),
              Positioned(
                left: 130,
                top: 130,
                child: SizedBox(
                  height: 120,
                  width: 150,
                  child: Center(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '$str',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'a',
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 200,
          ),
          ElevatedButton(
            onPressed: () {
              player.stop();

              player.play(AssetSource('alert_swoosh.mp3'));
              showMagic();
            },
            child: const Text(
              'Reveal',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          )
        ],
      ),
    );
  }
}
