import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

Widget buildUserIcon(BuildContext context, String imageUrl) {
  return CircleAvatar(
    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    radius: 60.0,
    child: CircleAvatar(
      radius: 50.0,
      backgroundImage: NetworkImage(imageUrl),
      backgroundColor: Colors.transparent,
    ),
  );
}

Widget buildAppLogo(BuildContext context, double dimemsion) {
  return Image.asset("ic_launcher");
}

BottomNavyBarItem makeItem(BuildContext context, String title, IconData icon,
    int index, int actualIndex) {
  bool selected = index == actualIndex;
  return BottomNavyBarItem(
    icon: Icon(icon,
        color: selected
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).textTheme.bodyText1!.color!),
    title: Text(title),
    activeColor: selected
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).textTheme.bodyText1!.color!,
    textAlign: TextAlign.center,
  );
}

/// This method build a text component to make sure that the title of the radio title
/// have the active color when it is active on the UI.
/// TODO: This change should be done by flutter theme, and this mean that I'm missing somethings in the code.
Text makeRadioTitle(BuildContext context, String message, bool active) {
  return Text(message,
      style: Theme.of(context).textTheme.bodyText1!.apply(
          color: active
              ? Theme.of(context).toggleableActiveColor
              : Theme.of(context).textTheme.bodyText1!.color));
}

/// Make a component that is able to be hidden when the propriety visible is false
Visibility makeVisibleComponent(Widget widget, bool visible,
    {bool disappear = false}) {
  return Visibility(
    child: widget,
    maintainSize: !disappear,
    maintainAnimation: true,
    maintainState: true,
    visible: visible,
  );
}

enum ButtonType { NORMAL }

Widget makeButton(BuildContext context,
    {required Function onPress,
    required String text,
    required Icon icon,
    ButtonType type = ButtonType.NORMAL,
    ButtonStyle? style}) {
  switch (type) {
    case ButtonType.NORMAL:
      return Container(
        margin: EdgeInsets.all(1),
        child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).colorScheme.primary,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
            onPressed: () => onPress(),
            icon: icon,
            label: FittedBox(fit: BoxFit.contain, child: Text(text))),
      );
  }
}

Widget makeTitleDivider(String titleString) {
  return Column(
    children: [
      Text(titleString),
      Divider(),
    ],
  );
}

CustomScrollView makeScrollView(BuildContext context, List<Widget> children) {
  return CustomScrollView(
    slivers: List<SliverList>.generate(
      children.length,
      (index) => SliverList(
          delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) => children[index],
              childCount: children.length)),
    ),
  );
}

void showSnackBar(BuildContext context, String message,
    {Action? action, String label = "Close"}) {
  var snackBar = SnackBar(
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Theme.of(context).selectedRowColor,
      content: Text(message),
      action: SnackBarAction(
          label: label,
          textColor: Theme.of(context).textTheme.button!.color,
          onPressed: () =>
              ScaffoldMessenger.of(context).hideCurrentSnackBar()));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
