import 'package:flutter/material.dart';
import 'package:quizproject/pagetwo/pagetwo.dart';

void main() {
  runApp(MaterialApp(
    title: 'Projeto FPA - Quiz',
    home: TelaBase(),
  ));
}

class TelaBase extends StatefulWidget {
  @override
  _TelaBaseState createState() => _TelaBaseState();
}

class _TelaBaseState extends State<TelaBase> {
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
             Icon(
               Icons.account_circle,
               size: 80.0,
             ),
             TextField(
               keyboardType: TextInputType.emailAddress,
               decoration: InputDecoration(labelText: "Insira Seu E-mail"),
               textAlign: TextAlign.center,
             ),
             TextField(
               keyboardType: TextInputType.emailAddress,
               decoration: InputDecoration(labelText: "Insira a Senha"),
               textAlign: TextAlign.center,
             ),
             RaisedButton(onPressed: () {
               Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => pagetwo()));
             },
               child: Text("Login", style:
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
