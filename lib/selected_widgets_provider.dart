import 'package:flutter/material.dart';

class SelectedWidgetsProvider extends ChangeNotifier {
  Map<String, dynamic> map = {
    'text': false,
    'image': false,
    'button': false,
  };
  bool isSaved = false;

  bool get getText {
    return map['text'];
  }

  bool get getImage {
    return map['image'];
  }

  bool get getButton {
    return map['button'];
  }

  bool get getSavedStatus {
    return isSaved;
  }

  void updateText() {
    map['text'] = !map['text'];
    notifyListeners();
  }

  void updateImage() {
    map['image'] = !map['image'];
    notifyListeners();
  }

  void updateButton() {
    map['button'] = !map['button'];
    notifyListeners();
  }

  void updateSavedStatus() {
    isSaved = !isSaved;
    notifyListeners();
  }
}
