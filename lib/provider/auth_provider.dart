import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isObsecure = true;

  get isObsecure => _isObsecure;

  toggleObsecure() {
    _isObsecure = !_isObsecure;
    notifyListeners();
  }

  //====================================================
  List<String> locationList = [
    "India",
    "USA",
  ];

  String selectedValue = "India";

  onLocationChange(value) {
    selectedValue = value;
  }
}
