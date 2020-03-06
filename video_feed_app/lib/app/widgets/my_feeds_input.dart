import 'package:video_feed_app/app/theme/constants.dart';
import 'package:video_feed_app/app/theme/icons.dart';
import 'package:flutter/material.dart';

class MyFeedsInput extends StatefulWidget {
  final TextEditingController textController;
  final String labelText;
  final String validatorFunction;
  final bool isPassword;
  final TextInputType keyboardType;

  const MyFeedsInput({
    Key key,
    this.keyboardType,
    this.textController,
    this.labelText = "",
    this.isPassword = false,
    this.validatorFunction,
  }) : super(key: key);

  @override
  _MyFeedsInputState createState() => _MyFeedsInputState();
}

class _MyFeedsInputState extends State<MyFeedsInput> {
  bool isObscure = false;
  @override
  void initState() {
    super.initState();
    isObscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // TODO 1 : Ajouter un TextFormField utiliser les parametre de configuration du widget MyFeedsInput (textController, labelText, ...)
        // TODO 2 :  utiliser suffixIcon pour affichage de l'icone de l'oeil
        // TODO 3 : utiliser isObscure et _buildTogglePasswordBtn pour gerer le mode show/hide password
        // TODO 4 :  Utiliser un fontSize: 14 et color: kColorDarkBlue pour le style du text
        // TODO 5 :  Utiliser le theme textTheme.display1 pour labelStyle, surchargez les valeur color: kColorSecondaryGrey, fontSize: 20
        // TODO 6 :  pour la validation du formulaire utiliser le resultat de validatorFunction pour afficher les erreurs

      ],
    );
  }

  _buildTogglePasswordBtn() {
    return IconButton(
      padding: EdgeInsets.all(0),
      splashColor: Colors.transparent,
      onPressed: () {
        setState(() {
          isObscure = !isObscure;
        });
      },
      icon: Icon(
        widget.isPassword
            ? isObscure ? CustomIcons.eye : CustomIcons.eye_off
            : null,
        color: kColorDarkBlue,
      ),
    );
  }
}
