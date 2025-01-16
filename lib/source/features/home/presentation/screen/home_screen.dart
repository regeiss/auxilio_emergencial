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
import 'package:gtk_flutter/source/features/home/presentation/screen/home_screen_provider.dart';
import 'package:gtk_flutter/source/features/notificacoes/data/notificacoes_repository.dart';
import 'package:gtk_flutter/source/utils/async_value_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actions = AppBarPopUpMenuActions();
    final notificacoesQuery = ref.watch(notificacoesQueryProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text(Strings.homePage),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                context.goNamed(AppRoute.notificacao.name);
              },
              icon: Badge.count(
                count: ref.watch(counterStateProvider),
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
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                ),
                itemCount: snapshot.docs.length,
                itemBuilder: (context, index) {
                  final doc = snapshot.docs[index];
                  final homeBoard = doc.data();
                  return HomeBoardListTile(
                    homeBoard: homeBoard,
                    onTap: () => context.goNamed(
                      AppRoute.home.name,
                      pathParameters: {'id': homeBoard.id},
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
    var dateFormat = DateFormat('dd/MM/yyyy hh:mm');

    return Container(
      color: HexColor.fromHex(homeBoard.cor),
      margin: const EdgeInsets.all(3),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              homeBoard.titulo,
              style: TextStyle(
                color: HexColor.fromHex(homeBoard.corTexto ?? '#e9e9e7'),
                fontSize: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                homeBoard.texto,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: HexColor.fromHex(homeBoard.corTexto ?? '#e9e9e7'),
                  fontSize: 15,
                ),
              ),
            ),
            Text(dateFormat.format(homeBoard.data),
                style: TextStyle(
                  color: HexColor.fromHex(homeBoard.corTexto ?? '#e9e9e7'),
                  fontSize: 12,
                )),
          ],
        ),
      ),
    );
  }
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
