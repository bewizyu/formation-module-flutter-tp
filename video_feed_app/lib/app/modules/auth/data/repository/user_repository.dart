import 'package:meta/meta.dart';

class UserRepository {

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    return Future.delayed(Duration(milliseconds: 1000))
        .then((_) => 'TESTTOKEN');
  }

  Future<void> resendVerificationEmail({
    @required String username,
    @required String password,
  }) async {
    return Future.delayed(Duration(milliseconds: 1000));
  }

  Future<String> create({
    @required String username,
    @required String email,
    @required String password,
  }) async {
    return Future.delayed(Duration(milliseconds: 1000))
        .then((_) => 'TESTTOKEN');
  }

  Future<void> logoutUser() async {
    return Future.delayed(Duration(milliseconds: 1000));
  }

  Future<void> persistUser(String token) async {
    return Future.delayed(Duration(milliseconds: 1000));
  }

  Future<bool> hasUserLoggedIn() async {
    return Future.delayed(Duration(milliseconds: 1000)).then((_) => false);
  }
}
