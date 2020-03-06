import 'package:video_feed_app/app/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:video_feed_app/app_routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    // TODO 7 : ajouter Un bloc listener : BlocListener<AuthenticationBloc, AuthenticationState> dans lequel rediriger vers l'ecran login si on a un state de type Unauthenticated
    // Supprimer le boutton 'GO TO LOGIN PAGE' qui ne sert plus à rien
    
    return Container(
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: RaisedButton(
              child: Text('GO TO LOGIN PAGE'),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, kLoginRoute, (_) => false);
              },
            ),
          )
        ],
      ),
    );
  }
}
