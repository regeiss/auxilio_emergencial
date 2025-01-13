import 'package:gtk_flutter/source/features/auth/data/firebase_auth_repository.dart';
import 'package:gtk_flutter/source/features/home/data/home_board_repository.dart';
import 'package:gtk_flutter/source/features/home/domain/home_board.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_board_screen_controller.g.dart';

@riverpod
class HomeBoardScreenController extends _$HomeBoardScreenController {
  @override
  FutureOr<void> build() {
    // ok to leave this empty if the return type is FutureOr<void>
  }

  Future<void> deleteHomeBoard(HomeBoard homeboard) async {
    final currentUser = ref.read(authRepositoryProvider).currentUser;
    if (currentUser == null) {
      throw AssertionError('User can\'t be null');
    }
    final repository = ref.read(homeboardRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => repository.deleteHomeBoard(uid: currentUser.uid, homeboardId: homeboard.id));
  }
}
