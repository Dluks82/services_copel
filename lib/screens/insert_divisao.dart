import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:services_copel/model/divisao_model.dart';

class Armazenamento {
  //
  // obtém o caminho do diretório do app

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // cria uma referência para o arquivo local

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.txt');
  }

  Future<String> lerDados() async {
    try {
      final file = await _localFile;

      // ler o arquivo
      return await file.readAsString();
    } catch (e) {
      return 'erro $e';
    }
  }

  Future<File> gravarDados(String dados) async {
    final file = await _localFile;

    // grava o arquivo
    return file.writeAsString(dados);
  }
}

class InserirDivisao extends StatefulWidget {
  final Armazenamento armazenamento;

  InserirDivisao({Key key, @required this.armazenamento}) : super(key: key);
  @override
  _InserirDivisaoState createState() => _InserirDivisaoState();
}

class _InserirDivisaoState extends State<InserirDivisao> {
  final idController = TextEditingController();
  final siglaController = TextEditingController();
  final descricaoController = TextEditingController();
  List<Divisao> dados = [];

  @override
  void initState() {
    super.initState();
    // widget.armazenamento.gravarDados(
    //     '[{"id":"001", "sigla" : "AGCTS", "descricao":"Agência Curitiba Sul", "ativo": true}, {"id":"002", "sigla" : "AGCTC", "descricao":"Agência Curitiba Centro", "ativo": false}]');

    widget.armazenamento.lerDados().then(
      (jsonString) {
        print(jsonString.runtimeType);
        List divisaoMap = jsonDecode(jsonString);
        print(divisaoMap);
        setState(() {
          dados = divisaoMap.map((e) => Divisao.fromJson(e)).toList();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tarefas Copel',
        theme: ThemeData(
          primaryColor: Colors.orange,
        ),
        home: Scaffold(
          drawer: Drawer(
            child: SafeArea(
              child: Container(
                color: Colors.amber,
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Text(
                  'Teste',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          appBar: AppBar(
            title: Text('Serviços Copel'),
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Column(
                  children: [
                    TextField(
                      controller: idController,
                      decoration: InputDecoration(labelText: 'Id'),
                    ),
                    TextField(
                      controller: siglaController,
                      decoration: InputDecoration(labelText: 'Sigla'),
                    ),
                    TextField(
                      controller: descricaoController,
                      decoration: InputDecoration(labelText: 'Descrição'),
                    ),
                    SizedBox(height: 5.0),
                    RaisedButton(
                      child: Text('Inserir'),
                      onPressed: () => adicionar(),
                      textColor: Colors.white,
                      color: Colors.orange,
                    ),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: dados.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Text('Carregando dados...'),
                                SizedBox(
                                  height: 20.0,
                                ),
                                CircularProgressIndicator(),
                              ])
                        : ListView.builder(
                            padding: EdgeInsets.all(8.0),
                            itemCount: dados.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: Text('${dados[index].ativo}'),
                                trailing: Text('${dados[index].id}'),
                                title: Text('Divisão: ${dados[index].sigla}'),
                                subtitle: Text(
                                    'Descrição: ${dados[index].descricao}'),
                              );
                            },
                          ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  adicionar() async {
    Divisao divisao = Divisao(
        id: idController.text,
        sigla: siglaController.text,
        descricao: descricaoController.text,
        ativo: true);
    setState(() {
      dados.add(divisao);
    });
    String texto = jsonEncode(dados);
    await widget.armazenamento.gravarDados(texto);
    idController.text = '';
    siglaController.text = '';
    descricaoController.text = '';
  }
}
