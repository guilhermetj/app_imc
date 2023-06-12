import 'package:flutter/material.dart';

class Imc {
  final String _id = UniqueKey().toString();
  String _peso = "";
  String _altura = "";

  Imc(this._peso, this._altura);

  String get id => _id;

  String get peso => _peso;

  String get altura => _altura;

  set peso(String peso) {
    _peso = peso;
  }

  set altura(String altura) {
    _altura = altura;
  }
}
