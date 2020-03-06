import 'package:video_feed_app/app/modules/auth/bloc/auth_bloc.dart';
import 'package:video_feed_app/app/modules/auth/bloc/auth_state.dart';
import 'package:video_feed_app/app/modules/login/bloc/login_bloc.dart';
import 'package:video_feed_app/app/modules/login/bloc/login_event.dart';
import 'package:video_feed_app/app/modules/login/bloc/login_state.dart';
import 'package:video_feed_app/app/theme/constants.dart';
import 'package:video_feed_app/app/widgets/my_feeds_button.dart';
import 'package:video_feed_app/app/widgets/my_feeds_input.dart';
import 'package:video_feed_app/app_routes.dart';
import 'package:video_feed_app/core/utils/validatorService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //State vars
  bool _autoValidateForm = false;

  _onLoginButtonPressed() {
    if (_formKey.currentState.validate()) {
      // TODO 9 : envoyer un event de type LoginButtonPressed sur le LoginBloc
    } else {
      FocusScope.of(context).requestFocus(FocusNode());
      _formKey.currentState.validate();
      setState(() => _autoValidateForm = true);
    }
  }

  Future<void> _showEmailVerificationMessage(BuildContext buildContext) async {
    return showDialog<void>(
      context: buildContext,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Email verification'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Your email addess is not verified !',
                  style: Theme.of(context).textTheme.display1.copyWith(
                        color: kColorDarkBlue,
                      ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Resend E-mail'),
              onPressed: () {
                Navigator.of(context).pop();
                BlocProvider.of<LoginBloc>(buildContext).add(
                  ResetEmailButtonPressed(
                    username: _usernameController.text,
                    password: _passwordController.text,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            // TODO 8 : Afficher un message d'erreur si LoginFailure (utiliser Scaffold.of(context).showSnackBar) pour afficher un snackbar
          },
        ),

      ],
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.only(top: 50),
            child: Form(
              autovalidate: _autoValidateForm,
              key: _formKey,
              child: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyFeedsInput(
                        keyboardType: TextInputType.emailAddress,
                        textController: _usernameController,
                        labelText: 'Email',
                        validatorFunction: ValidatorService.validateEmail(
                            _usernameController.text),
                      ),
                      MyFeedsInput(
                        keyboardType: TextInputType.visiblePassword,
                        textController: _passwordController,
                        labelText: 'Password',
                        isPassword: true,
                        validatorFunction: ValidatorService.validatePassword(
                            _passwordController.text),
                      ),
                      Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 20, left: 30),
                          child: Text(
                            'Forgot your password ?',
                            style: Theme.of(context)
                                .textTheme
                                .display2
                                .copyWith(
                                    color: kColorBluePrimary,
                                    decoration: TextDecoration.underline),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      state is LoginLoading
                          ? CircularProgressIndicator()
                          : MyFeedsButton(
                              label: 'Login',
                              onClick: state is! LoginLoading
                                  ? _onLoginButtonPressed
                                  : null,
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
                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 5),
                          child: Text(
                            'Don’t have an account ?',
                            style: Theme.of(context)
                                .textTheme
                                .display1
                                .copyWith(color: kColorSecondaryGrey),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        MyFeedsButton(
                          whiteBtn: true,
                          label: 'Create an account',
                          onClick: () {
                            Navigator.pushNamed(context, kCreatePassportRoute);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
