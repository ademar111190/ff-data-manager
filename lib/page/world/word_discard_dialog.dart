import 'package:datamanager/bloc/world/world_bloc.dart';
import 'package:datamanager/l10n/build_context_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorldDiscardDialog extends StatelessWidget {
  const WorldDiscardDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final texts = context.texts();
    return AlertDialog(
      title: Text(texts.world_page_action_cancel_confirmation_title),
      content: Text(texts.world_page_action_cancel_confirmation_message),
      actions: [
        ElevatedButton(
          child: Text(texts.world_page_action_cancel_confirmation_do_not_cancel),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          child: Text(texts.world_page_action_cancel_confirmation_yes_cancel_as_im_saying),
          onPressed: () {
            context.read<WorldBloc>().cancelWorld();
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
