import 'package:flutter/material.dart';
import 'package:yourshift_site/themes/dark_night_theme.dart';
import 'package:yourshift_site/views/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppDarkNightTheme(
        title: 'Shift You', home: HomeView(title: 'Shift You'));
  }
}
