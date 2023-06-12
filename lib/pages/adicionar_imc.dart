import 'package:flutter/material.dart';
import 'package:imcapp/model/imc.dart';
import 'package:imcapp/repositories/imc_repository.dart';

class AdicionarImcPage extends StatefulWidget {
  final ImcRepository imcRepository;
  final VoidCallback atualizarListaImc;

  const AdicionarImcPage({
    Key? key,
    required this.imcRepository,
    required this.atualizarListaImc,
  }) : super(key: key);

  @override
  State<AdicionarImcPage> createState() => _AdicionarImcPageState();
}

class _AdicionarImcPageState extends State<AdicionarImcPage> {
  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  String resultado = "";
  double valorImc = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Informe seu peso e sua altura para realizar o calculo do imc",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  TextField(
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    controller: pesoController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: "Peso",
                        hintStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(
                          Icons.line_weight,
                          color: Colors.black,
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    controller: alturaController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: "Altura",
                        hintStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(
                          Icons.height,
                          color: Colors.black,
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black)),
                    onPressed: () {
                      valorImc = widget.imcRepository.calcularIMC(
                          double.parse(pesoController.text.replaceAll(",", ".")),
                          double.parse(alturaController.text.replaceAll(",", ".")));
                      resultado = widget.imcRepository.verificarResultadoIMC(valorImc);
                      widget.imcRepository.adicionar(Imc(
                          double.parse(pesoController.text.replaceAll(",", ".")),
                          double.parse(alturaController.text.replaceAll(",", ".")),
                          valorImc,
                          resultado));
                      widget.atualizarListaImc.call();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Calcular",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
