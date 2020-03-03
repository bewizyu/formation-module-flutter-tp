import 'package:video_feed_app/app/modules/auth/bloc/auth_bloc.dart';
import 'package:video_feed_app/app/modules/auth/data/repository/user_repository.dart';
import 'package:video_feed_app/app/modules/login/bloc/login_bloc.dart';
import 'package:video_feed_app/app/theme/constants.dart';
import 'package:video_feed_app/app/widgets/my_feeds_header.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository userRepository;

  LoginScreen({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorPrimaryGrey,
      body: SafeArea(
        child: BlocProvider(
          create: (context) {
            return LoginBloc(
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
              userRepository: userRepository,
            );
          },
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: kColorPrimaryGrey,
                pinned: false,
                snap: false,
                floating: false,
                expandedHeight: 150,
                flexibleSpace: FlexibleSpaceBar(
                  background: FeedsHeader(
                    title: 'LOGIN TO YOUR ACCOUNT',
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    height: MediaQuery.of(context).size.height - 200,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: LoginForm(),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
