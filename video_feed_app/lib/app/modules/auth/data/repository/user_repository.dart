import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

class UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    // TODO 4 : remplacer le mock par le traitement d'authentification Firebase
    return Future.delayed(Duration(milliseconds: 1000))
        .then((_) => 'TESTTOKEN');
  }

  Future<void> resendVerificationEmail({
    @required String username,
    @required String password,
  }) async {
    AuthResult result = await _auth.signInWithEmailAndPassword(
        email: username, password: password);
    if (!result.user.isEmailVerified) {
      FirebaseUser user = await _auth.currentUser();
      await user.sendEmailVerification();
    }
    await _auth.signOut();
    return;
  }

  Future<String> create({
    @required String username,
    @required String email,
    @required String password,
  }) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    FirebaseUser currentUser = await _auth.currentUser();

    UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
    userUpdateInfo.displayName = username;
    currentUser.updateProfile(userUpdateInfo);

    await currentUser.reload();

    await currentUser.sendEmailVerification();

    await _auth.signOut();

    return null;
  }

  Future<void> logoutUser() async {
    // TODO 5 : remplacer le mock par le traitement de logout Firebase

    return Future.delayed(Duration(milliseconds: 1000));
  }

  Future<void> persistUser(String token) async {
    return Future.delayed(Duration(milliseconds: 1000));
  }

  Future<bool> hasUserLoggedIn() async {
    // TODO 6 : recuperer l'utilisateur authentifié, et retourner true si l'utilisateur existe bien et qu'il a un email verifié
    return Future.delayed(Duration(milliseconds: 3000)).then((_) => false);
  }
}
