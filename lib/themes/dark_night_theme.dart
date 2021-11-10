import 'package:flutter/material.dart';
import 'package:yourshift_site/themes/app_theme.dart';

class AppDarkNightTheme extends AppTheme {
  const AppDarkNightTheme(
      {Key? key, required String title, required Widget home})
      : super(key: key, title: title, home: home);

  @override
  ThemeData? makeTheme({required BuildContext context}) {
    return makeDarkTheme(context: context);
  }

  @override
  ThemeData? makeDarkTheme({required BuildContext context}) {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Color.fromARGB(255, 40, 42, 54),
      backgroundColor: Color.fromARGB(255, 40, 42, 54),
      cardColor: Color.fromARGB(255, 40, 42, 54),
      selectedRowColor: Color.fromARGB(255, 72, 79, 114),
      dialogBackgroundColor: Color.fromARGB(255, 40, 42, 54),
      disabledColor: Color.fromARGB(255, 98, 114, 164),
      canvasColor: Color.fromARGB(255, 40, 42, 54),
      toggleableActiveColor: Color.fromARGB(255, 255, 121, 197),
      unselectedWidgetColor: Color.fromARGB(255, 98, 114, 164),
      colorScheme: ColorScheme.dark(
        background: Color.fromARGB(255, 40, 42, 54),
        onPrimary: Color.fromARGB(255, 40, 42, 54),
        primary: Color.fromARGB(255, 255, 121, 197),
        secondary: Color.fromARGB(255, 40, 42, 54),
        primaryVariant: Color.fromARGB(255, 57, 60, 75),
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 98, 114, 164))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 255, 121, 197))),
        labelStyle: TextStyle(color: Color.fromARGB(255, 98, 114, 164)),
        prefixStyle: TextStyle(color: Color.fromARGB(255, 98, 114, 164)),
        suffixStyle: TextStyle(color: Color.fromARGB(255, 98, 114, 164)),
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Color.fromARGB(255, 98, 114, 164)),
        bodyText2: TextStyle(color: Color.fromARGB(255, 98, 114, 164)),
        headline5: TextStyle(
            color: Color.fromARGB(255, 98, 114, 164),
            fontWeight: FontWeight.bold),
        caption: TextStyle(
            color: Color.fromARGB(255, 98, 114, 164),
            fontStyle: FontStyle.normal,
            fontSize: 13),
      ).apply(
        bodyColor: Color.fromARGB(255, 98, 114, 164),
        decorationColor: Color.fromARGB(255, 98, 114, 164),
      ),
      iconTheme: Theme.of(context).iconTheme.copyWith(
            color: Color.fromARGB(255, 98, 114, 164),
          ),
      appBarTheme: AppBarTheme(
        color: Color.fromARGB(255, 40, 42, 54),
      ),
      //visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
