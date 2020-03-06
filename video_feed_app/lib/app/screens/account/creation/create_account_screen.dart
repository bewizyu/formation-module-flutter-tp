import 'package:video_feed_app/app/screens/account/creation/widgets/create_account_form.dart';
import 'package:video_feed_app/app/theme/constants.dart';
import 'package:video_feed_app/app/widgets/my_feeds_header.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorPrimaryGrey,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: kColorPrimaryGrey,
              pinned: false,
              snap: false,
              floating: false,
              expandedHeight: 150,
              flexibleSpace: FlexibleSpaceBar(
                background: FeedsHeader(
                  title: 'YOUR ACCOUNT',
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 10),
                  child: CreateAccountForm(),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
