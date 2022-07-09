import 'package:datamanager/bloc/world/world_state.dart';
import 'package:datamanager/l10n/build_context_localizations.dart';
import 'package:flutter/material.dart';

class WorldErrorDialog extends StatelessWidget {
  final List<WorldStateError> errors;

  const WorldErrorDialog(
    this.errors, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final texts = context.texts();
    return AlertDialog(
      title: Text(texts.world_page_error_title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: errors.map((error) {
          if (error == WorldStateError.nullName || error == WorldStateError.emptyName) {
            return Text(texts.world_name_error);
          } else if (error == WorldStateError.nullNickName || error == WorldStateError.emptyNickName) {
            return Text(texts.world_nick_name_error);
          } else {
            return Container();
          }
        }).toList(),
      ),
      actions: [
        ElevatedButton(
          child: Text(texts.world_page_action_ok),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
