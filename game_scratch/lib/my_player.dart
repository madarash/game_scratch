import 'package:flutter/material.dart';

class MyPlayer extends StatelessWidget {
  final double playerX;

  const MyPlayer({required this.playerX, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(playerX, 1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: Colors.blue,
          height: 40,
          width: 40,
        ),
      ),
    );
  }
}
