import 'package:dropdown_button2/dropdown_button2.dart';
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
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(5),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            //così non sfalsa quando il testo cambia
            SizedBox(
              width: 200,
              child: Text(
                LocaleKeys.settings_language.tr(),
                style: _settingsTextStyle(),
              ),
            ),
            DropdownButtonHideUnderline(
                child: DropdownButton2(
              value: selectedValue,
              items: dropdownItem,
              alignment: AlignmentDirectional.center,
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
            )),
          ],
        ),
        const Divider(
          thickness: 1,
          height: 10,
        )
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

//TODO inserire una grandezza predefinita per il dropdown button