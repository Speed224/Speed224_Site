import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:speed224_site/translations/codegen_loader.g.dart';

import 'package:flutter/services.dart'; // For rootBundle
import 'dart:convert'; // For jsonDecode
import 'package:json_theme/json_theme.dart';

import 'views/main_page.dart';

void main() async {
  // Needs to be called so that we can await for EasyLocalization.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final themeStr = await rootBundle.loadString('assets/theme/dracula_theme.json');
  final themeJson = jsonDecode(themeStr);
  final draculaTheme = ThemeDecoder.decodeThemeData(themeJson)!;

  runApp(
    EasyLocalization(
        path: 'assets/translations', // <-- change the path of the translation files
        supportedLocales: const [Locale('en'), Locale('it')],
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: MainPage(theme: draculaTheme)),
  );
}

//flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations"
//flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations" -o "locale_keys.g.dart" -f keys