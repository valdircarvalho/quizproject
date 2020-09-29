import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:quizproject/main.dart';
import 'package:quizproject/pagetwo/pagetwo.dart';
import 'package:share/share.dart';

class pagethree extends StatefulWidget {
  @override
  _pagethree createState() => _pagethree();
}

class _pagethree extends State<pagethree> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz - Covid19"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                Share.share(
                    "Jogo Quiz sobre o Covid19 - Projeto FPA 2020.1 - Jogue Você também");
              })
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Score Final:",
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
