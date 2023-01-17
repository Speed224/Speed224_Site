/*
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:speed224_site/theme/theme_side_bar_x.dart';

import 'package:speed224_site/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:speed224_site/views/main_page.dart';
import 'package:speed224_site/views/settings_page.dart';

class SideBarX extends StatelessWidget {
  final SidebarXController _controller;

  SideBarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);
  //inizia sul primo item e, estesa
  //final _controller = SidebarXController(selectedIndex: 0, extended: false);

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      items: [
        SidebarXItem(icon: Icons.home, label: LocaleKeys.sidebar_home.tr()),
        SidebarXItem(icon: Icons.search, label: 'Search'),
        SidebarXItem(icon: Icons.settings, label: LocaleKeys.sidebar_settings.tr())
      ],
      footerDivider: Divider(color: Theme.of(context).dividerColor, height: 1),
      theme: sXTheme(context),
      extendedTheme: sXTheme(
        context,
        width: 170,
        itemPadding: 10,
        selectedItemPadding: 10,
      ),
      footerItems: [],
      //collapseIcon: , ICONDATA
    );
  }
}

class ScreensExample extends StatelessWidget {
  const ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
          //return HomePage();
          case 2:
            return SettingsPage();
          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return LocaleKeys.sidebar_home.tr();
    case 1:
      return LocaleKeys.sidebar_contact.tr();
    case 2:
      return LocaleKeys.sidebar_settings.tr();
    /*case 3:
      return 'Favorites';
    case 4:
      return 'Custom iconWidget';
    case 5:
      return 'Profile';
    case 6:
      return 'Settings';
      */
    default:
      return 'Not found page';
  }
}

/*
        SidebarXItem(
          icon: Icons.flag,
          label: LocaleKeys.sidebar_settings.tr(),
          onTap: (() {
            context.setLocale(Locale("en"));
            //_controller.setExtended(true);
          }),
        ),
        */
*/