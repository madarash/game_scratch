import 'package:flutter/material.dart';

class MyMissle extends StatelessWidget {
  const MyMissle(
      {Key? key,
      required this.missileX,
      required this.missileY,
      required this.missilHieght})
      : super(key: key);

  final double missileX;
  final double missileY;
  final double missilHieght;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(missileX, missileY),
      child: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 223, 135, 77),
            spreadRadius: 2,
            blurRadius: 10,
          )
        ], color: Color.fromARGB(255, 197, 115, 47)),
        width: 5,
        height: missilHieght,
      ),
    );
  }
}
