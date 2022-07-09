import 'package:datamanager/l10n/build_context_localizations.dart';
import 'package:flutter/material.dart';

class WorldNickNameTile extends StatelessWidget {
  final MapEntry<Locale, String> name;

  const WorldNickNameTile(
    this.name, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final texts = context.texts();
    return ListTile(
      title: Text(texts.world_nick_name_value(name.value)),
      subtitle: Text(texts.world_nick_name_key(name.key.languageCode)),
    );
  }
}
