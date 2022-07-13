import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListaDeTarefas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de tarefas'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/formTarefa');
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: FutureBuilder(
        future: buscarDados(),
        builder: (context,
            AsyncSnapshot<List<Map<String, Object?>>> dadosRetornados) {
          if (!dadosRetornados.hasData) {
            return const CircularProgressIndicator();
          }
          var listaTarefas = dadosRetornados.data!;

          return ListView.builder(
            itemCount: listaTarefas.length,
            itemBuilder: (context, index) {
              var tarefa = listaTarefas[index];

              return Card(
                elevation: 4,
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.pinkAccent,
                    child: Text(listaTarefas[index]["nome"]
                        .toString()
                        .substring(0, 1)
                        .toUpperCase()),
                  ),
                  title: Text(tarefa['nome'].toString()),
                  subtitle: Text(tarefa['descricao'].toString()),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

buscarDados() {
  
}
