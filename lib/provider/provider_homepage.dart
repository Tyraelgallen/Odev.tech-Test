import 'package:flutter/material.dart';

class RefreshHome extends ChangeNotifier {
  void updateWidget() {
    notifyListeners();
  }
}
