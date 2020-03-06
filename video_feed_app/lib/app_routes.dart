import 'package:video_feed_app/app/screens/account/creation/create_account_screen.dart';
import 'package:video_feed_app/app/screens/auth/login_screen/login_screen.dart';
import 'package:video_feed_app/app/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

import 'app/modules/auth/data/repository/user_repository.dart';

const kHomeRoute = '/home';
const kLoginRoute = '/login';
const kCreatePassportRoute = '/createPassport';
const kFeedsRoute = '/feeds';
const kProfileRoute = '/profile';

const kMainRoute = '/';

/// My Feeds's routes
final Map<String, WidgetBuilder> kRoutes = {
  kMainRoute: (_) => SplashScreen(),
  kLoginRoute: (_) => LoginScreen(
    userRepository: UserRepository(),
  ),
  kCreatePassportRoute: (_) => CreateAccountScreen(),
};
