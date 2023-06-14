// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imc.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImcAdapter extends TypeAdapter<Imc> {
  @override
  final int typeId = 1;

  @override
  Imc read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Imc()
      ..peso = fields[1] as double
      ..altura = fields[2] as double
      ..valorImc = fields[3] as double
      ..resultado = fields[4] as String;
  }

  @override
  void write(BinaryWriter writer, Imc obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.peso)
      ..writeByte(2)
      ..write(obj.altura)
      ..writeByte(3)
      ..write(obj.valorImc)
      ..writeByte(4)
      ..write(obj.resultado);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImcAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
