import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  int selectedCategoryID = 0;

  void updateCategoryID(int selectedCategoryID) {
    this.selectedCategoryID = selectedCategoryID;
    notifyListeners();
  }
}
