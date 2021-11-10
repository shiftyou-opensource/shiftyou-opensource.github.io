import 'package:flutter/material.dart';
import 'package:yourshift_site/views/home/landpage/langind_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(title,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .apply(color: Theme.of(context).textTheme.bodyText1!.color)),
        centerTitle: false,
        primary: true,
        elevation: 2,
        leading: Container(),
      ),
      body: LandingPage(title: title),
    );
  }
}
