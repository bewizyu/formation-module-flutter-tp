import 'package:video_feed_app/app/modules/auth/data/repository/user_repository.dart';
import 'package:video_feed_app/app/modules/account/bloc/account_bloc.dart';
import 'package:video_feed_app/app/screens/account/creation/widgets/create_account_form.dart';
import 'package:video_feed_app/app/theme/constants.dart';
import 'package:video_feed_app/app/widgets/my_feeds_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountScreen extends StatelessWidget {
  final UserRepository userRepository;

  const CreateAccountScreen({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PassportBloc>(
      create: (context) {
        return PassportBloc(
          userRepository: userRepository,
        );
      },
      child: Scaffold(
        backgroundColor: kColorPrimaryGrey,
        body: SafeArea(
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
                    title: 'YOUR ACCOUNT',
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: CreateAccountForm(),
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
