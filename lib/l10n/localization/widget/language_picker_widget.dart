import 'package:flutter/material.dart';

import 'package:lgs_audiopedia/l10n/l10n.dart';
import 'package:lgs_audiopedia/l10n/localization/provider/locale_provider.dart';
import 'package:provider/provider.dart';

class LanguagePickerWidget extends StatefulWidget {
  const LanguagePickerWidget({Key? key}) : super(key: key);

  @override
  State<LanguagePickerWidget> createState() => _LanguagePickerWidgetState();
}

class _LanguagePickerWidgetState extends State<LanguagePickerWidget> {
  bool pashtoSelected = false;
  bool engSelected = true;
  bool urdoSelected = false;
  Color? engColor = Color(0xff35016D);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final locale = provider.locale ?? Locale('en');
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final flag = L10n.getFlag(locale.languageCode);
    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.only(right: 20),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       GestureDetector(
        //         onTap: () {
        //           setState(() {
        //             engSelected = true;
        //             pashtoSelected = false;
        //             urdoSelected = false;
        //             // engColor = Color(0xff35016D);
        //           });
        //         },
        //         child: Container(
        //           height: height * 0.05,
        //           width: width * 0.1,
        //           alignment: Alignment.center,
        //           decoration: BoxDecoration(
        //             shape: BoxShape.circle,
        //             border: Border.all(
        //               color: Color(0xff35016D),
        //             ),
        //             // color: Color(0xff35016D),
        //             //new color when other lang is selected
        //             color: engSelected ? engColor : Colors.white,
        //           ),
        //           child: Text(
        //             'ENG',
        //             style: TextStyle(
        //               color: engSelected ? Colors.white : Color(0xff35016D),
        //               fontSize: 13,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //         ),
        //       ),
        //       GestureDetector(
        //         onTap: () {
        //           setState(() {
        //             engSelected = false;
        //             pashtoSelected = false;
        //             urdoSelected = true;
        //             // engColor = Colors.red;
        //           });
        //         },
        //         child: Container(
        //           height: height * 0.05,
        //           width: width * 0.1,
        //           alignment: Alignment.center,
        //           decoration: BoxDecoration(
        //             color: urdoSelected ? Color(0xff35016D) : Colors.white,
        //             shape: BoxShape.circle,
        //             border: Border.all(
        //               color: Color(0xff35016D),
        //             ),
        //           ),
        //           child: Text(
        //             'اردو',
        //             style: TextStyle(
        //               fontSize: 13,
        //               fontWeight: FontWeight.bold,
        //               color: urdoSelected ? Colors.white : Color(0xff35016D),
        //             ),
        //           ),
        //         ),
        //       ),
        //       GestureDetector(
        //         onTap: () {
        //           setState(() {
        //             pashtoSelected = true;
        //             engSelected = false;
        //             urdoSelected = false;
        //           });
        //           final provider =
        //               Provider.of<LocaleProvider>(context, listen: false);
        //           provider.setLocale(locale);
        //         },
        //         child: Container(
        //           height: height * 0.05,
        //           width: width * 0.1,
        //           alignment: Alignment.center,
        //           decoration: BoxDecoration(
        //             color: pashtoSelected ? Color(0xff35016D) : Colors.white,
        //             shape: BoxShape.circle,
        //             border: Border.all(
        //               color: Color(0xff35016D),
        //             ),
        //           ),
        //           child: Text(
        //             // 'پښتو',
        //             flag,
        //             style: TextStyle(
        //               color: pashtoSelected ? Colors.white : Color(0xff35016D),
        //               fontSize: 13,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        DropdownButtonHideUnderline(
          child: DropdownButton(
            value: locale,

            // icon: Container(
            //   width: 49,
            // ),
            items: L10n.all.map((locale) {
              final flag = L10n.getFlag(locale.languageCode);
              print(flag);
              return DropdownMenuItem(
                child: Center(
                  child: Text(
                    flag,
                    style: TextStyle(fontSize: 32),
                  ),
                ),
                value: locale,
                onTap: () {
                  final provider =
                      Provider.of<LocaleProvider>(context, listen: false);
                  provider.setLocale(locale);
                },
              );
            }).toList(),
            onChanged: (_) {
              // final provider = Provider.of<LocaleProvider>(context, listen: false);
              // provider.setLocale(locale);
            },
          ),
        ),
      ],
    );
  }
}
