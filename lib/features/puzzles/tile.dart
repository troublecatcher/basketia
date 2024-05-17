import 'package:flutter/cupertino.dart';

class Tile {
  bool empty;
  int row;
  int col;
  int initRow;
  int initCol;
  Image image;

  Tile({
    required this.empty,
    required this.row,
    required this.col,
    required this.initRow,
    required this.initCol,
    required this.image,
  });
}
