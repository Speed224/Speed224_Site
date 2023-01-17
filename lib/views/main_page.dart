import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:speed224_site/components/side_bar.dart';
import 'package:speed224_site/views/collapse_bar.dart';

class MainPage extends StatelessWidget {
  final ThemeData theme;
  MainPage({super.key, required this.theme});

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
        body: SideBar(),
      ),
    );
  }
}
/*
const Text(
              "Hello World",
              style: TextStyle(fontSize: 72),
            )
            */
