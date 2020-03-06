import 'package:flutter/material.dart';
import 'package:video_feed_app/app/widgets/my_feeds_tag.dart';
import 'package:video_feed_app/app/widgets/my_feeds_video_player.dart';

class FeedsList extends StatelessWidget {
  final List<String> videos = [
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4'
  ];
  @override
  Widget build(BuildContext context) {
    // TODO 1 : Afficher une liste view en utilisant ListView.builder
    // TODO 2 : Créer un element de la listview (widgets hint : Card,  Columm, FeedsVideoPlayer, Row, Expanded, Text, InkWell, Icon, FeedsTag... )

    return Container();
  }
}
