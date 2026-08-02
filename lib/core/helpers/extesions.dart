import 'package:flutter/material.dart';

extension Navigation on BuildContext {
   Future<dynamic> pushNamed(String routeName) {
     return Navigator.pushNamed(this, routeName);
  }

  Future<dynamic> pushReplacementNamed(String routeName) {
    return Navigator.pushReplacementNamed(this, routeName);
  }
  Future<dynamic> pushAndRemoveUntil(String routeName) {
    return Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false);
  }

  void pop() {
    Navigator.pop(this);
  }

}
extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}