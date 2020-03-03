import 'package:video_feed_app/app/screens/home/feeds/widgets/feeds_list.dart';
import 'package:video_feed_app/app/theme/constants.dart';
import 'package:video_feed_app/app/widgets/my_feeds_header.dart';
import 'package:flutter/material.dart';

class FeedsScreen extends StatefulWidget {
  @override
  _FeedsScreenState createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: kColorPrimaryGrey,
          pinned: false,
          snap: false,
          floating: true,
          expandedHeight: 130,
          flexibleSpace: FlexibleSpaceBar(
            background: FeedsHeader(
              title: 'MY FEEDS',
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: FeedsList(),
            ),
          ]),
        )
      ],
    );
  }
}
