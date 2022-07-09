import 'package:datamanager/data/localized_text.dart';
import 'package:datamanager/data/world.dart';

abstract class WorldState {
  const WorldState();

  factory WorldState.initial() => const WorldlessState();

  WorldState copyWith({
    World? world,
  }) {
    if (world == null) {
      return const WorldlessState();
    } else {
      return WorldfullState(world);
    }
  }
}

class WorldlessState extends WorldState {
  const WorldlessState() : super();
}

class WorldCreationState extends WorldState {
  final LocalizedText? name;
  final LocalizedText? nickName;
  final List<WorldStateError> errors;

  const WorldCreationState({
    this.name,
    this.nickName,
    this.errors = const [],
  }) : super();

  WorldState copyCreationWith({
    LocalizedText? name,
    LocalizedText? nickName,
    List<WorldStateError>? errors,
  }) {
    return WorldCreationState(
      name: name ?? this.name,
      nickName: nickName ?? this.nickName,
      errors: errors ?? this.errors,
    );
  }
}

class WorldfullState extends WorldState {
  final World world;

  const WorldfullState(
    this.world,
  );
}

enum WorldStateError {
  nullName,
  emptyName,
  nullNickName,
  emptyNickName,
}
