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
      //   return '🇦🇪';
      case 'ps':
        return '🇦🇫';
      case 'ur':
        return '🇵🇰';
      // case 'de':
      //   return '🇩🇪';
      case 'en':
      default:
        return '🇺🇸';
    }
  }
}
