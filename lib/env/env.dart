import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'TMDB_KEY')
  static final String tmdbApiKey = _Env.tmdbApiKey;
}
