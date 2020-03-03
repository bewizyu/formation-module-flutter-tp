import 'package:video_feed_app/app/modules/auth/bloc/auth_bloc.dart';
import 'package:video_feed_app/app/modules/auth/bloc/auth_event.dart';
import 'package:video_feed_app/app/theme/constants.dart';
import 'package:video_feed_app/app/widgets/my_feeds_button.dart';
import 'package:video_feed_app/app/widgets/my_feeds_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_feed_app/app/widgets/my_feeds_tag.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: kColorPrimaryGrey,
          pinned: false,
          snap: false,
          floating: false,
          expandedHeight: 130,
          flexibleSpace: FlexibleSpaceBar(
            background: FeedsHeader(
              title: 'MY PROFILE',
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              height: MediaQuery.of(context).size.height - 200,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/avatar.png',
                    width: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text('Hamza Hsain', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FeedsTag(
                        label: '#Lifestyle',
                      ),
                      FeedsTag(
                        label: '#Good_habits',
                      ),
                    ],
                  ),

                  InkWell(
                    onTap: (){
                      _showInterestsChoiceDialog(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 60),
                      child: Text(
                        'Edit',
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(color: kColorSecondaryGrey, decoration: TextDecoration.underline),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),


                  MyFeedsButton(
                    whiteBtn: true,
                    label: 'Logout',
                    onClick: () {
                      BlocProvider.of<AuthenticationBloc>(context)
                          .add(LoggedOut());
                    },
                  ),
                ],
              ),
            ),
          ]),
        )
      ],
    );
  }

  Future<void> _showInterestsChoiceDialog(BuildContext buildContext) async {

    final List<String> interestsList = List();

    interestsList.add('#Lifestyle');
    interestsList.add('#Good_life');
    interestsList.add('#Best_Friends');

    return showDialog<void>(
      context: buildContext,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('MY INTERESTS'),
          content: Container(
            height: 200,
            width: 100,
            child: ListView(
              children: <Widget>[
                CheckboxListTile(
                  checkColor: kColorWhite,
                  title: Text(
                    'Corona',
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(color: kColorWhite),
                  ),
                  onChanged: (val) {

                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  value: false,
                  activeColor: kColorDarkBlue,
                )
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Validate'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
