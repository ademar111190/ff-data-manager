import 'package:datamanager/bloc/world/world_bloc.dart';
import 'package:datamanager/bloc/world/world_state.dart';
import 'package:datamanager/l10n/build_context_localizations.dart';
import 'package:datamanager/page/world/word_discard_dialog.dart';
import 'package:datamanager/page/world/word_error_dialog.dart';
import 'package:datamanager/page/world/world_name_default_tile.dart';
import 'package:datamanager/page/world/world_name_tile.dart';
import 'package:datamanager/page/world/world_nick_name_default_tile.dart';
import 'package:datamanager/page/world/world_nick_name_tile.dart';
import 'package:datamanager/widget/fill_view_port_column_scroll_view.dart';
import 'package:datamanager/widget/localized_text_item_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorldCreationWidget extends StatelessWidget {
  const WorldCreationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final texts = context.texts();
    final worldBloc = context.read<WorldBloc>();

    return BlocBuilder<WorldBloc, WorldState>(
      builder: (context, state) {
        if (state is WorldCreationState) {
          final name = state.name;
          final nickName = state.nickName;
          final errors = state.errors;
          if (errors.isNotEmpty) {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) => showDialog(
                  context: context,
                  builder: (context) => WorldErrorDialog(errors),
                ));
          }

          return FillViewPortColumnScrollView(
            children: [
              WorldNameDefaultTile(name),
              ...name?.texts.entries.map<Widget>((e) => WorldNameTile(e)) ?? [],
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      final name = await showDialog(
                        context: context,
                        builder: (_) => const LocalizedTextItemDialog(),
                      );
                      if (name != null) {
                        worldBloc.addName(name);
                      }
                    },
                    child: Text(texts.world_page_add_name),
                  ),
                ),
              ),
              WorldNickNameDefaultTile(nickName),
              ...nickName?.texts.entries.map<Widget>((e) => WorldNickNameTile(e)) ?? [],
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      final nickName = await showDialog(
                        context: context,
                        builder: (_) => const LocalizedTextItemDialog(),
                      );
                      if (nickName != null) {
                        worldBloc.addNickName(nickName);
                      }
                    },
                    child: Text(texts.world_page_add_nick_name),
                  ),
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (_) => const WorldDiscardDialog(),
                      ),
                      child: Text(texts.world_page_action_cancel),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () => worldBloc.saveWorld(),
                      child: Text(texts.world_page_action_save),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
