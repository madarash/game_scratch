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
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.red,
              spreadRadius: 2,
              blurRadius: 10,
            )
          ],
          image: DecorationImage(
              image: AssetImage('assets/images/ball.png'), fit: BoxFit.cover),
        ),
        width: 20,
        height: 20,
      ),
    );
  }
}
