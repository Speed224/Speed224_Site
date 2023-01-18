import 'dart:math' as math show pi;

import 'package:speed224_site/components/custom_page_view.dart';
import 'package:speed224_site/theme/get_context_theme.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:speed224_site/views/home_page.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  late List<CollapsibleItem> _items;
  late String _headline;
  AssetImage _avatarImg = AssetImage('assets/man.png');

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  void callback(Widget nextPage) {
    setState(() {
      _items.first.isSelected = true;
    });
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Dashboard',
        icon: Icons.assessment,
        onPressed: () => setState(() => _headline = 'DashBoard'),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Ice-Cream',
        icon: Icons.icecream,
        onPressed: () => setState(() => _headline = 'Errors'),
      ),
      CollapsibleItem(
        text: 'Search',
        icon: Icons.search,
        onPressed: () => setState(() => _headline = 'Search'),
      ),
    ];
  }

//TODO quando clicco gli item sulla barra deve scendere la pageview
  @override
  Widget build(BuildContext context) {
    GetColor colors = GetColor(context: context);
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: CollapsibleSidebar(
        isCollapsed: MediaQuery.of(context).size.width <= 800,
        items: _items,
        avatarImg: _avatarImg,
        title: 'Nicola Cremonesi',
        onTitleTap: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Yay! Flutter Collapsible Sidebar!')));
        },
        body: CustomPageView(), //_body(size, context),
        backgroundColor: colors.canvasColor(),
        selectedTextColor: colors.selectedRowColor(),
        selectedIconColor: colors.highlightColor(),
        unselectedIconColor: colors.unselectedItemColor(),
        unselectedTextColor: colors.foregroundColor(),
        selectedIconBox: colors.primaryDarkColor(),
        textStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.normal, color: colors.unselectedItemColor()),
        titleStyle: TextStyle(
          fontSize: 20,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          color: colors.foregroundColor(),
        ),
        toggleTitleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: colors.foregroundColor()),
        sidebarBoxShadow: const [
          BoxShadow(
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget _body(Size size, BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Colors.blueGrey[50],
      child: Center(
        child: Transform.rotate(
          angle: math.pi / 2,
          child: Transform.translate(
            offset: Offset(-size.height * 0.3, -size.width * 0.23),
            child: Text(
              _headline,
              style: Theme.of(context).textTheme.headline1,
              overflow: TextOverflow.visible,
              softWrap: false,
            ),
          ),
        ),
      ),
    );
  }
}
