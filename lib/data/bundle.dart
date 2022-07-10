import 'package:datamanager/data/world.dart';

class Bundle {
  final String name;
  final List<World> worlds;

  const Bundle(
    this.name, {
    this.worlds = const [],
  });
}
