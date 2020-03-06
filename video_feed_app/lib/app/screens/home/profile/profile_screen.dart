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
                    child: Text('Jean Dupon', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
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


}
