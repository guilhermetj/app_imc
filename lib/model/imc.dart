import 'package:flutter/material.dart';

class Imc {
  final String _id = UniqueKey().toString();
  double _peso;
  double _altura;
  double _valorImc;
  String _resultado;

  Imc(this._peso, this._altura, this._valorImc, this._resultado);

  String get id => _id;
  double get peso => _peso;
  double get altura => _altura;
  double get valorImc => _valorImc;
  String get resultado => _resultado;

  set peso(double peso) {
    _peso = peso;
  }

  set altura(double altura) {
    _altura = altura;
  }

  set valorImc(double imc) {
    _valorImc = imc;
  }
  set resultado(String resultado) {
    _resultado = resultado;
  }
}
