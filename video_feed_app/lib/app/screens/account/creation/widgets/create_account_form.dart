import 'package:video_feed_app/app/modules/account/bloc/account_bloc.dart';
import 'package:video_feed_app/app/modules/account/bloc/account_event.dart';
import 'package:video_feed_app/app/modules/account/bloc/account_state.dart';
import 'package:video_feed_app/app/theme/constants.dart';
import 'package:video_feed_app/app/widgets/my_feeds_button.dart';
import 'package:video_feed_app/app/widgets/my_feeds_input.dart';
import 'package:video_feed_app/core/utils/validatorService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountForm extends StatefulWidget {
  @override
  _CreateAccountFormState createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _autoValidateForm = false;

  _onCreateButtonPressed() {
    setState(() => _autoValidateForm = true);
    if (_formKey.currentState.validate()) {
      BlocProvider.of<PassportBloc>(context).add(
        CreatePassportPressed(
          username: _usernameController.text,
          password: _passwordController.text,
          email: _emailController.text,
        ),
      );
    } else {
      FocusScope.of(context).requestFocus(FocusNode());
      _formKey.currentState.validate();
      setState(() => _autoValidateForm = true);
    }
  }

  Future<void> _showCreationSuccessMessage(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Account created'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Your account has been successfully created, please validate it via the link that was sent to you on your email',
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
                _clearFormFields();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _clearFormFields() {
    setState(() => _autoValidateForm = false);
    _usernameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _passwordConfirmationController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PassportBloc, PassportState>(
      listener: (context, state) {
        if (state is PassportCreationFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error.message),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is PassportCreationSuccess) {
          _showCreationSuccessMessage(context);
        }
      },
      child: BlocBuilder<PassportBloc, PassportState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            autovalidate: _autoValidateForm,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  width: double.infinity,
                  child: Text(
                    'Create your account',
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(color: kColorSecondaryGrey, fontSize: 24),
                    textAlign: TextAlign.left,
                  ),
                ),
                MyFeedsInput(
                  textController: _usernameController,
                  labelText: 'Username',
                  validatorFunction: ValidatorService.validateUsername(
                      _usernameController.text),
                ),
                MyFeedsInput(
                  keyboardType: TextInputType.emailAddress,
                  textController: _emailController,
                  labelText: 'E-mail',
                  validatorFunction:
                      ValidatorService.validateEmail(_emailController.text),
                ),
                MyFeedsInput(
                  keyboardType: TextInputType.visiblePassword,
                  textController: _passwordController,
                  labelText: 'Password',
                  isPassword: true,
                  validatorFunction: ValidatorService.validatePassword(
                      _passwordController.text),
                ),
                MyFeedsInput(
                  keyboardType: TextInputType.visiblePassword,
                  textController: _passwordConfirmationController,
                  labelText: 'Confirm Password',
                  isPassword: true,
                  validatorFunction: ValidatorService.samePasswordValidation(
                      _passwordConfirmationController.text,
                      _passwordController.text),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: state is PassportCreationLoading
                      ? CircularProgressIndicator()
                      : MyFeedsButton(
                          label: 'Create My Account',
                          onClick: () {_onCreateButtonPressed();},
                        ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'Already have an account ?',
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(color: kColorSecondaryGrey),
                    textAlign: TextAlign.center,
                  ),
                ),
                MyFeedsButton(
                  whiteBtn: true,
                  label: 'Login',
                  onClick: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
