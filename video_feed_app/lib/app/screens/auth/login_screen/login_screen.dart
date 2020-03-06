import 'package:video_feed_app/app/theme/constants.dart';
import 'package:video_feed_app/app/widgets/my_feeds_header.dart';
import 'package:flutter/material.dart';



class LoginScreen extends StatelessWidget {


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
                  // TODO 2 : Ajouter un titre
                  title: '',
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  height: MediaQuery.of(context).size.height - 200,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 10),
                  // TODO 3 Utiliser le widget LoginForm
                  child: Container(),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
