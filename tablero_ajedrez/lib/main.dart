import 'package:flutter/material.dart';

void main() {
  runApp(const ChessApp());
}

class ChessApp extends StatelessWidget {
  const ChessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ChessBoardWidget(),
      ),
    );
  }
}

class ChessBoard {
  final int size; // Tamaño del tablero
  final Map<String, String> board = {}; // Tablero con piezas y posiciones

  ChessBoard({this.size = 8});

  void addPiece(String piece, String position) {
    board[position] = piece;
  }

  void removePiece(String position) {
    board.remove(position);
  }

  String? getPiece(String position) {
    return board[position];
  }

  bool isValidPosition(String position) {
    if (position.length != 2) return false;
    String column = position[0];
    String row = position[1];
    return 'a'.codeUnitAt(0) <= column.codeUnitAt(0) &&
        column.codeUnitAt(0) < 'a'.codeUnitAt(0) + size &&
        '1'.codeUnitAt(0) <= row.codeUnitAt(0) &&
        row.codeUnitAt(0) < '1'.codeUnitAt(0) + size;
  }
}

class ChessBoardWidget extends StatefulWidget {
  const ChessBoardWidget({super.key});

  @override
  _ChessBoardWidgetState createState() => _ChessBoardWidgetState();
}

class _ChessBoardWidgetState extends State<ChessBoardWidget> {
  final ChessBoard chessBoard = ChessBoard();

  @override
  void initState() {
    super.initState();

    //Se busca los unicodes de las piezas de ajedrez en google
    chessBoard.addPiece("♔", "e1"); // Rey blanco
    chessBoard.addPiece("♚", "e8"); // Rey negro
    chessBoard.addPiece("♖", "a8"); // Torre blanca
    chessBoard.addPiece("♟", "d2"); // Peón negro
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 8, // Ocho columnas
      ),
      itemCount: 64, // 8x8 casillas
      itemBuilder: (context, index) {
        int row = index ~/ 8;
        int col = index % 8;
        String position = "${String.fromCharCode(97 + col)}${8 - row}";

        // Alternar colores de las casillas
        bool isWhite = (row + col) % 2 == 0;
        String? piece = chessBoard.getPiece(position);

        return Container(
          decoration: BoxDecoration(
            color: isWhite ? Colors.white : Colors.grey,
            border: Border.all(color: Colors.black),
          ),
          child: Center(
            child: Text(
              piece ?? "",
              style: const TextStyle(fontSize: 44),
            ),
          ),
        );
      },
    );
  }
}
