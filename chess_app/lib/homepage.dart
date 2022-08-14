import 'package:chess/easypieces.dart';
import 'package:chess/piece.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 8 squares in each row
  int row = 8;
  // 64 squares in total
  int totalNumberOfSquares = 64;

  // currently selected piece
  bool thisPieceIsSelected = false;
  int indexOfCurrentlySelectedPiece = -1;
  String colorOfCurrentlySelectedPiece = 'white';
  String currentlySelectedPiece = '';

  // dead pieces
  var deadWhitePieces = [];
  var deadBlackpieces = [];
  bool whiteTurn = true; // white goes first

  List<int> blackSquares = [
    1,
    3,
    5,
    7,
    8,
    10,
    12,
    14,
    17,
    19,
    21,
    23,
    24,
    26,
    28,
    30,
    33,
    35,
    37,
    39,
    40,
    42,
    44,
    46,
    49,
    51,
    53,
    55,
    56,
    58,
    60,
    62
  ];
  Map coordinateMappings = {
    "a1":56,
    "a2":57,
    "a3":58,
    "a4":59,
    "a5":60,
    "a6":61,
    "a7":62,
    "a8":63,
    "b1":48,
    "b2":49,
    "b3":50,
    "b4":51,
    "b5":52,
    "b6":53,
    "b7":54,
    "b8":55,
    "c1":40,
    "c2":41,
    "c3":42,
    "c4":43,
    "c5":44,
    "c6":45,
    "c7":46,
    "c8":47,
    "d1":32,
    "d2":33,
    "d3":34,
    "d4":35,
    "d5":36,
    "d6":37,
    "d7":38,
    "d8":39,
    "e1":24,
    "e2":25,
    "e3":26,
    "e4":27,
    "e5":28,
    "e6":29,
    "e7":30,
    "e8":31,
    "f1":16,
    "f2":17,
    "f3":18,
    "f4":19,
    "f5":20,
    "f6":21,
    "f7":22,
    "f8":23,
    "g1":8,
    "g2":9,
    "g3":10,
    "g4":11,
    "g5":12,
    "g6":13,
    "g7":14,
    "g8":15,
    "h1":0,
    "h2":1,
    "h3":2,
    "h4":3,
    "h5":4,
    "h6":5,
    "h7":6,
    "h8":7
  };
  //pieces
  var pieces = [
    // black pieces
    [0, 'rook', 'black', 'unselected', ''],
    [1, 'knight', 'black', 'unselected', ''],
    [2, 'bishop', 'black', 'unselected', ''],
    [3, 'king', 'black', 'unselected', ''],
    [4, 'queen', 'black', 'unselected', ''],
    [5, 'bishop', 'black', 'unselected', ''],
    [6, 'knight', 'black', 'unselected', ''],
    [7, 'rook', 'black', 'unselected', ''],
    [8, 'pawn', 'black', 'unselected', ''],
    [9, 'pawn', 'black', 'unselected', ''],
    [10, 'pawn', 'black', 'unselected', ''],
    [11, 'pawn', 'black', 'unselected', ''],
    [12, 'pawn', 'black', 'unselected', ''],
    [13, 'pawn', 'black', 'unselected', ''],
    [14, 'pawn', 'black', 'unselected', ''],
    [15, 'pawn', 'black', 'unselected', ''],

    //open spaces -> x = blank, o = possible move, color, k = possibke kill

    [16, 'x', '', '', ''],
    [17, 'x', '', '', ''],
    [18, 'x', '', '', ''],
    [19, 'x', '', '', ''],
    [20, 'x', '', '', ''],
    [21, 'x', '', '', ''],
    [22, 'x', '', '', ''],
    [25, 'x', '', '', ''],
    [26, 'x', '', '', ''],
    [27, 'x', '', '', ''],
    [28, 'x', '', '', ''],
    [29, 'x', '', '', ''],
    [30, 'x', '', '', ''],
    [31, 'x', '', '', ''],
    [32, 'x', '', '', ''],
    [33, 'x', '', '', ''],
    [34, 'x', '', '', ''],
    [35, 'x', '', '', ''],
    [36, 'x', '', '', ''],
    [37, 'x', '', '', ''],
    [38, 'x', '', '', ''],
    [39, 'x', '', '', ''],
    [40, 'x', '', '', ''],
    [41, 'x', '', '', ''],
    [42, 'x', '', '', ''],
    [43, 'x', '', '', ''],
    [44, 'x', '', '', ''],
    [45, 'x', '', '', ''],
    [46, 'x', '', '', ''],
    [47, 'x', '', '', ''],

    //white pieces
    [48, 'pawn', 'white', 'unselected', ''],
    [49, 'pawn', 'white', 'unselected', ''],
    [50, 'pawn', 'white', 'unselected', ''],
    [51, 'pawn', 'white', 'unselected', ''],
    [51, 'pawn', 'white', 'unselected', ''],
    [52, 'pawn', 'white', 'unselected', ''],
    [53, 'pawn', 'white', 'unselected', ''],
    [54, 'pawn', 'white', 'unselected', ''],
    [55, 'pawn', 'white', 'unselected', ''],
    [56, 'rook', 'white', 'unselected', ''],
    [57, 'knight', 'white', 'unselected', ''],
    [58, 'bishop', 'white', 'unselected', ''],
    [59, 'queen', 'white', 'unselected', ''],
    [60, 'king', 'white', 'unselected', ''],
    [61, 'bishop', 'white', 'unselected', ''],
    [62, 'knight', 'white', 'unselected', ''],
    [63, 'rook', 'white', 'unselected', ''],
    [64, 'pawn', 'white', 'unselected', ''],
  ];

  bool withinTheBoard(int index){
    for(int i = 0; i < pieces.length; ++i){
      if (index == pieces[i][0]){
        return true;
      }
    }
    return false;

  }

  void unselectEverything(){
    setState((){
      for(int i = 0; i < pieces.length; ++i){
        pieces[i][3] = 'unselected';
        if(pieces[i][1] == 'o'){
          pieces[i][1] = 'x';
        }
        if(pieces[i][4] == 'k'){
          pieces[i][4] = '';
        }
      }
    })
  }

  void tappedPawn(int index) {
    //colour matters for pawns as they can only move forward

    setState(() {
      // WHITE PAWN

      if (pieces[index][2] == 'white') {
        //check if square in front of pawnis blank, if it's not...
        if (pieces[index - row][1] != 'x') {
          // do nothing
        }
        else if (index >= totalNumberOfSquares-2*row &&
            index <= totalNumberOfSquares - row) {
          if (pieces[index - 2 * row][1] != 'x'){
            pieces[index - row][1] = 'o';
          }

          else {
            pieces[index-row][1] = 'o';
            pieces[index - row * 2][1] = 'o';
          }
        }

        //after that, pawn can only move one square
        else{
          pieces[index-row][1] = 'o';
        }

        //if there is an enemy piece diagonal to the current tappped pawn,
        //it's a possibke kill move
        if (pieces[index - row - 1][1] != 'x' && 
            pieces[index - row - 1][1] != 'black'){
          pieces[index - row - 1][4] = 'k';
        }

        if (pieces[index - row - 1][1] != 'x' && 
            pieces[index - row - 1][1] != 'black'){
          pieces[index - row + 1][4] = 'k';
        }
      }

      // BLACK PAWN

      if (pieces[index][2] == 'black') {
        //check if square in front of pawn is blank, if it's not...
        if (pieces[index + row][1] != 'x') {
          // do nothing
        }
        else if (index >= totalNumberOfSquares-2*row &&
            index <= totalNumberOfSquares - row) {
          if (pieces[index + 2 * row][1] != 'x'){
            pieces[index + row][1] = 'o';
          }

          else {
            pieces[index + row][1] = 'o';
            pieces[index + row * 2][1] = 'o';
          }
        }

        //after that, pawn can only move one square
        else{
          pieces[index + row][1] = 'o';
        }

        //if there is an enemy piece diagonal to the current tappped pawn,
        //it's a possibke kill move
        if (pieces[index + row + 1][1] != 'x' && 
            pieces[index + row + 1][1] != 'white'){
          pieces[index + row + 1][4] = 'k';
        }

        if (pieces[index + row + 1][1] != 'x' && 
            pieces[index + row + 1][1] != 'white'){
          pieces[index + row - 1][4] = 'k';
        }
      }
      
       
    });
  }

  void tappedBishop(int index) { //need to implement kill!
    var current_index  = index;
    var still_highlighting = true;
    var current_remainder;
    
    //check going down
    current_index = index;
    current_remainder = current_index % row;
    still_highlighting = true;
    while(still_highlighting){
      current_index += row+1;
      current_remainder = current_index % row;
      if (pieces[current_index][1] != 'x' || current_index < 0 || current_index >63 && (current_remainder-(index%row))<=0) {
        still_highlighting = false;
        if(current_index > 0 && current_index < 64){
          pieces[current_index-row][1] = 'o';
        }
      }
      else{
        pieces[current_index-row][1] = 'o';
      }
    }

    //
    current_index = index;
    current_remainder = current_index % row;
    still_highlighting = true;
    while(still_highlighting){
      current_index += row-1;
      current_remainder = current_index % row;
      if (pieces[current_index][1] != 'x' || current_index < 0 || current_index >63 && (current_remainder-(index%row))<=0) {
        still_highlighting = false;
        if(current_index > 0 && current_index < 64){
          pieces[current_index-row][1] = 'o';
        }
      }
      else{
        pieces[current_index-row][1] = 'o';
      }
    }
    
    // 

    current_index = index;
    current_remainder = current_index % row;
    still_highlighting = true;
    while(still_highlighting){
      current_index -= row+1;
      current_remainder = current_index % row;
      if (pieces[current_index][1] != 'x' || current_index < 0 || current_index >63 && (current_remainder-(index%row))<=0) {
        still_highlighting = false;
        if(current_index > 0 && current_index < 64){
          pieces[current_index-row][1] = 'o';
        }
      }
      else{
        pieces[current_index-row][1] = 'o';
      }
    }

    // 

    current_index = index;
    current_remainder = current_index % row;
    still_highlighting = true;
    while(still_highlighting){
      current_index -= row-1;
      current_remainder = current_index % row;
      if (pieces[current_index][1] != 'x' || current_index < 0 || current_index >63 && (current_remainder-(index%row))<=0) {
        still_highlighting = false;
        if(current_index > 0 && current_index < 64){
          pieces[current_index-row][1] = 'o';
        }
      }
      else{
        pieces[current_index-row][1] = 'o';
      }
    }
  }
  
  
  void tappedRook(int index) {
    setState((){
      
      var current_index  = index;
      var still_highlighting = true;
      //check going up
      while(still_highlighting){
        current_index -= row;
        if (pieces[current_index][1] != 'x' || current_index < 0 || current_index >63) {
          still_highlighting = false;
          if(current_index > 0 && current_index < 64){
            pieces[current_index-row][1] = 'o';
          }
        }
        else{
          pieces[current_index-row][1] = 'o';
        }
        }
      //check going down
      current_index = index;
      still_highlighting = true;
      while(still_highlighting){
        current_index += row;
        if (pieces[current_index][1] != 'x' || current_index < 0 || current_index >63) {
          still_highlighting = false;
          if(current_index > 0 && current_index < 64){
            pieces[current_index-row][1] = 'o';
          }
        }
        else{
          pieces[current_index-row][1] = 'o';
        }
      }
      //check going right
      var remainder = index % 8;
      still_highlighting = true;
      current_index = index;
      while(still_highlighting){
        current_index += 1;
        if(pieces[current_index][1] != 'x' || current_index < 0 || current_index > 63 || current_index % 8 != remainder){
          still_highlighting = false;
        }
        else{
          pieces[current_index-row][1] = 'o';
        }
      }

      still_highlighting = true;
      current_index = index;
      while(still_highlighting){
        current_index -= 1;
        if(pieces[current_index][1] != 'x' || current_index < 0 || current_index > 63 || current_index % 8 != remainder){
          still_highlighting = false;
        }
        else{
          pieces[current_index-row][1] = 'o';
        }
      }
      
      
    });
  }
  void tappedQueen(int index) {
    tappedBishop(index);
    tappedRook(index);
  }

  void tappedKing(int index) {
    List<int> possibleMoves = [];
    // king can go up, left, down, right, and 4 diagonals

    // UP
    if(withinTheBoard(index - row)) {
      if (pieces[index-row][1] != 'x'){
        if(pieces[index-row][2] != pieces[index][2]){
          pieces[index - row][4] = 'k';
        }
      }else{
        possibleMoves.add(index - row);
      }
    }

    // DOWN
    if(withinTheBoard(index + row)) {
      if (pieces[index+row][1] != 'x'){
        if(pieces[index+row][2] != pieces[index][2]){
          pieces[index + row][4] = 'k';
        }
      }else{
        possibleMoves.add(index + row);
      }
    }

    // LEFT
    if(index%row != 0) {
      if (pieces[index - 1][1] != 'x'){
        if(pieces[index - 1][2] != pieces[index][2]){
          pieces[index - 1][4] = 'k';
        }
      }else{
        possibleMoves.add(index - 1);
      }
    }
    
    // RIGHT
    if(index%row != 7) {
      if (pieces[index + 1][1] != 'x'){
        if(pieces[index + 1][2] != pieces[index][2]){
          pieces[index + 1][4] = 'k';
        }
      }else{
        possibleMoves.add(index + 1);
      }
    }

  }


  @override
  Widget build(BuildContext context) {}
}
