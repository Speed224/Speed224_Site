import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:speed224_site/theme/get_context_theme.dart';

const circularRadius = 10.0;

//theme for sidebar
SidebarXTheme sXTheme(
  BuildContext context, {
  double width = 70,
  double itemPadding = 10,
  double selectedItemPadding = 10,
}) {
  GetColor colors = GetColor(context: context);
  return SidebarXTheme(
    width: width,
    itemTextPadding: EdgeInsets.only(left: itemPadding),
    selectedItemTextPadding: EdgeInsets.only(left: selectedItemPadding),
    //distance bar from left page
    margin: const EdgeInsets.all(0),
    //selected item box
    padding: const EdgeInsets.all(circularRadius),
    decoration: BoxDecoration(
      color: colors.canvasColor(),
      borderRadius: const BorderRadius.only(
          topLeft: Radius.zero,
          bottomLeft: Radius.zero,
          topRight: Radius.circular(circularRadius),
          bottomRight: Radius.circular(circularRadius)),
    ),
    hoverColor: colors.hoveredColor(),
    textStyle: TextStyle(color: colors.foregroundColor()),
    selectedTextStyle: TextStyle(color: colors.foregroundColor()),
    //itemTextPadding: const EdgeInsets.only(left: 30),
    //selectedItemTextPadding: const EdgeInsets.only(left: 30),
    //Not selected item decorator
    itemDecoration: BoxDecoration(
      borderRadius: BorderRadius.circular(circularRadius),
      //not selected item border color
      border: Border.all(color: colors.primaryDarkColor()),
    ),
    selectedItemDecoration: BoxDecoration(
      borderRadius: BorderRadius.circular(circularRadius),
      border: Border.all(
        //Selected item border color
        color: colors.primaryDarkColor(),
      ),
      gradient: LinearGradient(
        //shade effect con selected item
        colors: [colors.dialogBackgroundColor(), colors.canvasColor()],
      ),
      boxShadow: [
        BoxShadow(
          //shadow all around the boxe
          color: colors.shadowColor(),
          blurRadius: 10,
        )
      ],
    ), //not active item icon
    iconTheme: IconThemeData(
      color: colors.unselectedItem(),
      size: 20,
    ), //active item icon
    selectedIconTheme: IconThemeData(
      color: colors.foregroundColor(),
      size: 20,
    ),
  );
}

/*
//Theme for extended sidebar
SidebarXTheme sXExtendedTheme(BuildContext context) {
  return sXTheme(context, width: 150);
}


SidebarXTheme sXEX(BuildContext context) {
  GetColor colors = GetColor(context: context);
  return SidebarXTheme(
    width: 200,
    decoration: BoxDecoration(
      color: colors.canvasColor(),
      borderRadius: const BorderRadius.only(
          topLeft: Radius.zero,
          bottomLeft: Radius.zero,
          topRight: Radius.circular(circularRadius),
          bottomRight: Radius.circular(circularRadius)),
    ),
    itemTextPadding: const EdgeInsets.only(left: 50),
    selectedItemTextPadding: const EdgeInsets.only(left: 50),
  );
}


//IDK
const primaryColor = Color(0xFF685BFF);
//Background bar color
const canvasColor = Color(0xFF2E2E48);
//??
const scaffoldBackgroundColor = Color(0xFF464667);
//shade selected item color
const accentCanvasColor = Color(0xFF3E3E61);

const white = Colors.white;
//selected item border
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);

final divider = Divider(color: white.withOpacity(0.3), height: 1);

const fluoColor = Color.fromARGB(255, 255, 0, 242);

//vscode sidebar #21222C
const draculaDarkerBackgound = Color.fromARGB(255, 33, 34, 44);

const draculaBackground = Color.fromARGB(255, 40, 42, 54);

const draculaCurrentLine = Color.fromARGB(255, 68, 71, 90);

const draculaSelection = Color.fromARGB(255, 68, 71, 90);

const draculaForeground = Color.fromARGB(255, 248, 248, 242);

const draculaComment = Color.fromARGB(255, 98, 115, 164);

const draculaCyan = Color.fromARGB(255, 139, 232, 253);

const draculaGreen = Color.fromARGB(255, 80, 250, 122);

const draculaOrange = Color.fromARGB(255, 255, 184, 108);

const draculaPink = Color.fromARGB(255, 255, 121, 197);

const draculaPurple = Color.fromARGB(255, 189, 147, 249);

const draculaRed = Color.fromARGB(255, 255, 85, 85);

const draculaYellow = Color.fromARGB(255, 241, 250, 140);

*/