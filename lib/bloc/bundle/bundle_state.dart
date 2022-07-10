import 'package:datamanager/data/bundle.dart';

class BundleState {
  final List<Bundle> bundles;

  const BundleState(
    this.bundles,
  );

  factory BundleState.initial() => const BundleState([]);

  BundleState copyWith({
    List<Bundle>? bundles,
  }) {
    return BundleState(
      bundles ?? this.bundles,
    );
  }
}
