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

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FeedsVideoPlayer(
                url: videos[index],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        'Lorem Iptsum',
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 40,
                      height: 40,
                      child: Icon(Icons.favorite_border),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        '250',
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  FeedsTag(
                    label: '#Lifestyle',
                  ),
                  FeedsTag(
                    label: '#Good_habits',
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500,',
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(fontSize: 14),
                ),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          elevation: 2,
        );
      },
      itemCount: videos.length,
    );
  }
}
