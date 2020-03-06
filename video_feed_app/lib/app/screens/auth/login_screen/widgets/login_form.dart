import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50),
      child: Form(
        key: _formKey,
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // TODO 7 : Remplacer les Containers par MyFeedsInput et utiliser les bons validateurs (voir utils/validatorService.dart
                Container(
                  color: Colors.greenAccent,
                  height: 50,
                ),
                Container(
                  color: Colors.deepPurple,
                  height: 50,
                ),
                Container(
                  color: Colors.amber,
                  height: 50,
                ),
              ],
            ),
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // TODO 10 : afficher le boutton login et le boutton  Create an account
                  Container(
                    color: Colors.greenAccent,
                    height: 50,
                  ),
                  Container(
                    color: Colors.amber,
                    height: 50,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
