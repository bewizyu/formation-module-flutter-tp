import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_feed_app/app/modules/auth/bloc/auth_bloc.dart';
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
          child: MultiBlocProvider(
            providers : [
              BlocProvider<AuthenticationBloc>(
                create: (context) {
                  // TODO 6 : ajouter un BlocProvider<AuthenticationBloc> pour mettre a disposition le state de l'authentification dans l'app
                  // Envoyer un event de type AppStarted pour lancer le workflow de verification ..add(AppStarted())

                  return null;
                },
              ),
            ],
              child: widget,
          ),
        );
      },
      initialRoute: kMainRoute,
      routes: kRoutes,
    );
  }
}
