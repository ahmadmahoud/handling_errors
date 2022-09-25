import 'package:flutter/material.dart';
import 'package:handling_error/features/home/home_page.dart';

class Routes {
  static const String home = '/home';

  static Map<String, WidgetBuilder> get routes {
    return {
      home: (context) => const HomePage(),
    };
  }
}