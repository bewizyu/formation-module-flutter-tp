import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50),
      child: Stack(
        children: <Widget>[
          // TODO 4 : Ajouter la structure du formulaire sous forme de containers vertical,
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Column(
              // TODO 5 : Ajouter la structure des bouttons en bas du formulaire,
            ),
          )
        ],
      ),
    );
  }
}
