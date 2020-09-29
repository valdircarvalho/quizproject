import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quizproject/pagetwo/pagetwo.dart';
import 'package:quizproject/pagetwo/pagethree.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(title: 'Projeto FPA - Quiz', home: TelaBase()));

  //FirebaseFirestore.instance.collection("collectionPath").doc("sdlkfj").set({"data":"alsdkjf"});
}

class TelaBase extends StatefulWidget {
  @override
  _TelaBaseState createState() => _TelaBaseState();
}

class _TelaBaseState extends State<TelaBase> {
/*  final String name = 'foo';
  final FirebaseOptions firebaseOptions = const FirebaseOptions(
    appId: '1:373577477696:android:731eca82fb6178984939a5',
    apiKey: 'AIzaSyBasN7eL5Z0RfrAcvkULH5rrsscBVtuwWc',
    projectId: 'quizproject2-b6718',
    messagingSenderId: '373577477696',
  );

  Future<void> initializeDefault() async {
    FirebaseApp app = await Firebase.initializeApp();
    assert(app != null);
    print('Initialized default app $app');
  }

  Future<void> initializeSecondary() async {
    FirebaseApp app =
    await Firebase.initializeApp(name: name, options: firebaseOptions);

    assert(app != null);
    print('Initialized $app');
  }

  void apps() {
    final List<FirebaseApp> apps = Firebase.apps;
    print('Currently initialized apps: $apps');
  }

  void options() {
    final FirebaseApp app = Firebase.app(name);
    final FirebaseOptions options = app?.options;
    print('Current options for app $name: $options');
  }

  Future<void> delete() async {
    final FirebaseApp app = Firebase.app(name);
    await app?.delete();
    print('App $name deleted');
  }*/

  //FirebaseFirestore.instance.collection("collectionPath").doc("sdlkfj").set({"data":"alsdkjf"});
  //Firestore.instance.collection("collectionPath").document("asldkfj").setData({"data":"lskdjf"});


  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz - Covid19"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.account_circle,
              size: 80.0,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: "Insira Seu E-mail"),
              textAlign: TextAlign.center,
              controller: _emailController,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: "Insira a Senha"),
              textAlign: TextAlign.center,
              obscureText: true,
              controller: _passController,
            ),
            RaisedButton(
              onPressed: () async {
               /* try {
               //primeiro teste
                  FirebaseUser user = (await FirebaseAuth.instance.
                  signInWithEmailAndPassword(email: _emailController.text, password: _passController.text)).user;
                //segundo teste
                  FirebaseUser user = FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailController.text, password: _passController.text) as FirebaseUser;
                  if (user != null) {
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) => pagetwo()), (Route<dynamic> route) => false);
                  }
                } catch (e) {
                  print(e);
                  //_emailController = "sdf";
                  //_passController = "sdf";
                }*/

               //navegar para segunda pagina
                /*Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) => pagetwo()), (Route<dynamic> route) => false);*/



                signInWithGoogle().then((result) {
                  if (result != null) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return pagetwo();
                        },
                      ),
                    );
                  }
                });


                },
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
              color: Colors.blue,
            ),
            Text(
              "PPGIA - FPA 2020.1",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}





// classe para login

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult = await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  if (user != null) {
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    print('signInWithGoogle succeeded: $user');

    return '$user';
  }

  return null;
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Signed Out");
}
