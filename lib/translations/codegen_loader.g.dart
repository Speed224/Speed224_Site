// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "test_message": "{} are writte in the {} language",
  "sidebar": {
    "contact": "Contact me",
    "aboutme": "About me",
    "home": "Home",
    "settings": "Settings"
  }
};
static const Map<String,dynamic> it = {
  "test_message": "{} sono scritti in {}",
  "sidebar": {
    "contact": "Contattami",
    "aboutme": "Chi sono",
    "home": "Home",
    "settings": "Impostazioni"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "it": it};
}
