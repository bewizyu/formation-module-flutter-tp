import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_feed_app/app/modules/auth/bloc/auth_bloc.dart';
import 'package:video_feed_app/app/modules/auth/bloc/auth_event.dart';
import 'package:video_feed_app/app/theme/constants.dart';
import 'package:video_feed_app/app/widgets/my_feeds_button.dart';
import 'package:video_feed_app/app/widgets/my_feeds_header.dart';
import 'package:flutter/material.dart';

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
              child: Center(
                child: MyFeedsButton(
                  whiteBtn: true,
                  label: 'Logout',
                  onClick: () {
                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(LoggedOut());
                  },
                ),
              ),
            ),
          ]),
        )
      ],
    );
  }
}
