import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

enum Direction { left, right }

class _HomePageState extends State<HomePage> {
  // player variables
  static double playerX = 0;
  //missile variables
  double missileX = playerX;
  double missileY = 1;
  double missileHeight = 10;
  bool missileShot = false;
  //ball variables
  double ballY = 1;
  double ballX = 0.5;
  var ballDirection = Direction.left;

//convert height to coordinate
  double hieghtToPosition(double height) {
    double totalHeight = MediaQuery.of(context).size.height * 3 / 4;
    double position = 1 - 2 * height / totalHeight;
    return position;
  }

  void moveLeft() {
    setState(() {
      if (playerX - 0.1 < -1) {
      } else {
        playerX -= 0.1;
      }
      //only make the X cordinate the same when it isn't in the middle of a shot
      if (!missileShot) {
        missileX = playerX;
      }
    });
  }

  void moveRight() {
    setState(() {
      if (playerX + 0.1 > 1) {
        //do nothing
      } else {
        playerX += 0.1;
      }
      //only make the X cordinate the same when it isn't in the middle of a shot
      if (!missileShot) {
        missileX = playerX;
      }
    });
  }

  void fireMissile() {
    if (missileShot == false) {
      Timer.periodic(
        const Duration(milliseconds: 30),
        (timer) {
          //shots fired
          missileShot = true;

          //missile grows til it git top of the screen

          setState(
            () {
              missileHeight += 10;
            },
          );
          // stop missile when it is on the top of the screen
          if (missileHeight > MediaQuery.of(context).size.height * 3 / 4) {
            resetMissile();
            timer.cancel();
          }
          // check if missel has hit the ball
          if (ballY > hieghtToPosition(missileHeight) &&
              (ballX - missileX).abs() < 0.03) {
            resetMissile();
            ballX = 5;
            timer.cancel();
          }
        },
      );
    }
  }

  void resetMissile() {
    missileX = playerX;
    missileHeight = 10;
    missileShot = false;
  }

  void startGame() {
    double time = 0;
    double height = 1;
    double velocity = 60; //how strong jump is
    // setState(() {});
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      //upside down parabola(bounce ball)
      height = -5 * time * time + velocity * time;

      if (height < 0) {
        time = 0;
      }

      setState(() {
        ballY = hieghtToPosition(height);
      });

      // if the ball hits the left wall, then change direction
      if (ballX - 0.005 < -1) {
        ballDirection = Direction.right;
      }
      // if the ball hits the left wall, then change direction
      else if (ballX + 0.005 > 1) {
        ballDirection = Direction.left;
      }
      // move the ball in the correct direction
      if (ballDirection == Direction.left) {
        setState(() {
          ballX -= 0.005;
        });
      } else if (ballDirection == Direction.right) {
        setState(() {
          ballX += 0.005;
        });
      }

      //check if the ball hits the player
      if (playerDies()) {
        timer.cancel();
        _showDialog();
      }
      //keep the time going
      time += 0.1;
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          backgroundColor: Colors.grey,
          title: Center(
            child: Text('You Dead,bro'),
          ),
        );
      },
    );
  }

  bool playerDies() {
    //if the ball position and the player position are the same, then player dies
    if ((ballX - playerX).abs() < 0.05 && ballY > 0.95) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (RawKeyEvent event) {
        if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
          moveLeft();
        }
        if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
          moveRight();
        }
        if (event.isKeyPressed(LogicalKeyboardKey.space)) {
          fireMissile();
        }
      },
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.pink[100],
              child: Center(
                child: Stack(
                  children: [
                    MyBall(ballX: ballX, ballY: ballY),
                    MyMissle(
                      missileX: missileX,
                      missileY: missileY,
                      missilHieght: missileHeight,
                    ),
                    MyPlayer(playerX: playerX),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyButton(
                    icon: Icons.play_arrow,
                    event: startGame,
                  ),
                  MyButton(
                    icon: Icons.arrow_left,
                    event: moveLeft,
                  ),
                  MyButton(
                    icon: Icons.arrow_right,
                    event: moveRight,
                  ),
                  MyButton(
                    icon: Icons.arrow_upward,
                    event: fireMissile,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
