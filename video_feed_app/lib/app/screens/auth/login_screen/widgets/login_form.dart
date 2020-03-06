import 'package:flutter/material.dart';
import 'package:video_feed_app/app/theme/constants.dart';
import 'package:video_feed_app/app/widgets/my_feeds_button.dart';
import 'package:video_feed_app/app/widgets/my_feeds_input.dart';
import 'package:video_feed_app/app_routes.dart';
import 'package:video_feed_app/core/utils/validatorService.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _onLoginButtonPressed() {
    _formKey.currentState.validate();
  }
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
                MyFeedsInput(
                  keyboardType: TextInputType.emailAddress,
                  textController: _usernameController,
                  labelText: 'Email',
                  validatorFunction:
                      ValidatorService.validateEmail(_usernameController.text),
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
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 20, left: 30),
                    child: Text(
                      'Forgot your password ?',
                      style: Theme.of(context).textTheme.display2.copyWith(
                          color: kColorBluePrimary,
                          decoration: TextDecoration.underline),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                MyFeedsButton(
                  label: 'Login',
                  onClick: _onLoginButtonPressed,
                )
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
  }
}
