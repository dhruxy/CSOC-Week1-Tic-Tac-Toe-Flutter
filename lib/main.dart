import 'package:first_app/SelectIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './2player.dart';
import './SelectGameMode.dart';
import './SelectPlayer.dart';
import './SelectIcon.dart';
import './1Player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var player = '2-Player';
  var firstMove = 'N/A';
  var icon = 'N/A';
  final ButtonStyle style1 =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 24));

  void _selectGameModeScreen(BuildContext context) async {
    player = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectGameMode()),
    );

    if (player == '2-Player') {
      firstMove = 'N/A';
      icon = 'N/A';
    }

    if (player == '1-Player') {
      firstMove = 'Player';
      icon = 'X';
    }

    setState(() {
      firstMove = firstMove;
      player = player;
      icon = icon;
    });
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$player')));
  }

  void _selectPlayerScreen(BuildContext context) async {
    firstMove = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectPlayer()),
    );

    if (player == '2-Player') {
      firstMove = 'N/A';
    }

    setState(() {
      firstMove = firstMove;
    });

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$firstMove')));
  }

  void _selectIconScreen(BuildContext context) async {
    icon = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectIcon()),
    );

    if (player == '2-Player') {
      icon = 'N/A';
    }

    setState(() {
      icon = icon;
    });

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$icon')));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(
              'Tic Tac Toe',
            ),
          ),
          body: Column(
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text(
                      'Tic Tac Toe !!',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          fontFamily: 'IndieFlower'),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset("assets/Tic_Tac_Toe.jpeg"),
                      padding: EdgeInsets.only(bottom: 35),
                    ),
                    Container(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Game mode : ',
                          style: const TextStyle(fontSize: 25),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _selectGameModeScreen(context);
                          },
                          child: Row(
                            children: [
                              Text(
                                '$player',
                                style: const TextStyle(fontSize: 25),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                size: 25,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'First Move : ',
                          style: const TextStyle(fontSize: 25),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (player == '1-Player') {
                              _selectPlayerScreen(context);
                            } else {
                              return null;
                            }
                          },
                          child: Row(
                            children: [
                              Text(
                                '$firstMove',
                                style: const TextStyle(fontSize: 25),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                size: 25,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'You are : ',
                          style: const TextStyle(fontSize: 25),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (player == '1-Player') {
                              _selectIconScreen(context);
                            } else {
                              return null;
                            }
                          },
                          child: Row(
                            children: [
                              Text(
                                '$icon',
                                style: const TextStyle(fontSize: 25),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                size: 25,
                                color: Colors.white,
                              )
                            ],
                          ),
                          style: style1,
                        ),
                      ],
                    ),
                    Container(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 80,
                      padding: EdgeInsets.only(top: 10),
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () {
                          if (player == '2-Player') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TwoPlayerScreen()),
                            );
                          } else if (player == '1-Player') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SinglePlayerScreen(firstMove, icon)),
                            );
                          }
                        },
                        child: Text('New Game!'),
                        style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 45),
                            fixedSize: Size.fromRadius(300),
                            shape: const BeveledRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)))),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
