import 'package:flutter/material.dart';
import 'package:speed224_site/components/side_bar.dart';

class HomePage extends StatelessWidget {
  final ThemeData theme;

  const HomePage({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Speed224.dev",
      debugShowCheckedModeBanner: true,
      theme: theme,
      home: Scaffold(
        body: Row(
          children: [
            SideBarX()
            // Your app screen body
          ],
        ),
      ),
    );
  }
}
