import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:yourshift_site/utils/generic_components.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//https://www.pinterest.it/pin/129478558026692427/
class LandingPage extends StatefulWidget {
  LandingPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: _buildAppPreview(context: context),
            )),
        Divider(),
        Spacer(),
      ],
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  /// Build the App preview of the app
  Widget _buildAppPreview({required BuildContext context}) {
    return Row(
      children: [
        Spacer(),
        Expanded(flex: 3, child: _buildAppDescription(context: context)),
        Spacer(),
        Expanded(
            flex: 5,
            child: Image.network(
              'https://raw.githubusercontent.com/shiftyou-opensource/shiftyou.icons/main/web/preview_site.png',
              fit: BoxFit.cover,
            )),
        Spacer(),
      ],
    );
  }

  Widget _buildAppDescription({required BuildContext context}) {
    return Column(children: [
      Expanded(
          flex: 1,
          child: Image.network(
            'https://raw.githubusercontent.com/shiftyou-opensource/shiftyou.icons/main/main_icon/res/mipmap-xxxhdpi/ic_launcher.png',
            alignment: Alignment.center,
            fit: BoxFit.fill,
          )),
      Expanded(
          flex: 2,
          child: Column(
            children: [
              FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    "Shift You",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .apply(color: Theme.of(context).colorScheme.primary),
                  )),
              FittedBox(
                  fit: BoxFit.contain,
                  child: Text("Your hospital shift in a Fashion Way!",
                      style: Theme.of(context).textTheme.headline6!.apply(
                          color:
                              Theme.of(context).textTheme.bodyText1!.color))),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: makeButton(context,
                            icon: Icon(FontAwesomeIcons.apple),
                            onPress: () =>
                                _launchURL("http://shorturl.at/otCQ5"),
                            text: "App Store")),
                    Expanded(
                        flex: 3,
                        child: makeButton(context,
                            icon: Icon(FontAwesomeIcons.googlePlay),
                            onPress: () =>
                                _launchURL("http://shorturl.at/jnBHL"),
                            text: "Play Store")),
                  ],
                ),
              )
            ],
          ))
    ]);
  }
}
