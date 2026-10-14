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
  String alSummary(int locked, int total) {
    return '$locked restricted now · $total managed';
  }

  @override
  String alSummaryOff(int total) {
    return '$total managed · blocking off';
  }

  @override
  String get alFromInstalled => 'Choose from installed apps';

  @override
  String get alFromInstalledSub => 'Pick any app on this phone';

  @override
  String get alPermTitle => 'Blocking isn\'t active yet';

  @override
  String get alPermMsg =>
      'Your rules are saved, but Pausey can\'t block apps until you allow these two permissions:';

  @override
  String get alPermUsage => 'Usage access';

  @override
  String get alPermUsageSub => 'See which app is open and today\'s time in it';

  @override
  String get alPermOverlay => 'Display over other apps';

  @override
  String get alPermOverlaySub => 'Show the lock screen over a blocked app';

  @override
  String get alAllow => 'Allow';

  @override
  String get alAllowed => 'Allowed';

  @override
  String get alPermReturn =>
      'Come back to Pausey after allowing — it checks again automatically.';

  @override
  String get alAndroidOnly =>
      'Blocking works on Android only. You can still set up your rules here.';

  @override
  String get alSearchHint => 'Search apps';

  @override
  String get alFilterAll => 'All';

  @override
  String get alFilterLocked => 'Locked now';

  @override
  String get alFilterScheduled => 'Scheduled';

  @override
  String get alFilterAvailable => 'Available';

  @override
  String get alStateLocked => 'Locked';

  @override
  String get alStateWillLock => 'Will lock';

  @override
  String get alStateScheduled => 'Scheduled';

  @override
  String get alStateAvailable => 'Available';

  @override
  String alUsedOf(String used, String limit) {
    return 'Used $used of $limit';
  }

  @override
  String alUsedToday(String used) {
    return 'Used $used today';
  }

  @override
  String get alNoLimit => 'No daily limit';

  @override
  String alLimitNoUsage(String limit) {
    return '$limit daily limit · usage unavailable';
  }

  @override
  String get alRulesOff => 'Restrictions off';

  @override
  String alNextLock(String time) {
    return 'Next lock: $time';
  }

  @override
  String alUnlockedUntil(String time) {
    return 'Unlocked until $time';
  }

  @override
  String get alReasonLimit => 'Daily limit reached';

  @override
  String get alReasonSchedule => 'Lock schedule active';

  @override
  String get alReasonGeneral => 'General schedule active';

  @override
  String get alReasonAllDay => 'Locked all day';

  @override
  String get alReasonFocus => 'Focus session running';

  @override
  String get alNoMatches => 'No apps match';

  @override
  String get alGeneral => 'General';

  @override
  String get alGeneralScheduleSub =>
      'For apps with “Follow general schedule” on';

  @override
  String get alLockAllSub => 'Turn restrictions on for every app';

  @override
  String get alSaved => 'Saved';

  @override
  String get alChangesApply => 'Changes apply immediately';

  @override
  String get alDetailsTitle => 'App Limits';

  @override
  String get alBlockingOff => 'Blocking is off on this phone';

  @override
  String get alRestrictApp => 'Restrict this app';

  @override
  String get alMasterOff => 'Off — Pausey won\'t restrict this app';

  @override
  String get alMasterOnRules => 'Your limit and schedules below apply';

  @override
  String get alMasterOnAllDay => 'No limit or schedule yet — locked all day';

  @override
  String get alMasterOnGeneral => 'Locked during the general schedule';

  @override
  String get alFollowGeneral => 'Follow general schedule';

  @override
  String alFollowGeneralSub(String start, String end) {
    return 'Also lock $start – $end';
  }

  @override
  String get alGeneralOff => 'The general schedule is turned off';

  @override
  String get alDailyLimit => 'Daily limit';

  @override
  String get alDailyLimitOffSub => 'Lock the app after a set time each day';

  @override
  String get alCustom => 'Custom';

  @override
  String get alUsedLabel => 'Used today';

  @override
  String get alLeftLabel => 'Remaining';

  @override
  String get alLimitReached => 'Limit reached for today';

  @override
  String get alResets => 'Resets at midnight (your phone\'s time)';

  @override
  String get alUsageUnavailable => 'Usage unavailable';

  @override
  String get alUsageNeedsAccess =>
      'Allow Usage access so Pausey can count today\'s time.';

  @override
  String get alUsageAndroidOnly =>
      'Usage is measured on Android phones only. The limit still saves and applies there.';

  @override
  String get alGrantUsage => 'Grant usage access';

  @override
  String get alCustomLimitTitle => 'Custom daily limit';

  @override
  String get alHours => 'Hours';

  @override
  String get alMinutes => 'Minutes';

  @override
  String get alErrZeroLimit => 'Pick a time above zero';

  @override
  String get alSave => 'Save';

  @override
  String get alScheduledLocking => 'Scheduled locking';

  @override
  String get alScheduledOffSub => 'Lock this app at set times';

  @override
  String get alNoSchedules => 'No schedules yet';

  @override
  String get alAddSchedule => 'Add schedule';

  @override
  String get alActiveNow => 'Active now';

  @override
  String get alScheduleDefault => 'Lock time';

  @override
  String get alEndsNextDay => 'Ends next day';

  @override
  String get alEdit => 'Edit';

  @override
  String get alDelete => 'Delete';

  @override
  String get alDeleteScheduleQ => 'Delete this schedule?';

  @override
  String alDeleteScheduleMsg(String title) {
    return '“$title” will stop locking this app.';
  }

  @override
  String get alNewSchedule => 'New schedule';

  @override
  String get alEditSchedule => 'Edit schedule';

  @override
  String get alTitleOptional => 'Title (optional)';

  @override
  String get alPresetStudy => 'Study';

  @override
  String get alPresetEvening => 'Evening';

  @override
  String get alPresetSleep => 'Sleep';

  @override
  String get alRepeatOn => 'Repeat on';

  @override
  String get alErrSameTime => 'Start and end can\'t be the same';

  @override
  String get alErrNoDays => 'Pick at least one day';

  @override
  String alTempUnlock(int minutes) {
    return 'Unlock for $minutes min';
  }

  @override
  String alTempUnlockSub(int n) {
    return 'Uses 1 emergency override · $n left today';
  }

  @override
  String get alTempUnlockFocus => 'Can\'t unlock during a Focus session';

  @override
  String get alTempUnlockNotLocked => 'Only needed while the app is locked';

  @override
  String alTempUnlockQ(String app, int minutes) {
    return 'Unlock $app for $minutes minutes?';
  }

  @override
  String get alUnlock => 'Unlock';

  @override
  String get alEndEarly => 'End early';

  @override
  String get alResetRules => 'Reset restrictions';

  @override
  String get alResetRulesSub => 'Remove this app\'s limit and schedules';

  @override
  String alResetQ(String app) {
    return 'Reset restrictions for $app?';
  }

  @override
  String get alResetMsg =>
      'Its daily limit and all schedules will be removed. The app stays in your list.';

  @override
  String get alReset => 'Reset';

  @override
  String get alResetDone => 'Restrictions reset';

  @override
  String get alRemoveApp => 'Remove app';

  @override
  String get alRemoveAppSub => 'Stop managing this app';

  @override
  String alRemoveQ(String app) {
    return 'Remove $app?';
  }

  @override
  String get alRemoveMsg =>
      'Pausey will stop restricting it and forget its limit and schedules.';

  @override
  String get alRemove => 'Remove';

  @override
  String get alNoPackage =>
      'Per-app limits and schedules need one specific installed app. On Android, add it with “Choose from installed apps”.';

  @override
  String get alNotFound => 'This app is no longer managed';

  @override
  String get alPickerTitle => 'Installed apps';

  @override
  String get alPickerAdded => 'Already added';

  @override
  String alPickerAdd(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Add $n apps',
      one: 'Add 1 app',
      zero: 'Add apps',
    );
    return '$_temp0';
  }

  @override
  String get alPickerEmpty => 'No apps found';

  @override
  String get blockTitle => 'App Lock';

  @override
  String get blockAddApp => 'Add App';

  @override
  String get blockFaceIdTitle => 'Face ID Protection';

  @override
  String get blockFaceIdSub => 'Require Face ID to unlock any app';

  @override
  String get blockFaceIdUnavailable =>
      'Biometric unlock isn\'t available on this device';

  @override
  String get blockFaceIdReason => 'Confirm it\'s you to turn on protection';

  @override
  String get blockFaceIdFailed => 'Couldn\'t verify — protection stays off';

  @override
  String get blockScheduleTitle => 'Schedule Lock';

  @override
  String get blockStart => 'Start Time';

  @override
  String get blockEnd => 'End Time';

  @override
  String get blockNeedOneDay => 'Keep at least one day selected';

  @override
  String get blockManagedApps => 'Managed Apps';

  @override
  String get blockLockAll => 'Lock All';

  @override
  String get blockAllLocked => 'All apps are locked';

  @override
  String blockRemoved(String app) {
    return '$app removed';
  }

  @override
  String get blockAppsUpdated => 'Managed apps updated';

  @override
  String get blockCatSocial => 'Social';

  @override
  String get blockCatVideo => 'Video';

  @override
  String get blockCatGames => 'Games';

  @override
  String get blockCatShopping => 'Shopping';

  @override
  String get blockCatCommunity => 'Community';

  @override
  String get blockCatOther => 'Other';

  @override
  String get blockEmptyBadge => 'Nothing blocked';

  @override
  String get blockEmptyTitle => 'No apps managed yet';

  @override
  String get blockEmptyMsg =>
      'Add the apps that distract you most and Pausey will lock them for you.';

  @override
  String get blockEmergencyTitle => 'Emergency Override';

  @override
  String blockEmergencySub(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n left today',
      one: '1 left today',
    );
    return 'Temporarily unlock all apps · $_temp0';
  }

  @override
  String get blockEmergencyOff => 'Turned off in Settings';

  @override
  String get blockEmergencyUse => 'Use';

  @override
  String get blockEmergencyConfirmTitle => 'Use emergency override?';

  @override
  String blockEmergencyConfirmMsg(int n) {
    return 'This uses one of your $n overrides left today. Only use it when you really need an app.';
  }

  @override
  String get blockEmergencyUsed => 'Override used — apps are unlocked for now';

  @override
  String get blockEmergencyNone => 'No overrides left today';

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
  String get ob6OtherHint => 'Type your occupation';

  @override
  String get timeSecondLabel => 'Second';

  @override
  String get focusModePomodoro => 'Pomodoro';

  @override
  String get focusModeDeep => 'Deep Focus';

  @override
  String get focusModeCustom => 'Custom';

  @override
  String get focusRemaining => 'REMAINING';

  @override
  String get focusBreakLabel => 'BREAK';

  @override
  String get focusReadyLabel => 'READY';

  @override
  String get focusInSession => 'In session';

  @override
  String get focusPausedState => 'Paused';

  @override
  String get focusOnBreak => 'On break';

  @override
  String get focusIdleState => 'Tap play to start';

  @override
  String get focusSessionsDone => 'Sessions done';

  @override
  String get focusProgress => 'Progress';

  @override
  String get focusBreakAfter => 'Break after';

  @override
  String get focusFocusedToday => 'Focused today';

  @override
  String focusAppsBlocked(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count apps blocked',
      one: '1 app blocked',
    );
    return '$_temp0';
  }

  @override
  String get focusAppsBlockedSub => 'Distractions are locked for this session.';

  @override
  String get focusNoApps => 'No apps blocked';

  @override
  String get focusNoAppsSub => 'Pick apps to lock while you focus.';

  @override
  String get focusEdit => 'Edit';

  @override
  String get focusAdd => 'Add';

  @override
  String get focusAmbient => 'Ambient Sound';

  @override
  String get focusSoundOff => 'Off';

  @override
  String get focusSoundRain => 'Rain';

  @override
  String get focusSoundForest => 'Forest';

  @override
  String get focusSoundWaves => 'Ocean Waves';

  @override
  String get focusSoundWhite => 'White Noise';

  @override
  String get focusVolume => 'Volume';

  @override
  String get focusStart => 'Start';

  @override
  String get focusPause => 'Pause';

  @override
  String get focusResume => 'Resume';

  @override
  String get focusStop => 'Stop';

  @override
  String get focusRestart => 'Restart';

  @override
  String get focusSkipBreak => 'Skip break';

  @override
  String get focusDurations => 'Session lengths';

  @override
  String focusMinutesN(int n) {
    return '$n min';
  }

  @override
  String get focusBreakLength => 'Break';

  @override
  String get focusCustomTitle => 'Custom duration';

  @override
  String get focusSet => 'Set';

  @override
  String get focusStopTitle => 'End session early?';

  @override
  String get focusStopBody => 'The time you\'ve focused so far will be saved.';

  @override
  String get focusEndSession => 'End session';

  @override
  String get focusKeepGoing => 'Keep going';

  @override
  String get focusTooShort => 'Under a minute — not saved.';

  @override
  String get focusBreakOver => 'Break\'s over — ready for the next one?';

  @override
  String get focusBusy => 'End the current session to change mode.';

  @override
  String get focusFirstHint => 'Your first session starts here — press play.';

  @override
  String get focusCompleteA => 'Session';

  @override
  String get focusCompleteB => 'Complete!';

  @override
  String get focusEndedTitle => 'Session Ended';

  @override
  String focusCompleteMsg(String mode) {
    return 'Outstanding work! You finished your $mode session without a single distraction.';
  }

  @override
  String get focusEndedMsg =>
      'Every minute counts. Try a full session next time.';

  @override
  String get focusDurationLabel => 'FOCUS DURATION';

  @override
  String get focusMinUnit => 'min';

  @override
  String get focusDayStreak => 'Day streak';

  @override
  String get focusAppsLabel => 'Apps blocked';

  @override
  String get focusTodayGoal => 'Today\'s Goal';

  @override
  String focusPctCompleted(int pct) {
    return '$pct% completed';
  }

  @override
  String focusPlusPct(int pct) {
    return '+$pct% from this session';
  }

  @override
  String get focusMomentum => 'Keep the momentum!';

  @override
  String get focusQuote1 =>
      'Consistency beats intensity. Every session compounds into mastery.';

  @override
  String get focusQuote2 => 'Small focused blocks add up to big results.';

  @override
  String get focusQuote3 => 'You didn\'t scroll — you built. Do it again.';

  @override
  String get focusStartNext => 'Start Next Session';

  @override
  String get focusBackHome => 'Back to Dashboard';

  @override
  String get goalsTitle => 'My Goals';

  @override
  String goalsSubtitle(int active, int done) {
    return '$active active · $done completed';
  }

  @override
  String get goalsAdd => 'Add Goal';

  @override
  String get goalsCompleted => 'Completed';

  @override
  String get goalsActive => 'Active';

  @override
  String get goalsStreak => 'Streak';

  @override
  String get goalsOverall => 'Overall Completion';

  @override
  String goalsWeeklyHit(int hit, int total) {
    return '$hit of $total weekly targets hit';
  }

  @override
  String goalsVsLastWeek(String delta) {
    return '$delta vs last week';
  }

  @override
  String get goalsFilterAll => 'All';

  @override
  String get goalsDone => 'Done';

  @override
  String get goalsCatFocus => 'Focus';

  @override
  String get goalsCatDiscipline => 'Discipline';

  @override
  String get goalsCatWellness => 'Wellness';

  @override
  String goalsTitleFocusHours(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Daily Focus: $n Hours',
      one: 'Daily Focus: 1 Hour',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleFocusDur(String duration) {
    return 'Daily Focus: $duration';
  }

  @override
  String get goalsTitleBlock => 'Block Social Apps';

  @override
  String goalsTitleSessions(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Pomodoros per day',
      one: '1 Pomodoro per day',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleScreen(String duration) {
    return 'Under $duration Screen Time';
  }

  @override
  String get goalsTitlePhoneFree => 'Phone-free time';

  @override
  String goalsDescFocus(String duration) {
    return 'Achieve $duration of deep focus every day';
  }

  @override
  String goalsDescBlock(int n) {
    return 'Keep your locked apps locked $n days a week';
  }

  @override
  String goalsDescSessions(int n) {
    return 'Complete at least $n focus sessions daily';
  }

  @override
  String goalsDescScreen(String duration) {
    return 'Keep total daily phone use under $duration';
  }

  @override
  String goalsDescPhoneFree(int n) {
    return 'Have $n phone-free days a week — tick each one off';
  }

  @override
  String goalsProgressDays(int done, int total) {
    return '$done / $total days';
  }

  @override
  String goalsProgressSessions(int done, int total) {
    return '$done / $total sessions';
  }

  @override
  String goalsStreakShort(int n) {
    return '${n}d';
  }

  @override
  String goalsStreakN(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n-day streak',
      one: '1-day streak',
    );
    return '$_temp0';
  }

  @override
  String get goalsCheckIn => 'Mark today done';

  @override
  String get goalsCheckedIn => 'Done today';

  @override
  String get goalsCheckedSnack => 'Nice! Today is marked as done.';

  @override
  String get goalsUncheckedSnack => 'Today is no longer marked as done.';

  @override
  String get goalsCreateNew => 'Create New Goal';

  @override
  String get goalsEmptyBadge => 'Get started';

  @override
  String get goalsEmptyTitle => 'No goals yet';

  @override
  String get goalsEmptyMsg =>
      'Set a small daily goal and Pausey will track it for you.';

  @override
  String get goalsFilterEmpty => 'No goals match this filter.';

  @override
  String get goalsNewGoal => 'New goal';

  @override
  String get goalsEditGoal => 'Edit goal';

  @override
  String get goalsType => 'Goal type';

  @override
  String get goalsTypeFocus => 'Focus time';

  @override
  String get goalsTypeSessions => 'Focus sessions';

  @override
  String get goalsTypeBlock => 'Block apps';

  @override
  String get goalsTypePhoneFree => 'Phone-free days';

  @override
  String get goalsTypeScreen => 'Screen-time limit';

  @override
  String get goalsCategory => 'Category';

  @override
  String get goalsTarget => 'Target';

  @override
  String get goalsPerDay => 'per day';

  @override
  String get goalsPerWeek => 'days per week';

  @override
  String get goalsMaxPerDay => 'max per day';

  @override
  String get goalsTitleOptional => 'Title (optional)';

  @override
  String get goalsSave => 'Save goal';

  @override
  String get goalsCreate => 'Create goal';

  @override
  String get goalsSavedSnack => 'Goal saved';

  @override
  String get goalsCreatedSnack => 'Goal created';

  @override
  String get goalsEdit => 'Edit';

  @override
  String get goalsDelete => 'Delete goal';

  @override
  String get goalsDeleteQ => 'Delete this goal?';

  @override
  String get goalsDeleteMsg =>
      'Its check-ins will be removed. This can\'t be undone.';

  @override
  String get goalsDeletedSnack => 'Goal deleted';

  @override
  String get goalsComplete => 'complete';

  @override
  String get goalsDaysActive => 'Days Active';

  @override
  String get goalsTotalTime => 'Total Time';

  @override
  String get goalsSessionsLabel => 'Sessions';

  @override
  String get goals7Day => '7-Day Completion';

  @override
  String get goals7DaysAgo => '7 days ago';

  @override
  String get goalsToday => 'Today';

  @override
  String goalsTodayDate(String date) {
    return 'Today, $date';
  }

  @override
  String goalsYesterdayDate(String date) {
    return 'Yesterday, $date';
  }

  @override
  String get goalsMilestones => 'Milestones';

  @override
  String get goalsMsFirst => 'First day completed';

  @override
  String get goalsMs3 => '3-day streak achieved';

  @override
  String get goalsMsHalf => '50% of weekly goal';

  @override
  String get goalsMs5 => '5-day streak';

  @override
  String get goalsMsWeek => 'Full week completed';

  @override
  String get goalsMsLocked => 'Not yet';

  @override
  String get goalsHistory => 'Activity History';

  @override
  String get goalsShowLess => 'Show less';

  @override
  String get goalsStartSession => 'Start Focus Session';

  @override
  String get goalsManageApps => 'Manage Blocked Apps';

  @override
  String get goalsBlockHint =>
      'Counts automatically while your lock schedule is on and apps are locked.';

  @override
  String goalsScreenToday(String used) {
    return 'Screen time today: $used';
  }

  @override
  String get goalsNotFound => 'This goal no longer exists.';

  @override
  String get goalsMore => 'More options';

  @override
  String goalsFreeLimit(int n) {
    return 'Free plan: up to $n goals';
  }

  @override
  String get homeGoodMorning => 'Good morning';

  @override
  String get homeGoodAfternoon => 'Good afternoon';

  @override
  String get homeGoodEvening => 'Good evening';

  @override
  String get homeFriend => 'Friend';

  @override
  String get homeTodayFocus => 'Today\'s Focus';

  @override
  String homeVsYesterday(String pct) {
    return '$pct% vs yesterday';
  }

  @override
  String get homeStartToday => 'No focus yet today';

  @override
  String get homeDayStreak => 'Day Streak';

  @override
  String get homeTodayGoal => 'Today\'s Goal';

  @override
  String homePctCompleted(int pct) {
    return '$pct% completed';
  }

  @override
  String get homeOnTrack => 'On track!';

  @override
  String get homeKeepGoing => 'Keep going';

  @override
  String get homeGoalMet => 'Goal met!';

  @override
  String get homeScreenTimeTitle => 'Screen Time';

  @override
  String get homeToday => 'Today';

  @override
  String homeVsAvg(String pct) {
    return '$pct% vs avg';
  }

  @override
  String get homeQuickStart => 'Quick Start Focus Session';

  @override
  String get homeManage => 'Manage';

  @override
  String get homeNoApps =>
      'Pick the apps that distract you most and lock them here.';

  @override
  String get homeAddApps => 'Add apps';

  @override
  String homeAppLocked(String app) {
    return '$app locked';
  }

  @override
  String homeAppUnlocked(String app) {
    return '$app unlocked';
  }

  @override
  String homeLockApp(String app) {
    return 'Lock or unlock $app';
  }

  @override
  String get homeUpgradeTitle => 'Upgrade to Premium';

  @override
  String get homeUpgradeBody => 'Unlimited blocks, goals & deep analytics.';

  @override
  String get homeTryFree => 'Try Free';

  @override
  String get homePro => 'PRO';

  @override
  String get homeProActive => 'Pausey Pro is active';

  @override
  String get homeProActiveBody =>
      'All features unlocked. Thanks for your support!';

  @override
  String get homeNotifications => 'Notifications';

  @override
  String get homeNoNotifications => 'You\'re all caught up.';

  @override
  String get homePushLabel => 'Push notifications';

  @override
  String get homeFocusReminder => 'Daily focus reminder';

  @override
  String get homeStreakAlerts => 'Streak alerts';

  @override
  String get homePwTitle => 'Unlock Pausey Pro';

  @override
  String get homePwSubtitle => 'Reclaim your focus and beat phone addiction.';

  @override
  String get homePwMonthly => 'Monthly';

  @override
  String get homePwBilledMonthly => 'Billed monthly';

  @override
  String get homePwYearly => 'Yearly';

  @override
  String get homePwPopular => 'Most Popular';

  @override
  String homePwSave(int pct) {
    return 'Save $pct%';
  }

  @override
  String homePwBilledYearly(String price) {
    return '$price billed annually';
  }

  @override
  String get homePwLifetime => 'Lifetime';

  @override
  String get homePwBestValue => 'Best Value';

  @override
  String get homePwPayOnce => 'Pay once, own forever';

  @override
  String get homePwPerMonth => '/ month';

  @override
  String get homePwOnce => 'once';

  @override
  String get homePwStartTrial => 'Start 7-Day Free Trial';

  @override
  String get homePwBuyLifetime => 'Get Lifetime Access';

  @override
  String get homePwNoCharge => 'No charge today · Cancel anytime';

  @override
  String get homePwOneTime => 'One-time payment · No subscription';

  @override
  String get homePwFree => 'Free';

  @override
  String get homePwProCol => 'Pro';

  @override
  String get homePwFeatBlocking => 'Unlimited App Blocking';

  @override
  String get homePwFeatSessions => 'All Focus Modes';

  @override
  String get homePwFeatGoals => 'Unlimited Goals';

  @override
  String get homePwFeatAnalytics => 'Advanced Analytics';

  @override
  String get homePwFeatStreak => 'Streak Protection';

  @override
  String get homePwFeatSchedule => 'Focus Scheduling';

  @override
  String get homePwFeatFaceId => 'Face ID App Lock';

  @override
  String get homePwFeatNotif => 'Smart Notifications';

  @override
  String homePwMax(int n) {
    return '$n max';
  }

  @override
  String get homePwSecure => 'Secure Payment';

  @override
  String get homePwCancelAnytime => 'Cancel Anytime';

  @override
  String get homePwPrivacyFirst => 'Privacy First';

  @override
  String get homePwRestore => 'Restore Purchases';

  @override
  String get homePwTerms => 'Terms of Service';

  @override
  String get homePwPrivacyPolicy => 'Privacy Policy';

  @override
  String get homePwWelcome => 'Welcome to Pausey Pro!';

  @override
  String get homePwNothingToRestore => 'No previous purchases found.';

  @override
  String get homePwRestored => 'Your Pro access is active.';

  @override
  String get homePwLinkSoon => 'This page will open on our website soon.';

  @override
  String get homePwYouArePro => 'You\'re Pro — enjoy!';

  @override
  String get homePwClose => 'Close';

  @override
  String get homeAvgLegend => '7-day average';

  @override
  String homeGoalOf(String done, String goal) {
    return '$done of $goal';
  }

  @override
  String get homeBest => 'Best:';

  @override
  String get insightsAnalytics => 'Analytics';

  @override
  String get insightsScreenTime => 'Screen Time';

  @override
  String get insightsToday => 'Today';

  @override
  String get insightsWeek => 'Week';

  @override
  String get insightsMonth => 'Month';

  @override
  String get insightsProductivity => 'Productivity score';

  @override
  String insightsPts(String delta) {
    return '$delta pts';
  }

  @override
  String get insightsVsLastWeek => 'vs last week';

  @override
  String get insightsVsLastMonth => 'vs last month';

  @override
  String insightsScoreDays(int n) {
    return '$n-day score';
  }

  @override
  String get insightsFocusHours => 'Focus hours';

  @override
  String get insightsThisWeek => 'this week';

  @override
  String get insightsThisMonth => 'this month';

  @override
  String insightsGoalOf(String done, String goal) {
    return '$done / $goal goal';
  }

  @override
  String get insightsFocusScore => 'Focus score';

  @override
  String get insightsGoals => 'Goals';

  @override
  String get insightsConsistency => 'Consistency';

  @override
  String get insightsWeeklyFocus => 'Weekly focus hours';

  @override
  String insightsDailyFocus(int n) {
    return 'Daily focus, last $n days';
  }

  @override
  String insightsBestDay(String day, String time) {
    return 'Best day: $day · $time';
  }

  @override
  String insightsAvgDay(String time) {
    return 'Avg $time / day';
  }

  @override
  String get insightsMonthlyTrends => 'Monthly trends';

  @override
  String get insightsActual => 'Actual';

  @override
  String get insightsGoal => 'Goal';

  @override
  String insightsWk(int n) {
    return 'Wk $n';
  }

  @override
  String insightsWeekBeat(int n, String time) {
    return 'Week $n beat the goal by $time';
  }

  @override
  String insightsWeekShort(int n, String time) {
    return 'Best was week $n, $time short of the goal';
  }

  @override
  String get insightsGoalCompletion => 'Goal completion';

  @override
  String insightsDaysOf(int done, int total) {
    return '$done/$total days';
  }

  @override
  String get insightsNoGoals =>
      'No goals yet. Add one to see your progress here.';

  @override
  String get insightsManageGoals => 'Manage';

  @override
  String insightsGoalFocus(String hours) {
    return 'Daily focus: $hours hours';
  }

  @override
  String get insightsGoalBlock => 'Block social apps';

  @override
  String insightsGoalPomo(int n) {
    return '$n Pomodoros per day';
  }

  @override
  String insightsGoalScreen(String time) {
    return 'Under $time screen time';
  }

  @override
  String get insightsGoalPhoneFree => 'Phone-free time';

  @override
  String get insightsEmptyBadge => 'No sessions yet';

  @override
  String get insightsEmptyTitle => 'Your insights start with one session';

  @override
  String get insightsEmptyBody =>
      'Finish a focus session and your scores, charts and goal progress will show up here.';

  @override
  String get insightsEmptyCta => 'Start a focus session';

  @override
  String get insightsDailyUsage => 'Daily usage';

  @override
  String get insightsFocusTime => 'Focus time';

  @override
  String get insightsVsAvg => 'vs avg';

  @override
  String get insightsUsageByDay => 'Usage by day';

  @override
  String get insightsUsageByWeek => 'Usage by week';

  @override
  String get insightsUsage => 'Usage';

  @override
  String insightsTrend(int n) {
    return '$n-day trend';
  }

  @override
  String get insightsImproving => 'Improving';

  @override
  String get insightsRising => 'Rising';

  @override
  String insightsDaysAgo(int n) {
    return '$n days ago';
  }

  @override
  String get insightsMostUsed => 'Most used apps';

  @override
  String get insightsAllApps => 'All apps';

  @override
  String get insightsBreakdown => 'Usage breakdown';

  @override
  String get insightsTotal => 'total';

  @override
  String get insightsNoUsage => 'No screen time recorded for this period.';

  @override
  String get insightsLockApp => 'Lock this app';

  @override
  String insightsLocked(String app) {
    return '$app is now locked';
  }

  @override
  String get insightsCatSocial => 'Social';

  @override
  String get insightsCatVideo => 'Video';

  @override
  String get insightsCatGames => 'Games';

  @override
  String get insightsCatShopping => 'Shopping';

  @override
  String get insightsCatCommunity => 'Community';

  @override
  String get insightsCatOther => 'Other';

  @override
  String nativeBlockTitle(String app) {
    return '$app is paused';
  }

  @override
  String get nativeReasonLimit => 'You\'ve used today\'s time for this app.';

  @override
  String get nativeReasonSchedule => 'A lock schedule is active right now.';

  @override
  String get nativeReasonGlobal => 'This app is locked in Pausey.';

  @override
  String get nativeReasonFocus => 'You\'re in a focus session.';

  @override
  String get nativeClose => 'Close app';

  @override
  String get nativeNotifTitle => 'Pausey is keeping your limits';

  @override
  String get nativeNotifText => 'App limits and lock schedules are on';

  @override
  String get profileSettings => 'Settings';

  @override
  String get profileGuestName => 'Guest';

  @override
  String get profileGuestBadge => 'Guest · saved on this phone';

  @override
  String get profileEditName => 'Edit name';

  @override
  String get profileNameHint => 'Your name';

  @override
  String get profileSave => 'Save';

  @override
  String profileMemberSince(String date) {
    return 'Member since $date';
  }

  @override
  String get profileProActive => 'Pro · Active';

  @override
  String get profileFree => 'Free plan';

  @override
  String get profileUpgrade => 'Upgrade';

  @override
  String get profileBadges => 'Badges';

  @override
  String get profileNoBadges => 'Finish focus sessions to earn badges';

  @override
  String get profileFocusTime => 'Focus time';

  @override
  String get profileGoalsDone => 'Goals done';

  @override
  String get profileDayStreak => 'Day streak';

  @override
  String get profileAppsBlocked => 'Apps blocked';

  @override
  String get profileFocusActivity => 'Focus Activity';

  @override
  String get profileLast4Weeks => 'Last 4 weeks';

  @override
  String get profileRecentActivity => 'Recent Activity';

  @override
  String get profileSessionDone => 'Focus session completed';

  @override
  String get profileSessionStopped => 'Session ended early';

  @override
  String get profileModePomodoro => 'Pomodoro';

  @override
  String get profileModeDeep => 'Deep work';

  @override
  String get profileModeCustom => 'Custom';

  @override
  String get profileJustNow => 'Just now';

  @override
  String profileAgoMinutes(int n) {
    return '${n}m ago';
  }

  @override
  String profileAgoHours(int n) {
    return '${n}h ago';
  }

  @override
  String get profileYesterday => 'Yesterday';

  @override
  String get profileEmptyTitle => 'No focus sessions yet';

  @override
  String get profileEmptyBody =>
      'Start your first session — your activity, streak and badges will show up here.';

  @override
  String get profileStartFocus => 'Start focusing';

  @override
  String get profileMyGoals => 'My Goals';

  @override
  String get profileStreaks => 'Streaks & badges';

  @override
  String get profileSubscription => 'Subscription';

  @override
  String get profileSignOutTitle => 'Sign out?';

  @override
  String get profileSignOutBody => 'You can log back in any time.';

  @override
  String get profileSecNotifications => 'Notifications';

  @override
  String get profileSecAppearance => 'Appearance';

  @override
  String get profileSecFocus => 'Focus & Blocking';

  @override
  String get profileSecPrivacy => 'Privacy & Security';

  @override
  String get profileSecAccount => 'Account';

  @override
  String get profilePush => 'Push notifications';

  @override
  String get profilePushSub => 'Focus reminders & alerts';

  @override
  String get profileReminder => 'Focus start reminder';

  @override
  String profileReminderSub(String time) {
    return 'Daily at $time';
  }

  @override
  String get profileStreakAlerts => 'Streak alerts';

  @override
  String get profileStreakAlertsSub => 'Before your streak breaks';

  @override
  String get profileGoalMilestones => 'Goal milestones';

  @override
  String get profileGoalMilestonesSub => 'When you reach a goal';

  @override
  String get profileDarkMode => 'Dark mode';

  @override
  String get profileOn => 'On';

  @override
  String get profileOff => 'Off';

  @override
  String get profileTextSize => 'Text size';

  @override
  String get profileTextSmall => 'Small';

  @override
  String get profileTextMedium => 'Medium';

  @override
  String get profileTextLarge => 'Large';

  @override
  String get profileTextHuge => 'Extra large';

  @override
  String get profilePomodoroLen => 'Pomodoro length';

  @override
  String get profileBreakLen => 'Break length';

  @override
  String profileMinutes(int n) {
    return '$n min';
  }

  @override
  String get profileFaceIdUnlock => 'Face ID for unlocks';

  @override
  String get profileFaceIdUnlockSub => 'Confirm before unlocking an app';

  @override
  String get profileBypass => 'Emergency bypass';

  @override
  String profileBypassSub(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n unlocks per day',
      one: '1 unlock per day',
    );
    return '$_temp0';
  }

  @override
  String get profileAppLock => 'Lock Pausey with Face ID';

  @override
  String get profileAppLockSub => 'Ask when opening the app';

  @override
  String get profileHideUsage => 'Hide usage data';

  @override
  String get profileHideUsageSub => 'Hide screen-time numbers';

  @override
  String get profileClearData => 'Clear activity data';

  @override
  String get profileClearDataSub => 'Removes sessions and goal history';

  @override
  String get profileClearTitle => 'Clear activity data?';

  @override
  String get profileClearBody =>
      'This deletes all focus sessions and goal check-ins on this phone. It can\'t be undone.';

  @override
  String get profileClear => 'Clear';

  @override
  String get profileCleared => 'Activity data cleared';

  @override
  String get profileExport => 'Export my data';

  @override
  String get profileExportSub => 'Copy as JSON';

  @override
  String get profileExported => 'Your data was copied to the clipboard';

  @override
  String get profileStreaksTitle => 'Streaks';

  @override
  String get profileShare => 'Share';

  @override
  String profileShareText(int n) {
    return 'I\'m on a $n-day focus streak with Pausey!';
  }

  @override
  String get profileCopied => 'Copied to clipboard';

  @override
  String profileNextMilestone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n days',
      one: '1 day',
    );
    return 'Keep it going – $_temp0 to your next milestone!';
  }

  @override
  String get profileAllMilestones => 'Every milestone reached. Legendary!';

  @override
  String get profileStartStreak =>
      'Finish a focus session today to start a streak.';

  @override
  String get profileBest => 'Best';

  @override
  String get profileThisWeek => 'This Week';

  @override
  String profileDaysCompleted(int n) {
    return '$n/7 days completed';
  }

  @override
  String get profileCompleted => 'Completed';

  @override
  String get profilePartial => 'Partial';

  @override
  String get profileMissed => 'Missed';

  @override
  String get profilePrevMonth => 'Previous month';

  @override
  String get profileNextMonth => 'Next month';

  @override
  String get profileMilestones => 'Streak Milestones';

  @override
  String get profileAchievements => 'Achievements';

  @override
  String get profileAchOnFire => 'On Fire';

  @override
  String get profileAchIronWill => 'Iron Will';

  @override
  String get profileAchFocusMaster => 'Focus Master';

  @override
  String get profileAchMonk => 'Digital Monk';

  @override
  String get profileAchLegend => 'Legendary';

  @override
  String get profileAchSpeed => 'Speed Demon';

  @override
  String profileAchStreakDesc(int n) {
    return '$n-day streak';
  }

  @override
  String profileAchSessionsDesc(int n) {
    return '$n sessions completed';
  }

  @override
  String profileAchHoursDesc(int n) {
    return '${n}h total focus';
  }

  @override
  String profileAchDayDesc(int n) {
    return '$n sessions in a day';
  }

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

  @override
  String get statesTitle => 'States';

  @override
  String get statesSubtitle => 'Friendly error, empty & loading screens';

  @override
  String get statesNoInternet => 'No internet';

  @override
  String get statesConnectionLost => 'Connection lost';

  @override
  String get statesOfflineTitle => 'You\'re offline';

  @override
  String get statesOfflineMsg =>
      'Pausey can\'t reach the server right now. Check your Wi-Fi or mobile data and try again – your local data is safe.';

  @override
  String get statesTryAgain => 'Try again';

  @override
  String get statesOpenSettings => 'Open settings';

  @override
  String get statesOfflineMode => 'Offline mode active';

  @override
  String get statesLimited => 'Limited';

  @override
  String get statesAvailable => 'Available';

  @override
  String get statesUnavailable => 'Unavailable';

  @override
  String get statesCapSessions => 'View previous sessions';

  @override
  String get statesCapApps => 'Access locked app list';

  @override
  String get statesCapTimer => 'Run local focus timer';

  @override
  String get statesCapSync => 'Sync streak & goals';

  @override
  String get statesCapAnalytics => 'Refresh analytics data';

  @override
  String get statesOfflineNote =>
      'All your focus data is stored locally. Nothing is lost when you\'re offline.';

  @override
  String get statesBackOnline => 'Back online – everything is synced';

  @override
  String get statesShowAgain => 'Show state again';

  @override
  String get statesPermDenied => 'Permission denied';

  @override
  String get statesPermRequired => 'Permission required';

  @override
  String get statesPermTitle => 'Access blocked';

  @override
  String get statesPermMsg =>
      'Pausey needs Screen Time access to block apps. Without it, app blocking won\'t work.';

  @override
  String get statesGrant => 'Grant access';

  @override
  String get statesLearnMore => 'Learn more';

  @override
  String get statesLearnMoreMsg =>
      'Screen Time access lets Pausey see and pause distracting apps. Your data never leaves your phone.';

  @override
  String get statesRequiredPerms => 'Required permissions';

  @override
  String get statesPermNotif => 'Notifications';

  @override
  String get statesPermScreenTime => 'Screen Time access';

  @override
  String get statesPermUsage => 'App usage stats';

  @override
  String get statesPermBio => 'Face ID / biometrics';

  @override
  String get statesGranted => 'Granted';

  @override
  String get statesDenied => 'Denied';

  @override
  String get statesPermNote =>
      'Without Screen Time, the app can still run focus timers but cannot block apps.';

  @override
  String get statesAccessGranted => 'Access granted – app blocking is ready';

  @override
  String get statesDataNA => 'Data not available';

  @override
  String get statesSyncFailed => 'Sync failed';

  @override
  String get statesLoadTitle => 'Data couldn\'t load';

  @override
  String get statesLoadMsg =>
      'Something went wrong fetching your analytics. This might be a temporary server hiccup – your local data is untouched.';

  @override
  String get statesRetrySync => 'Retry sync';

  @override
  String get statesUseCached => 'Use cached';

  @override
  String get statesErrorDetails => 'Error details';

  @override
  String get statesErrorCode => 'Error code';

  @override
  String get statesTimestamp => 'Time';

  @override
  String get statesRetryCount => 'Retry count';

  @override
  String statesAttempts(int n) {
    return '$n / 3 attempts';
  }

  @override
  String get statesReport => 'Report to support';

  @override
  String get statesReported => 'Thanks – the report was sent';

  @override
  String get statesCachedNote =>
      'Cached data from your last successful sync is available in the meantime.';

  @override
  String get statesDataLoaded => 'Analytics loaded';

  @override
  String get statesCachedShown => 'Showing cached data';

  @override
  String statesWeekFocus(String time) {
    return 'Focus this week: $time';
  }

  @override
  String get statesEmpty => 'Empty state';

  @override
  String get statesNothingYet => 'Nothing yet';

  @override
  String get statesEmptyTitle => 'No sessions yet';

  @override
  String get statesEmptyMsg =>
      'Start your first focus session and your progress will show up here.';

  @override
  String get statesStartFocus => 'Start focusing';

  @override
  String get statesLoadingSection => 'Loading states';

  @override
  String get statesDashLoading => 'Dashboard';

  @override
  String get statesAnalyticsLoading => 'Analytics';

  @override
  String get statesGoalsLoading => 'Goals';

  @override
  String get statesProfileLoading => 'Profile';

  @override
  String get statesCrunching => 'Crunching your data…';

  @override
  String get statesLoadingGoals => 'Loading your goals…';

  @override
  String get statesLoadingProfile => 'Loading your profile…';

  @override
  String get statesReplay => 'Replay';
}
