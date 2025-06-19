import 'package:flutter/material.dart';

class ListProvider with ChangeNotifier{
  double size = 18;
  void gosh(){
    size += 2;
  }

  void ayyr(){
    size -=2;
  }
}