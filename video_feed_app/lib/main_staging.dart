import 'package:bloc/bloc.dart';
import 'package:video_feed_app/core/bloc/SimpleBlocDelegate.dart';
import 'package:video_feed_app/core/crashlytics/crashlytics.dart';
import 'package:flutter/material.dart';

import 'core/environments/environment.dart';
import 'core/environments/environment_provider.dart';
import 'main.dart';

void main() {
  CrashlyticsConfiguration.initialize(enableInDevMode: true);
  BlocSupervisor.delegate = SimpleBlocDelegate(isDev: true);
  runApp(app);
}

final app = EnvironmentProvider(
  env: const Environment(
    baseUrl: '',
    appTitle: 'Feeds Staging',
  ),
  child: VideoFeedsApp(),
);
