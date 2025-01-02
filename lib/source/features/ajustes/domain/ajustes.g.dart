// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ajustes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AjustesAdapter extends TypeAdapter<Ajustes> {
  @override
  final int typeId = 0;

  @override
  Ajustes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ajustes(
      nome: fields[0] as String,
      fone: fields[1] as String,
      email: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Ajustes obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.nome)
      ..writeByte(1)
      ..write(obj.fone)
      ..writeByte(2)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AjustesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
