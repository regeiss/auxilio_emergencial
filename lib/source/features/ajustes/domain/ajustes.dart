import 'package:hive/hive.dart';

part 'ajustes.g.dart';

@HiveType(typeId: 0)  
class Ajustes extends HiveObject {

  @HiveField(0)
  final String nome;

  @HiveField(1)
  final String fone;

  @HiveField(2)
  final String email;

  // Constructor
  Ajustes({required this.nome, required this.fone, required this.email});
}