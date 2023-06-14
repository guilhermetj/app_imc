import 'package:flutter/material.dart';
import 'package:imcapp/model/imc.dart';
import 'package:imcapp/pages/adicionar_imc.dart';
import 'package:imcapp/repositories/imc_repository.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late ImcRepository imcRepository;
  List<Imc> _imcs = [];

  @override
  void initState() {
    super.initState();
    obterImc();
  }

  void obterImc() async {
    imcRepository = await ImcRepository.load();
    _imcs = await imcRepository.obterDados();
    setState(() {});
  }

  void removerImc(Imc imc) async {
    imcRepository.excluir(imc.id);
    _imcs.remove(imc);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            children: [
              const Text(
                "Lista de Imc",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _imcs.length,
                  itemBuilder: (BuildContext bc, int index) {
                    var imc = _imcs[index];
                    return Dismissible(
                      onDismissed: (DismissDirection dismissDirection) {
                        removerImc(imc);
                      },
                      key: Key(imc.id),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          tileColor: imc.valorImc >= 24.9
                              ? const Color.fromARGB(255, 224, 123, 116)
                              : const Color.fromARGB(255, 136, 204, 138),
                          title: Text(
                            imc.resultado.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          subtitle: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Peso: ${imc.peso.toString()} Kg"),
                              Text("Altura: ${imc.altura.toString()} m"),
                              Text(
                                  "Valor do Imc: ${imc.valorImc.toStringAsFixed(2)}"),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdicionarImcPage(
                  imcRepository: imcRepository,
                  atualizarListaImc: obterImc,
                ),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
