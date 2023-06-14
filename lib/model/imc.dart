import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'imc.g.dart';

@HiveType(typeId: 1)
class Imc extends HiveObject{
  @HiveField(0)
  final String id = UniqueKey().toString();
  @HiveField(1)
  double peso = 0;
  @HiveField(2)
  double altura = 0;
  @HiveField(3)
  double valorImc = 0;
  @HiveField(4)
  String resultado = "";
  Imc();
  Imc.criar(this.peso, this.altura, this.valorImc, this.resultado);
}
