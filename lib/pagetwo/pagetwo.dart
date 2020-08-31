import 'package:flutter/material.dart';

class pagetwo extends StatefulWidget {
  @override
  _pagetwoState createState() => _pagetwoState();
}

class _pagetwoState extends State<pagetwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz - Tema a Definir"),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.apps), onPressed: null)],
      ),
      backgroundColor: Colors.white,
      body:
      SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text("1ª: Dados da Questão", style: TextStyle(fontSize: 30.0)),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child:
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        Radio(value: 1, groupValue: 0, onChanged: null)
                      ],
                    ),
                ),
                Text("Alternativa 1", textAlign: TextAlign.center,)
              ],
            ),
            Row(
              children: [
                Expanded(
                  child:
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [
                      Radio(value: 1, groupValue: 0, onChanged: null)
                    ],
                  ),
                ),
                Text("Alternativa 2", textAlign: TextAlign.center,)
              ],
            ),
            Row(
              children: [
                Expanded(
                  child:
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [
                      Radio(value: 1, groupValue: 0, onChanged: null)
                    ],
                  ),
                ),
                Text("Alternativa 3", textAlign: TextAlign.center,)
              ],
            ),
            Row(
              children: [
                Expanded(
                  child:
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [
                      Radio(value: 1, groupValue: 0, onChanged: null)
                    ],
                  ),
                ),
                Text("Alternativa 4", textAlign: TextAlign.center,)
              ],
            ),
            RaisedButton(onPressed: () {},
              child: Text("Responder", style:
              TextStyle(color: Colors.white, fontSize: 20.0),),
              color: Colors.blue,
            ),
            Text("PPGIA - FPA 2020.1", textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
