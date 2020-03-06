import 'package:video_feed_app/app/theme/constants.dart';
import 'package:flutter/material.dart';

class FeedsHeader extends StatelessWidget {
  final String title;

  const FeedsHeader({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 130,
          decoration: BoxDecoration(
            gradient: kBackgroundGradient,
          ),
          child: Center(
            child: Text(
              this.title,
              style: Theme.of(context).textTheme.headline,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
