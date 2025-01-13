// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_board_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeboardRepositoryHash() =>
    r'f9749858721fdae598213e03dbe8e76cf034195a';

/// See also [homeboardRepository].
@ProviderFor(homeboardRepository)
final homeboardRepositoryProvider = Provider<HomeBoardRepository>.internal(
  homeboardRepository,
  name: r'homeboardRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homeboardRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HomeboardRepositoryRef = ProviderRef<HomeBoardRepository>;
String _$homeboardQueryHash() => r'859e91d9b48aeff0aec50019e99d2ac97b2ce26b';

/// See also [homeboardQuery].
@ProviderFor(homeboardQuery)
final homeboardQueryProvider = AutoDisposeProvider<Query<HomeBoard>>.internal(
  homeboardQuery,
  name: r'homeboardQueryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homeboardQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HomeboardQueryRef = AutoDisposeProviderRef<Query<HomeBoard>>;
String _$homeboardStreamHash() => r'e8851a5a8e2d77493fd8c00cab70842add2d6e28';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [homeboardStream].
@ProviderFor(homeboardStream)
const homeboardStreamProvider = HomeboardStreamFamily();

/// See also [homeboardStream].
class HomeboardStreamFamily extends Family<AsyncValue<HomeBoard>> {
  /// See also [homeboardStream].
  const HomeboardStreamFamily();

  /// See also [homeboardStream].
  HomeboardStreamProvider call(
    String homeboardId,
  ) {
    return HomeboardStreamProvider(
      homeboardId,
    );
  }

  @override
  HomeboardStreamProvider getProviderOverride(
    covariant HomeboardStreamProvider provider,
  ) {
    return call(
      provider.homeboardId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'homeboardStreamProvider';
}

/// See also [homeboardStream].
class HomeboardStreamProvider extends AutoDisposeStreamProvider<HomeBoard> {
  /// See also [homeboardStream].
  HomeboardStreamProvider(
    String homeboardId,
  ) : this._internal(
          (ref) => homeboardStream(
            ref as HomeboardStreamRef,
            homeboardId,
          ),
          from: homeboardStreamProvider,
          name: r'homeboardStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$homeboardStreamHash,
          dependencies: HomeboardStreamFamily._dependencies,
          allTransitiveDependencies:
              HomeboardStreamFamily._allTransitiveDependencies,
          homeboardId: homeboardId,
        );

  HomeboardStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.homeboardId,
  }) : super.internal();

  final String homeboardId;

  @override
  Override overrideWith(
    Stream<HomeBoard> Function(HomeboardStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HomeboardStreamProvider._internal(
        (ref) => create(ref as HomeboardStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        homeboardId: homeboardId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<HomeBoard> createElement() {
    return _HomeboardStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HomeboardStreamProvider && other.homeboardId == homeboardId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, homeboardId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HomeboardStreamRef on AutoDisposeStreamProviderRef<HomeBoard> {
  /// The parameter `homeboardId` of this provider.
  String get homeboardId;
}

class _HomeboardStreamProviderElement
    extends AutoDisposeStreamProviderElement<HomeBoard>
    with HomeboardStreamRef {
  _HomeboardStreamProviderElement(super.provider);

  @override
  String get homeboardId => (origin as HomeboardStreamProvider).homeboardId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
