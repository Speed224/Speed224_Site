import 'package:flutter/material.dart';

class GetColor {
  late BuildContext _context;

  GetColor({required BuildContext context}) {
    _context = context;
  }

  Color canvasColor() => Theme.of(_context).canvasColor;

  Color dividerColor() => Theme.of(_context).dividerColor;

  Color primaryColor() => Theme.of(_context).primaryColor;

  Color hoveredColor() => Theme.of(_context).hoverColor;

  Color hintColor() => Theme.of(_context).hintColor;

  Color selectedRowColor() => Theme.of(_context).selectedRowColor;

  //Color foregroundColor() => Theme.of(_context).primaryColorLight;

  Color foregroundColor() => Theme.of(_context).appBarTheme.foregroundColor!;

  Color primaryDarkColor() => Theme.of(_context).primaryColorDark;

  Color shadowColor() => Theme.of(_context).shadowColor;

  Color dialogBackgroundColor() => Theme.of(_context).dialogBackgroundColor;

  Color unselectedItemColor() => Theme.of(_context).tabBarTheme.unselectedLabelColor!;

  Color highlightColor() => Theme.of(_context).highlightColor;
}
