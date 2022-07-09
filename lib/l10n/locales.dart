import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_pt.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates() {
  return [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}

Iterable<Locale> supportedLocales() {
  return [
    const Locale('en', ''),
    const Locale('pt', ''),
  ];
}

Locale fromLocaleName(String localeName) {
  if (localeName.contains("_")) {
    final pieces = localeName.split("_");
    return Locale(pieces[0], pieces[1]);
  } else {
    return Locale(localeName);
  }
}

Locale getSystemLocale() => fromLocaleName(Platform.localeName);

/// prefer the traditional AppLocalizations.of(context) instead of this method.
/// The only reason to add this method is the lack of official method to access
/// an AppLocalizations object without a BuildContext object
AppLocalizations getSystemAppLocalizations() {
  switch (getSystemLocale().languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
    default:
      return AppLocalizationsEn();
  }
}
