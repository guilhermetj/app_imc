import 'package:hive/hive.dart';
import 'package:imcapp/model/imc.dart';

class ImcRepository {
  static late Box _box;
  ImcRepository();

  static Future<ImcRepository> load() async {
    if (Hive.isBoxOpen('imc')) {
      _box = Hive.box('imc');
    } else {
      _box = await Hive.openBox('imc');
    }
    return ImcRepository();
  }

  void salvar(Imc imc) {
    _box.add(imc);
  }

  void editar(Imc imc) {
    final imcBanco = _box.values.firstWhere((x) => x.id == imc.id);
    if (imcBanco != null) {
      _box.put(imcBanco.key, imc);
    }
  }

  void excluir(String id) {
    final imcBanco = _box.values.firstWhere((x) => x.id == id);
    if (imcBanco != null) {
      _box.delete(imcBanco.key);
    }
  }

  dynamic obterDados() {
    return _box.values.cast<Imc>().toList();
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
