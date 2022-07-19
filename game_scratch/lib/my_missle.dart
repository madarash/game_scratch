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
        color: Colors.yellow,
        width: 5,
        height: missilHieght,
      ),
    );
  }
}
