import 'package:video_feed_app/app/modules/auth/bloc/auth_bloc.dart';
import 'package:video_feed_app/app/modules/auth/bloc/auth_state.dart';
import 'package:video_feed_app/app/screens/home/feeds/feeds_screen.dart';
import 'package:video_feed_app/app/screens/home/profile/profile_screen.dart';
import 'package:video_feed_app/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum RootScreenType { FEEDS, PROFILE }

class SubMenuItem {
  const SubMenuItem(this.title, this.route, this.screenType, this.icon);
  final String title;
  final String route;
  final IconData icon;
  final RootScreenType screenType;
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<SubMenuItem> subMenuItems = <SubMenuItem>[
    SubMenuItem('Feeds', kFeedsRoute, RootScreenType.FEEDS, Icons.list),
    SubMenuItem(
        'Profile', kProfileRoute, RootScreenType.PROFILE, Icons.account_box),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (_, state) {
          if (state is Unauthenticated) {
            // TODO 4 : rediriger vers la page login si l'utilisateur est deconnecté

            Navigator.pushNamedAndRemoveUntil(
                context, kLoginRoute, (_) => false);
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: IndexedStack(
                // TODO 5 : page a afficher a la stack

                ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            // TODO 6 : ajouter les BottomNavigationBarItem correspondantes aux pages (items)

            items: null,
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ));
  }

  /// Utiliser ce helper pour avoir la page correspondante
  _getRouteView(SubMenuItem item) {
    switch (item.route) {
      case kFeedsRoute:
        return FeedsScreen();
      case kProfileRoute:
        return ProfileScreen();
    }
  }
}
