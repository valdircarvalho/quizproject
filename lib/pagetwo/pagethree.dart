import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:quizproject/main.dart';
import 'package:quizproject/pagetwo/pagetwo.dart';
import 'package:share/share.dart';

class pagethree extends StatefulWidget {
  static const routename = '/pagetwo';
  @override
  _pagethree createState() => _pagethree();
}

class _pagethree extends State<pagethree> {

  @override
  Widget build(BuildContext context) {

   final pagetwo args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz - Covid19"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                Share.share(
                    "Jogo Quiz sobre o Covid19 - Obtive $fscore em pontos. Jogue Você também - Projeto FPA 2020.1 ");
              })
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding:
            EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
            child:
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
                          "Parabéns, Você acaba de finalizar o quiz. Compartilhe o app com seus amigos com a opção no canto superior e pressione Jogar Novamente para iniciar um novo jogo.",
                          style: TextStyle(fontSize: 25.0),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                //args.toString(),
                "Score Final: $fscore",
                style: TextStyle(fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
            ],
          ),

          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 1.0),
                  child: RaisedButton(
                    onPressed: () {
                      fscore = 0 ;
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) => pagetwo()), (Route<dynamic> route) => false);
                    },
                    child: Text(
                      "Jogar Novamente",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
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
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    child: Text(
                      "PPGIA - FPA 2020.1",
                      textAlign: TextAlign.center,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
