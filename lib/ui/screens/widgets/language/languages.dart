import 'package:flutter/material.dart';

abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get appName;

  String get labelWelcome;

  String get home;

  String get portfolio;

  String get prices;

  String get settings;

  String get goodMorning;

  String get search;

  String get currentApp;
}