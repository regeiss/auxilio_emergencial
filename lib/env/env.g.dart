// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _Env {
  static const List<int> _enviedkeytmdbApiKey = <int>[
    901733984,
    2650451750,
    2470843925,
    1351944914,
    2871881163,
    642635293,
    1505269247,
  ];

  static const List<int> _envieddatatmdbApiKey = <int>[
    901733974,
    2650451731,
    2470843937,
    1351944932,
    2871881214,
    642635305,
    1505269195,
  ];

  static final String tmdbApiKey = String.fromCharCodes(List<int>.generate(
    _envieddatatmdbApiKey.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddatatmdbApiKey[i] ^ _enviedkeytmdbApiKey[i]));
}
