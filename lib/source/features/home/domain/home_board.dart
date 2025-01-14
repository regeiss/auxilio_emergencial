import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

typedef HomeBoardID = String;

@immutable
class HomeBoard extends Equatable {
  const HomeBoard(
      {required this.id,
      required this.titulo,
      required this.texto,
      required this.data,
      required this.prioridade,
      required this.cor,
      required this.corTexto});
  final HomeBoardID id;
  final String titulo;
  final String texto;
  final DateTime data;
  final int prioridade;
  final String cor;
  final String? corTexto;

  @override
  List<Object> get props => [titulo, texto, data, prioridade, cor, corTexto ?? '#e9e9e7'];

  @override
  bool get stringify => true;

  factory HomeBoard.fromMap(Map<String, dynamic> value, String id) {
    final titulo = value['titulo'] as String;
    final texto = value['texto'] as String;
    final data = value['data'].toDate();
    final prioridade = value['prioridade'] as int;
    final cor = value['cor'] as String;
    final corTexto = value['corTexto'] as String?;

    return HomeBoard(
      id: id,
      titulo: titulo,
      texto: texto,
      data: data,
      prioridade: prioridade,
      cor: cor,
      corTexto: corTexto,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'texto': texto,
      'data': data,
      'prioridade': prioridade,
      'cor': cor,
      'corTexto': corTexto,
    };
  }
}
