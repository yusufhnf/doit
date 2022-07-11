import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../helper/error_handler.dart';
import '../../models/user_model.dart';

class FirebaseSocialAuthService {
  final _firebaseAuth = FirebaseAuth.instance;
  final _fbAuth = FacebookAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Stream<User?> watchUser() => _firebaseAuth.authStateChanges();
  User? get getUser => _firebaseAuth.currentUser;

  Future<bool> isSignedIn() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return true;
    }
    return false;
  }

  Future<UserCredential?> _firebaseSignInWithCredential(
      String email, OAuthCredential oAuthCredential) async {
    try {
      final userCredential = await _firebaseAuth.signInWithCredential(
        oAuthCredential,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw AuthException(errorMessage: e.message);
    } catch (e) {
      throw const AuthException();
    }
  }

  Future<bool> createNewUser(User user) async {
    try {
      await _firestore.collection("users").doc(user.uid).set({
        "name": user.displayName,
        "email": user.email,
        "displayImage": user.photoURL
      });
      return true;
    } on FirebaseException catch (e) {
      throw AuthException(errorMessage: e.message);
    } catch (e) {
      return false;
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;
    if (googleAuth == null || googleUser == null) return null;

    final googleOauth = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final firebaseCredential =
        await _firebaseSignInWithCredential(googleUser.email, googleOauth);

    return firebaseCredential;
  }

  Future<UserCredential?> signInWithFacebook() async {
    final result = await _fbAuth.login();
    final accessTokenFB = result.accessToken;

    if (accessTokenFB == null ||
        result.status == LoginStatus.failed ||
        result.status == LoginStatus.cancelled) {
      return null;
    }
    final userProfile = await _fbAuth.getUserData(fields: 'email');
    final faceBookOauth = FacebookAuthProvider.credential(accessTokenFB.token);
    final credential = await _firebaseSignInWithCredential(
        userProfile['email'], faceBookOauth);

    return credential;
  }

  Future<void> signOut() async {
    final isGoogleSignedIn = await GoogleSignIn().isSignedIn();
    if (isGoogleSignedIn) {
      await GoogleSignIn().disconnect();
      await GoogleSignIn().signOut();
    }

    await _firebaseAuth.signOut();
  }
}
