// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get ob1Title => 'Reduce Screen Addiction';

  @override
  String get ob1Body =>
      'Take control of your digital habits and spend less time on distracting apps.';

  @override
  String get ob1StatAvg => 'Avg daily screen time';

  @override
  String get ob1StatSocial => 'Spent on social media';

  @override
  String get ob2SelectApps => 'Select Apps';

  @override
  String get ob2Title => 'Lock Distracting Apps';

  @override
  String get ob2Body =>
      'Block social media, games, and other distractions with powerful app locking tools.';

  @override
  String get ob2Feature1 => 'One-tap block for any app on your phone';

  @override
  String get ob2Feature2 => 'Schedule lock times and focus windows';

  @override
  String get ob2Feature3 => 'Password-protect blocks so you stay committed';

  @override
  String get sheetTitle => 'Select Apps';

  @override
  String get sheetTotalLocked => 'Total Locked';

  @override
  String get sheetAppsSelected => 'apps selected';

  @override
  String get sheetTimeSaved => 'Time Saved';

  @override
  String get sheetPerDayAvg => 'per day avg';

  @override
  String sheetHoursValue(String h) {
    return '${h}h';
  }

  @override
  String get sheetSearchHint => 'Search apps...';

  @override
  String get sheetCatAll => 'All';

  @override
  String get sheetCatSocial => 'Social';

  @override
  String get sheetCatEntertainment => 'Entertainment';

  @override
  String get sheetCatGames => 'Games';

  @override
  String get sheetAppsHeader => 'APPS';

  @override
  String sheetSelectedCount(int count) {
    return '$count selected';
  }

  @override
  String get sheetNoApps => 'No apps found';

  @override
  String get sheetLockSchedule => 'LOCK SCHEDULE';

  @override
  String get sheetAddCustomSemantic => 'Add a custom lock schedule';

  @override
  String get sheetCustomBadge => '+ Custom';

  @override
  String get sheetSchedMorning => 'Morning';

  @override
  String get sheetSchedWork => 'Work';

  @override
  String get sheetSchedEvening => 'Evening';

  @override
  String get sheetEveryDay => 'Every day';

  @override
  String get sheetWeekdays => 'Weekdays';

  @override
  String get sheetWeekends => 'Weekends';

  @override
  String get sheetUnlockMethod => 'UNLOCK METHOD';

  @override
  String get sheetPin => 'PIN Code';

  @override
  String get sheetPinSub => '4-digit PIN';

  @override
  String get sheetFaceId => 'Face ID';

  @override
  String get sheetFaceIdSub => 'Biometric';

  @override
  String get sheetTouchId => 'Touch ID';

  @override
  String get sheetTouchIdSub => 'Fingerprint';

  @override
  String get sheetFooter => 'You can always change this later';

  @override
  String get sheetConfirmLock => 'Confirm Lock';

  @override
  String sheetRemove(String name) {
    return 'Remove $name';
  }

  @override
  String get sheetCustomTitle => 'Custom schedule';

  @override
  String get sheetCustomBody =>
      'Your selected apps stay locked during this time.';

  @override
  String get sheetNameLabel => 'NAME';

  @override
  String get sheetNameHint => 'e.g. Study time';

  @override
  String get sheetStarts => 'Starts';

  @override
  String get sheetEnds => 'Ends';

  @override
  String get sheetSameTime => 'Start and end are the same';

  @override
  String sheetLockedFor(String duration) {
    return 'Locked for $duration';
  }

  @override
  String sheetLockedForOvernight(String duration) {
    return 'Locked for $duration (overnight)';
  }

  @override
  String sheetDurH(int h) {
    return '${h}h';
  }

  @override
  String sheetDurM(int m) {
    return '${m}m';
  }

  @override
  String sheetDurHM(int h, int m) {
    return '${h}h ${m}m';
  }

  @override
  String get sheetLockStartsAt => 'LOCK STARTS AT';

  @override
  String get sheetLockEndsAt => 'LOCK ENDS AT';

  @override
  String get sheetRepeatOn => 'REPEAT ON';

  @override
  String get sheetAddSchedule => 'Add schedule';

  @override
  String get sheetCustomDefaultName => 'Custom';

  @override
  String sheetChangeTime(String label, String time) {
    return '$label $time. Change time';
  }

  @override
  String get ob3Title => 'Stay Focused Every Day';

  @override
  String get ob3Body =>
      'Use Pomodoro and Deep Focus sessions to boost productivity and achieve more.';

  @override
  String get ob3Pomodoro => 'Pomodoro';

  @override
  String ob3PomodoroSub(int min) {
    return '$min min sessions';
  }

  @override
  String get ob3DeepFocus => 'Deep Focus';

  @override
  String ob3DeepFocusSub(int min) {
    return '$min min flow';
  }

  @override
  String get ob3StatBoost => 'productivity boost';

  @override
  String ob3StatStreakValue(int days) {
    return '$days-day';
  }

  @override
  String get ob3StatStreak => 'streak building';

  @override
  String get ob3StatGoal => 'goal completion';

  @override
  String get ob3StartTimer => 'Start timer';

  @override
  String get ob3PauseTimer => 'Pause timer';

  @override
  String get ob4Title => 'Track Your Progress';

  @override
  String get ob4Body =>
      'Monitor screen time, focus hours, goals, and productivity with beautiful analytics.';

  @override
  String get ob4Weekly => 'Weekly';

  @override
  String get ob4WeeklySub => 'reports';

  @override
  String get ob4Goals => 'Goals';

  @override
  String get ob4GoalsSub => 'tracker';

  @override
  String get ob4Insights => 'Insights';

  @override
  String get ob4InsightsSub => 'AI coach';

  @override
  String get ob4Streaks => 'Streaks';

  @override
  String get ob4StreaksSub => '& badges';

  @override
  String get ob5Title => 'What is your daily average Screen Time?';

  @override
  String get ob5Subtitle => 'On your phone only. Your best guess is okay.';

  @override
  String get ob5More7 => 'More than 7 hours';

  @override
  String get ob5H5to7 => '5-7 hours';

  @override
  String get ob5H4to5 => '4-5 hours';

  @override
  String get ob5H3to4 => '3-4 hours';

  @override
  String get ob5H1to3 => '1-3 hours';

  @override
  String get ob5Under1 => 'Under 1 hour';

  @override
  String get ob6Title => 'What is your occupation?';

  @override
  String get ob6Subtitle =>
      'We\'ll personalize your focus plan based on your work style.';

  @override
  String get ob6Software => 'Software Development';

  @override
  String get ob6Founder => 'CEO / Founder';

  @override
  String get ob6Remote => 'Remote Worker';

  @override
  String get ob6Finance => 'Finance / Ops / Consulting';

  @override
  String get ob6Art => 'Art / Content';

  @override
  String get ob6Education => 'Education';

  @override
  String get ob6Others => 'Others';

  @override
  String get ob7Title => 'Set your daily screen-time goal';

  @override
  String get ob7Subtitle =>
      'You can change this any time. We\'ll nudge you as you get close.';

  @override
  String ob7Hours(String hours) {
    return '${hours}h';
  }

  @override
  String get ob7PerDay => 'per day';

  @override
  String ob7HoursPerDay(String hours) {
    return '$hours per day';
  }

  @override
  String get ob7DialLabel => 'Daily screen-time goal';

  @override
  String get ob7InfoNote =>
      'The average person spends 4h+ on their phone daily. Setting a goal is the first step to reclaiming your time.';

  @override
  String get ob8Title => 'Enable Essential Permissions';

  @override
  String get ob8Subtitle =>
      'Grant access to unlock the full Pausey experience.';

  @override
  String get ob8UsageTitle => 'Usage Access';

  @override
  String get ob8UsageSub => 'Monitor app usage and enforce focus sessions.';

  @override
  String get ob8NotifTitle => 'Notifications';

  @override
  String get ob8NotifSub => 'Timely reminders & progress alerts.';

  @override
  String get ob8TrackTitle => 'Track App Usage';

  @override
  String get ob8TrackSub => 'Daily and weekly breakdowns.';

  @override
  String get ob9Title => 'You\'re all set!';

  @override
  String get ob9Subtitle => 'Your focus environment is ready to go.';

  @override
  String get ob9Enter => 'Enter Pausey';

  @override
  String get ob9Replay => 'Replay Onboarding';

  @override
  String get ob9ScreenTime => 'Screen Time';

  @override
  String get ob9AppsLocked => 'Apps Locked';

  @override
  String get ob9Permissions => 'Permissions';

  @override
  String get ob9FocusMode => 'Focus Mode';

  @override
  String get ob9AllOk => 'All OK';

  @override
  String get ob9On => 'ON';

  @override
  String get ob9Done => 'DONE';

  @override
  String get ob9StreakTitle => 'Day 1 streak starts now';

  @override
  String get ob9StreakSub => 'Complete a session to keep it going';

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

  @override
  String get navHome => 'Home';

  @override
  String get navBlock => 'Block';

  @override
  String get navFocus => 'Focus';

  @override
  String get navInsights => 'Insights';

  @override
  String get navProfile => 'Profile';

  @override
  String get unitH => 'h';

  @override
  String get unitM => 'm';

  @override
  String get sampleData => 'Sample data';

  @override
  String get seeAll => 'See All';

  @override
  String days(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days',
      one: '1 day',
    );
    return '$_temp0';
  }
}
