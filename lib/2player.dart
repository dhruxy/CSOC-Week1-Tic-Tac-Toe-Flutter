import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TwoPlayerScreen extends StatefulWidget {
  const TwoPlayerScreen({Key? key}) : super(key: key);

  @override
  TwoPlayerScreenState createState() => TwoPlayerScreenState();
}

class TwoPlayerScreenState extends State<TwoPlayerScreen> {
  final ButtonStyle style2 = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 40),
      fixedSize: Size.fromRadius(0),
      primary: Colors.blue[50],
      onPrimary: Colors.blue,
      shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0))));
  int xWins = 0;
  int oWins = 0;
  bool turnO = false;
  int filledBoxes = 0;
  final List<String> matrix = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                clearBoard();
              },
            )
          ],
          title: Text(
            'Tic Tac Toe',
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
          ),
        ),
        body: Column(
          children: [
            buildPointsTable(),
            buildGrid(),
            buildTurn(),
            Container(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('EXIT'),
                style: style2,
              ),
            ),
            Container(
              height: 60,
            )
          ],
        ),
      ),
    );
  }

  Widget buildPointsTable() {
    return Expanded(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                right: 20.0,
                left: 20.0,
              ),
              child: Column(
                children: [
                  Text(
                    'Player O',
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'IndieFlower',
                    ),
                  ),
                  Text(
                    oWins.toString(),
                    style: const TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IndieFlower',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                right: 20.0,
                left: 20.0,
              ),
              child: Column(
                children: [
                  Text(
                    'Player X',
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'IndieFlower',
                    ),
                  ),
                  Text(
                    xWins.toString(),
                    style: const TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IndieFlower',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildGrid() {
    return Expanded(
      flex: 3,
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              tapped(0);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: matrix[0] == 'X' ? Colors.blue : Colors.blue[50],
              ),
              height: double.infinity,
              alignment: Alignment.center,
              child: Text(
                matrix[0],
                style: TextStyle(
                    color: matrix[0] == 'X' ? Colors.blue[50] : Colors.blue,
                    fontSize: 85),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              tapped(1);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: matrix[1] == 'X' ? Colors.blue : Colors.blue[50],
              ),
              height: double.infinity,
              alignment: Alignment.center,
              child: Text(
                matrix[1],
                style: TextStyle(
                  color: matrix[1] == 'X' ? Colors.blue[50] : Colors.blue,
                  fontSize: 85,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              tapped(2);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: matrix[2] == 'X' ? Colors.blue : Colors.blue[50],
              ),
              height: double.infinity,
              alignment: Alignment.center,
              child: Text(
                matrix[2],
                style: TextStyle(
                    color: matrix[2] == 'X' ? Colors.blue[50] : Colors.blue,
                    fontSize: 85),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              tapped(3);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: matrix[3] == 'X' ? Colors.blue : Colors.blue[50],
              ),
              height: double.infinity,
              alignment: Alignment.center,
              child: Text(
                matrix[3],
                style: TextStyle(
                    color: matrix[3] == 'X' ? Colors.blue[50] : Colors.blue,
                    fontSize: 85),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              tapped(4);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: matrix[4] == 'X' ? Colors.blue : Colors.blue[50],
              ),
              height: double.infinity,
              alignment: Alignment.center,
              child: Text(
                matrix[4],
                style: TextStyle(
                    color: matrix[4] == 'X' ? Colors.blue[50] : Colors.blue,
                    fontSize: 85),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              tapped(5);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: matrix[5] == 'X' ? Colors.blue : Colors.blue[50],
              ),
              height: double.infinity,
              alignment: Alignment.center,
              child: Text(
                matrix[5],
                style: TextStyle(
                    color: matrix[5] == 'X' ? Colors.blue[50] : Colors.blue,
                    fontSize: 85),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              tapped(6);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: matrix[6] == 'X' ? Colors.blue : Colors.blue[50],
              ),
              height: double.infinity,
              alignment: Alignment.center,
              child: Text(
                matrix[6],
                style: TextStyle(
                    color: matrix[6] == 'X' ? Colors.blue[50] : Colors.blue,
                    fontSize: 85),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              tapped(7);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: matrix[7] == 'X' ? Colors.blue : Colors.blue[50],
              ),
              height: double.infinity,
              alignment: Alignment.center,
              child: Text(
                matrix[7],
                style: TextStyle(
                    color: matrix[7] == 'X' ? Colors.blue[50] : Colors.blue,
                    fontSize: 85),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              tapped(8);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: matrix[8] == 'X' ? Colors.blue : Colors.blue[50],
              ),
              height: double.infinity,
              alignment: Alignment.center,
              child: Text(
                matrix[8],
                style: TextStyle(
                    color: matrix[8] == 'X' ? Colors.blue[50] : Colors.blue,
                    fontSize: 85),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTurn() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            turnO ? 'Turn of O' : 'Turn of X',
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  void tapped(int index) {
    setState(() {
      if (turnO && matrix[index] == '') {
        matrix[index] = 'O';
        filledBoxes += 1;
        turnO = !turnO;
        checkTheWinner();
      } else if (!turnO && matrix[index] == '') {
        matrix[index] = 'X';
        filledBoxes += 1;
        turnO = !turnO;
        checkTheWinner();
      }
    });
  }

  void checkTheWinner() {
    // check first row
    if (matrix[0] == matrix[1] && matrix[0] == matrix[2] && matrix[0] != '') {
      showAlertDialog('Winner', matrix[0]);
      return;
    }

    // check second row
    if (matrix[3] == matrix[4] && matrix[3] == matrix[5] && matrix[3] != '') {
      showAlertDialog('Winner', matrix[3]);
      return;
    }

    // check third row
    if (matrix[6] == matrix[7] && matrix[6] == matrix[8] && matrix[6] != '') {
      showAlertDialog('Winner', matrix[6]);
      return;
    }

    // check first column
    if (matrix[0] == matrix[3] && matrix[0] == matrix[6] && matrix[0] != '') {
      showAlertDialog('Winner', matrix[0]);
      return;
    }

    // check second column
    if (matrix[1] == matrix[4] && matrix[1] == matrix[7] && matrix[1] != '') {
      showAlertDialog('Winner', matrix[1]);
      return;
    }

    // check third column
    if (matrix[2] == matrix[5] && matrix[2] == matrix[8] && matrix[2] != '') {
      showAlertDialog('Winner', matrix[2]);
      return;
    }

    // check diagonal
    if (matrix[0] == matrix[4] && matrix[0] == matrix[8] && matrix[0] != '') {
      showAlertDialog('Winner', matrix[0]);
      return;
    }

    // check diagonal
    if (matrix[2] == matrix[4] && matrix[2] == matrix[6] && matrix[2] != '') {
      showAlertDialog('Winner', matrix[2]);
      return;
    }

    if (filledBoxes == 9) {
      showAlertDialog('Draw', '');
    }
  }

  void showAlertDialog(String title, String winner) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('$title'),
        content: Text(winner == ''
            ? 'The match ended in a draw'
            : 'The winner is ${winner.toUpperCase()}'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              clearBoard();
            },
            child: const Text('Rematch'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              clearBoard();
            },
            child: const Text('Exit'),
          ),
        ],
      ),
    );

    if (winner == 'O') {
      oWins += 1;
    } else if (winner == 'X') {
      xWins += 1;
    }
  }

  void clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        matrix[i] = '';
      }
    });
    filledBoxes = 0;
    turnO = false;
  }
}
