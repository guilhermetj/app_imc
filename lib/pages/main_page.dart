import 'package:flutter/material.dart';
import 'package:imcapp/model/imc.dart';
import 'package:imcapp/pages/adicionar_imc.dart';
import 'package:imcapp/repositories/imc_repository.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var imcRepository = ImcRepository();
  final List<Imc> _imcs = [];
  void obterImc() async {
    await imcRepository.listar();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: ListView.builder(
              itemCount: _imcs.length,
              itemBuilder: (BuildContext bc, int index) {
                var imc = _imcs[index];
                return Dismissible(
                  onDismissed: (DismissDirection dismissDirection) async {
                    await imcRepository.remove(imc.id);
                    obterImc();
                  },
                  key: Key(imc.id),
                  child: ListTile(
                    title: Text(imc.altura),
                  ),
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AdicionarImcPage()));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
