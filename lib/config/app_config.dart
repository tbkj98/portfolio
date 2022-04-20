import 'package:flutter/material.dart';

class AppConfig {
  AppConfig._();

  static const baseUrl = 'https://localhost';
  static const appName = 'Portfolio';
  static const appTitle = 'Portfolio';
  static const color = ColorConfig._();
}

class ColorConfig {
  const ColorConfig._();
  final primaryColor = Colors.red;
}
