import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('ps'),
    const Locale('ur'),
    // const Locale('es'),
    // const Locale('de'),
  ];

  static String getFlag(String code) {
    switch (code) {
      // case 'en':
      //   return 'π¦πͺ';
      case 'ps':
        return 'π¦π«';
      case 'ur':
        return 'π΅π°';
      // case 'de':
      //   return 'π©πͺ';
      case 'en':
      default:
        return 'πΊπΈ';
    }
  }
}
