import 'package:datamanager/l10n/locales.dart';
import 'package:flutter/material.dart';

class LocalizedText {
  /// a non empty map where the first entry is the default a.k.a fallback locale
  final Map<Locale, String> texts;

  const LocalizedText(
    this.texts,
  );

  String fallback() => texts.entries.first.value;

  String localized({
    Locale? locale,
  }) {
    var base = locale ?? getSystemLocale();
    if (texts.containsKey(base)) {
      return texts[base]!;
    }
    base = fromLocaleName(base.languageCode);
    return texts[base] ?? fallback();
  }

  LocalizedText copyWith({
    Map<Locale, String>? additionalTexts,
  }) {
    final texts = this.texts;
    if (additionalTexts != null) {
      texts.addAll(additionalTexts);
    }
    return LocalizedText(texts);
  }
}
