import 'package:flutter/material.dart';
import 'package:services_copel/data/question.dart';
import 'package:services_copel/json/json.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var questions = List<Question>();
  _getQuestions() {
    questions = data.map((e) => Question.fromJson(e)).toList();
  }

  _HomeScreenState() {
    _getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tarefas Copel',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: listaQuestions(),
    );
  }

  Widget listaQuestions() {
    return ListView.builder(
      itemCount: questions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${questions[index].title}'),
          subtitle: Text('${questions[index].enabled}'),
        );
      },
    );
  }
}
