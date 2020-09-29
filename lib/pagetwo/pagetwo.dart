import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:quizproject/pagetwo/pagethree.dart';
import 'package:quizproject/pagetwo/questoes.dart';
import 'dart:math';

class pagetwo extends StatefulWidget {
  @override
  _pagetwoState createState() => _pagetwoState();
}

/*class data {String score;
  Data({this.score});
}*/

class _pagetwoState extends State<pagetwo> {
  //https://portal.fiocruz.br/coronavirus/perguntas-e-respostas

  var contador = 0;
  var score = 0;

  List listaquestoes = [
    questoes(
        "1 - Existe um sabão/sabonete específico que  serve para higienizar as mãos?",
        false),
    questoes("2 - A tuberculose coloca a pessoa em um grupo de risco?", true),
    questoes(
        "3 - A máscara de proteção, mesmo que de pano, ajuda a proteger do novo coronavírus?",
        true),
    questoes(
        "4 - A máscara de proteção, mesmo que de pano, ajuda a proteger do novo coronavírus?",
        true),
    questoes(
        "5 - A máscara de proteção, mesmo que de pano, ajuda a proteger do novo coronavírus?",
        true),
    questoes(
        "6 - A máscara de proteção, mesmo que de pano, ajuda a proteger do novo coronavírus?",
        true),
    questoes(
        "7 - A máscara de proteção, mesmo que de pano, ajuda a proteger do novo coronavírus?",
        true),
    questoes(
        "8 - A máscara de proteção, mesmo que de pano, ajuda a proteger do novo coronavírus?",
        true),
    questoes(
        "9 - A máscara de proteção, mesmo que de pano, ajuda a proteger do novo coronavírus?",
        true)
  ];

  verificacorrecao(bool alternativa, BuildContext ctx) {
    if (alternativa == listaquestoes[contador].correto) {
      score = score + 10;
      final snackbar = SnackBar(
        content: Text("Resposta Correta! \o/"),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
      );
      Scaffold.of(ctx).showSnackBar(snackbar);
    } else {
      score = score + 0;
      final snackbar = SnackBar(
        content: Text("Resposta Incorreta! ):"),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
      );
      Scaffold.of(ctx).showSnackBar(snackbar);
    }

    setState(() {
      if (contador < 8) {
        contador = contador + 1;
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => pagethree()),
            (Route<dynamic> route) => false);
      }
    });
  }

  reset() {
    setState(() {
      contador = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quiz - Covid19"),
          centerTitle: true,
          //actions: [IconButton(icon: Icon(Icons.apps), onPressed: null)],
        ),
        backgroundColor: Colors.white,
        body: Builder(
            builder: (ctx) => Container(
                margin: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 200,
                            width: 350,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(color: Colors.blue)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  listaquestoes[contador].texto,
                                  style: TextStyle(fontSize: 25.0),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding:
                                EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
                            child: RaisedButton(
                              onPressed: () => verificacorrecao(true, ctx),
                              child: Text(
                                "Verdadeiro",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding:
                                EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
                            child: RaisedButton(
                              onPressed: () => verificacorrecao(false, ctx),
                              child: Text(
                                "Falso",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                                child: Text(
                                  "SCORE: $score de 100",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 25.0),
                                ))),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                          child: Text(
                            "PPGIA - FPA 2020.1",
                            textAlign: TextAlign.center,
                          ),
                        )),
                      ],
                    ),
                  ],
                ))));
  }
}

/*
  int _contador = 1;
  int _nota = 0;
  var _questaoum = [
    "Qualquer sabão/sabonete serve para higienizar as mãos?",
    "Sim",
    "Não"
        "Possivelmente sim"
        "Com certeza não"
  ];
  var _questaodois = [
    "A máscara de proteção, mesmo que de pano, ajuda a proteger do novo coronavírus?",
    "Sim",
    "Não",
    "Possivelmente sim",
    "Com certeza não",
  ];
  var _questaotres = [
    "O número de casos notificados do novo coronavírus é inferior ao real?",
    "Sim, ainda há subnotificação",
    "Não, todos os casos são contabilizados",
    "Possivalmente sim",
    "Com certeza não"
  ];
  var _questaoquatro = [
    "A tuberculose coloca a pessoa em um grupo de risco?",
    "Sim",
    "Não",
    "Possivelmente sim",
    "Com certeza não"
  ];
  var _questaocinco = [
    "Fumantes correm mais risco de infecção pelo novo coronavírus?",
    "Sim",
    "Não",
    "Possivelmente sim",
    "Com certeza não"
  ];

  //var _valor = new List(5);
  var _valor = [
    "Qualquer sabão/sabonete serve para higienizar as mãos?",
    "Sim",
    "Não",
    "Possivelmente sim",
    "Com certeza não"
  ];

  void _proxima(_alfa) {
    setState(() {
      _contador += _alfa;

      switch (_contador) {
        case 1:
          {
            _valor = _questaoum;
            break;
          }
        case 2:
          {
            _valor = _questaodois;
            break;
          }
        case 3:
          {
            _valor = _questaotres;
            break;
          }
        case 4:
          {
            _valor = _questaoquatro;
            break;
          }
        case 5:
          {
            _valor = _questaocinco;
            break;
          }
      }
      ;
    });
  }

  void _score() {
    var _pontuacao = 1;
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz - Tema a Definir"),
        centerTitle: true,
        //actions: [IconButton(icon: Icon(Icons.apps), onPressed: null)],
      ),
      backgroundColor: Colors.white,
      body:
      SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //mainAxisAlignment: MainAxisAlignment.,
          children: [
            Row(
              children: [
                Expanded(child: Container(
                    padding: new EdgeInsets.fromLTRB(1.0, 10.0, 20.0, 1.0),
                    child:
                    Flexible(child:
                      Column(
                        children: [
                          Text("${_valor[0]}", style: TextStyle(fontSize: 30.0), textAlign: TextAlign.center,),
                        ],
                      )
                    ),
                ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child:
                  Container(
                    padding: new EdgeInsets.fromLTRB(1.0, 1.0, 10.0, 1.0),
                    child:
                    RaisedButton(onPressed: () {},
                      child: Text("${_valor[1]}", style:
                      TextStyle(color: Colors.white, fontSize: 20.0),),
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child:
                  Container(
                    padding: new EdgeInsets.fromLTRB(1.0, 1.0, 10.0, 1.0),
                    child:
                    RaisedButton(onPressed: () {},
                      child: Text("${_valor[2]}", style:
                      TextStyle(color: Colors.white, fontSize: 20.0),),
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child:
                  Container(
                    padding: new EdgeInsets.fromLTRB(1.0, 1.0, 10.0, 1.0),
                    child:
                    RaisedButton(onPressed: () {},
                      child: Text("${_valor[3]}", style:
                      TextStyle(color: Colors.white, fontSize: 20.0),),
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child:
                  Container(
                    padding: new EdgeInsets.fromLTRB(1.0, 1.0, 10.0, 1.0),
                    child:
                    RaisedButton(onPressed: () {},
                      child: Text("${_valor[4]}", style:
                      TextStyle(color: Colors.white, fontSize: 20.0),),
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child:
                  Container(
                    padding: new EdgeInsets.fromLTRB(1.0, 10.0, 10.0, 10.0),
                    child:
                    RaisedButton(onPressed: () {
                      _proxima(-1);
                      */ /*Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => pagethree()));*/ /*
                    },
                      child: Text("Anterior", style:
                      TextStyle(color: Colors.white, fontSize: 20.0),),
                      color: Colors.blue,
                    ),
                  ),
                ),
                Expanded(
                  child:
                  Container(
                    padding: new EdgeInsets.fromLTRB(1.0, 10.0, 10.0, 10.0),
                    child:
                    RaisedButton(onPressed: () {
                      _proxima(1);
                    },
                      child: Text("Próximo", style:
                      TextStyle(color: Colors.white, fontSize: 20.0),),
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),

            Text("PPGIA - FPA 2020.1", textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
  }*/
