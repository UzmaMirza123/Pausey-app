import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('ur'),
  ];

  /// No description provided for @ob1Title.
  ///
  /// In en, this message translates to:
  /// **'Reduce Screen Addiction'**
  String get ob1Title;

  /// No description provided for @ob1Body.
  ///
  /// In en, this message translates to:
  /// **'Take control of your digital habits and spend less time on distracting apps.'**
  String get ob1Body;

  /// No description provided for @ob1StatAvg.
  ///
  /// In en, this message translates to:
  /// **'Avg daily screen time'**
  String get ob1StatAvg;

  /// No description provided for @ob1StatSocial.
  ///
  /// In en, this message translates to:
  /// **'Spent on social media'**
  String get ob1StatSocial;

  /// No description provided for @ob2SelectApps.
  ///
  /// In en, this message translates to:
  /// **'Select Apps'**
  String get ob2SelectApps;

  /// No description provided for @ob2Title.
  ///
  /// In en, this message translates to:
  /// **'Lock Distracting Apps'**
  String get ob2Title;

  /// No description provided for @ob2Body.
  ///
  /// In en, this message translates to:
  /// **'Block social media, games, and other distractions with powerful app locking tools.'**
  String get ob2Body;

  /// No description provided for @ob2Feature1.
  ///
  /// In en, this message translates to:
  /// **'One-tap block for any app on your phone'**
  String get ob2Feature1;

  /// No description provided for @ob2Feature2.
  ///
  /// In en, this message translates to:
  /// **'Schedule lock times and focus windows'**
  String get ob2Feature2;

  /// No description provided for @ob2Feature3.
  ///
  /// In en, this message translates to:
  /// **'Password-protect blocks so you stay committed'**
  String get ob2Feature3;

  /// No description provided for @sheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Apps'**
  String get sheetTitle;

  /// No description provided for @sheetTotalLocked.
  ///
  /// In en, this message translates to:
  /// **'Total Locked'**
  String get sheetTotalLocked;

  /// No description provided for @sheetAppsSelected.
  ///
  /// In en, this message translates to:
  /// **'apps selected'**
  String get sheetAppsSelected;

  /// No description provided for @sheetTimeSaved.
  ///
  /// In en, this message translates to:
  /// **'Time Saved'**
  String get sheetTimeSaved;

  /// No description provided for @sheetPerDayAvg.
  ///
  /// In en, this message translates to:
  /// **'per day avg'**
  String get sheetPerDayAvg;

  /// No description provided for @sheetHoursValue.
  ///
  /// In en, this message translates to:
  /// **'{h}h'**
  String sheetHoursValue(String h);

  /// No description provided for @sheetSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search apps...'**
  String get sheetSearchHint;

  /// No description provided for @sheetCatAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get sheetCatAll;

  /// No description provided for @sheetCatSocial.
  ///
  /// In en, this message translates to:
  /// **'Social'**
  String get sheetCatSocial;

  /// No description provided for @sheetCatEntertainment.
  ///
  /// In en, this message translates to:
  /// **'Entertainment'**
  String get sheetCatEntertainment;

  /// No description provided for @sheetCatGames.
  ///
  /// In en, this message translates to:
  /// **'Games'**
  String get sheetCatGames;

  /// No description provided for @sheetAppsHeader.
  ///
  /// In en, this message translates to:
  /// **'APPS'**
  String get sheetAppsHeader;

  /// No description provided for @sheetSelectedCount.
  ///
  /// In en, this message translates to:
  /// **'{count} selected'**
  String sheetSelectedCount(int count);

  /// No description provided for @sheetNoApps.
  ///
  /// In en, this message translates to:
  /// **'No apps found'**
  String get sheetNoApps;

  /// No description provided for @sheetLockSchedule.
  ///
  /// In en, this message translates to:
  /// **'LOCK SCHEDULE'**
  String get sheetLockSchedule;

  /// No description provided for @sheetAddCustomSemantic.
  ///
  /// In en, this message translates to:
  /// **'Add a custom lock schedule'**
  String get sheetAddCustomSemantic;

  /// No description provided for @sheetCustomBadge.
  ///
  /// In en, this message translates to:
  /// **'+ Custom'**
  String get sheetCustomBadge;

  /// No description provided for @sheetSchedMorning.
  ///
  /// In en, this message translates to:
  /// **'Morning'**
  String get sheetSchedMorning;

  /// No description provided for @sheetSchedWork.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get sheetSchedWork;

  /// No description provided for @sheetSchedEvening.
  ///
  /// In en, this message translates to:
  /// **'Evening'**
  String get sheetSchedEvening;

  /// No description provided for @sheetEveryDay.
  ///
  /// In en, this message translates to:
  /// **'Every day'**
  String get sheetEveryDay;

  /// No description provided for @sheetWeekdays.
  ///
  /// In en, this message translates to:
  /// **'Weekdays'**
  String get sheetWeekdays;

  /// No description provided for @sheetWeekends.
  ///
  /// In en, this message translates to:
  /// **'Weekends'**
  String get sheetWeekends;

  /// No description provided for @sheetUnlockMethod.
  ///
  /// In en, this message translates to:
  /// **'UNLOCK METHOD'**
  String get sheetUnlockMethod;

  /// No description provided for @sheetPin.
  ///
  /// In en, this message translates to:
  /// **'PIN Code'**
  String get sheetPin;

  /// No description provided for @sheetPinSub.
  ///
  /// In en, this message translates to:
  /// **'4-digit PIN'**
  String get sheetPinSub;

  /// No description provided for @sheetFaceId.
  ///
  /// In en, this message translates to:
  /// **'Face ID'**
  String get sheetFaceId;

  /// No description provided for @sheetFaceIdSub.
  ///
  /// In en, this message translates to:
  /// **'Biometric'**
  String get sheetFaceIdSub;

  /// No description provided for @sheetTouchId.
  ///
  /// In en, this message translates to:
  /// **'Touch ID'**
  String get sheetTouchId;

  /// No description provided for @sheetTouchIdSub.
  ///
  /// In en, this message translates to:
  /// **'Fingerprint'**
  String get sheetTouchIdSub;

  /// No description provided for @sheetFooter.
  ///
  /// In en, this message translates to:
  /// **'You can always change this later'**
  String get sheetFooter;

  /// No description provided for @sheetConfirmLock.
  ///
  /// In en, this message translates to:
  /// **'Confirm Lock'**
  String get sheetConfirmLock;

  /// No description provided for @sheetRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove {name}'**
  String sheetRemove(String name);

  /// No description provided for @sheetCustomTitle.
  ///
  /// In en, this message translates to:
  /// **'Custom schedule'**
  String get sheetCustomTitle;

  /// No description provided for @sheetCustomBody.
  ///
  /// In en, this message translates to:
  /// **'Your selected apps stay locked during this time.'**
  String get sheetCustomBody;

  /// No description provided for @sheetNameLabel.
  ///
  /// In en, this message translates to:
  /// **'NAME'**
  String get sheetNameLabel;

  /// No description provided for @sheetNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Study time'**
  String get sheetNameHint;

  /// No description provided for @sheetStarts.
  ///
  /// In en, this message translates to:
  /// **'Starts'**
  String get sheetStarts;

  /// No description provided for @sheetEnds.
  ///
  /// In en, this message translates to:
  /// **'Ends'**
  String get sheetEnds;

  /// No description provided for @sheetSameTime.
  ///
  /// In en, this message translates to:
  /// **'Start and end are the same'**
  String get sheetSameTime;

  /// No description provided for @sheetLockedFor.
  ///
  /// In en, this message translates to:
  /// **'Locked for {duration}'**
  String sheetLockedFor(String duration);

  /// No description provided for @sheetLockedForOvernight.
  ///
  /// In en, this message translates to:
  /// **'Locked for {duration} (overnight)'**
  String sheetLockedForOvernight(String duration);

  /// No description provided for @sheetDurH.
  ///
  /// In en, this message translates to:
  /// **'{h}h'**
  String sheetDurH(int h);

  /// No description provided for @sheetDurM.
  ///
  /// In en, this message translates to:
  /// **'{m}m'**
  String sheetDurM(int m);

  /// No description provided for @sheetDurHM.
  ///
  /// In en, this message translates to:
  /// **'{h}h {m}m'**
  String sheetDurHM(int h, int m);

  /// No description provided for @sheetLockStartsAt.
  ///
  /// In en, this message translates to:
  /// **'LOCK STARTS AT'**
  String get sheetLockStartsAt;

  /// No description provided for @sheetLockEndsAt.
  ///
  /// In en, this message translates to:
  /// **'LOCK ENDS AT'**
  String get sheetLockEndsAt;

  /// No description provided for @sheetRepeatOn.
  ///
  /// In en, this message translates to:
  /// **'REPEAT ON'**
  String get sheetRepeatOn;

  /// No description provided for @sheetAddSchedule.
  ///
  /// In en, this message translates to:
  /// **'Add schedule'**
  String get sheetAddSchedule;

  /// No description provided for @sheetCustomDefaultName.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get sheetCustomDefaultName;

  /// No description provided for @sheetChangeTime.
  ///
  /// In en, this message translates to:
  /// **'{label} {time}. Change time'**
  String sheetChangeTime(String label, String time);

  /// No description provided for @ob3Title.
  ///
  /// In en, this message translates to:
  /// **'Stay Focused Every Day'**
  String get ob3Title;

  /// No description provided for @ob3Body.
  ///
  /// In en, this message translates to:
  /// **'Use Pomodoro and Deep Focus sessions to boost productivity and achieve more.'**
  String get ob3Body;

  /// No description provided for @ob3Pomodoro.
  ///
  /// In en, this message translates to:
  /// **'Pomodoro'**
  String get ob3Pomodoro;

  /// No description provided for @ob3PomodoroSub.
  ///
  /// In en, this message translates to:
  /// **'{min} min sessions'**
  String ob3PomodoroSub(int min);

  /// No description provided for @ob3DeepFocus.
  ///
  /// In en, this message translates to:
  /// **'Deep Focus'**
  String get ob3DeepFocus;

  /// No description provided for @ob3DeepFocusSub.
  ///
  /// In en, this message translates to:
  /// **'{min} min flow'**
  String ob3DeepFocusSub(int min);

  /// No description provided for @ob3StatBoost.
  ///
  /// In en, this message translates to:
  /// **'productivity boost'**
  String get ob3StatBoost;

  /// No description provided for @ob3StatStreakValue.
  ///
  /// In en, this message translates to:
  /// **'{days}-day'**
  String ob3StatStreakValue(int days);

  /// No description provided for @ob3StatStreak.
  ///
  /// In en, this message translates to:
  /// **'streak building'**
  String get ob3StatStreak;

  /// No description provided for @ob3StatGoal.
  ///
  /// In en, this message translates to:
  /// **'goal completion'**
  String get ob3StatGoal;

  /// No description provided for @ob3StartTimer.
  ///
  /// In en, this message translates to:
  /// **'Start timer'**
  String get ob3StartTimer;

  /// No description provided for @ob3PauseTimer.
  ///
  /// In en, this message translates to:
  /// **'Pause timer'**
  String get ob3PauseTimer;

  /// No description provided for @ob4Title.
  ///
  /// In en, this message translates to:
  /// **'Track Your Progress'**
  String get ob4Title;

  /// No description provided for @ob4Body.
  ///
  /// In en, this message translates to:
  /// **'Monitor screen time, focus hours, goals, and productivity with beautiful analytics.'**
  String get ob4Body;

  /// No description provided for @ob4Weekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get ob4Weekly;

  /// No description provided for @ob4WeeklySub.
  ///
  /// In en, this message translates to:
  /// **'reports'**
  String get ob4WeeklySub;

  /// No description provided for @ob4Goals.
  ///
  /// In en, this message translates to:
  /// **'Goals'**
  String get ob4Goals;

  /// No description provided for @ob4GoalsSub.
  ///
  /// In en, this message translates to:
  /// **'tracker'**
  String get ob4GoalsSub;

  /// No description provided for @ob4Insights.
  ///
  /// In en, this message translates to:
  /// **'Insights'**
  String get ob4Insights;

  /// No description provided for @ob4InsightsSub.
  ///
  /// In en, this message translates to:
  /// **'AI coach'**
  String get ob4InsightsSub;

  /// No description provided for @ob4Streaks.
  ///
  /// In en, this message translates to:
  /// **'Streaks'**
  String get ob4Streaks;

  /// No description provided for @ob4StreaksSub.
  ///
  /// In en, this message translates to:
  /// **'& badges'**
  String get ob4StreaksSub;

  /// No description provided for @ob5Title.
  ///
  /// In en, this message translates to:
  /// **'What is your daily average Screen Time?'**
  String get ob5Title;

  /// No description provided for @ob5Subtitle.
  ///
  /// In en, this message translates to:
  /// **'On your phone only. Your best guess is okay.'**
  String get ob5Subtitle;

  /// No description provided for @ob5More7.
  ///
  /// In en, this message translates to:
  /// **'More than 7 hours'**
  String get ob5More7;

  /// No description provided for @ob5H5to7.
  ///
  /// In en, this message translates to:
  /// **'5-7 hours'**
  String get ob5H5to7;

  /// No description provided for @ob5H4to5.
  ///
  /// In en, this message translates to:
  /// **'4-5 hours'**
  String get ob5H4to5;

  /// No description provided for @ob5H3to4.
  ///
  /// In en, this message translates to:
  /// **'3-4 hours'**
  String get ob5H3to4;

  /// No description provided for @ob5H1to3.
  ///
  /// In en, this message translates to:
  /// **'1-3 hours'**
  String get ob5H1to3;

  /// No description provided for @ob5Under1.
  ///
  /// In en, this message translates to:
  /// **'Under 1 hour'**
  String get ob5Under1;

  /// No description provided for @ob6Title.
  ///
  /// In en, this message translates to:
  /// **'What is your occupation?'**
  String get ob6Title;

  /// No description provided for @ob6Subtitle.
  ///
  /// In en, this message translates to:
  /// **'We\'ll personalize your focus plan based on your work style.'**
  String get ob6Subtitle;

  /// No description provided for @ob6Software.
  ///
  /// In en, this message translates to:
  /// **'Software Development'**
  String get ob6Software;

  /// No description provided for @ob6Founder.
  ///
  /// In en, this message translates to:
  /// **'CEO / Founder'**
  String get ob6Founder;

  /// No description provided for @ob6Remote.
  ///
  /// In en, this message translates to:
  /// **'Remote Worker'**
  String get ob6Remote;

  /// No description provided for @ob6Finance.
  ///
  /// In en, this message translates to:
  /// **'Finance / Ops / Consulting'**
  String get ob6Finance;

  /// No description provided for @ob6Art.
  ///
  /// In en, this message translates to:
  /// **'Art / Content'**
  String get ob6Art;

  /// No description provided for @ob6Education.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get ob6Education;

  /// No description provided for @ob6Others.
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get ob6Others;

  /// No description provided for @ob7Title.
  ///
  /// In en, this message translates to:
  /// **'Set your daily screen-time goal'**
  String get ob7Title;

  /// No description provided for @ob7Subtitle.
  ///
  /// In en, this message translates to:
  /// **'You can change this any time. We\'ll nudge you as you get close.'**
  String get ob7Subtitle;

  /// No description provided for @ob7Hours.
  ///
  /// In en, this message translates to:
  /// **'{hours}h'**
  String ob7Hours(String hours);

  /// No description provided for @ob7PerDay.
  ///
  /// In en, this message translates to:
  /// **'per day'**
  String get ob7PerDay;

  /// No description provided for @ob7HoursPerDay.
  ///
  /// In en, this message translates to:
  /// **'{hours} per day'**
  String ob7HoursPerDay(String hours);

  /// No description provided for @ob7DialLabel.
  ///
  /// In en, this message translates to:
  /// **'Daily screen-time goal'**
  String get ob7DialLabel;

  /// No description provided for @ob7InfoNote.
  ///
  /// In en, this message translates to:
  /// **'The average person spends 4h+ on their phone daily. Setting a goal is the first step to reclaiming your time.'**
  String get ob7InfoNote;

  /// No description provided for @ob8Title.
  ///
  /// In en, this message translates to:
  /// **'Enable Essential Permissions'**
  String get ob8Title;

  /// No description provided for @ob8Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Grant access to unlock the full Pausey experience.'**
  String get ob8Subtitle;

  /// No description provided for @ob8UsageTitle.
  ///
  /// In en, this message translates to:
  /// **'Usage Access'**
  String get ob8UsageTitle;

  /// No description provided for @ob8UsageSub.
  ///
  /// In en, this message translates to:
  /// **'Monitor app usage and enforce focus sessions.'**
  String get ob8UsageSub;

  /// No description provided for @ob8NotifTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get ob8NotifTitle;

  /// No description provided for @ob8NotifSub.
  ///
  /// In en, this message translates to:
  /// **'Timely reminders & progress alerts.'**
  String get ob8NotifSub;

  /// No description provided for @ob8TrackTitle.
  ///
  /// In en, this message translates to:
  /// **'Track App Usage'**
  String get ob8TrackTitle;

  /// No description provided for @ob8TrackSub.
  ///
  /// In en, this message translates to:
  /// **'Daily and weekly breakdowns.'**
  String get ob8TrackSub;

  /// No description provided for @ob9Title.
  ///
  /// In en, this message translates to:
  /// **'You\'re all set!'**
  String get ob9Title;

  /// No description provided for @ob9Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Your focus environment is ready to go.'**
  String get ob9Subtitle;

  /// No description provided for @ob9Enter.
  ///
  /// In en, this message translates to:
  /// **'Enter Pausey'**
  String get ob9Enter;

  /// No description provided for @ob9Replay.
  ///
  /// In en, this message translates to:
  /// **'Replay Onboarding'**
  String get ob9Replay;

  /// No description provided for @ob9ScreenTime.
  ///
  /// In en, this message translates to:
  /// **'Screen Time'**
  String get ob9ScreenTime;

  /// No description provided for @ob9AppsLocked.
  ///
  /// In en, this message translates to:
  /// **'Apps Locked'**
  String get ob9AppsLocked;

  /// No description provided for @ob9Permissions.
  ///
  /// In en, this message translates to:
  /// **'Permissions'**
  String get ob9Permissions;

  /// No description provided for @ob9FocusMode.
  ///
  /// In en, this message translates to:
  /// **'Focus Mode'**
  String get ob9FocusMode;

  /// No description provided for @ob9AllOk.
  ///
  /// In en, this message translates to:
  /// **'All OK'**
  String get ob9AllOk;

  /// No description provided for @ob9On.
  ///
  /// In en, this message translates to:
  /// **'ON'**
  String get ob9On;

  /// No description provided for @ob9Done.
  ///
  /// In en, this message translates to:
  /// **'DONE'**
  String get ob9Done;

  /// No description provided for @ob9StreakTitle.
  ///
  /// In en, this message translates to:
  /// **'Day 1 streak starts now'**
  String get ob9StreakTitle;

  /// No description provided for @ob9StreakSub.
  ///
  /// In en, this message translates to:
  /// **'Complete a session to keep it going'**
  String get ob9StreakSub;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Pausey'**
  String get appName;

  /// No description provided for @tagline.
  ///
  /// In en, this message translates to:
  /// **'Take back your time'**
  String get tagline;

  /// No description provided for @versionLabel.
  ///
  /// In en, this message translates to:
  /// **'Version 2.0 · App Store Edition'**
  String get versionLabel;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @continueLabel.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueLabel;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @freeToStart.
  ///
  /// In en, this message translates to:
  /// **'Free to start · No credit card needed'**
  String get freeToStart;

  /// No description provided for @dataStaysOnDevice.
  ///
  /// In en, this message translates to:
  /// **'Your data never leaves your device.'**
  String get dataStaysOnDevice;

  /// No description provided for @switchToLight.
  ///
  /// In en, this message translates to:
  /// **'Switch to light mode'**
  String get switchToLight;

  /// No description provided for @switchToDark.
  ///
  /// In en, this message translates to:
  /// **'Switch to dark mode'**
  String get switchToDark;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @phoneLanguage.
  ///
  /// In en, this message translates to:
  /// **'Phone language'**
  String get phoneLanguage;

  /// No description provided for @authTitle.
  ///
  /// In en, this message translates to:
  /// **'Pause the scroll.\nOwn your day.'**
  String get authTitle;

  /// No description provided for @authSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create an account to sync your goals and streaks, or try Pausey as a guest.'**
  String get authSubtitle;

  /// No description provided for @continueWithApple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get continueWithApple;

  /// No description provided for @continueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continueWithGoogle;

  /// No description provided for @signUpWithEmail.
  ///
  /// In en, this message translates to:
  /// **'Sign up with email'**
  String get signUpWithEmail;

  /// No description provided for @continueAsGuest.
  ///
  /// In en, this message translates to:
  /// **'Continue as guest'**
  String get continueAsGuest;

  /// No description provided for @guestNote.
  ///
  /// In en, this message translates to:
  /// **'Guest data is saved only on this phone.'**
  String get guestNote;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @haveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get haveAccount;

  /// No description provided for @noAccount.
  ///
  /// In en, this message translates to:
  /// **'New to Pausey?'**
  String get noAccount;

  /// No description provided for @logIn.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get logIn;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get createAccount;

  /// No description provided for @signUpTitle.
  ///
  /// In en, this message translates to:
  /// **'Create your account'**
  String get signUpTitle;

  /// No description provided for @signUpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Start building calmer screen habits.'**
  String get signUpSubtitle;

  /// No description provided for @logInTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get logInTitle;

  /// No description provided for @logInSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Log in to pick up your streak.'**
  String get logInSubtitle;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullName;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassword;

  /// No description provided for @showPassword.
  ///
  /// In en, this message translates to:
  /// **'Show password'**
  String get showPassword;

  /// No description provided for @hidePassword.
  ///
  /// In en, this message translates to:
  /// **'Hide password'**
  String get hidePassword;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// No description provided for @resetTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetTitle;

  /// No description provided for @resetSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your email and we\'ll send you a reset link.'**
  String get resetSubtitle;

  /// No description provided for @sendLink.
  ///
  /// In en, this message translates to:
  /// **'Send link'**
  String get sendLink;

  /// No description provided for @resetSent.
  ///
  /// In en, this message translates to:
  /// **'Check your inbox for the reset link.'**
  String get resetSent;

  /// No description provided for @agreeTerms.
  ///
  /// In en, this message translates to:
  /// **'I agree to the Terms and Privacy Policy'**
  String get agreeTerms;

  /// No description provided for @passwordStrength.
  ///
  /// In en, this message translates to:
  /// **'Password strength'**
  String get passwordStrength;

  /// No description provided for @strengthWeak.
  ///
  /// In en, this message translates to:
  /// **'Weak'**
  String get strengthWeak;

  /// No description provided for @strengthOk.
  ///
  /// In en, this message translates to:
  /// **'Okay'**
  String get strengthOk;

  /// No description provided for @strengthStrong.
  ///
  /// In en, this message translates to:
  /// **'Strong'**
  String get strengthStrong;

  /// No description provided for @errNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get errNameRequired;

  /// No description provided for @errEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get errEmailInvalid;

  /// No description provided for @errPasswordShort.
  ///
  /// In en, this message translates to:
  /// **'Use at least 8 characters'**
  String get errPasswordShort;

  /// No description provided for @errPasswordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords don\'t match'**
  String get errPasswordMismatch;

  /// No description provided for @errTerms.
  ///
  /// In en, this message translates to:
  /// **'Please accept the terms to continue'**
  String get errTerms;

  /// No description provided for @authErr_not_configured.
  ///
  /// In en, this message translates to:
  /// **'Sign-in isn\'t set up yet. You can continue as a guest.'**
  String get authErr_not_configured;

  /// No description provided for @authErr_cancelled.
  ///
  /// In en, this message translates to:
  /// **'Sign-in was cancelled.'**
  String get authErr_cancelled;

  /// No description provided for @authErr_invalid_email.
  ///
  /// In en, this message translates to:
  /// **'That email doesn\'t look right.'**
  String get authErr_invalid_email;

  /// No description provided for @authErr_wrong_password.
  ///
  /// In en, this message translates to:
  /// **'Email or password is incorrect.'**
  String get authErr_wrong_password;

  /// No description provided for @authErr_user_not_found.
  ///
  /// In en, this message translates to:
  /// **'No account with this email. Sign up instead?'**
  String get authErr_user_not_found;

  /// No description provided for @authErr_email_in_use.
  ///
  /// In en, this message translates to:
  /// **'An account with this email already exists. Log in instead.'**
  String get authErr_email_in_use;

  /// No description provided for @authErr_weak_password.
  ///
  /// In en, this message translates to:
  /// **'Choose a stronger password.'**
  String get authErr_weak_password;

  /// No description provided for @authErr_network.
  ///
  /// In en, this message translates to:
  /// **'No internet connection. Try again.'**
  String get authErr_network;

  /// No description provided for @authErr_too_many.
  ///
  /// In en, this message translates to:
  /// **'Too many attempts. Wait a minute and try again.'**
  String get authErr_too_many;

  /// No description provided for @authErr_unknown.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Try again.'**
  String get authErr_unknown;

  /// No description provided for @homeHello.
  ///
  /// In en, this message translates to:
  /// **'Hi, {name}'**
  String homeHello(String name);

  /// No description provided for @homeHelloGuest.
  ///
  /// In en, this message translates to:
  /// **'Hi there'**
  String get homeHelloGuest;

  /// No description provided for @homeGuestBadge.
  ///
  /// In en, this message translates to:
  /// **'Guest mode · saved on this phone'**
  String get homeGuestBadge;

  /// No description provided for @homeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your plan is ready. Here\'s what you chose.'**
  String get homeSubtitle;

  /// No description provided for @homeDailyGoal.
  ///
  /// In en, this message translates to:
  /// **'Daily goal'**
  String get homeDailyGoal;

  /// No description provided for @homeLockedApps.
  ///
  /// In en, this message translates to:
  /// **'Locked apps'**
  String get homeLockedApps;

  /// No description provided for @homeScreenTime.
  ///
  /// In en, this message translates to:
  /// **'Current screen time'**
  String get homeScreenTime;

  /// No description provided for @homeNotSet.
  ///
  /// In en, this message translates to:
  /// **'Not set'**
  String get homeNotSet;

  /// No description provided for @homeCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create an account to back up'**
  String get homeCreateAccount;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOut;

  /// No description provided for @signOutGuestWarn.
  ///
  /// In en, this message translates to:
  /// **'Signing out deletes guest data on this phone.'**
  String get signOutGuestWarn;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'de',
    'en',
    'es',
    'fr',
    'hi',
    'ur',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'ur':
      return AppLocalizationsUr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
