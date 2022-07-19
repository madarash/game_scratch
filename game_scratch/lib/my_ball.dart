import 'package:flutter/material.dart';

class MyBall extends StatelessWidget {
  final double ballY;
  final double ballX;

  const MyBall({required this.ballX, required this.ballY, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(ballX, ballY),
      child: Container(
        width: 20,
        height: 20,
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
