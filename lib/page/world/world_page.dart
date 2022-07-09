import 'package:datamanager/bloc/world/world_bloc.dart';
import 'package:datamanager/bloc/world/world_state.dart';
import 'package:datamanager/l10n/build_context_localizations.dart';
import 'package:datamanager/page/world/world_creation_widget.dart';
import 'package:datamanager/page/world/worldfull_widget.dart';
import 'package:datamanager/page/world/worldless_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorldPage extends StatelessWidget {
  const WorldPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final texts = context.texts();

    return Scaffold(
      appBar: AppBar(
        title: Text(texts.world_page_title),
      ),
      body: BlocBuilder<WorldBloc, WorldState>(
        builder: (context, state) {
          if (state is WorldlessState) {
            return const WorldlessWidget();
          } else if (state is WorldfullState) {
            return WorldfullWidget(state: state);
          } else {
            return const WorldCreationWidget();
          }
        },
      ),
      floatingActionButton: BlocBuilder<WorldBloc, WorldState>(
        builder: (context, state) {
          if (state is WorldlessState) {
            return FloatingActionButton(
              onPressed: () => context.read<WorldBloc>().createWorld(),
              tooltip: texts.world_page_add,
              child: const Icon(Icons.add),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
