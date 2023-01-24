/*
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:speed224_site/components/custom_page_view.dart';
import 'package:speed224_site/theme/get_context_theme.dart';

import 'package:flutter/material.dart';

import '../translations/locale_keys.g.dart';

import 'dart:developer';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final ValueNotifier<bool> _scrolling = ValueNotifier<bool>(false);
  late List<CollapsibleItem> _items;
  late final List<Widget> _pageList;

  final AssetImage _avatarImg = const AssetImage('assets/Foto.png');

  final PageController _controller = PageController(viewportFraction: 1);

  Duration duration = const Duration(milliseconds: 600);

  @override
  void initState() {
    super.initState();
    _items = _generateItems1;
    _pageList = _generatePages();
  }

  List<CollapsibleItem> get _generateItems1 {
    return [
      CollapsibleItem(
        text: LocaleKeys.sidebar_home.tr(),
        icon: Icons.assessment,
        onPressed: () {
          _controller.animateToPage(0, duration: duration, curve: Curves.easeInOut);
        },
      ),
      CollapsibleItem(
        text: LocaleKeys.sidebar_aboutme.tr(),
        icon: Icons.icecream,
        onPressed: () {
          _controller.animateToPage(1, duration: duration, curve: Curves.easeInOut);
        },
        isSelected: true,
      ),
      CollapsibleItem(
        text: LocaleKeys.sidebar_contact.tr(),
        icon: Icons.search,
        onPressed: () {
          _controller.animateToPage(2, duration: duration, curve: Curves.easeInOut);
        },
      ),
    ];
  }

//TODO quando clicco gli item sulla barra deve scendere la pageview
  @override
  Widget build(BuildContext context) {
    GetColor colors = GetColor(context: context);
    int i = 1;
    var size = MediaQuery.of(context).size;
    return CollapsibleSidebar(
      index: i,
      onTitleTap: (() {
        i = 0;
        setState(() {});
      }),
      showTitle: true,
      topPadding: 200,
      isCollapsed: MediaQuery.of(context).size.width <= 800,
      collapseOnBodyTap: true,
      items: _items,
      avatarImg: _avatarImg,
      title: 'Nicola',
      body: CustomPageView(
        controller: _controller,
        pageList: _pageList,
      ), //_body(size, context),
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
    );
  }
}

*/