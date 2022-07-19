import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final IconData icon;
  final event;

  const MyButton({
    required this.event,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: event,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 50,
          width: 50,
          color: Colors.black,
          child: Icon(
            icon,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
    );
  }
}
