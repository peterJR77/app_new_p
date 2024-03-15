import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
class Constants{
  static  var mediaQuery= MediaQuery.of(navigatorKey.currentState!.context).size;
  static var theme = Theme.of(navigatorKey.currentState!.context);
  static const String apiKey = "bcf19e646e1645bbbe4260f4454bd957";
  static const String baseUrl = "newsapi.org";
}