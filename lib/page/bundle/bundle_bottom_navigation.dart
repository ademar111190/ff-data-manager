import 'package:datamanager/bloc/bundle/bundle_bloc.dart';
import 'package:datamanager/l10n/build_context_localizations.dart';
import 'package:datamanager/page/bundle/bundle_creation_dialog.dart';
import 'package:datamanager/page/world/world_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BundleBottomNavigation extends StatelessWidget {
  const BundleBottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final texts = context.texts();
    final navigator = Navigator.of(context);
    final bundleBloc = context.read<BundleBloc>();

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 8, 16),
            child: ElevatedButton(
              onPressed: () async {
                final name = await showDialog(
                  context: context,
                  builder: (context) => const BundleCreationDialog(),
                );
                if (name != null) {
                  await bundleBloc.createBundle(name);
                  navigator.push(MaterialPageRoute(
                    builder: (context) => const WorldPage(),
                  ));
                }
              },
              child: Text(texts.bundle_page_action_new),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 16, 16),
            child: ElevatedButton(
              onPressed: null,
              child: Text(texts.bundle_page_action_import),
            ),
          ),
        ),
      ],
    );
  }
}
