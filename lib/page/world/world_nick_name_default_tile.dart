import 'package:datamanager/data/localized_text.dart';
import 'package:datamanager/l10n/build_context_localizations.dart';
import 'package:flutter/material.dart';

class WorldNickNameDefaultTile extends StatelessWidget {
  final LocalizedText? nickName;

  const WorldNickNameDefaultTile(
    this.nickName, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final texts = context.texts();
    final themeData = Theme.of(context);

    return nickName != null
        ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              texts.world_nick_name_default(nickName!.localized()),
              style: themeData.textTheme.titleLarge,
            ),
          )
        : const SizedBox();
  }
}
