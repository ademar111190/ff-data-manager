import 'package:datamanager/bloc/bundle/bundle_bloc.dart';
import 'package:datamanager/bloc/bundle/bundle_state.dart';
import 'package:datamanager/l10n/build_context_localizations.dart';
import 'package:datamanager/page/bundle/bundle_bottom_navigation.dart';
import 'package:datamanager/page/bundle/bundle_place_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BundlePage extends StatelessWidget {
  const BundlePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final texts = context.texts();

    return Scaffold(
      appBar: AppBar(
        title: Text(texts.bundle_page_title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<BundleBloc, BundleState>(
              builder: (context, state) {
                if (state.bundles.isEmpty) {
                  return const BundlePlaceHolder();
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BundleBottomNavigation(),
    );
  }
}
