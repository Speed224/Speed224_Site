import 'package:flutter/material.dart';

import 'package:speed224_site/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String selectedValue = "Italiano";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                LocaleKeys.settings_language.tr(),
                style: _settingsTextStyle(),
              ),
              DropdownButton(
                value: selectedValue,
                items: dropdownItem,
                onChanged: (String? value) {
                  setState(() {
                    selectedValue = value!;
                    switch (value) {
                      case "Italiano":
                        context.setLocale(const Locale(("it")));
                        break;
                      case "English":
                        context.setLocale(const Locale(("en")));
                        break;
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

List<DropdownMenuItem<String>> get dropdownItem {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "English", child: Text("English")),
    const DropdownMenuItem(value: "Italiano", child: Text("Italiano")),
  ];
  return menuItems;
}

TextStyle _settingsTextStyle() {
  return const TextStyle(
    fontSize: 32,
  );
}
