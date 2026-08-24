import 'package:flutter/material.dart';
import 'package:salla7ly/core/networking/api_constants.dart';

extension ImageUrlExtension on String? {
  String? toFullImageUrl() {
    final path = this;
    if (path == null || path.isEmpty) return null;
    if (path.startsWith('http')) return path;

    return '${ApiConstants.socketUrl}$path';
  }
}

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushNamed(
      this,
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> pushReplacementNamed(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushReplacementNamed(
      this,
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> pushAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushNamedAndRemoveUntil(
      this,
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  void pop([Object? result]) {
    Navigator.pop(this, result);
  }
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}