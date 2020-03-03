import 'package:video_feed_app/app/modules/auth/bloc/auth_bloc.dart';
import 'package:video_feed_app/core/connectivity/bloc/connectivity_bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:video_feed_app/core/environments/environment.dart';
import 'package:video_feed_app/app/theme/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'app/modules/auth/bloc/auth_event.dart';
import 'app/modules/auth/data/repository/user_repository.dart';
import 'app_routes.dart';

void main() => runApp(VideoFeedsApp());

class VideoFeedsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Feeds App',
      theme: generateVideoFeedsTheme(context),
      builder: (_, widget) {
        return MultiBlocProvider(providers: [
          BlocProvider<ConnectivityBloc>(
            create: (context) =>
                ConnectivityBloc(connectivityRepository: Connectivity()),
          ),

          BlocProvider<AuthenticationBloc>(
            create: (context) {
              return AuthenticationBloc(userRepository: UserRepository())
                ..add(AppStarted());
            },
          ),
        ],
        child: widget,);
      },
      initialRoute: kMainRoute,
      routes: kRoutes,
    );
  }
}
