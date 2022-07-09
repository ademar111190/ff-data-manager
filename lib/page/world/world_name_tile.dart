import 'package:datamanager/l10n/build_context_localizations.dart';
import 'package:flutter/material.dart';

class WorldNameTile extends StatelessWidget {
  final MapEntry<Locale, String> name;

  const WorldNameTile(
    this.name, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final texts = context.texts();
    return ListTile(
      title: Text(texts.world_name_value(name.value)),
      subtitle: Text(texts.world_name_key(name.key.languageCode)),
    );
  }
}
