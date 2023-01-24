/*
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:speed224_site/components/old_side_bar.dart';

import 'package:easy_localization/easy_localization.dart';

class MainPage extends StatelessWidget {
  final ThemeData theme;

  MainPage({super.key, required this.theme});

  final _controller = SidebarXController(selectedIndex: 0, extended: false);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: "Speed224.dev",
      debugShowCheckedModeBanner: true,
      theme: theme,
      home: Scaffold(
        body: Row(
          children: [
            SideBarX(
              key: _key,
              controller: _controller,
            ),
            Expanded(
                child: Center(
              child: ScreensExample(controller: _controller),
            ))
            // Your app screen body
          ],
        ),
      ),
    );
  }
}
*/