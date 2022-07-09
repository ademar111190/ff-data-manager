import 'package:datamanager/l10n/build_context_localizations.dart';
import 'package:flutter/material.dart';

class WorldlessWidget extends StatelessWidget {
  const WorldlessWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final texts = context.texts();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            texts.world_page_empty,
          ),
        ],
      ),
    );
  }
}
