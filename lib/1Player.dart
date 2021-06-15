import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SinglePlayerScreen extends StatefulWidget {
  final String icon;
  final String player;
  const SinglePlayerScreen(this.player, this.icon);

  @override
  SinglePlayerScreenState createState() =>
      SinglePlayerScreenState(this.player, this.icon);
}

class SinglePlayerScreenState extends State<SinglePlayerScreen> {
  final ButtonStyle style2 = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 40),
    fixedSize: Size.fromWidth(600),
    shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0))),
  );
  final ButtonStyle style3 = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 40),
      fixedSize: Size.fromWidth(600),
      primary: Colors.blue[50],
      onPrimary: Colors.blue,
      shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0))));

  String icon;
  String player;

  SinglePlayerScreenState(this.player, this.icon);
  String playerIcon = 'X';
  String computerIcon = 'O';
  void setIcon(icon) {
    if (icon == 'X') {
      playerIcon = 'X';
      computerIcon = 'O';
    } else {
      playerIcon = 'O';
      computerIcon = 'X';
    }
  }

  int flag = 0;
  int check = 0;
  int playerWins = 0;
  int computerWins = 0;
  bool turnPlayer = true;
  bool turnComputer = false;
  void setFisrtTrun(player) {
    if (player == 'Player') {
      turnPlayer = true;
      turnComputer = false;
    } else {
      turnPlayer = false;
      turnComputer = true;
    }
  }

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
            Container(
              height: 4,
            ),
            Container(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('EXIT'),
                style: style3,
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
                    'Player',
                    style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'IndieFlower',
                    ),
                  ),
                  Text(
                    playerWins.toString(),
                    style: const TextStyle(
                      fontSize: 45.0,
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
                    'Computer',
                    style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'IndieFlower',
                    ),
                  ),
                  Text(
                    computerWins.toString(),
                    style: const TextStyle(
                      fontSize: 45.0,
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
    if (flag == 0) {
      return Container(
        padding: EdgeInsets.only(bottom: 4),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              'Press Start To Play',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            Container(
              height: 200,
            ),
            Container(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setIcon(icon);
                  setFisrtTrun(player);
                  flag = 1;
                  setState(() {
                    buildGrid();
                  });
                  if (player == 'Computer') {
                    setState(() {
                      move(0);
                    });
                  }
                  print('$icon');
                  print('$player');
                },
                child: Text('START'),
                style: style2,
              ),
            ),
          ],
        ),
      );
    } else {
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
                move(0);
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
                move(1);
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
                move(2);
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
                move(3);
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
                move(4);
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
                move(5);
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
                move(6);
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
                move(7);
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
                move(8);
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
  }

  void computerMove(int i) {
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        matrix[i] = computerIcon;
        filledBoxes += 1;
        turnPlayer = !turnPlayer;
        checkTheWinner1(matrix);
      });
    });
  }

  void move(int index) {
    setState(() {
      if (matrix[index] == '' && !checkTheWinner(matrix)) {
        if (turnPlayer) {
          matrix[index] = playerIcon;
          turnPlayer = !turnPlayer;
          filledBoxes += 1;
          checkTheWinner1(matrix);
        }
        if (!checkTheWinner(matrix)) {
          computerMove(findBestMove(matrix));
          print("hello");
        }
      }
    });
  }

  bool checkTheWinner(List matrix) {
    // check first row
    if (matrix[0] == matrix[1] && matrix[0] == matrix[2] && matrix[0] != '') {
      return true;
    }

    // check second row
    if (matrix[3] == matrix[4] && matrix[3] == matrix[5] && matrix[3] != '') {
      return true;
    }

    // check third row
    if (matrix[6] == matrix[7] && matrix[6] == matrix[8] && matrix[6] != '') {
      return true;
    }

    // check first column
    if (matrix[0] == matrix[3] && matrix[0] == matrix[6] && matrix[0] != '') {
      return true;
    }

    // check second column
    if (matrix[1] == matrix[4] && matrix[1] == matrix[7] && matrix[1] != '') {
      return true;
    }

    // check third column
    if (matrix[2] == matrix[5] && matrix[2] == matrix[8] && matrix[2] != '') {
      return true;
    }

    // check diagonal
    if (matrix[0] == matrix[4] && matrix[0] == matrix[8] && matrix[0] != '') {
      return true;
    }

    // check diagonal
    if (matrix[2] == matrix[4] && matrix[2] == matrix[6] && matrix[2] != '') {
      return true;
    }

    if (filledBoxes == 9) {
      return true;
    } else
      return false;
  }

  bool checkTheWinner1(List matrix) {
    // check first row
    if (matrix[0] == matrix[1] && matrix[0] == matrix[2] && matrix[0] != '') {
      incrementPoints(matrix[0]);
      showAlertDialog('Winner', matrix[0]);
      return true;
    }

    // check second row
    if (matrix[3] == matrix[4] && matrix[3] == matrix[5] && matrix[3] != '') {
      incrementPoints(matrix[3]);
      showAlertDialog('Winner', matrix[3]);
      return true;
    }

    // check third row
    if (matrix[6] == matrix[7] && matrix[6] == matrix[8] && matrix[6] != '') {
      incrementPoints(matrix[6]);
      showAlertDialog('Winner', matrix[6]);
      return true;
    }

    // check first column
    if (matrix[0] == matrix[3] && matrix[0] == matrix[6] && matrix[0] != '') {
      incrementPoints(matrix[0]);
      showAlertDialog('Winner', matrix[0]);
      return true;
    }

    // check second column
    if (matrix[1] == matrix[4] && matrix[1] == matrix[7] && matrix[1] != '') {
      incrementPoints(matrix[1]);
      showAlertDialog('Winner', matrix[1]);
      return true;
    }

    // check third column
    if (matrix[2] == matrix[5] && matrix[2] == matrix[8] && matrix[2] != '') {
      incrementPoints(matrix[2]);
      showAlertDialog('Winner', matrix[2]);
      return true;
    }

    // check diagonal
    if (matrix[0] == matrix[4] && matrix[0] == matrix[8] && matrix[0] != '') {
      incrementPoints(matrix[0]);
      showAlertDialog('Winner', matrix[0]);
      return true;
    }

    // check diagonal
    if (matrix[2] == matrix[4] && matrix[2] == matrix[6] && matrix[2] != '') {
      incrementPoints(matrix[2]);
      showAlertDialog('Winner', matrix[2]);
      return true;
    }

    if (filledBoxes == 9) {
      showAlertDialog('Draw', '');
      return true;
    } else
      return false;
  }

  int evaluate(List matrix) {
    // check first row
    if (matrix[0] == matrix[1] && matrix[0] == matrix[2] && matrix[0] != '') {
      if (matrix[0] == playerIcon) {
        return -10;
      } else
        return 10;
    }

    // check second row
    if (matrix[3] == matrix[4] && matrix[3] == matrix[5] && matrix[3] != '') {
      if (matrix[3] == playerIcon) {
        return -10;
      } else
        return 10;
    }

    // check third row
    if (matrix[6] == matrix[7] && matrix[6] == matrix[8] && matrix[6] != '') {
      if (matrix[6] == playerIcon) {
        return -10;
      } else
        return 10;
    }

    // check first column
    if (matrix[0] == matrix[3] && matrix[0] == matrix[6] && matrix[0] != '') {
      if (matrix[0] == playerIcon) {
        return -10;
      } else
        return 10;
    }

    // check second column
    if (matrix[1] == matrix[4] && matrix[1] == matrix[7] && matrix[1] != '') {
      if (matrix[1] == playerIcon) {
        return -10;
      } else
        return 10;
    }

    // check third column
    if (matrix[2] == matrix[5] && matrix[2] == matrix[8] && matrix[2] != '') {
      if (matrix[2] == playerIcon) {
        return -10;
      } else
        return 10;
    }

    // check diagonal
    if (matrix[0] == matrix[4] && matrix[0] == matrix[8] && matrix[0] != '') {
      if (matrix[0] == playerIcon) {
        return -10;
      } else
        return 10;
    }

    // check diagonal
    if (matrix[2] == matrix[4] && matrix[2] == matrix[6] && matrix[2] != '') {
      if (matrix[2] == playerIcon) {
        return -10;
      } else
        return 10;
    } else
      return 0;
  }

  int minimax(List matrix, int depth, bool isComputer) {
    int score = evaluate(matrix);

    if (score == 10) return score * depth;

    if (score == -10) return score * depth;

    if (filledBoxes == 9) return 0;

    if (isComputer) {
      int best = -1000;

      for (int i = 0; i < 9; i++) {
        if (matrix[i] == '') {
          matrix[i] = computerIcon;
          filledBoxes++;
          best = max(best, minimax(matrix, depth - 1, !isComputer));

          matrix[i] = '';
          filledBoxes--;
        }
      }
      return best;
    } else {
      int best = 1000;

      for (int i = 0; i < 9; i++) {
        if (matrix[i] == '') {
          matrix[i] = playerIcon;
          filledBoxes++;
          best = min(best, minimax(matrix, depth - 1, !isComputer));

          matrix[i] = '';
          filledBoxes--;
        }
      }
      return best;
    }
  }

  int findBestMove(List matrix) {
    int bestVal = -1000;
    int bestMove = -1;

    for (int i = 0; i < 9; i++) {
      if (matrix[i] == '') {
        matrix[i] = computerIcon;
        filledBoxes++;

        int moveVal = minimax(matrix, 9, false);
        matrix[i] = '';
        filledBoxes--;

        if (moveVal > bestVal) {
          bestVal = moveVal;
          bestMove = i;
        }
      }
    }
    return bestMove;
  }

  int max(int a, int b) {
    if (a > b) {
      return a;
    } else {
      return b;
    }
  }

  int min(int a, int b) {
    if (a < b) {
      return a;
    } else {
      return b;
    }
  }

  void showAlertDialog(String title, String winner) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('$title'),
        content: Text(winner == ''
            ? 'The match ended in a draw'
            : winner == playerIcon
                ? 'You Won !!'
                : 'Computer Won'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              clearBoard();
              flag = 0;
              turnPlayer = true;
              turnComputer = false;
              setFisrtTrun(player);
              setIcon(icon);
              setState(() {
                buildGrid();
              });
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
  }

  void incrementPoints(String winner) {
    if (winner == playerIcon) {
      playerWins++;
    } else if (winner == computerIcon) {
      computerWins++;
    }
  }

  void clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        matrix[i] = '';
      }
    });
    filledBoxes = 0;
  }
}
