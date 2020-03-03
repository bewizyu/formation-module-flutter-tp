import 'package:video_feed_app/app/theme/constants.dart';
import 'package:video_feed_app/app/widgets/my_feeds_button.dart';
import 'package:video_feed_app/app/widgets/my_feeds_input.dart';
import 'package:flutter/material.dart';

class OptionsModalScreen extends StatefulWidget {
  @override
  _OptionsModalScreenState createState() => _OptionsModalScreenState();
}

class _OptionsModalScreenState extends State<OptionsModalScreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorDarkBlue,
      body: SafeArea(
          child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Stack(
                  children: <Widget>[
                    Positioned(
                      top: 5,
                      right: 10,
                      child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(
                          Icons.close,
                          color: kColorBluePrimary,
                          size: 40,
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 50, bottom: 20),
                          width: double.infinity,
                          child: Text(
                            'SPOKEN LANGUAGES',
                            style: Theme.of(context)
                                .textTheme
                                .headline
                                .copyWith(color: kColorBluePrimary),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: MyFeedsInput(
                            textController: _searchController,
                            labelText: 'Search a language',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: MyFeedsButton(
                            label: 'Done',
                            onClick: null,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
