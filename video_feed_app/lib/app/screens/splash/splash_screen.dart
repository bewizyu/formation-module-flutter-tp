import 'package:video_feed_app/app/modules/auth/bloc/auth_bloc.dart';
import 'package:video_feed_app/app/modules/auth/bloc/auth_state.dart';
import 'package:video_feed_app/app/theme/constants.dart';
import 'package:video_feed_app/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (_, state) {
        if (state is Authenticated) {
          Navigator.pushNamedAndRemoveUntil(context, kHomeRoute, (_) => false);
        }
        if (state is Unauthenticated) {
          Navigator.pushNamedAndRemoveUntil(context, kLoginRoute, (_) => false);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: kBackgroundGradient,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/my-feeds-logo-picto.png',
              width: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: Text(
                  'MY FEEDS',
                  style: Theme.of(context).textTheme.headline,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
