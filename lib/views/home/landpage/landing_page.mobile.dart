import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yourshift_site/utils/generic_components.dart';

class LandingPageMobile extends StatelessWidget {
  LandingPageMobile({Key? key, required this.title}) : super(key: key);

  final String title;

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
    return Column(
      children: _makeListComponent(context: context),
    );
  }

  List<Widget> _makeListComponent({required BuildContext context}) {
    return [
      Spacer(),
      Expanded(flex: 3, child: _buildAppDescription(context: context)),
    ];
  }

  Widget _buildAppDescription({required BuildContext context}) {
    return Column(children: [
      Expanded(
          flex: 1,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Image.network(
              'https://raw.githubusercontent.com/shiftyou-opensource/shiftyou.icons/main/main_icon/res/mipmap-xxxhdpi/ic_launcher.png',
              alignment: Alignment.center,
            ),
          )),
      Expanded(
          flex: 2,
          child: Column(
            children: [
              Text(
                "Shift You",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .apply(color: Theme.of(context).colorScheme.primary),
              ),
              Text("Your hospital shift in a Fashion Way!",
                  style: Theme.of(context).textTheme.bodyText1!.apply(
                      color: Theme.of(context).textTheme.bodyText1!.color)),
              Container(
                margin: EdgeInsets.all(30),
                child: Row(
                  children: [
                    Spacer(),
                    Expanded(
                        flex: 3,
                        child: makeButton(context,
                            icon: Icon(FontAwesomeIcons.apple),
                            onPress: () =>
                                _launchURL("http://shorturl.at/otCQ5"),
                            text: "App Store")),
                    Spacer(),
                    Expanded(
                        flex: 3,
                        child: makeButton(context,
                            icon: Icon(FontAwesomeIcons.googlePlay),
                            onPress: () =>
                                _launchURL("http://shorturl.at/jnBHL"),
                            text: "Play Store")),
                    Spacer(),
                  ],
                ),
              )
            ],
          ))
    ]);
  }
}
