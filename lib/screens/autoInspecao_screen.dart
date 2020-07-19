import 'package:flutter/material.dart';

enum Options { bom, aceitavel, fraco, naoAplica }
enum SimNao { sim, nao }

class AutoInspecao extends StatefulWidget {
  @override
  _AutoInspecaoState createState() => _AutoInspecaoState();
}

class _AutoInspecaoState extends State<AutoInspecao> {
  //
  Options _options = Options.bom;
  SimNao _simNao = SimNao.sim;
  Options _options2 = Options.bom;
  //
  final nomeController = TextEditingController();
  final agenciaController = TextEditingController();

  //

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Programa Preservando a Vida (Auto Inspeção)',
              style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(18.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  color: Colors.orange,
                  child: Text(
                    'Identificação:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Registro'),
                ),
                TextField(
                  controller: nomeController,
                  decoration: InputDecoration(labelText: 'Nome Completo'),
                  onChanged: (value) {
                    nomeController.value = TextEditingValue(
                      text: value.toUpperCase(),
                      selection: nomeController.selection,
                    );
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Equipamento'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Agência'),
                  controller: agenciaController,
                  onChanged: (value) {
                    agenciaController.value = TextEditingValue(
                      text: value.toUpperCase(),
                      selection: agenciaController.selection,
                    );
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Data e Hora do início da inspeção'),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  color: Colors.orange,
                  child: Text(
                    'A camera do veículo está ligada e posicionada?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Radio(
                              value: SimNao.sim,
                              groupValue: _simNao,
                              onChanged: (SimNao value) {
                                setState(() {
                                  _simNao = value;
                                });
                              }),
                          Text('Sim'),
                        ],
                      ),
                    ),
                    Container(
                        child: Row(
                      children: [
                        Radio(
                            value: SimNao.nao,
                            groupValue: _simNao,
                            onChanged: (SimNao value) {
                              setState(() {
                                _simNao = value;
                              });
                            }),
                        Text('Não'),
                      ],
                    )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  color: Colors.orange,
                  child: Text(
                    'Inspeção de EPIs e EPCs',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    children: [
                      Text('Bolsa de Proteção Luva AT/BT'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Radio(
                                    value: Options.bom,
                                    groupValue: _options,
                                    onChanged: (Options value) {
                                      setState(() {
                                        _options = value;
                                      });
                                    }),
                                Text('Bom'),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Radio(
                                    value: Options.aceitavel,
                                    groupValue: _options,
                                    onChanged: (Options value) {
                                      setState(() {
                                        _options = value;
                                      });
                                    }),
                                Text('Aceitável'),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Radio(
                                    value: Options.fraco,
                                    groupValue: _options,
                                    onChanged: (Options value) {
                                      setState(() {
                                        _options = value;
                                      });
                                    }),
                                Text('Fraco'),
                              ],
                            ),
                          ),
                          Container(
                              child: Row(
                            children: [
                              Radio(
                                  value: Options.naoAplica,
                                  groupValue: _options,
                                  onChanged: (Options value) {
                                    setState(() {
                                      _options = value;
                                    });
                                  }),
                              Text('Não se aplica'),
                            ],
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                Container(
                  child: Column(
                    children: [
                      Text('Capa impermeável para chuva'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Radio(
                                    value: Options.bom,
                                    groupValue: _options2,
                                    onChanged: (Options value) {
                                      setState(() {
                                        _options2 = value;
                                      });
                                    }),
                                Text('Bom'),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Radio(
                                    value: Options.aceitavel,
                                    groupValue: _options2,
                                    onChanged: (Options value) {
                                      setState(() {
                                        _options2 = value;
                                      });
                                    }),
                                Text('Aceitável'),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Radio(
                                    value: Options.fraco,
                                    groupValue: _options2,
                                    onChanged: (Options value) {
                                      setState(() {
                                        _options2 = value;
                                      });
                                    }),
                                Text('Fraco'),
                              ],
                            ),
                          ),
                          Container(
                              child: Row(
                            children: [
                              Radio(
                                  value: Options.naoAplica,
                                  groupValue: _options2,
                                  onChanged: (Options value) {
                                    setState(() {
                                      _options2 = value;
                                    });
                                  }),
                              Text('Não se aplica'),
                            ],
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
