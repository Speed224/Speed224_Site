import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:speed224_site/components/custom_page_view.dart';
import 'package:speed224_site/old/old_coll_side_bar.dart';
import 'package:speed224_site/views/collapse_bar.dart';

class MainPage extends StatelessWidget {
  final ThemeData theme;
  const MainPage({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    const AssetImage _avatarImg = AssetImage('assets/Foto.png');

    final PageController _controller = PageController(viewportFraction: 1);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: "Speed224.dev",
      debugShowCheckedModeBanner: true,
      theme: theme,
      home: Scaffold(
        body: CustomPageView(controller: _controller, pageList: _generatePages()),
      ),
    );
  }
}

List<Widget> _generatePages() {
  return <Widget>[
    const Center(
      child: Text('First Page'),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Second Page'),
          ElevatedButton(
            onPressed: () {},
            child: Text("Button"),
          ),
        ],
      ),
    ),
    Center(
      child: Text('Third Page'),
    ),
  ];
}
