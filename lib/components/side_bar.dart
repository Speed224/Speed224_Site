import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:speed224_site/theme/theme_side_bar_x.dart';

class SideBarX extends StatelessWidget {
  SideBarX({super.key});

  //inizia sul primo item e, estesa
  final _controller = SidebarXController(selectedIndex: 0, extended: false);

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      items: const [
        SidebarXItem(icon: Icons.home, label: 'Home'),
        SidebarXItem(icon: Icons.search, label: 'Search'),
      ],
      footerDivider: divider,
      theme: draculaSidebarXTheme(context),
      extendedTheme: draculaExtendedSidebarXTheme(),
    );
  }
}
