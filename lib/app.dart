import 'package:datamanager/l10n/build_context_localizations.dart';
import 'package:datamanager/l10n/locales.dart';
import 'package:datamanager/page/bundle/bundle_page.dart';
import 'package:flutter/material.dart';

class DataManagerApp extends StatelessWidget {
  const DataManagerApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: context.texts().app_title,
      localizationsDelegates: localizationsDelegates(),
      supportedLocales: supportedLocales(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BundlePage(),
    );
  }
}
