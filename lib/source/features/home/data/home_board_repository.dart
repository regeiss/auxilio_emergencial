// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gtk_flutter/source/features/auth/data/firebase_auth_repository.dart';
import 'package:gtk_flutter/source/features/home/domain/home_board.dart';
import 'package:gtk_flutter/source/features/home/presentation/screen/home_screen_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

part 'home_board_repository.g.dart';

class HomeBoardRepository {
  const HomeBoardRepository(this._firestore);
  final FirebaseFirestore _firestore;

  static String homeBoardPath(String uid, String homeboardId) => '/homeBoard/$homeboardId';
  static String homeBoardsPath(String uid) => '/homeBoard';
  // create
  Future<void> addHomeBoard(
          {required HomeBoardID uid,
          required String titulo,
          required String texto,
          required DateTime data,
          required int prioridade,
          required String cor}) =>
      _firestore.collection(homeBoardsPath(uid)).add({
        'titulo': titulo,
        'texto': texto,
        'data': data,
        'prioridade': prioridade,
        'cor': cor,
      });

  // update
  Future<void> updateHomeBoard({required HomeBoardID uid, required HomeBoard homeboard}) =>
      _firestore.doc(homeBoardPath(uid, homeboard.id)).update(homeboard.toMap());

  // delete
  Future<void> deleteHomeBoard({required HomeBoardID uid, required HomeBoardID homeboardId}) async {}

  // read
  Stream<HomeBoard> watchHomeBoard({required HomeBoardID uid, required HomeBoardID homeboardId}) => _firestore
      .doc(homeBoardPath(uid, homeboardId))
      .withConverter<HomeBoard>(
        fromFirestore: (snapshot, _) => HomeBoard.fromMap(snapshot.data()!, snapshot.id),
        toFirestore: (homeboard, _) => homeboard.toMap(),
      )
      .snapshots()
      .map((snapshot) => snapshot.data()!);

  Stream<List<HomeBoard>> watchHomeBoards({required HomeBoardID uid}) =>
      queryHomeBoard(uid: uid).snapshots().map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());

  Query<HomeBoard> queryHomeBoard({required HomeBoardID uid}) =>
      _firestore.collection(homeBoardsPath(uid)).withConverter(
            fromFirestore: (snapshot, _) => HomeBoard.fromMap(snapshot.data()!, snapshot.id),
            toFirestore: (homeboard, _) => homeboard.toMap(),
          );

  Future<List<HomeBoard>> fetchHomeBoard({required HomeBoardID uid}) async {
    final homeboard = await queryHomeBoard(uid: uid).get();
    return homeboard.docs.map((doc) => doc.data()).toList();
  }
}

@Riverpod(keepAlive: true)
HomeBoardRepository homeboardRepository(Ref ref) {
  return HomeBoardRepository(FirebaseFirestore.instance);
}

@riverpod
Query<HomeBoard> homeboardQuery(Ref ref) {
  final user = ref.watch(firebaseAuthProvider).currentUser;
  if (user == null) {
    throw AssertionError('User can\'t be null');
  }
  final repository = ref.watch(homeboardRepositoryProvider);
  return repository.queryHomeBoard(uid: user.uid);
}

@riverpod
Stream<HomeBoard> homeboardStream(Ref ref, HomeBoardID homeboardId) {
  final user = ref.watch(firebaseAuthProvider).currentUser;
  if (user == null) {
    throw AssertionError('User can\'t be null');
  }
  final repository = ref.watch(homeboardRepositoryProvider);
  return repository.watchHomeBoard(uid: user.uid, homeboardId: homeboardId);
}
