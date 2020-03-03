import 'package:video_feed_app/app/theme/constants.dart';
import 'package:flutter/material.dart';

class MyFeedsButton extends StatefulWidget {
  final Function onClick;
  final String label;
  final bool whiteBtn;

  const MyFeedsButton(
      {Key key, this.onClick, this.label = '', this.whiteBtn = false})
      : super(key: key);

  @override
  _MyFeedsButtonState createState() => _MyFeedsButtonState();
}

class _MyFeedsButtonState extends State<MyFeedsButton> {
  @override
  Widget build(BuildContext context) {
    TextStyle btnStyle =
        Theme.of(context).textTheme.display1.copyWith(color: kColorWhite);

    if (widget.whiteBtn) {
      btnStyle = btnStyle.copyWith(color: kColorBluePrimary);
    }
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        if (widget.onClick != null) {
          widget.onClick();
        }
      },
      child: Container(
        padding: EdgeInsets.all(10),
        constraints: BoxConstraints(minWidth: 150),
        decoration: BoxDecoration(
          color: kColorWhite,
          gradient: widget.whiteBtn ? null : kBackgroundGradient,
          borderRadius: BorderRadius.circular(5),
          border: widget.whiteBtn
              ? Border.all(color: kColorBluePrimary, width: 1)
              : null,
        ),
        child: Text(
          widget.label,
          style: btnStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
