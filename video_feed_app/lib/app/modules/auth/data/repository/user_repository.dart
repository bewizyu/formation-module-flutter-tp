import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

class UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    AuthResult result = await _auth.signInWithEmailAndPassword(
        email: username, password: password);
    if (!result.user.isEmailVerified) {
      await _auth.signOut();
      throw PlatformException(
          code: 'EMAIL_NOT_VERIFIED',
          message: 'The email addess is not verified');
    }
    return result.user.uid;
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

  Future<String> create(
      {@required String username,
      @required String email,
      @required String password}) async {
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
    await _auth.signOut();
    return;
  }

  Future<void> persistUser(String token) async {
    /// TODO persist user UID for further uses
    return;
  }

  Future<bool> hasUserLoggedIn() async {
    /// TODO remove this delay
    await Future.delayed(Duration(milliseconds: 2000));
    FirebaseUser user = await _auth.currentUser();
    if(user != null && !user.isEmailVerified){
      _auth.signOut();
      return false;
    }
    return user != null;
  }
}
