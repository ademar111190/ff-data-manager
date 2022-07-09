import 'package:datamanager/data/localized_text.dart';
import 'package:datamanager/l10n/build_context_localizations.dart';
import 'package:flutter/material.dart';

class WorldNameDefaultTile extends StatelessWidget {
  final LocalizedText? name;

  const WorldNameDefaultTile(
    this.name, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final texts = context.texts();
    final themeData = Theme.of(context);

    return name != null
        ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              texts.world_name_default(name!.localized()),
              style: themeData.textTheme.titleLarge,
            ),
          )
        : const SizedBox();
  }
}
