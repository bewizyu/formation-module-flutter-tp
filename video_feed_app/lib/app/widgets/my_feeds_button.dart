import 'package:video_feed_app/app/theme/constants.dart';
import 'package:flutter/material.dart';

class MyFeedsButton extends StatelessWidget {
  final Function onClick;
  final String label;
  final bool whiteBtn;

  const MyFeedsButton(
      {Key key, this.onClick, this.label = '', this.whiteBtn = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle btnStyle =
        Theme.of(context).textTheme.display1.copyWith(color: kColorWhite);

    if (whiteBtn) {
      btnStyle = btnStyle.copyWith(color: kColorBluePrimary);
    }
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        // TODO 8 : utiliser la Function onClick
      },
      child: Container(
        padding: EdgeInsets.all(10),
        constraints: BoxConstraints(minWidth: 150),

        // TODO 9 : Appliquer la couleur du fond et les border radius (prendre en compte le toggle whiteBtn)
        child: Text(
          label,
          style: btnStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
