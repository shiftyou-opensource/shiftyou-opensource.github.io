import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'yourshift.site',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color.fromARGB(255, 40, 42, 54),
        backgroundColor: Color.fromARGB(255, 40, 42, 54),
        bottomAppBarColor: Color.fromARGB(255, 40, 42, 54),
        cardColor: Color.fromARGB(255, 40, 42, 54),
        accentColor: Color.fromARGB(255, 255, 121, 197),
        buttonColor: Color.fromARGB(255, 57, 60, 75),
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
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 98, 114, 164))),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 255, 121, 197))),
          labelStyle: TextStyle(color: Color.fromARGB(255, 98, 114, 164)),
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
          headline5: TextStyle(fontWeight: FontWeight.bold),
          caption: TextStyle(fontStyle: FontStyle.normal, fontSize: 13),
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
      ),
      home: LandingPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class LandingPage extends StatefulWidget {
  LandingPage({Key? key, required this.title}) : super(key: key);

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late int _currentIndex;

  _LandingPageState() {
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // No appbar provided to the Scaffold, only a body with a
      // CustomScrollView.
      bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeInCirc,
          onItemSelected: (index) => setState(() => _currentIndex = index),
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: Icon(Icons.apps),
              title: Text('Home'),
              activeColor: Colors.red,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.people),
              title: Text('Users'),
              activeColor: Colors.purpleAccent,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.message),
              title: Text(
                'Messages test for mes teset test test ',
              ),
              activeColor: Colors.pink,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              activeColor: Colors.blue,
              textAlign: TextAlign.center,
            ),
          ]),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          // Provide a standard title.
          title: Text(widget.title),
          // Allows the user to reveal the app bar if they begin scrolling
          // back up the list of items.
          floating: true,
          // Display a placeholder widget to visualize the shrinking size.
          flexibleSpace: this._makePlaystoreView(),
          // Make the initial height of the SliverAppBar larger than normal.
          expandedHeight: 200,
        ),
      ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _makePlaystoreView() {
    return Row(
      children: [
        Expanded(child: Text("Playstore view"))
      ],
    );
  }
}
