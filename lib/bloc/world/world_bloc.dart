import 'package:datamanager/bloc/world/world_state.dart';
import 'package:datamanager/data/localized_text.dart';
import 'package:datamanager/data/world.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorldBloc extends Cubit<WorldState> {
  WorldBloc() : super(WorldState.initial());

  Future<void> createWorld() async {
    final currentState = state;
    if (currentState is WorldlessState) {
      emit(const WorldCreationState());
    } else if (currentState is WorldfullState) {
      emit(WorldCreationState(
        name: currentState.world.name,
        nickName: currentState.world.nickName,
      ));
    } else {
      emit(currentState);
    }
  }

  Future<void> saveWorld() async {
    final currentState = state;
    if (currentState is WorldCreationState) {
      final errors = <WorldStateError>[];

      final name = currentState.name;
      if (name == null) {
        errors.add(WorldStateError.nullName);
      } else if (name.texts.isEmpty) {
        errors.add(WorldStateError.emptyName);
      }

      final nickName = currentState.nickName;
      if (nickName == null) {
        errors.add(WorldStateError.nullNickName);
      } else if (nickName.texts.isEmpty) {
        errors.add(WorldStateError.emptyNickName);
      }

      if (errors.isEmpty) {
        emit(WorldfullState(World(name!, nickName!)));
      } else {
        emit(currentState.copyCreationWith(
          errors: errors,
        ));
      }
    } else {
      emit(currentState);
    }
  }

  Future<void> cancelWorld() async {
    emit(WorldState.initial());
  }

  Future<void> addName(LocalizedText name) async {
    final currentState = state;
    if (currentState is WorldCreationState) {
      emit(currentState.copyCreationWith(
        name: (currentState.name ?? name).copyWith(
          additionalTexts: name.texts,
        ),
        errors: [],
      ));
    }
  }

  Future<void> addNickName(LocalizedText nickName) async {
    final currentState = state;
    if (currentState is WorldCreationState) {
      emit(currentState.copyCreationWith(
        nickName: (currentState.nickName ?? nickName).copyWith(
          additionalTexts: nickName.texts,
        ),
        errors: [],
      ));
    }
  }
}
