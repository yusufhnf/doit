import 'package:doit/src/infrastructure/data/local/preference_storage.dart';
import 'package:doit/src/infrastructure/data/remote/firebase_social_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../helper/error_handler.dart';

class AuthRepository {
  final FirebaseSocialAuthService _firebaseSocialAuthService =
      FirebaseSocialAuthService();
  final PreferenceStorage _preferenceStorage = PreferenceStorage();

  Future<bool> isSignedIn() async {
    final isSignedIn = await _firebaseSocialAuthService.isSignedIn();
    return isSignedIn;
  }

  Future<void> cacheTokenToStorage(String token) async =>
      await _preferenceStorage.setToken(token);

  Future<String?> getUserToken() async => await _preferenceStorage.getToken();

  Future<String> _userToken(UserCredential userCredential) async {
    final token = await userCredential.user?.getIdToken();
    if (token != null) return token;

    throw const RepositoryException('Failed to get Token');
  }

  Future<String?> signInWithGoogle() async {
    final result = await _firebaseSocialAuthService.signInWithGoogle();
    if (result != null) {
      final token = await _userToken(result);
      _preferenceStorage.setToken(token);
      return token;
    }
    return null;
  }

  Future<String?> signInWithFB() async {
    final result = await _firebaseSocialAuthService.signInWithFacebook();
    if (result != null) {
      final token = await _userToken(result);
      _preferenceStorage.setToken(token);
    }

    return null;
  }

  Future<void> signOut() async {
    await _firebaseSocialAuthService.signOut();
    await _preferenceStorage.clearAllStorage();
  }
}
