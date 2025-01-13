import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/source/core/router/app_router.dart';
import 'package:gtk_flutter/source/features/common/widgets/drawer.dart';
import 'package:gtk_flutter/source/constants/strings.dart';
import 'package:gtk_flutter/source/features/common/appbar_menu_action.dart';
import 'package:gtk_flutter/source/features/home/data/home_board_repository.dart';
import 'package:gtk_flutter/source/features/home/domain/home_board.dart';
import 'package:gtk_flutter/source/features/home/presentation/controller/home_board_screen_controller.dart';
import 'package:gtk_flutter/source/utils/async_value_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actions = AppBarPopUpMenuActions();

    return Scaffold(
        appBar: AppBar(
          title: const Text(Strings.homePage),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                context.goNamed(AppRoute.home.name);
              },
              icon: Badge.count(
                count: 3,
                child: Icon(Icons.notifications),
              ),
            ),
            PopupMenuButton<int>(
              onSelected: (item) => actions.handleClick(item, context, ref),
              itemBuilder: (context) => [
                PopupMenuItem<int>(value: 0, child: Text('Logout')),
                PopupMenuItem<int>(value: 1, child: Text('Ajustes')),
              ],
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Consumer(builder: (context, ref, child) {
          ref.listen<AsyncValue>(
            homeBoardScreenControllerProvider,
            (_, state) => state.showAlertDialogOnError(context),
          );
          final homeBoardQuery = ref.watch(homeboardQueryProvider);
          return FirestoreQueryBuilder<HomeBoard>(
            query: homeBoardQuery.orderBy('data', descending: true),
            builder: (context, snapshot, _) {
              if (snapshot.isFetching) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              if (snapshot.docs.isEmpty) {
                return const Center(child: Text('Não há dados para exibir'));
              }
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: snapshot.docs.length,
                itemBuilder: (context, index) {
                  final doc = snapshot.docs[index];
                  final homeBoard = doc.data();
                  return Dismissible(
                    key: Key('homeBoard-${homeBoard.id}'),
                    background: Container(color: Colors.red),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) =>
                        ref.read(homeBoardScreenControllerProvider.notifier).deleteHomeBoard(homeBoard),
                    child: HomeBoardListTile(
                      homeBoard: homeBoard,
                      onTap: () => context.goNamed(
                        AppRoute.home.name,
                        pathParameters: {'id': homeBoard.id},
                      ),
                    ),
                  );
                },
              );
            },
          );
        }));
  }
}

class HomeBoardListTile extends StatelessWidget {
  const HomeBoardListTile({super.key, required this.homeBoard, this.onTap});
  final HomeBoard homeBoard;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat('dd/MM/yyyy hh:mm a');

    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.green,
      child: Text(homeBoard.titulo),
    );
  }
}
