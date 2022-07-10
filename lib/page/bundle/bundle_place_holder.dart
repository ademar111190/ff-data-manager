import 'package:datamanager/l10n/build_context_localizations.dart';
import 'package:flutter/material.dart';

class BundlePlaceHolder extends StatelessWidget {
  const BundlePlaceHolder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final texts = context.texts();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(texts.bundle_page_empty),
      ),
    );
  }
}
