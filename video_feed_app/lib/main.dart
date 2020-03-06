import 'package:flutter/material.dart';
import 'package:video_feed_app/app/theme/constants.dart';

import 'app_routes.dart';

void main() => runApp(VideoFeedsApp());

class VideoFeedsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feeds App',
      theme: generateVideoFeedsTheme(context),
      builder: (_, widget) {
        return Container(
          child: widget,
        );
      },
      initialRoute: kMainRoute,
      routes: kRoutes,
    );
  }
}
