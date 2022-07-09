import 'package:datamanager/bloc/world/world_state.dart';
import 'package:datamanager/l10n/build_context_localizations.dart';
import 'package:datamanager/page/world/world_name_default_tile.dart';
import 'package:datamanager/page/world/world_name_tile.dart';
import 'package:datamanager/page/world/world_nick_name_default_tile.dart';
import 'package:datamanager/page/world/world_nick_name_tile.dart';
import 'package:datamanager/widget/fill_view_port_column_scroll_view.dart';
import 'package:flutter/material.dart';

class WorldfullWidget extends StatelessWidget {
  final WorldfullState state;

  const WorldfullWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final texts = context.texts();
    final world = state.world;
    return FillViewPortColumnScrollView(
      children: [
        WorldNameDefaultTile(world.name),
        ...world.name.texts.entries.map<Widget>((e) => WorldNameTile(e)),
        WorldNickNameDefaultTile(world.nickName),
        ...world.name.texts.entries.map<Widget>((e) => WorldNickNameTile(e)),
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(texts.world_page_limit),
        ),
      ],
    );
  }
}
