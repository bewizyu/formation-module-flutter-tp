import 'package:flutter/material.dart';
import 'package:video_feed_app/app/theme/constants.dart';

class FeedsTag extends StatelessWidget {
  final String label;

  const FeedsTag({Key key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kColorDarkBlue,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(5.0),
      child: Text(
        this.label,
        style: Theme.of(context).textTheme.display2,
      ),
    );
  }
}
