import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'local_store.dart';

/// Who is using the app right now.
sealed class Session {
  const Session();
  String get displayName;
}

class SignedOut extends Session {
  const SignedOut();
  @override
  String get displayName => '';
}

class GuestSession extends Session {
  const GuestSession(this.profile);
  final GuestProfile profile;
  @override
  String get displayName => profile.name;
}

class AccountSession extends Session {
  const AccountSession(this.user);
  final User user;
  @override
  String get displayName => user.displayName ?? user.email?.split('@').first ?? '';
}

/// Why a sign-in failed. The UI turns the code into a translated message.
class AuthFailure implements Exception {
  const AuthFailure(this.code);

  /// One of: not_configured, cancelled, invalid_email, wrong_password,
  /// user_not_found, email_in_use, weak_password, network, too_many, unknown.
  final String code;

  static AuthFailure from(Object e) {
    if (e is AuthFailure) return e;
    if (e is FirebaseAuthException) {
      return AuthFailure(switch (e.code) {
        'invalid-email' => 'invalid_email',
        'wrong-password' || 'invalid-credential' || 'invalid-login-credentials' => 'wrong_password',
        'user-not-found' => 'user_not_found',
        'email-already-in-use' => 'email_in_use',
        'weak-password' => 'weak_password',
        'network-request-failed' => 'network',
        'too-many-requests' => 'too_many',
        'web-context-cancelled' || 'canceled' || 'popup-closed-by-user' || 'user-cancelled' => 'cancelled',
        _ => 'unknown',
      });
    }
    return const AuthFailure('unknown');
  }
}

/// Sign in with Google, Apple, email, or as a guest.
///
/// Google, Apple and email need Firebase: add `google-services.json`
/// (Android) and `GoogleService-Info.plist` (iOS) — see README. Without them
/// the app still runs and guest mode works; the other buttons explain that
/// sign-in isn't set up yet.
class AuthService extends ValueNotifier<Session> {
  AuthService._() : super(const SignedOut());

  static final AuthService instance = AuthService._();

  bool _firebaseReady = false;
  bool get firebaseReady => _firebaseReady;

  Future<void> init() async {
    try {
      await Firebase.initializeApp();
      _firebaseReady = true;
    } catch (e) {
      debugPrint('Firebase not configured, only guest mode is available: $e');
    }
    final user = _firebaseReady ? FirebaseAuth.instance.currentUser : null;
    final guest = LocalStore.instance.guest;
    if (user != null) {
      value = AccountSession(user);
    } else if (guest != null) {
      value = GuestSession(guest);
    }
  }

  FirebaseAuth get _auth {
    if (!_firebaseReady) throw const AuthFailure('not_configured');
    return FirebaseAuth.instance;
  }

  Future<void> continueAsGuest({String name = ''}) async {
    value = GuestSession(await LocalStore.instance.createGuest(name: name));
  }

  Future<void> signInWithGoogle() => _provider(GoogleAuthProvider());

  Future<void> signInWithApple() => _provider(AppleAuthProvider()..addScope('email')..addScope('name'));

  Future<void> _provider(AuthProvider provider) async {
    try {
      final cred = kIsWeb ? await _auth.signInWithPopup(provider) : await _auth.signInWithProvider(provider);
      await _signedIn(cred.user);
    } catch (e) {
      throw AuthFailure.from(e);
    }
  }

  Future<void> signUpWithEmail({required String name, required String email, required String password}) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password);
      await cred.user?.updateDisplayName(name.trim());
      await cred.user?.reload();
      await _signedIn(_auth.currentUser);
    } catch (e) {
      throw AuthFailure.from(e);
    }
  }

  Future<void> logInWithEmail({required String email, required String password}) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(email: email.trim(), password: password);
      await _signedIn(cred.user);
    } catch (e) {
      throw AuthFailure.from(e);
    }
  }

  Future<void> sendPasswordReset(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } catch (e) {
      throw AuthFailure.from(e);
    }
  }

  Future<void> _signedIn(User? user) async {
    if (user == null) throw const AuthFailure('unknown');
    value = AccountSession(user);
  }

  /// Signs out. For a guest this also deletes their local data.
  Future<void> signOut() async {
    if (value is GuestSession) await LocalStore.instance.clearGuest();
    if (_firebaseReady) await FirebaseAuth.instance.signOut();
    value = const SignedOut();
  }
}
