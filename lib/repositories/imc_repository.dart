import 'package:imcapp/model/imc.dart';

class ImcRepository {
  final List<Imc> _imcs = [];

  Future<void> adicionar(Imc imc) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _imcs.add(imc);
  }

  Future<void> alterar(String id, Imc imc) async {
    await Future.delayed(const Duration(milliseconds: 100));
    Imc imcBanco = _imcs.where((imc) => imc.id == id).single;
    imcBanco.altura = imc.altura;
    imcBanco.peso = imc.peso;
  }

  Future<void> remove(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _imcs.remove(_imcs.where((imc) => imc.id == id).first);
  }

  Future<List<Imc>> listar() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _imcs;
  }

  double calcularIMC(double peso, double altura) {
    // Fórmula para calcular o IMC: peso / (altura * altura)
    double imc = peso / (altura * altura);
    return imc;
  }

  String verificarResultadoIMC(double imc) {
    if (imc < 18.5) {
      return "Abaixo do peso";
    } else if (imc >= 18.5 && imc < 25) {
      return "Peso normal";
    } else if (imc >= 25 && imc < 30) {
      return "Sobrepeso";
    } else if (imc >= 30 && imc < 35) {
      return "Obesidade grau 1";
    } else if (imc >= 35 && imc < 40) {
      return "Obesidade grau 2";
    } else {
      return "Obesidade grau 3";
    }
  }
}
