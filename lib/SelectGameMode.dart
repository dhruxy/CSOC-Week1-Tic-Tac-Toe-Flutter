import 'package:flutter/material.dart';

class SelectGameMode extends StatelessWidget {
  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 45), fixedSize: Size.fromHeight(70));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select game mode '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, '1-Player');
                },
                child: Text('1-Player'),
                style: style,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, '2-Player');
                },
                child: Text('2-Player'),
                style: style,
              ),
            )
          ],
        ),
      ),
    );
  }
}
