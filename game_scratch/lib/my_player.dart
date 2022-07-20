import 'package:flutter/material.dart';

class MyPlayer extends StatelessWidget {
  final double playerX;

  const MyPlayer({required this.playerX, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(playerX, 1),
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                alignment: Alignment.bottomCenter,
                image: AssetImage('assets/images/character.png'))),
        height: 110,
        width: 80,
      ),
    );
  }
}
