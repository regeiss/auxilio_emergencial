// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$moviesRepositoryHash() => r'1a9b2c557c8a8214d4474d50bfcfa07cda40a95f';

/// See also [moviesRepository].
@ProviderFor(moviesRepository)
final moviesRepositoryProvider = AutoDisposeProvider<MoviesRepository>.internal(
  moviesRepository,
  name: r'moviesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$moviesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MoviesRepositoryRef = AutoDisposeProviderRef<MoviesRepository>;
String _$movieHash() => r'a84110beb4fdebcf3fa74dfcb6879ea287bc915c';

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

/// Provider to fetch a movie by ID
///
/// Copied from [movie].
@ProviderFor(movie)
const movieProvider = MovieFamily();

/// Provider to fetch a movie by ID
///
/// Copied from [movie].
class MovieFamily extends Family {
  /// Provider to fetch a movie by ID
  ///
  /// Copied from [movie].
  const MovieFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'movieProvider';

  /// Provider to fetch a movie by ID
  ///
  /// Copied from [movie].
  MovieProvider call({
    required int movieId,
  }) {
    return MovieProvider(
      movieId: movieId,
    );
  }

  @visibleForOverriding
  @override
  MovieProvider getProviderOverride(
    covariant MovieProvider provider,
  ) {
    return call(
      movieId: provider.movieId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(FutureOr<TMDBMovie> Function(MovieRef ref) create) {
    return _$MovieFamilyOverride(this, create);
  }
}

class _$MovieFamilyOverride implements FamilyOverride {
  _$MovieFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<TMDBMovie> Function(MovieRef ref) create;

  @override
  final MovieFamily overriddenFamily;

  @override
  MovieProvider getProviderOverride(
    covariant MovieProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// Provider to fetch a movie by ID
///
/// Copied from [movie].
class MovieProvider extends AutoDisposeFutureProvider<TMDBMovie> {
  /// Provider to fetch a movie by ID
  ///
  /// Copied from [movie].
  MovieProvider({
    required int movieId,
  }) : this._internal(
          (ref) => movie(
            ref as MovieRef,
            movieId: movieId,
          ),
          from: movieProvider,
          name: r'movieProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$movieHash,
          dependencies: MovieFamily._dependencies,
          allTransitiveDependencies: MovieFamily._allTransitiveDependencies,
          movieId: movieId,
        );

  MovieProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieId,
  }) : super.internal();

  final int movieId;

  @override
  Override overrideWith(
    FutureOr<TMDBMovie> Function(MovieRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MovieProvider._internal(
        (ref) => create(ref as MovieRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieId: movieId,
      ),
    );
  }

  @override
  ({
    int movieId,
  }) get argument {
    return (movieId: movieId,);
  }

  @override
  AutoDisposeFutureProviderElement<TMDBMovie> createElement() {
    return _MovieProviderElement(this);
  }

  MovieProvider _copyWith(
    FutureOr<TMDBMovie> Function(MovieRef ref) create,
  ) {
    return MovieProvider._internal(
      (ref) => create(ref as MovieRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      movieId: movieId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MovieProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MovieRef on AutoDisposeFutureProviderRef<TMDBMovie> {
  /// The parameter `movieId` of this provider.
  int get movieId;
}

class _MovieProviderElement extends AutoDisposeFutureProviderElement<TMDBMovie>
    with MovieRef {
  _MovieProviderElement(super.provider);

  @override
  int get movieId => (origin as MovieProvider).movieId;
}

String _$fetchMoviesHash() => r'1635ab7e809adc3cfcc0a11a49405eaa429a390f';

/// Provider to fetch paginated movies data
///
/// Copied from [fetchMovies].
@ProviderFor(fetchMovies)
const fetchMoviesProvider = FetchMoviesFamily();

/// Provider to fetch paginated movies data
///
/// Copied from [fetchMovies].
class FetchMoviesFamily extends Family {
  /// Provider to fetch paginated movies data
  ///
  /// Copied from [fetchMovies].
  const FetchMoviesFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchMoviesProvider';

  /// Provider to fetch paginated movies data
  ///
  /// Copied from [fetchMovies].
  FetchMoviesProvider call({
    required MoviesQueryData queryData,
  }) {
    return FetchMoviesProvider(
      queryData: queryData,
    );
  }

  @visibleForOverriding
  @override
  FetchMoviesProvider getProviderOverride(
    covariant FetchMoviesProvider provider,
  ) {
    return call(
      queryData: provider.queryData,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<TMDBMoviesResponse> Function(FetchMoviesRef ref) create) {
    return _$FetchMoviesFamilyOverride(this, create);
  }
}

class _$FetchMoviesFamilyOverride implements FamilyOverride {
  _$FetchMoviesFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<TMDBMoviesResponse> Function(FetchMoviesRef ref) create;

  @override
  final FetchMoviesFamily overriddenFamily;

  @override
  FetchMoviesProvider getProviderOverride(
    covariant FetchMoviesProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// Provider to fetch paginated movies data
///
/// Copied from [fetchMovies].
class FetchMoviesProvider
    extends AutoDisposeFutureProvider<TMDBMoviesResponse> {
  /// Provider to fetch paginated movies data
  ///
  /// Copied from [fetchMovies].
  FetchMoviesProvider({
    required MoviesQueryData queryData,
  }) : this._internal(
          (ref) => fetchMovies(
            ref as FetchMoviesRef,
            queryData: queryData,
          ),
          from: fetchMoviesProvider,
          name: r'fetchMoviesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchMoviesHash,
          dependencies: FetchMoviesFamily._dependencies,
          allTransitiveDependencies:
              FetchMoviesFamily._allTransitiveDependencies,
          queryData: queryData,
        );

  FetchMoviesProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.queryData,
  }) : super.internal();

  final MoviesQueryData queryData;

  @override
  Override overrideWith(
    FutureOr<TMDBMoviesResponse> Function(FetchMoviesRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchMoviesProvider._internal(
        (ref) => create(ref as FetchMoviesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        queryData: queryData,
      ),
    );
  }

  @override
  ({
    MoviesQueryData queryData,
  }) get argument {
    return (queryData: queryData,);
  }

  @override
  AutoDisposeFutureProviderElement<TMDBMoviesResponse> createElement() {
    return _FetchMoviesProviderElement(this);
  }

  FetchMoviesProvider _copyWith(
    FutureOr<TMDBMoviesResponse> Function(FetchMoviesRef ref) create,
  ) {
    return FetchMoviesProvider._internal(
      (ref) => create(ref as FetchMoviesRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      queryData: queryData,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchMoviesProvider && other.queryData == queryData;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, queryData.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchMoviesRef on AutoDisposeFutureProviderRef<TMDBMoviesResponse> {
  /// The parameter `queryData` of this provider.
  MoviesQueryData get queryData;
}

class _FetchMoviesProviderElement
    extends AutoDisposeFutureProviderElement<TMDBMoviesResponse>
    with FetchMoviesRef {
  _FetchMoviesProviderElement(super.provider);

  @override
  MoviesQueryData get queryData => (origin as FetchMoviesProvider).queryData;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
