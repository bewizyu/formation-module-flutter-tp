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
          // TODO 1 : Ajouter un arriere plan en gradiant (utiliser theme/constants.dart )
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
