import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});
