// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Pausey';

  @override
  String get tagline => 'Take back your time';

  @override
  String get versionLabel => 'Version 2.0 · App Store Edition';

  @override
  String get skip => 'Skip';

  @override
  String get continueLabel => 'Continue';

  @override
  String get back => 'Back';

  @override
  String get freeToStart => 'Free to start · No credit card needed';

  @override
  String get dataStaysOnDevice => 'Your data never leaves your device.';

  @override
  String get switchToLight => 'Switch to light mode';

  @override
  String get switchToDark => 'Switch to dark mode';

  @override
  String get language => 'Language';

  @override
  String get phoneLanguage => 'Phone language';

  @override
  String get authTitle => 'Pause the scroll.\nOwn your day.';

  @override
  String get authSubtitle =>
      'Create an account to sync your goals and streaks, or try Pausey as a guest.';

  @override
  String get continueWithApple => 'Continue with Apple';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get signUpWithEmail => 'Sign up with email';

  @override
  String get continueAsGuest => 'Continue as guest';

  @override
  String get guestNote => 'Guest data is saved only on this phone.';

  @override
  String get or => 'or';

  @override
  String get haveAccount => 'Already have an account?';

  @override
  String get noAccount => 'New to Pausey?';

  @override
  String get logIn => 'Log in';

  @override
  String get signUp => 'Sign up';

  @override
  String get createAccount => 'Create account';

  @override
  String get signUpTitle => 'Create your account';

  @override
  String get signUpSubtitle => 'Start building calmer screen habits.';

  @override
  String get logInTitle => 'Welcome back';

  @override
  String get logInSubtitle => 'Log in to pick up your streak.';

  @override
  String get fullName => 'Full name';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm password';

  @override
  String get showPassword => 'Show password';

  @override
  String get hidePassword => 'Hide password';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get resetTitle => 'Reset password';

  @override
  String get resetSubtitle =>
      'Enter your email and we\'ll send you a reset link.';

  @override
  String get sendLink => 'Send link';

  @override
  String get resetSent => 'Check your inbox for the reset link.';

  @override
  String get agreeTerms => 'I agree to the Terms and Privacy Policy';

  @override
  String get passwordStrength => 'Password strength';

  @override
  String get strengthWeak => 'Weak';

  @override
  String get strengthOk => 'Okay';

  @override
  String get strengthStrong => 'Strong';

  @override
  String get errNameRequired => 'Enter your name';

  @override
  String get errEmailInvalid => 'Enter a valid email';

  @override
  String get errPasswordShort => 'Use at least 8 characters';

  @override
  String get errPasswordMismatch => 'Passwords don\'t match';

  @override
  String get errTerms => 'Please accept the terms to continue';

  @override
  String get authErr_not_configured =>
      'Sign-in isn\'t set up yet. You can continue as a guest.';

  @override
  String get authErr_cancelled => 'Sign-in was cancelled.';

  @override
  String get authErr_invalid_email => 'That email doesn\'t look right.';

  @override
  String get authErr_wrong_password => 'Email or password is incorrect.';

  @override
  String get authErr_user_not_found =>
      'No account with this email. Sign up instead?';

  @override
  String get authErr_email_in_use =>
      'An account with this email already exists. Log in instead.';

  @override
  String get authErr_weak_password => 'Choose a stronger password.';

  @override
  String get authErr_network => 'No internet connection. Try again.';

  @override
  String get authErr_too_many =>
      'Too many attempts. Wait a minute and try again.';

  @override
  String get authErr_unknown => 'Something went wrong. Try again.';

  @override
  String homeHello(String name) {
    return 'Hi, $name';
  }

  @override
  String get homeHelloGuest => 'Hi there';

  @override
  String get homeGuestBadge => 'Guest mode · saved on this phone';

  @override
  String get homeSubtitle => 'Your plan is ready. Here\'s what you chose.';

  @override
  String get homeDailyGoal => 'Daily goal';

  @override
  String get homeLockedApps => 'Locked apps';

  @override
  String get homeScreenTime => 'Current screen time';

  @override
  String get homeNotSet => 'Not set';

  @override
  String get homeCreateAccount => 'Create an account to back up';

  @override
  String get signOut => 'Sign out';

  @override
  String get signOutGuestWarn =>
      'Signing out deletes guest data on this phone.';

  @override
  String get cancel => 'Cancel';
}
