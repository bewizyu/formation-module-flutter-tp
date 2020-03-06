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
        TextFormField(
          autofocus: false,
          obscureText: isObscure,
          keyboardType: widget.keyboardType == null
              ? TextInputType.text
              : widget.keyboardType,
          style: TextStyle(fontSize: 14, color: kColorDarkBlue),
          controller: widget.textController
            ..selection = TextSelection.collapsed(
                offset: widget.textController.text.length),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(top: 8, bottom: 5, right: 10, left: 10),
            hasFloatingPlaceholder: true,
            suffixIcon: widget.isPassword
                ? _buildTogglePasswordBtn()
                : null,
            labelText: widget.labelText != null ? widget.labelText : '',
            labelStyle: Theme.of(context)
                .textTheme
                .display1
                .copyWith(color: kColorSecondaryGrey, fontSize: 20),
          ),
          validator: (value) {
            if (widget.validatorFunction != null) {
              String error = widget.validatorFunction;
              return error;
            }
            return null;
          },
        ),
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
