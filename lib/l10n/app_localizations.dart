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
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_zh.dart';

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
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('pt'),
    Locale('ru'),
    Locale('tr'),
    Locale('ur'),
    Locale('zh'),
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

  /// No description provided for @alSummary.
  ///
  /// In en, this message translates to:
  /// **'{locked} restricted now · {total} managed'**
  String alSummary(int locked, int total);

  /// No description provided for @alSummaryOff.
  ///
  /// In en, this message translates to:
  /// **'{total} managed · blocking off'**
  String alSummaryOff(int total);

  /// No description provided for @alFromInstalled.
  ///
  /// In en, this message translates to:
  /// **'Choose from installed apps'**
  String get alFromInstalled;

  /// No description provided for @alFromInstalledSub.
  ///
  /// In en, this message translates to:
  /// **'Pick any app on this phone'**
  String get alFromInstalledSub;

  /// No description provided for @alPermTitle.
  ///
  /// In en, this message translates to:
  /// **'Blocking isn\'t active yet'**
  String get alPermTitle;

  /// No description provided for @alPermMsg.
  ///
  /// In en, this message translates to:
  /// **'Your rules are saved, but Pausey can\'t block apps until you allow these two permissions:'**
  String get alPermMsg;

  /// No description provided for @alPermUsage.
  ///
  /// In en, this message translates to:
  /// **'Usage access'**
  String get alPermUsage;

  /// No description provided for @alPermUsageSub.
  ///
  /// In en, this message translates to:
  /// **'See which app is open and today\'s time in it'**
  String get alPermUsageSub;

  /// No description provided for @alPermOverlay.
  ///
  /// In en, this message translates to:
  /// **'Display over other apps'**
  String get alPermOverlay;

  /// No description provided for @alPermOverlaySub.
  ///
  /// In en, this message translates to:
  /// **'Show the lock screen over a blocked app'**
  String get alPermOverlaySub;

  /// No description provided for @alAllow.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get alAllow;

  /// No description provided for @alAllowed.
  ///
  /// In en, this message translates to:
  /// **'Allowed'**
  String get alAllowed;

  /// No description provided for @alPermReturn.
  ///
  /// In en, this message translates to:
  /// **'Come back to Pausey after allowing — it checks again automatically.'**
  String get alPermReturn;

  /// No description provided for @alAndroidOnly.
  ///
  /// In en, this message translates to:
  /// **'Blocking works on Android only. You can still set up your rules here.'**
  String get alAndroidOnly;

  /// No description provided for @alSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search apps'**
  String get alSearchHint;

  /// No description provided for @alFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get alFilterAll;

  /// No description provided for @alFilterLocked.
  ///
  /// In en, this message translates to:
  /// **'Locked now'**
  String get alFilterLocked;

  /// No description provided for @alFilterScheduled.
  ///
  /// In en, this message translates to:
  /// **'Scheduled'**
  String get alFilterScheduled;

  /// No description provided for @alFilterAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get alFilterAvailable;

  /// No description provided for @alStateLocked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get alStateLocked;

  /// No description provided for @alStateWillLock.
  ///
  /// In en, this message translates to:
  /// **'Will lock'**
  String get alStateWillLock;

  /// No description provided for @alStateScheduled.
  ///
  /// In en, this message translates to:
  /// **'Scheduled'**
  String get alStateScheduled;

  /// No description provided for @alStateAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get alStateAvailable;

  /// No description provided for @alUsedOf.
  ///
  /// In en, this message translates to:
  /// **'Used {used} of {limit}'**
  String alUsedOf(String used, String limit);

  /// No description provided for @alUsedToday.
  ///
  /// In en, this message translates to:
  /// **'Used {used} today'**
  String alUsedToday(String used);

  /// No description provided for @alNoLimit.
  ///
  /// In en, this message translates to:
  /// **'No daily limit'**
  String get alNoLimit;

  /// No description provided for @alLimitNoUsage.
  ///
  /// In en, this message translates to:
  /// **'{limit} daily limit · usage unavailable'**
  String alLimitNoUsage(String limit);

  /// No description provided for @alRulesOff.
  ///
  /// In en, this message translates to:
  /// **'Restrictions off'**
  String get alRulesOff;

  /// No description provided for @alNextLock.
  ///
  /// In en, this message translates to:
  /// **'Next lock: {time}'**
  String alNextLock(String time);

  /// No description provided for @alUnlockedUntil.
  ///
  /// In en, this message translates to:
  /// **'Unlocked until {time}'**
  String alUnlockedUntil(String time);

  /// No description provided for @alReasonLimit.
  ///
  /// In en, this message translates to:
  /// **'Daily limit reached'**
  String get alReasonLimit;

  /// No description provided for @alReasonSchedule.
  ///
  /// In en, this message translates to:
  /// **'Lock schedule active'**
  String get alReasonSchedule;

  /// No description provided for @alReasonGeneral.
  ///
  /// In en, this message translates to:
  /// **'General schedule active'**
  String get alReasonGeneral;

  /// No description provided for @alReasonAllDay.
  ///
  /// In en, this message translates to:
  /// **'Locked all day'**
  String get alReasonAllDay;

  /// No description provided for @alReasonFocus.
  ///
  /// In en, this message translates to:
  /// **'Focus session running'**
  String get alReasonFocus;

  /// No description provided for @alNoMatches.
  ///
  /// In en, this message translates to:
  /// **'No apps match'**
  String get alNoMatches;

  /// No description provided for @alGeneral.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get alGeneral;

  /// No description provided for @alGeneralScheduleSub.
  ///
  /// In en, this message translates to:
  /// **'For apps with “Follow general schedule” on'**
  String get alGeneralScheduleSub;

  /// No description provided for @alLockAllSub.
  ///
  /// In en, this message translates to:
  /// **'Turn restrictions on for every app'**
  String get alLockAllSub;

  /// No description provided for @alSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get alSaved;

  /// No description provided for @alChangesApply.
  ///
  /// In en, this message translates to:
  /// **'Changes apply immediately'**
  String get alChangesApply;

  /// No description provided for @alDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'App Limits'**
  String get alDetailsTitle;

  /// No description provided for @alBlockingOff.
  ///
  /// In en, this message translates to:
  /// **'Blocking is off on this phone'**
  String get alBlockingOff;

  /// No description provided for @alRestrictApp.
  ///
  /// In en, this message translates to:
  /// **'Restrict this app'**
  String get alRestrictApp;

  /// No description provided for @alMasterOff.
  ///
  /// In en, this message translates to:
  /// **'Off — Pausey won\'t restrict this app'**
  String get alMasterOff;

  /// No description provided for @alMasterOnRules.
  ///
  /// In en, this message translates to:
  /// **'Your limit and schedules below apply'**
  String get alMasterOnRules;

  /// No description provided for @alMasterOnAllDay.
  ///
  /// In en, this message translates to:
  /// **'No limit or schedule yet — locked all day'**
  String get alMasterOnAllDay;

  /// No description provided for @alMasterOnGeneral.
  ///
  /// In en, this message translates to:
  /// **'Locked during the general schedule'**
  String get alMasterOnGeneral;

  /// No description provided for @alFollowGeneral.
  ///
  /// In en, this message translates to:
  /// **'Follow general schedule'**
  String get alFollowGeneral;

  /// No description provided for @alFollowGeneralSub.
  ///
  /// In en, this message translates to:
  /// **'Also lock {start} – {end}'**
  String alFollowGeneralSub(String start, String end);

  /// No description provided for @alGeneralOff.
  ///
  /// In en, this message translates to:
  /// **'The general schedule is turned off'**
  String get alGeneralOff;

  /// No description provided for @alDailyLimit.
  ///
  /// In en, this message translates to:
  /// **'Daily limit'**
  String get alDailyLimit;

  /// No description provided for @alDailyLimitOffSub.
  ///
  /// In en, this message translates to:
  /// **'Lock the app after a set time each day'**
  String get alDailyLimitOffSub;

  /// No description provided for @alCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get alCustom;

  /// No description provided for @alUsedLabel.
  ///
  /// In en, this message translates to:
  /// **'Used today'**
  String get alUsedLabel;

  /// No description provided for @alLeftLabel.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get alLeftLabel;

  /// No description provided for @alLimitReached.
  ///
  /// In en, this message translates to:
  /// **'Limit reached for today'**
  String get alLimitReached;

  /// No description provided for @alResets.
  ///
  /// In en, this message translates to:
  /// **'Resets at midnight (your phone\'s time)'**
  String get alResets;

  /// No description provided for @alUsageUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Usage unavailable'**
  String get alUsageUnavailable;

  /// No description provided for @alUsageNeedsAccess.
  ///
  /// In en, this message translates to:
  /// **'Allow Usage access so Pausey can count today\'s time.'**
  String get alUsageNeedsAccess;

  /// No description provided for @alUsageAndroidOnly.
  ///
  /// In en, this message translates to:
  /// **'Usage is measured on Android phones only. The limit still saves and applies there.'**
  String get alUsageAndroidOnly;

  /// No description provided for @alGrantUsage.
  ///
  /// In en, this message translates to:
  /// **'Grant usage access'**
  String get alGrantUsage;

  /// No description provided for @alCustomLimitTitle.
  ///
  /// In en, this message translates to:
  /// **'Custom daily limit'**
  String get alCustomLimitTitle;

  /// No description provided for @alHours.
  ///
  /// In en, this message translates to:
  /// **'Hours'**
  String get alHours;

  /// No description provided for @alMinutes.
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get alMinutes;

  /// No description provided for @alErrZeroLimit.
  ///
  /// In en, this message translates to:
  /// **'Pick a time above zero'**
  String get alErrZeroLimit;

  /// No description provided for @alSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get alSave;

  /// No description provided for @alScheduledLocking.
  ///
  /// In en, this message translates to:
  /// **'Scheduled locking'**
  String get alScheduledLocking;

  /// No description provided for @alScheduledOffSub.
  ///
  /// In en, this message translates to:
  /// **'Lock this app at set times'**
  String get alScheduledOffSub;

  /// No description provided for @alNoSchedules.
  ///
  /// In en, this message translates to:
  /// **'No schedules yet'**
  String get alNoSchedules;

  /// No description provided for @alAddSchedule.
  ///
  /// In en, this message translates to:
  /// **'Add schedule'**
  String get alAddSchedule;

  /// No description provided for @alActiveNow.
  ///
  /// In en, this message translates to:
  /// **'Active now'**
  String get alActiveNow;

  /// No description provided for @alScheduleDefault.
  ///
  /// In en, this message translates to:
  /// **'Lock time'**
  String get alScheduleDefault;

  /// No description provided for @alEndsNextDay.
  ///
  /// In en, this message translates to:
  /// **'Ends next day'**
  String get alEndsNextDay;

  /// No description provided for @alEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get alEdit;

  /// No description provided for @alDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get alDelete;

  /// No description provided for @alDeleteScheduleQ.
  ///
  /// In en, this message translates to:
  /// **'Delete this schedule?'**
  String get alDeleteScheduleQ;

  /// No description provided for @alDeleteScheduleMsg.
  ///
  /// In en, this message translates to:
  /// **'“{title}” will stop locking this app.'**
  String alDeleteScheduleMsg(String title);

  /// No description provided for @alNewSchedule.
  ///
  /// In en, this message translates to:
  /// **'New schedule'**
  String get alNewSchedule;

  /// No description provided for @alEditSchedule.
  ///
  /// In en, this message translates to:
  /// **'Edit schedule'**
  String get alEditSchedule;

  /// No description provided for @alTitleOptional.
  ///
  /// In en, this message translates to:
  /// **'Title (optional)'**
  String get alTitleOptional;

  /// No description provided for @alPresetStudy.
  ///
  /// In en, this message translates to:
  /// **'Study'**
  String get alPresetStudy;

  /// No description provided for @alPresetEvening.
  ///
  /// In en, this message translates to:
  /// **'Evening'**
  String get alPresetEvening;

  /// No description provided for @alPresetSleep.
  ///
  /// In en, this message translates to:
  /// **'Sleep'**
  String get alPresetSleep;

  /// No description provided for @alRepeatOn.
  ///
  /// In en, this message translates to:
  /// **'Repeat on'**
  String get alRepeatOn;

  /// No description provided for @alErrSameTime.
  ///
  /// In en, this message translates to:
  /// **'Start and end can\'t be the same'**
  String get alErrSameTime;

  /// No description provided for @alErrNoDays.
  ///
  /// In en, this message translates to:
  /// **'Pick at least one day'**
  String get alErrNoDays;

  /// No description provided for @alTempUnlock.
  ///
  /// In en, this message translates to:
  /// **'Unlock for {minutes} min'**
  String alTempUnlock(int minutes);

  /// No description provided for @alTempUnlockSub.
  ///
  /// In en, this message translates to:
  /// **'Uses 1 emergency override · {n} left today'**
  String alTempUnlockSub(int n);

  /// No description provided for @alTempUnlockFocus.
  ///
  /// In en, this message translates to:
  /// **'Can\'t unlock during a Focus session'**
  String get alTempUnlockFocus;

  /// No description provided for @alTempUnlockNotLocked.
  ///
  /// In en, this message translates to:
  /// **'Only needed while the app is locked'**
  String get alTempUnlockNotLocked;

  /// No description provided for @alTempUnlockQ.
  ///
  /// In en, this message translates to:
  /// **'Unlock {app} for {minutes} minutes?'**
  String alTempUnlockQ(String app, int minutes);

  /// No description provided for @alUnlock.
  ///
  /// In en, this message translates to:
  /// **'Unlock'**
  String get alUnlock;

  /// No description provided for @alEndEarly.
  ///
  /// In en, this message translates to:
  /// **'End early'**
  String get alEndEarly;

  /// No description provided for @alResetRules.
  ///
  /// In en, this message translates to:
  /// **'Reset restrictions'**
  String get alResetRules;

  /// No description provided for @alResetRulesSub.
  ///
  /// In en, this message translates to:
  /// **'Remove this app\'s limit and schedules'**
  String get alResetRulesSub;

  /// No description provided for @alResetQ.
  ///
  /// In en, this message translates to:
  /// **'Reset restrictions for {app}?'**
  String alResetQ(String app);

  /// No description provided for @alResetMsg.
  ///
  /// In en, this message translates to:
  /// **'Its daily limit and all schedules will be removed. The app stays in your list.'**
  String get alResetMsg;

  /// No description provided for @alReset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get alReset;

  /// No description provided for @alResetDone.
  ///
  /// In en, this message translates to:
  /// **'Restrictions reset'**
  String get alResetDone;

  /// No description provided for @alRemoveApp.
  ///
  /// In en, this message translates to:
  /// **'Remove app'**
  String get alRemoveApp;

  /// No description provided for @alRemoveAppSub.
  ///
  /// In en, this message translates to:
  /// **'Stop managing this app'**
  String get alRemoveAppSub;

  /// No description provided for @alRemoveQ.
  ///
  /// In en, this message translates to:
  /// **'Remove {app}?'**
  String alRemoveQ(String app);

  /// No description provided for @alRemoveMsg.
  ///
  /// In en, this message translates to:
  /// **'Pausey will stop restricting it and forget its limit and schedules.'**
  String get alRemoveMsg;

  /// No description provided for @alRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get alRemove;

  /// No description provided for @alNoPackage.
  ///
  /// In en, this message translates to:
  /// **'Per-app limits and schedules need one specific installed app. On Android, add it with “Choose from installed apps”.'**
  String get alNoPackage;

  /// No description provided for @alNotFound.
  ///
  /// In en, this message translates to:
  /// **'This app is no longer managed'**
  String get alNotFound;

  /// No description provided for @alPickerTitle.
  ///
  /// In en, this message translates to:
  /// **'Installed apps'**
  String get alPickerTitle;

  /// No description provided for @alPickerAdded.
  ///
  /// In en, this message translates to:
  /// **'Already added'**
  String get alPickerAdded;

  /// No description provided for @alPickerAdd.
  ///
  /// In en, this message translates to:
  /// **'{n, plural, =0{Add apps} =1{Add 1 app} other{Add {n} apps}}'**
  String alPickerAdd(int n);

  /// No description provided for @alPickerEmpty.
  ///
  /// In en, this message translates to:
  /// **'No apps found'**
  String get alPickerEmpty;

  /// No description provided for @blockTitle.
  ///
  /// In en, this message translates to:
  /// **'App Lock'**
  String get blockTitle;

  /// No description provided for @blockAddApp.
  ///
  /// In en, this message translates to:
  /// **'Add App'**
  String get blockAddApp;

  /// No description provided for @blockFaceIdTitle.
  ///
  /// In en, this message translates to:
  /// **'Face ID Protection'**
  String get blockFaceIdTitle;

  /// No description provided for @blockFaceIdSub.
  ///
  /// In en, this message translates to:
  /// **'Require Face ID to unlock any app'**
  String get blockFaceIdSub;

  /// No description provided for @blockFaceIdUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Biometric unlock isn\'t available on this device'**
  String get blockFaceIdUnavailable;

  /// No description provided for @blockFaceIdReason.
  ///
  /// In en, this message translates to:
  /// **'Confirm it\'s you to turn on protection'**
  String get blockFaceIdReason;

  /// No description provided for @blockFaceIdFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t verify — protection stays off'**
  String get blockFaceIdFailed;

  /// No description provided for @blockScheduleTitle.
  ///
  /// In en, this message translates to:
  /// **'Schedule Lock'**
  String get blockScheduleTitle;

  /// No description provided for @blockStart.
  ///
  /// In en, this message translates to:
  /// **'Start Time'**
  String get blockStart;

  /// No description provided for @blockEnd.
  ///
  /// In en, this message translates to:
  /// **'End Time'**
  String get blockEnd;

  /// No description provided for @blockNeedOneDay.
  ///
  /// In en, this message translates to:
  /// **'Keep at least one day selected'**
  String get blockNeedOneDay;

  /// No description provided for @blockManagedApps.
  ///
  /// In en, this message translates to:
  /// **'Managed Apps'**
  String get blockManagedApps;

  /// No description provided for @blockLockAll.
  ///
  /// In en, this message translates to:
  /// **'Lock All'**
  String get blockLockAll;

  /// No description provided for @blockAllLocked.
  ///
  /// In en, this message translates to:
  /// **'All apps are locked'**
  String get blockAllLocked;

  /// No description provided for @blockRemoved.
  ///
  /// In en, this message translates to:
  /// **'{app} removed'**
  String blockRemoved(String app);

  /// No description provided for @blockAppsUpdated.
  ///
  /// In en, this message translates to:
  /// **'Managed apps updated'**
  String get blockAppsUpdated;

  /// No description provided for @blockCatSocial.
  ///
  /// In en, this message translates to:
  /// **'Social'**
  String get blockCatSocial;

  /// No description provided for @blockCatVideo.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get blockCatVideo;

  /// No description provided for @blockCatGames.
  ///
  /// In en, this message translates to:
  /// **'Games'**
  String get blockCatGames;

  /// No description provided for @blockCatShopping.
  ///
  /// In en, this message translates to:
  /// **'Shopping'**
  String get blockCatShopping;

  /// No description provided for @blockCatCommunity.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get blockCatCommunity;

  /// No description provided for @blockCatOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get blockCatOther;

  /// No description provided for @blockEmptyBadge.
  ///
  /// In en, this message translates to:
  /// **'Nothing blocked'**
  String get blockEmptyBadge;

  /// No description provided for @blockEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No apps managed yet'**
  String get blockEmptyTitle;

  /// No description provided for @blockEmptyMsg.
  ///
  /// In en, this message translates to:
  /// **'Add the apps that distract you most and Pausey will lock them for you.'**
  String get blockEmptyMsg;

  /// No description provided for @blockEmergencyTitle.
  ///
  /// In en, this message translates to:
  /// **'Emergency Override'**
  String get blockEmergencyTitle;

  /// No description provided for @blockEmergencySub.
  ///
  /// In en, this message translates to:
  /// **'Temporarily unlock all apps · {n, plural, =1{1 left today} other{{n} left today}}'**
  String blockEmergencySub(int n);

  /// No description provided for @blockEmergencyOff.
  ///
  /// In en, this message translates to:
  /// **'Turned off in Settings'**
  String get blockEmergencyOff;

  /// No description provided for @blockEmergencyUse.
  ///
  /// In en, this message translates to:
  /// **'Use'**
  String get blockEmergencyUse;

  /// No description provided for @blockEmergencyConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Use emergency override?'**
  String get blockEmergencyConfirmTitle;

  /// No description provided for @blockEmergencyConfirmMsg.
  ///
  /// In en, this message translates to:
  /// **'This uses one of your {n} overrides left today. Only use it when you really need an app.'**
  String blockEmergencyConfirmMsg(int n);

  /// No description provided for @blockEmergencyUsed.
  ///
  /// In en, this message translates to:
  /// **'Override used — apps are unlocked for now'**
  String get blockEmergencyUsed;

  /// No description provided for @blockEmergencyNone.
  ///
  /// In en, this message translates to:
  /// **'No overrides left today'**
  String get blockEmergencyNone;

  /// No description provided for @cvAppsLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t read the apps on this phone.'**
  String get cvAppsLoadFailed;

  /// No description provided for @cvTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get cvTryAgain;

  /// No description provided for @cvGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get cvGetStarted;

  /// No description provided for @cvHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'I already have an account'**
  String get cvHaveAccount;

  /// No description provided for @cvWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Your time is yours.'**
  String get cvWelcomeTitle;

  /// No description provided for @cvWelcomeBody.
  ///
  /// In en, this message translates to:
  /// **'Let\'s make more room for what matters.'**
  String get cvWelcomeBody;

  /// No description provided for @cvNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get cvNext;

  /// No description provided for @cvSkipForNow.
  ///
  /// In en, this message translates to:
  /// **'Skip for now'**
  String get cvSkipForNow;

  /// No description provided for @cvRelateTitle.
  ///
  /// In en, this message translates to:
  /// **'Ever picked up your phone for a minute and stayed much longer?'**
  String get cvRelateTitle;

  /// No description provided for @cvRelateOften.
  ///
  /// In en, this message translates to:
  /// **'All the time'**
  String get cvRelateOften;

  /// No description provided for @cvRelateSometimes.
  ///
  /// In en, this message translates to:
  /// **'Sometimes'**
  String get cvRelateSometimes;

  /// No description provided for @cvRelateRarely.
  ///
  /// In en, this message translates to:
  /// **'Rarely'**
  String get cvRelateRarely;

  /// No description provided for @cvRelateReplyOften.
  ///
  /// In en, this message translates to:
  /// **'You\'re not alone. Phones are designed to keep us there.'**
  String get cvRelateReplyOften;

  /// No description provided for @cvRelateReplySometimes.
  ///
  /// In en, this message translates to:
  /// **'It happens to most of us, usually without noticing.'**
  String get cvRelateReplySometimes;

  /// No description provided for @cvRelateReplyRarely.
  ///
  /// In en, this message translates to:
  /// **'Nice. Let\'s keep it that way.'**
  String get cvRelateReplyRarely;

  /// No description provided for @cvRelateCta.
  ///
  /// In en, this message translates to:
  /// **'That\'s me'**
  String get cvRelateCta;

  /// No description provided for @cvGoalTitle.
  ///
  /// In en, this message translates to:
  /// **'What would you like more time for?'**
  String get cvGoalTitle;

  /// No description provided for @cvGoalFocus.
  ///
  /// In en, this message translates to:
  /// **'Better focus'**
  String get cvGoalFocus;

  /// No description provided for @cvGoalSleep.
  ///
  /// In en, this message translates to:
  /// **'Better sleep'**
  String get cvGoalSleep;

  /// No description provided for @cvGoalScrolling.
  ///
  /// In en, this message translates to:
  /// **'Less scrolling'**
  String get cvGoalScrolling;

  /// No description provided for @cvGoalMe.
  ///
  /// In en, this message translates to:
  /// **'More time for myself'**
  String get cvGoalMe;

  /// No description provided for @cvGoalHabits.
  ///
  /// In en, this message translates to:
  /// **'Healthier daily habits'**
  String get cvGoalHabits;

  /// No description provided for @cvGoalOther.
  ///
  /// In en, this message translates to:
  /// **'Something else'**
  String get cvGoalOther;

  /// No description provided for @cvGoalOtherHint.
  ///
  /// In en, this message translates to:
  /// **'What would you like more time for?'**
  String get cvGoalOtherHint;

  /// No description provided for @cvGoalReplyFocus.
  ///
  /// In en, this message translates to:
  /// **'Focus it is. We\'ll protect the time you need for deep work.'**
  String get cvGoalReplyFocus;

  /// No description provided for @cvGoalReplySleep.
  ///
  /// In en, this message translates to:
  /// **'Good sleep starts before bed. We\'ll help your evenings wind down.'**
  String get cvGoalReplySleep;

  /// No description provided for @cvGoalReplyScrolling.
  ///
  /// In en, this message translates to:
  /// **'Let\'s make the scroll a choice, not a habit.'**
  String get cvGoalReplyScrolling;

  /// No description provided for @cvGoalReplyMe.
  ///
  /// In en, this message translates to:
  /// **'Time for yourself matters. Let\'s find some.'**
  String get cvGoalReplyMe;

  /// No description provided for @cvGoalReplyHabits.
  ///
  /// In en, this message translates to:
  /// **'Small steps add up. We\'ll keep them easy.'**
  String get cvGoalReplyHabits;

  /// No description provided for @cvGoalReplyOther.
  ///
  /// In en, this message translates to:
  /// **'Got it. We\'ll shape things around that.'**
  String get cvGoalReplyOther;

  /// No description provided for @cvAppsTitle.
  ///
  /// In en, this message translates to:
  /// **'Which apps pull you in the most?'**
  String get cvAppsTitle;

  /// No description provided for @cvAppsSubReal.
  ///
  /// In en, this message translates to:
  /// **'These are apps on this phone. Pick as many as you like.'**
  String get cvAppsSubReal;

  /// No description provided for @cvAppsSubPopular.
  ///
  /// In en, this message translates to:
  /// **'Popular apps that often take up time. Pick any that apply.'**
  String get cvAppsSubPopular;

  /// No description provided for @cvAppsSearch.
  ///
  /// In en, this message translates to:
  /// **'Search apps'**
  String get cvAppsSearch;

  /// No description provided for @cvAppsReply.
  ///
  /// In en, this message translates to:
  /// **'Noted: {apps}. We\'ll start with these.'**
  String cvAppsReply(String apps);

  /// No description provided for @cvAnd.
  ///
  /// In en, this message translates to:
  /// **'{a} and {b}'**
  String cvAnd(String a, String b);

  /// No description provided for @cvAndMore.
  ///
  /// In en, this message translates to:
  /// **'{a}, {b} and {count} more'**
  String cvAndMore(String a, String b, int count);

  /// No description provided for @cvStTitle.
  ///
  /// In en, this message translates to:
  /// **'Roughly how long are you on your phone each day?'**
  String get cvStTitle;

  /// No description provided for @cvStSub.
  ///
  /// In en, this message translates to:
  /// **'A guess is fine. This stays on your phone.'**
  String get cvStSub;

  /// No description provided for @cvStMeasured.
  ///
  /// In en, this message translates to:
  /// **'Measured on this phone today so far: {time}'**
  String cvStMeasured(String time);

  /// No description provided for @cvStUnder2.
  ///
  /// In en, this message translates to:
  /// **'Under 2 hours'**
  String get cvStUnder2;

  /// No description provided for @cvSt2to4.
  ///
  /// In en, this message translates to:
  /// **'2 to 4 hours'**
  String get cvSt2to4;

  /// No description provided for @cvSt4to6.
  ///
  /// In en, this message translates to:
  /// **'4 to 6 hours'**
  String get cvSt4to6;

  /// No description provided for @cvStOver6.
  ///
  /// In en, this message translates to:
  /// **'More than 6 hours'**
  String get cvStOver6;

  /// No description provided for @cvStNotSure.
  ///
  /// In en, this message translates to:
  /// **'Not sure'**
  String get cvStNotSure;

  /// No description provided for @cvStReplyUnder2.
  ///
  /// In en, this message translates to:
  /// **'That\'s a good balance. We\'ll help you keep it.'**
  String get cvStReplyUnder2;

  /// No description provided for @cvStReply2to4.
  ///
  /// In en, this message translates to:
  /// **'A few small changes can free up real time.'**
  String get cvStReply2to4;

  /// No description provided for @cvStReply4to6.
  ///
  /// In en, this message translates to:
  /// **'That\'s a good part of your day. Let\'s make some of it yours again.'**
  String get cvStReply4to6;

  /// No description provided for @cvStReplyOver6.
  ///
  /// In en, this message translates to:
  /// **'That\'s a big part of the day, so we\'ll start small.'**
  String get cvStReplyOver6;

  /// No description provided for @cvStReplyNotSure.
  ///
  /// In en, this message translates to:
  /// **'No problem. Pausey can measure it once you allow usage access.'**
  String get cvStReplyNotSure;

  /// No description provided for @cvPhraseFocus.
  ///
  /// In en, this message translates to:
  /// **'more focus'**
  String get cvPhraseFocus;

  /// No description provided for @cvPhraseSleep.
  ///
  /// In en, this message translates to:
  /// **'better sleep'**
  String get cvPhraseSleep;

  /// No description provided for @cvPhraseScrolling.
  ///
  /// In en, this message translates to:
  /// **'less scrolling'**
  String get cvPhraseScrolling;

  /// No description provided for @cvPhraseMe.
  ///
  /// In en, this message translates to:
  /// **'more time for yourself'**
  String get cvPhraseMe;

  /// No description provided for @cvPhraseHabits.
  ///
  /// In en, this message translates to:
  /// **'healthier habits'**
  String get cvPhraseHabits;

  /// No description provided for @cvPhraseOther.
  ///
  /// In en, this message translates to:
  /// **'more room for what matters'**
  String get cvPhraseOther;

  /// No description provided for @cvPhraseOtherNamed.
  ///
  /// In en, this message translates to:
  /// **'more time for {thing}'**
  String cvPhraseOtherNamed(String thing);

  /// No description provided for @cvReflectApps.
  ///
  /// In en, this message translates to:
  /// **'You want {goal}, but {apps} keep pulling you in.'**
  String cvReflectApps(String goal, String apps);

  /// No description provided for @cvReflectNoApps.
  ///
  /// In en, this message translates to:
  /// **'You want {goal}, and your phone sometimes gets in the way.'**
  String cvReflectNoApps(String goal);

  /// No description provided for @cvReflectEstimate.
  ///
  /// In en, this message translates to:
  /// **'About {time} a day (your estimate)'**
  String cvReflectEstimate(String time);

  /// No description provided for @cvReflectMeasured.
  ///
  /// In en, this message translates to:
  /// **'{time} today so far (measured)'**
  String cvReflectMeasured(String time);

  /// No description provided for @cvReflectHelp.
  ///
  /// In en, this message translates to:
  /// **'Pausey can help you build a routine that gives your attention some breathing room.'**
  String get cvReflectHelp;

  /// No description provided for @cvShowMeHow.
  ///
  /// In en, this message translates to:
  /// **'Show me how'**
  String get cvShowMeHow;

  /// No description provided for @cvHowTitle.
  ///
  /// In en, this message translates to:
  /// **'Here\'s how Pausey helps'**
  String get cvHowTitle;

  /// No description provided for @cvHowPauseTab.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get cvHowPauseTab;

  /// No description provided for @cvHowLimitTab.
  ///
  /// In en, this message translates to:
  /// **'Limits'**
  String get cvHowLimitTab;

  /// No description provided for @cvHowFocusTab.
  ///
  /// In en, this message translates to:
  /// **'Focus'**
  String get cvHowFocusTab;

  /// No description provided for @cvHowPauseTitle.
  ///
  /// In en, this message translates to:
  /// **'A calm pause, not a punishment'**
  String get cvHowPauseTitle;

  /// No description provided for @cvHowPauseBody.
  ///
  /// In en, this message translates to:
  /// **'When an app\'s time is up, Pausey covers it with a quiet pause screen and a way out.'**
  String get cvHowPauseBody;

  /// No description provided for @cvHowLimitTitle.
  ///
  /// In en, this message translates to:
  /// **'A daily allowance for each app'**
  String get cvHowLimitTitle;

  /// No description provided for @cvHowLimitBody.
  ///
  /// In en, this message translates to:
  /// **'Give every app its own daily time and lock times. Changing one never changes another.'**
  String get cvHowLimitBody;

  /// No description provided for @cvHowFocusTitle.
  ///
  /// In en, this message translates to:
  /// **'Focus sessions'**
  String get cvHowFocusTitle;

  /// No description provided for @cvHowFocusBody.
  ///
  /// In en, this message translates to:
  /// **'Start a timer for work, study or rest. Your chosen apps stay paused until it ends.'**
  String get cvHowFocusBody;

  /// No description provided for @cvPreview.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get cvPreview;

  /// No description provided for @cvYourApp.
  ///
  /// In en, this message translates to:
  /// **'Your app'**
  String get cvYourApp;

  /// No description provided for @cvAnotherApp.
  ///
  /// In en, this message translates to:
  /// **'Another app'**
  String get cvAnotherApp;

  /// No description provided for @cvMinOf.
  ///
  /// In en, this message translates to:
  /// **'{used}m of {limit}m'**
  String cvMinOf(int used, int limit);

  /// No description provided for @cvBuildPlan.
  ///
  /// In en, this message translates to:
  /// **'Build my plan'**
  String get cvBuildPlan;

  /// No description provided for @cvPlanTitle.
  ///
  /// In en, this message translates to:
  /// **'Here\'s a gentle place to start'**
  String get cvPlanTitle;

  /// No description provided for @cvPlanSub.
  ///
  /// In en, this message translates to:
  /// **'Suggested from your answers. Change anything you like.'**
  String get cvPlanSub;

  /// No description provided for @cvPlanFocus.
  ///
  /// In en, this message translates to:
  /// **'Focus session'**
  String get cvPlanFocus;

  /// No description provided for @cvPlanFocusSub.
  ///
  /// In en, this message translates to:
  /// **'{time} per session'**
  String cvPlanFocusSub(String time);

  /// No description provided for @cvPlanDaily.
  ///
  /// In en, this message translates to:
  /// **'Daily focus goal'**
  String get cvPlanDaily;

  /// No description provided for @cvPlanDailySub.
  ///
  /// In en, this message translates to:
  /// **'{time} of focus a day'**
  String cvPlanDailySub(String time);

  /// No description provided for @cvPlanLimit.
  ///
  /// In en, this message translates to:
  /// **'Daily app limit'**
  String get cvPlanLimit;

  /// No description provided for @cvPlanLimitSub.
  ///
  /// In en, this message translates to:
  /// **'{app}: {time} a day'**
  String cvPlanLimitSub(String app, String time);

  /// No description provided for @cvPlanLimitNoPkg.
  ///
  /// In en, this message translates to:
  /// **'This app isn\'t on the phone list, so the limit can be set later in App Lock.'**
  String get cvPlanLimitNoPkg;

  /// No description provided for @cvPlanWind.
  ///
  /// In en, this message translates to:
  /// **'Evening wind-down'**
  String get cvPlanWind;

  /// No description provided for @cvPlanWindSub.
  ///
  /// In en, this message translates to:
  /// **'Your chosen apps pause from {start} to {end}'**
  String cvPlanWindSub(String start, String end);

  /// No description provided for @cvPlanOff.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get cvPlanOff;

  /// No description provided for @cvStarts.
  ///
  /// In en, this message translates to:
  /// **'Starts'**
  String get cvStarts;

  /// No description provided for @cvEnds.
  ///
  /// In en, this message translates to:
  /// **'Ends'**
  String get cvEnds;

  /// No description provided for @cvPlanNote.
  ///
  /// In en, this message translates to:
  /// **'Nothing is switched on yet. It starts only when you finish setup, and you can change it any time.'**
  String get cvPlanNote;

  /// No description provided for @cvUsePlan.
  ///
  /// In en, this message translates to:
  /// **'Use this plan'**
  String get cvUsePlan;

  /// No description provided for @cvPermTitle.
  ///
  /// In en, this message translates to:
  /// **'A few permissions make this work'**
  String get cvPermTitle;

  /// No description provided for @cvPermSub.
  ///
  /// In en, this message translates to:
  /// **'Each one opens Android settings. Turn it on there, then come back.'**
  String get cvPermSub;

  /// No description provided for @cvPermUnsupported.
  ///
  /// In en, this message translates to:
  /// **'App limits and pause screens work on Android phones. Everything else works here too.'**
  String get cvPermUnsupported;

  /// No description provided for @cvPermUsageTitle.
  ///
  /// In en, this message translates to:
  /// **'Usage access'**
  String get cvPermUsageTitle;

  /// No description provided for @cvPermUsageWhy.
  ///
  /// In en, this message translates to:
  /// **'Lets Pausey see how long each app is open today and which app is on screen.'**
  String get cvPermUsageWhy;

  /// No description provided for @cvPermUsageWithout.
  ///
  /// In en, this message translates to:
  /// **'Without it, Pausey can\'t measure screen time or know when a limit is reached.'**
  String get cvPermUsageWithout;

  /// No description provided for @cvPermOverlayTitle.
  ///
  /// In en, this message translates to:
  /// **'Display over other apps'**
  String get cvPermOverlayTitle;

  /// No description provided for @cvPermOverlayWhy.
  ///
  /// In en, this message translates to:
  /// **'Lets Pausey show its pause screen on top of an app when its time is up.'**
  String get cvPermOverlayWhy;

  /// No description provided for @cvPermOverlayWithout.
  ///
  /// In en, this message translates to:
  /// **'Without it, apps can\'t be paused. Your plan is kept for later.'**
  String get cvPermOverlayWithout;

  /// No description provided for @cvPermBatteryTitle.
  ///
  /// In en, this message translates to:
  /// **'Keep Pausey running'**
  String get cvPermBatteryTitle;

  /// No description provided for @cvPermBatteryWhy.
  ///
  /// In en, this message translates to:
  /// **'Some phones stop background apps to save battery. Allowing Pausey keeps your limits working.'**
  String get cvPermBatteryWhy;

  /// No description provided for @cvPermBatteryWithout.
  ///
  /// In en, this message translates to:
  /// **'Without it, limits may stop working until you open Pausey again.'**
  String get cvPermBatteryWithout;

  /// No description provided for @cvPermLater.
  ///
  /// In en, this message translates to:
  /// **'You can change this later in Android settings.'**
  String get cvPermLater;

  /// No description provided for @cvPermPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Pausey reads app names and times only. Nothing leaves your phone.'**
  String get cvPermPrivacy;

  /// No description provided for @cvAllowInSettings.
  ///
  /// In en, this message translates to:
  /// **'Allow in settings'**
  String get cvAllowInSettings;

  /// No description provided for @cvAllowed.
  ///
  /// In en, this message translates to:
  /// **'Allowed'**
  String get cvAllowed;

  /// No description provided for @cvOptional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get cvOptional;

  /// No description provided for @cvContinueAnyway.
  ///
  /// In en, this message translates to:
  /// **'Continue for now'**
  String get cvContinueAnyway;

  /// No description provided for @cvAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Keep your progress'**
  String get cvAccountTitle;

  /// No description provided for @cvAccountSub.
  ///
  /// In en, this message translates to:
  /// **'Use Pausey as a guest, or sign in.'**
  String get cvAccountSub;

  /// No description provided for @cvNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Your name (optional)'**
  String get cvNameLabel;

  /// No description provided for @cvNameHint.
  ///
  /// In en, this message translates to:
  /// **'What should we call you?'**
  String get cvNameHint;

  /// No description provided for @cvContinueGuest.
  ///
  /// In en, this message translates to:
  /// **'Continue as guest'**
  String get cvContinueGuest;

  /// No description provided for @cvAccountNote.
  ///
  /// In en, this message translates to:
  /// **'Signing in doesn\'t back up your data yet. Either way, your settings stay on this phone.'**
  String get cvAccountNote;

  /// No description provided for @cvReadyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your first step starts here.'**
  String get cvReadyTitle;

  /// No description provided for @cvReadyTitleNamed.
  ///
  /// In en, this message translates to:
  /// **'{name}, your first step starts here.'**
  String cvReadyTitleNamed(String name);

  /// No description provided for @cvReadyFocus.
  ///
  /// In en, this message translates to:
  /// **'Let\'s make a little more room for focus.'**
  String get cvReadyFocus;

  /// No description provided for @cvReadySleep.
  ///
  /// In en, this message translates to:
  /// **'Let\'s make your evenings a little calmer.'**
  String get cvReadySleep;

  /// No description provided for @cvReadyScrolling.
  ///
  /// In en, this message translates to:
  /// **'Let\'s give the scroll a little less of your day.'**
  String get cvReadyScrolling;

  /// No description provided for @cvReadyMe.
  ///
  /// In en, this message translates to:
  /// **'Let\'s make a little more time for you.'**
  String get cvReadyMe;

  /// No description provided for @cvReadyHabits.
  ///
  /// In en, this message translates to:
  /// **'Let\'s build habits that feel good.'**
  String get cvReadyHabits;

  /// No description provided for @cvReadyOther.
  ///
  /// In en, this message translates to:
  /// **'Let\'s make more room for what matters to you.'**
  String get cvReadyOther;

  /// No description provided for @cvYourPlan.
  ///
  /// In en, this message translates to:
  /// **'Your plan'**
  String get cvYourPlan;

  /// No description provided for @cvSumGoal.
  ///
  /// In en, this message translates to:
  /// **'Goal: {goal}'**
  String cvSumGoal(String goal);

  /// No description provided for @cvSumApps.
  ///
  /// In en, this message translates to:
  /// **'Apps: {apps}'**
  String cvSumApps(String apps);

  /// No description provided for @cvSumFocus.
  ///
  /// In en, this message translates to:
  /// **'{session} focus sessions, {daily} a day'**
  String cvSumFocus(String session, String daily);

  /// No description provided for @cvReadyNeedsPerm.
  ///
  /// In en, this message translates to:
  /// **'App limits are saved but won\'t run until the two permissions are allowed.'**
  String get cvReadyNeedsPerm;

  /// No description provided for @cvReadyChange.
  ///
  /// In en, this message translates to:
  /// **'You can change all of this later.'**
  String get cvReadyChange;

  /// No description provided for @cvStartFirstFocus.
  ///
  /// In en, this message translates to:
  /// **'Start my first focus session'**
  String get cvStartFirstFocus;

  /// No description provided for @cvFinishLimits.
  ///
  /// In en, this message translates to:
  /// **'Finish setting up app limits'**
  String get cvFinishLimits;

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

  /// No description provided for @ob6OtherHint.
  ///
  /// In en, this message translates to:
  /// **'Type your occupation'**
  String get ob6OtherHint;

  /// No description provided for @timeSecondLabel.
  ///
  /// In en, this message translates to:
  /// **'Second'**
  String get timeSecondLabel;

  /// No description provided for @focusModePomodoro.
  ///
  /// In en, this message translates to:
  /// **'Pomodoro'**
  String get focusModePomodoro;

  /// No description provided for @focusModeDeep.
  ///
  /// In en, this message translates to:
  /// **'Deep Focus'**
  String get focusModeDeep;

  /// No description provided for @focusModeCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get focusModeCustom;

  /// No description provided for @focusRemaining.
  ///
  /// In en, this message translates to:
  /// **'REMAINING'**
  String get focusRemaining;

  /// No description provided for @focusBreakLabel.
  ///
  /// In en, this message translates to:
  /// **'BREAK'**
  String get focusBreakLabel;

  /// No description provided for @focusReadyLabel.
  ///
  /// In en, this message translates to:
  /// **'READY'**
  String get focusReadyLabel;

  /// No description provided for @focusInSession.
  ///
  /// In en, this message translates to:
  /// **'In session'**
  String get focusInSession;

  /// No description provided for @focusPausedState.
  ///
  /// In en, this message translates to:
  /// **'Paused'**
  String get focusPausedState;

  /// No description provided for @focusOnBreak.
  ///
  /// In en, this message translates to:
  /// **'On break'**
  String get focusOnBreak;

  /// No description provided for @focusIdleState.
  ///
  /// In en, this message translates to:
  /// **'Tap play to start'**
  String get focusIdleState;

  /// No description provided for @focusSessionsDone.
  ///
  /// In en, this message translates to:
  /// **'Sessions done'**
  String get focusSessionsDone;

  /// No description provided for @focusProgress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get focusProgress;

  /// No description provided for @focusBreakAfter.
  ///
  /// In en, this message translates to:
  /// **'Break after'**
  String get focusBreakAfter;

  /// No description provided for @focusFocusedToday.
  ///
  /// In en, this message translates to:
  /// **'Focused today'**
  String get focusFocusedToday;

  /// No description provided for @focusAppsBlocked.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 app blocked} other{{count} apps blocked}}'**
  String focusAppsBlocked(int count);

  /// No description provided for @focusAppsBlockedSub.
  ///
  /// In en, this message translates to:
  /// **'Distractions are locked for this session.'**
  String get focusAppsBlockedSub;

  /// No description provided for @focusNoApps.
  ///
  /// In en, this message translates to:
  /// **'No apps blocked'**
  String get focusNoApps;

  /// No description provided for @focusNoAppsSub.
  ///
  /// In en, this message translates to:
  /// **'Pick apps to lock while you focus.'**
  String get focusNoAppsSub;

  /// No description provided for @focusEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get focusEdit;

  /// No description provided for @focusAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get focusAdd;

  /// No description provided for @focusAmbient.
  ///
  /// In en, this message translates to:
  /// **'Ambient Sound'**
  String get focusAmbient;

  /// No description provided for @focusSoundOff.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get focusSoundOff;

  /// No description provided for @focusSoundRain.
  ///
  /// In en, this message translates to:
  /// **'Rain'**
  String get focusSoundRain;

  /// No description provided for @focusSoundForest.
  ///
  /// In en, this message translates to:
  /// **'Forest'**
  String get focusSoundForest;

  /// No description provided for @focusSoundWaves.
  ///
  /// In en, this message translates to:
  /// **'Ocean Waves'**
  String get focusSoundWaves;

  /// No description provided for @focusSoundWhite.
  ///
  /// In en, this message translates to:
  /// **'White Noise'**
  String get focusSoundWhite;

  /// No description provided for @focusVolume.
  ///
  /// In en, this message translates to:
  /// **'Volume'**
  String get focusVolume;

  /// No description provided for @focusStart.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get focusStart;

  /// No description provided for @focusPause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get focusPause;

  /// No description provided for @focusResume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get focusResume;

  /// No description provided for @focusStop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get focusStop;

  /// No description provided for @focusRestart.
  ///
  /// In en, this message translates to:
  /// **'Restart'**
  String get focusRestart;

  /// No description provided for @focusSkipBreak.
  ///
  /// In en, this message translates to:
  /// **'Skip break'**
  String get focusSkipBreak;

  /// No description provided for @focusDurations.
  ///
  /// In en, this message translates to:
  /// **'Session lengths'**
  String get focusDurations;

  /// No description provided for @focusMinutesN.
  ///
  /// In en, this message translates to:
  /// **'{n} min'**
  String focusMinutesN(int n);

  /// No description provided for @focusBreakLength.
  ///
  /// In en, this message translates to:
  /// **'Break'**
  String get focusBreakLength;

  /// No description provided for @focusCustomTitle.
  ///
  /// In en, this message translates to:
  /// **'Custom duration'**
  String get focusCustomTitle;

  /// No description provided for @focusSet.
  ///
  /// In en, this message translates to:
  /// **'Set'**
  String get focusSet;

  /// No description provided for @focusStopTitle.
  ///
  /// In en, this message translates to:
  /// **'End session early?'**
  String get focusStopTitle;

  /// No description provided for @focusStopBody.
  ///
  /// In en, this message translates to:
  /// **'The time you\'ve focused so far will be saved.'**
  String get focusStopBody;

  /// No description provided for @focusEndSession.
  ///
  /// In en, this message translates to:
  /// **'End session'**
  String get focusEndSession;

  /// No description provided for @focusKeepGoing.
  ///
  /// In en, this message translates to:
  /// **'Keep going'**
  String get focusKeepGoing;

  /// No description provided for @focusTooShort.
  ///
  /// In en, this message translates to:
  /// **'Under a minute — not saved.'**
  String get focusTooShort;

  /// No description provided for @focusBreakOver.
  ///
  /// In en, this message translates to:
  /// **'Break\'s over — ready for the next one?'**
  String get focusBreakOver;

  /// No description provided for @focusBusy.
  ///
  /// In en, this message translates to:
  /// **'End the current session to change mode.'**
  String get focusBusy;

  /// No description provided for @focusFirstHint.
  ///
  /// In en, this message translates to:
  /// **'Your first session starts here — press play.'**
  String get focusFirstHint;

  /// No description provided for @focusCompleteA.
  ///
  /// In en, this message translates to:
  /// **'Session'**
  String get focusCompleteA;

  /// No description provided for @focusCompleteB.
  ///
  /// In en, this message translates to:
  /// **'Complete!'**
  String get focusCompleteB;

  /// No description provided for @focusEndedTitle.
  ///
  /// In en, this message translates to:
  /// **'Session Ended'**
  String get focusEndedTitle;

  /// No description provided for @focusCompleteMsg.
  ///
  /// In en, this message translates to:
  /// **'Outstanding work! You finished your {mode} session without a single distraction.'**
  String focusCompleteMsg(String mode);

  /// No description provided for @focusEndedMsg.
  ///
  /// In en, this message translates to:
  /// **'Every minute counts. Try a full session next time.'**
  String get focusEndedMsg;

  /// No description provided for @focusDurationLabel.
  ///
  /// In en, this message translates to:
  /// **'FOCUS DURATION'**
  String get focusDurationLabel;

  /// No description provided for @focusMinUnit.
  ///
  /// In en, this message translates to:
  /// **'min'**
  String get focusMinUnit;

  /// No description provided for @focusDayStreak.
  ///
  /// In en, this message translates to:
  /// **'Day streak'**
  String get focusDayStreak;

  /// No description provided for @focusAppsLabel.
  ///
  /// In en, this message translates to:
  /// **'Apps blocked'**
  String get focusAppsLabel;

  /// No description provided for @focusTodayGoal.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Goal'**
  String get focusTodayGoal;

  /// No description provided for @focusPctCompleted.
  ///
  /// In en, this message translates to:
  /// **'{pct}% completed'**
  String focusPctCompleted(int pct);

  /// No description provided for @focusPlusPct.
  ///
  /// In en, this message translates to:
  /// **'+{pct}% from this session'**
  String focusPlusPct(int pct);

  /// No description provided for @focusMomentum.
  ///
  /// In en, this message translates to:
  /// **'Keep the momentum!'**
  String get focusMomentum;

  /// No description provided for @focusQuote1.
  ///
  /// In en, this message translates to:
  /// **'Consistency beats intensity. Every session compounds into mastery.'**
  String get focusQuote1;

  /// No description provided for @focusQuote2.
  ///
  /// In en, this message translates to:
  /// **'Small focused blocks add up to big results.'**
  String get focusQuote2;

  /// No description provided for @focusQuote3.
  ///
  /// In en, this message translates to:
  /// **'You didn\'t scroll — you built. Do it again.'**
  String get focusQuote3;

  /// No description provided for @focusStartNext.
  ///
  /// In en, this message translates to:
  /// **'Start Next Session'**
  String get focusStartNext;

  /// No description provided for @focusBackHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Dashboard'**
  String get focusBackHome;

  /// No description provided for @goalsTitle.
  ///
  /// In en, this message translates to:
  /// **'My Goals'**
  String get goalsTitle;

  /// No description provided for @goalsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'{active} active · {done} completed'**
  String goalsSubtitle(int active, int done);

  /// No description provided for @goalsAdd.
  ///
  /// In en, this message translates to:
  /// **'Add Goal'**
  String get goalsAdd;

  /// No description provided for @goalsCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get goalsCompleted;

  /// No description provided for @goalsActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get goalsActive;

  /// No description provided for @goalsStreak.
  ///
  /// In en, this message translates to:
  /// **'Streak'**
  String get goalsStreak;

  /// No description provided for @goalsOverall.
  ///
  /// In en, this message translates to:
  /// **'Overall Completion'**
  String get goalsOverall;

  /// No description provided for @goalsWeeklyHit.
  ///
  /// In en, this message translates to:
  /// **'{hit} of {total} weekly targets hit'**
  String goalsWeeklyHit(int hit, int total);

  /// No description provided for @goalsVsLastWeek.
  ///
  /// In en, this message translates to:
  /// **'{delta} vs last week'**
  String goalsVsLastWeek(String delta);

  /// No description provided for @goalsFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get goalsFilterAll;

  /// No description provided for @goalsDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get goalsDone;

  /// No description provided for @goalsCatFocus.
  ///
  /// In en, this message translates to:
  /// **'Focus'**
  String get goalsCatFocus;

  /// No description provided for @goalsCatDiscipline.
  ///
  /// In en, this message translates to:
  /// **'Discipline'**
  String get goalsCatDiscipline;

  /// No description provided for @goalsCatWellness.
  ///
  /// In en, this message translates to:
  /// **'Wellness'**
  String get goalsCatWellness;

  /// No description provided for @goalsTitleFocusHours.
  ///
  /// In en, this message translates to:
  /// **'{n, plural, =1{Daily Focus: 1 Hour} other{Daily Focus: {n} Hours}}'**
  String goalsTitleFocusHours(int n);

  /// No description provided for @goalsTitleFocusDur.
  ///
  /// In en, this message translates to:
  /// **'Daily Focus: {duration}'**
  String goalsTitleFocusDur(String duration);

  /// No description provided for @goalsTitleBlock.
  ///
  /// In en, this message translates to:
  /// **'Block Social Apps'**
  String get goalsTitleBlock;

  /// No description provided for @goalsTitleSessions.
  ///
  /// In en, this message translates to:
  /// **'{n, plural, =1{1 Pomodoro per day} other{{n} Pomodoros per day}}'**
  String goalsTitleSessions(int n);

  /// No description provided for @goalsTitleScreen.
  ///
  /// In en, this message translates to:
  /// **'Under {duration} Screen Time'**
  String goalsTitleScreen(String duration);

  /// No description provided for @goalsTitlePhoneFree.
  ///
  /// In en, this message translates to:
  /// **'Phone-free time'**
  String get goalsTitlePhoneFree;

  /// No description provided for @goalsDescFocus.
  ///
  /// In en, this message translates to:
  /// **'Achieve {duration} of deep focus every day'**
  String goalsDescFocus(String duration);

  /// No description provided for @goalsDescBlock.
  ///
  /// In en, this message translates to:
  /// **'Keep your locked apps locked {n} days a week'**
  String goalsDescBlock(int n);

  /// No description provided for @goalsDescSessions.
  ///
  /// In en, this message translates to:
  /// **'Complete at least {n} focus sessions daily'**
  String goalsDescSessions(int n);

  /// No description provided for @goalsDescScreen.
  ///
  /// In en, this message translates to:
  /// **'Keep total daily phone use under {duration}'**
  String goalsDescScreen(String duration);

  /// No description provided for @goalsDescPhoneFree.
  ///
  /// In en, this message translates to:
  /// **'Have {n} phone-free days a week — tick each one off'**
  String goalsDescPhoneFree(int n);

  /// No description provided for @goalsProgressDays.
  ///
  /// In en, this message translates to:
  /// **'{done} / {total} days'**
  String goalsProgressDays(int done, int total);

  /// No description provided for @goalsProgressSessions.
  ///
  /// In en, this message translates to:
  /// **'{done} / {total} sessions'**
  String goalsProgressSessions(int done, int total);

  /// No description provided for @goalsStreakShort.
  ///
  /// In en, this message translates to:
  /// **'{n}d'**
  String goalsStreakShort(int n);

  /// No description provided for @goalsStreakN.
  ///
  /// In en, this message translates to:
  /// **'{n, plural, =1{1-day streak} other{{n}-day streak}}'**
  String goalsStreakN(int n);

  /// No description provided for @goalsCheckIn.
  ///
  /// In en, this message translates to:
  /// **'Mark today done'**
  String get goalsCheckIn;

  /// No description provided for @goalsCheckedIn.
  ///
  /// In en, this message translates to:
  /// **'Done today'**
  String get goalsCheckedIn;

  /// No description provided for @goalsCheckedSnack.
  ///
  /// In en, this message translates to:
  /// **'Nice! Today is marked as done.'**
  String get goalsCheckedSnack;

  /// No description provided for @goalsUncheckedSnack.
  ///
  /// In en, this message translates to:
  /// **'Today is no longer marked as done.'**
  String get goalsUncheckedSnack;

  /// No description provided for @goalsCreateNew.
  ///
  /// In en, this message translates to:
  /// **'Create New Goal'**
  String get goalsCreateNew;

  /// No description provided for @goalsEmptyBadge.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get goalsEmptyBadge;

  /// No description provided for @goalsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No goals yet'**
  String get goalsEmptyTitle;

  /// No description provided for @goalsEmptyMsg.
  ///
  /// In en, this message translates to:
  /// **'Set a small daily goal and Pausey will track it for you.'**
  String get goalsEmptyMsg;

  /// No description provided for @goalsFilterEmpty.
  ///
  /// In en, this message translates to:
  /// **'No goals match this filter.'**
  String get goalsFilterEmpty;

  /// No description provided for @goalsNewGoal.
  ///
  /// In en, this message translates to:
  /// **'New goal'**
  String get goalsNewGoal;

  /// No description provided for @goalsEditGoal.
  ///
  /// In en, this message translates to:
  /// **'Edit goal'**
  String get goalsEditGoal;

  /// No description provided for @goalsType.
  ///
  /// In en, this message translates to:
  /// **'Goal type'**
  String get goalsType;

  /// No description provided for @goalsTypeFocus.
  ///
  /// In en, this message translates to:
  /// **'Focus time'**
  String get goalsTypeFocus;

  /// No description provided for @goalsTypeSessions.
  ///
  /// In en, this message translates to:
  /// **'Focus sessions'**
  String get goalsTypeSessions;

  /// No description provided for @goalsTypeBlock.
  ///
  /// In en, this message translates to:
  /// **'Block apps'**
  String get goalsTypeBlock;

  /// No description provided for @goalsTypePhoneFree.
  ///
  /// In en, this message translates to:
  /// **'Phone-free days'**
  String get goalsTypePhoneFree;

  /// No description provided for @goalsTypeScreen.
  ///
  /// In en, this message translates to:
  /// **'Screen-time limit'**
  String get goalsTypeScreen;

  /// No description provided for @goalsCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get goalsCategory;

  /// No description provided for @goalsTarget.
  ///
  /// In en, this message translates to:
  /// **'Target'**
  String get goalsTarget;

  /// No description provided for @goalsPerDay.
  ///
  /// In en, this message translates to:
  /// **'per day'**
  String get goalsPerDay;

  /// No description provided for @goalsPerWeek.
  ///
  /// In en, this message translates to:
  /// **'days per week'**
  String get goalsPerWeek;

  /// No description provided for @goalsMaxPerDay.
  ///
  /// In en, this message translates to:
  /// **'max per day'**
  String get goalsMaxPerDay;

  /// No description provided for @goalsTitleOptional.
  ///
  /// In en, this message translates to:
  /// **'Title (optional)'**
  String get goalsTitleOptional;

  /// No description provided for @goalsSave.
  ///
  /// In en, this message translates to:
  /// **'Save goal'**
  String get goalsSave;

  /// No description provided for @goalsCreate.
  ///
  /// In en, this message translates to:
  /// **'Create goal'**
  String get goalsCreate;

  /// No description provided for @goalsSavedSnack.
  ///
  /// In en, this message translates to:
  /// **'Goal saved'**
  String get goalsSavedSnack;

  /// No description provided for @goalsCreatedSnack.
  ///
  /// In en, this message translates to:
  /// **'Goal created'**
  String get goalsCreatedSnack;

  /// No description provided for @goalsEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get goalsEdit;

  /// No description provided for @goalsDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete goal'**
  String get goalsDelete;

  /// No description provided for @goalsDeleteQ.
  ///
  /// In en, this message translates to:
  /// **'Delete this goal?'**
  String get goalsDeleteQ;

  /// No description provided for @goalsDeleteMsg.
  ///
  /// In en, this message translates to:
  /// **'Its check-ins will be removed. This can\'t be undone.'**
  String get goalsDeleteMsg;

  /// No description provided for @goalsDeletedSnack.
  ///
  /// In en, this message translates to:
  /// **'Goal deleted'**
  String get goalsDeletedSnack;

  /// No description provided for @goalsComplete.
  ///
  /// In en, this message translates to:
  /// **'complete'**
  String get goalsComplete;

  /// No description provided for @goalsDaysActive.
  ///
  /// In en, this message translates to:
  /// **'Days Active'**
  String get goalsDaysActive;

  /// No description provided for @goalsTotalTime.
  ///
  /// In en, this message translates to:
  /// **'Total Time'**
  String get goalsTotalTime;

  /// No description provided for @goalsSessionsLabel.
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get goalsSessionsLabel;

  /// No description provided for @goals7Day.
  ///
  /// In en, this message translates to:
  /// **'7-Day Completion'**
  String get goals7Day;

  /// No description provided for @goals7DaysAgo.
  ///
  /// In en, this message translates to:
  /// **'7 days ago'**
  String get goals7DaysAgo;

  /// No description provided for @goalsToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get goalsToday;

  /// No description provided for @goalsTodayDate.
  ///
  /// In en, this message translates to:
  /// **'Today, {date}'**
  String goalsTodayDate(String date);

  /// No description provided for @goalsYesterdayDate.
  ///
  /// In en, this message translates to:
  /// **'Yesterday, {date}'**
  String goalsYesterdayDate(String date);

  /// No description provided for @goalsMilestones.
  ///
  /// In en, this message translates to:
  /// **'Milestones'**
  String get goalsMilestones;

  /// No description provided for @goalsMsFirst.
  ///
  /// In en, this message translates to:
  /// **'First day completed'**
  String get goalsMsFirst;

  /// No description provided for @goalsMs3.
  ///
  /// In en, this message translates to:
  /// **'3-day streak achieved'**
  String get goalsMs3;

  /// No description provided for @goalsMsHalf.
  ///
  /// In en, this message translates to:
  /// **'50% of weekly goal'**
  String get goalsMsHalf;

  /// No description provided for @goalsMs5.
  ///
  /// In en, this message translates to:
  /// **'5-day streak'**
  String get goalsMs5;

  /// No description provided for @goalsMsWeek.
  ///
  /// In en, this message translates to:
  /// **'Full week completed'**
  String get goalsMsWeek;

  /// No description provided for @goalsMsLocked.
  ///
  /// In en, this message translates to:
  /// **'Not yet'**
  String get goalsMsLocked;

  /// No description provided for @goalsHistory.
  ///
  /// In en, this message translates to:
  /// **'Activity History'**
  String get goalsHistory;

  /// No description provided for @goalsShowLess.
  ///
  /// In en, this message translates to:
  /// **'Show less'**
  String get goalsShowLess;

  /// No description provided for @goalsStartSession.
  ///
  /// In en, this message translates to:
  /// **'Start Focus Session'**
  String get goalsStartSession;

  /// No description provided for @goalsManageApps.
  ///
  /// In en, this message translates to:
  /// **'Manage Blocked Apps'**
  String get goalsManageApps;

  /// No description provided for @goalsBlockHint.
  ///
  /// In en, this message translates to:
  /// **'Counts automatically while your lock schedule is on and apps are locked.'**
  String get goalsBlockHint;

  /// No description provided for @goalsScreenToday.
  ///
  /// In en, this message translates to:
  /// **'Screen time today: {used}'**
  String goalsScreenToday(String used);

  /// No description provided for @goalsNotFound.
  ///
  /// In en, this message translates to:
  /// **'This goal no longer exists.'**
  String get goalsNotFound;

  /// No description provided for @goalsMore.
  ///
  /// In en, this message translates to:
  /// **'More options'**
  String get goalsMore;

  /// No description provided for @goalsFreeLimit.
  ///
  /// In en, this message translates to:
  /// **'Free plan: up to {n} goals'**
  String goalsFreeLimit(int n);

  /// No description provided for @homeGoodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get homeGoodMorning;

  /// No description provided for @homeGoodAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get homeGoodAfternoon;

  /// No description provided for @homeGoodEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get homeGoodEvening;

  /// No description provided for @homeFriend.
  ///
  /// In en, this message translates to:
  /// **'Friend'**
  String get homeFriend;

  /// No description provided for @homeTodayFocus.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Focus'**
  String get homeTodayFocus;

  /// No description provided for @homeVsYesterday.
  ///
  /// In en, this message translates to:
  /// **'{pct}% vs yesterday'**
  String homeVsYesterday(String pct);

  /// No description provided for @homeStartToday.
  ///
  /// In en, this message translates to:
  /// **'No focus yet today'**
  String get homeStartToday;

  /// No description provided for @homeDayStreak.
  ///
  /// In en, this message translates to:
  /// **'Day Streak'**
  String get homeDayStreak;

  /// No description provided for @homeTodayGoal.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Goal'**
  String get homeTodayGoal;

  /// No description provided for @homePctCompleted.
  ///
  /// In en, this message translates to:
  /// **'{pct}% completed'**
  String homePctCompleted(int pct);

  /// No description provided for @homeOnTrack.
  ///
  /// In en, this message translates to:
  /// **'On track!'**
  String get homeOnTrack;

  /// No description provided for @homeKeepGoing.
  ///
  /// In en, this message translates to:
  /// **'Keep going'**
  String get homeKeepGoing;

  /// No description provided for @homeGoalMet.
  ///
  /// In en, this message translates to:
  /// **'Goal met!'**
  String get homeGoalMet;

  /// No description provided for @homeScreenTimeTitle.
  ///
  /// In en, this message translates to:
  /// **'Screen Time'**
  String get homeScreenTimeTitle;

  /// No description provided for @homeToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get homeToday;

  /// No description provided for @homeVsAvg.
  ///
  /// In en, this message translates to:
  /// **'{pct}% vs avg'**
  String homeVsAvg(String pct);

  /// No description provided for @homeQuickStart.
  ///
  /// In en, this message translates to:
  /// **'Quick Start Focus Session'**
  String get homeQuickStart;

  /// No description provided for @homeManage.
  ///
  /// In en, this message translates to:
  /// **'Manage'**
  String get homeManage;

  /// No description provided for @homeNoApps.
  ///
  /// In en, this message translates to:
  /// **'Pick the apps that distract you most and lock them here.'**
  String get homeNoApps;

  /// No description provided for @homeAddApps.
  ///
  /// In en, this message translates to:
  /// **'Add apps'**
  String get homeAddApps;

  /// No description provided for @homeAppLocked.
  ///
  /// In en, this message translates to:
  /// **'{app} locked'**
  String homeAppLocked(String app);

  /// No description provided for @homeAppUnlocked.
  ///
  /// In en, this message translates to:
  /// **'{app} unlocked'**
  String homeAppUnlocked(String app);

  /// No description provided for @homeLockApp.
  ///
  /// In en, this message translates to:
  /// **'Lock or unlock {app}'**
  String homeLockApp(String app);

  /// No description provided for @homeUpgradeTitle.
  ///
  /// In en, this message translates to:
  /// **'Upgrade to Premium'**
  String get homeUpgradeTitle;

  /// No description provided for @homeUpgradeBody.
  ///
  /// In en, this message translates to:
  /// **'Unlimited blocks, goals & deep analytics.'**
  String get homeUpgradeBody;

  /// No description provided for @homeTryFree.
  ///
  /// In en, this message translates to:
  /// **'Try Free'**
  String get homeTryFree;

  /// No description provided for @homePro.
  ///
  /// In en, this message translates to:
  /// **'PRO'**
  String get homePro;

  /// No description provided for @homeProActive.
  ///
  /// In en, this message translates to:
  /// **'Pausey Pro is active'**
  String get homeProActive;

  /// No description provided for @homeProActiveBody.
  ///
  /// In en, this message translates to:
  /// **'All features unlocked. Thanks for your support!'**
  String get homeProActiveBody;

  /// No description provided for @homeNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get homeNotifications;

  /// No description provided for @homeNoNotifications.
  ///
  /// In en, this message translates to:
  /// **'You\'re all caught up.'**
  String get homeNoNotifications;

  /// No description provided for @homePushLabel.
  ///
  /// In en, this message translates to:
  /// **'Push notifications'**
  String get homePushLabel;

  /// No description provided for @homeFocusReminder.
  ///
  /// In en, this message translates to:
  /// **'Daily focus reminder'**
  String get homeFocusReminder;

  /// No description provided for @homeStreakAlerts.
  ///
  /// In en, this message translates to:
  /// **'Streak alerts'**
  String get homeStreakAlerts;

  /// No description provided for @homePwTitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock Pausey Pro'**
  String get homePwTitle;

  /// No description provided for @homePwSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Reclaim your focus and beat phone addiction.'**
  String get homePwSubtitle;

  /// No description provided for @homePwMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get homePwMonthly;

  /// No description provided for @homePwBilledMonthly.
  ///
  /// In en, this message translates to:
  /// **'Billed monthly'**
  String get homePwBilledMonthly;

  /// No description provided for @homePwYearly.
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get homePwYearly;

  /// No description provided for @homePwPopular.
  ///
  /// In en, this message translates to:
  /// **'Most Popular'**
  String get homePwPopular;

  /// No description provided for @homePwSave.
  ///
  /// In en, this message translates to:
  /// **'Save {pct}%'**
  String homePwSave(int pct);

  /// No description provided for @homePwBilledYearly.
  ///
  /// In en, this message translates to:
  /// **'{price} billed annually'**
  String homePwBilledYearly(String price);

  /// No description provided for @homePwLifetime.
  ///
  /// In en, this message translates to:
  /// **'Lifetime'**
  String get homePwLifetime;

  /// No description provided for @homePwBestValue.
  ///
  /// In en, this message translates to:
  /// **'Best Value'**
  String get homePwBestValue;

  /// No description provided for @homePwPayOnce.
  ///
  /// In en, this message translates to:
  /// **'Pay once, own forever'**
  String get homePwPayOnce;

  /// No description provided for @homePwPerMonth.
  ///
  /// In en, this message translates to:
  /// **'/ month'**
  String get homePwPerMonth;

  /// No description provided for @homePwOnce.
  ///
  /// In en, this message translates to:
  /// **'once'**
  String get homePwOnce;

  /// No description provided for @homePwStartTrial.
  ///
  /// In en, this message translates to:
  /// **'Start 7-Day Free Trial'**
  String get homePwStartTrial;

  /// No description provided for @homePwBuyLifetime.
  ///
  /// In en, this message translates to:
  /// **'Get Lifetime Access'**
  String get homePwBuyLifetime;

  /// No description provided for @homePwNoCharge.
  ///
  /// In en, this message translates to:
  /// **'No charge today · Cancel anytime'**
  String get homePwNoCharge;

  /// No description provided for @homePwOneTime.
  ///
  /// In en, this message translates to:
  /// **'One-time payment · No subscription'**
  String get homePwOneTime;

  /// No description provided for @homePwFree.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get homePwFree;

  /// No description provided for @homePwProCol.
  ///
  /// In en, this message translates to:
  /// **'Pro'**
  String get homePwProCol;

  /// No description provided for @homePwFeatBlocking.
  ///
  /// In en, this message translates to:
  /// **'Unlimited App Blocking'**
  String get homePwFeatBlocking;

  /// No description provided for @homePwFeatSessions.
  ///
  /// In en, this message translates to:
  /// **'All Focus Modes'**
  String get homePwFeatSessions;

  /// No description provided for @homePwFeatGoals.
  ///
  /// In en, this message translates to:
  /// **'Unlimited Goals'**
  String get homePwFeatGoals;

  /// No description provided for @homePwFeatAnalytics.
  ///
  /// In en, this message translates to:
  /// **'Advanced Analytics'**
  String get homePwFeatAnalytics;

  /// No description provided for @homePwFeatStreak.
  ///
  /// In en, this message translates to:
  /// **'Streak Protection'**
  String get homePwFeatStreak;

  /// No description provided for @homePwFeatSchedule.
  ///
  /// In en, this message translates to:
  /// **'Focus Scheduling'**
  String get homePwFeatSchedule;

  /// No description provided for @homePwFeatFaceId.
  ///
  /// In en, this message translates to:
  /// **'Face ID App Lock'**
  String get homePwFeatFaceId;

  /// No description provided for @homePwFeatNotif.
  ///
  /// In en, this message translates to:
  /// **'Smart Notifications'**
  String get homePwFeatNotif;

  /// No description provided for @homePwMax.
  ///
  /// In en, this message translates to:
  /// **'{n} max'**
  String homePwMax(int n);

  /// No description provided for @homePwSecure.
  ///
  /// In en, this message translates to:
  /// **'Secure Payment'**
  String get homePwSecure;

  /// No description provided for @homePwCancelAnytime.
  ///
  /// In en, this message translates to:
  /// **'Cancel Anytime'**
  String get homePwCancelAnytime;

  /// No description provided for @homePwPrivacyFirst.
  ///
  /// In en, this message translates to:
  /// **'Privacy First'**
  String get homePwPrivacyFirst;

  /// No description provided for @homePwRestore.
  ///
  /// In en, this message translates to:
  /// **'Restore Purchases'**
  String get homePwRestore;

  /// No description provided for @homePwTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get homePwTerms;

  /// No description provided for @homePwPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get homePwPrivacyPolicy;

  /// No description provided for @homePwWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Pausey Pro!'**
  String get homePwWelcome;

  /// No description provided for @homePwNothingToRestore.
  ///
  /// In en, this message translates to:
  /// **'No previous purchases found.'**
  String get homePwNothingToRestore;

  /// No description provided for @homePwRestored.
  ///
  /// In en, this message translates to:
  /// **'Your Pro access is active.'**
  String get homePwRestored;

  /// No description provided for @homePwLinkSoon.
  ///
  /// In en, this message translates to:
  /// **'This page will open on our website soon.'**
  String get homePwLinkSoon;

  /// No description provided for @homePwYouArePro.
  ///
  /// In en, this message translates to:
  /// **'You\'re Pro — enjoy!'**
  String get homePwYouArePro;

  /// No description provided for @homePwClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get homePwClose;

  /// No description provided for @homeAvgLegend.
  ///
  /// In en, this message translates to:
  /// **'7-day average'**
  String get homeAvgLegend;

  /// No description provided for @homeGoalOf.
  ///
  /// In en, this message translates to:
  /// **'{done} of {goal}'**
  String homeGoalOf(String done, String goal);

  /// No description provided for @homeBest.
  ///
  /// In en, this message translates to:
  /// **'Best:'**
  String get homeBest;

  /// No description provided for @insightsAnalytics.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get insightsAnalytics;

  /// No description provided for @insightsScreenTime.
  ///
  /// In en, this message translates to:
  /// **'Screen Time'**
  String get insightsScreenTime;

  /// No description provided for @insightsToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get insightsToday;

  /// No description provided for @insightsWeek.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get insightsWeek;

  /// No description provided for @insightsMonth.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get insightsMonth;

  /// No description provided for @insightsProductivity.
  ///
  /// In en, this message translates to:
  /// **'Productivity score'**
  String get insightsProductivity;

  /// No description provided for @insightsPts.
  ///
  /// In en, this message translates to:
  /// **'{delta} pts'**
  String insightsPts(String delta);

  /// No description provided for @insightsVsLastWeek.
  ///
  /// In en, this message translates to:
  /// **'vs last week'**
  String get insightsVsLastWeek;

  /// No description provided for @insightsVsLastMonth.
  ///
  /// In en, this message translates to:
  /// **'vs last month'**
  String get insightsVsLastMonth;

  /// No description provided for @insightsScoreDays.
  ///
  /// In en, this message translates to:
  /// **'{n}-day score'**
  String insightsScoreDays(int n);

  /// No description provided for @insightsFocusHours.
  ///
  /// In en, this message translates to:
  /// **'Focus hours'**
  String get insightsFocusHours;

  /// No description provided for @insightsThisWeek.
  ///
  /// In en, this message translates to:
  /// **'this week'**
  String get insightsThisWeek;

  /// No description provided for @insightsThisMonth.
  ///
  /// In en, this message translates to:
  /// **'this month'**
  String get insightsThisMonth;

  /// No description provided for @insightsGoalOf.
  ///
  /// In en, this message translates to:
  /// **'{done} / {goal} goal'**
  String insightsGoalOf(String done, String goal);

  /// No description provided for @insightsFocusScore.
  ///
  /// In en, this message translates to:
  /// **'Focus score'**
  String get insightsFocusScore;

  /// No description provided for @insightsGoals.
  ///
  /// In en, this message translates to:
  /// **'Goals'**
  String get insightsGoals;

  /// No description provided for @insightsConsistency.
  ///
  /// In en, this message translates to:
  /// **'Consistency'**
  String get insightsConsistency;

  /// No description provided for @insightsWeeklyFocus.
  ///
  /// In en, this message translates to:
  /// **'Weekly focus hours'**
  String get insightsWeeklyFocus;

  /// No description provided for @insightsDailyFocus.
  ///
  /// In en, this message translates to:
  /// **'Daily focus, last {n} days'**
  String insightsDailyFocus(int n);

  /// No description provided for @insightsBestDay.
  ///
  /// In en, this message translates to:
  /// **'Best day: {day} · {time}'**
  String insightsBestDay(String day, String time);

  /// No description provided for @insightsAvgDay.
  ///
  /// In en, this message translates to:
  /// **'Avg {time} / day'**
  String insightsAvgDay(String time);

  /// No description provided for @insightsMonthlyTrends.
  ///
  /// In en, this message translates to:
  /// **'Monthly trends'**
  String get insightsMonthlyTrends;

  /// No description provided for @insightsActual.
  ///
  /// In en, this message translates to:
  /// **'Actual'**
  String get insightsActual;

  /// No description provided for @insightsGoal.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get insightsGoal;

  /// No description provided for @insightsWk.
  ///
  /// In en, this message translates to:
  /// **'Wk {n}'**
  String insightsWk(int n);

  /// No description provided for @insightsWeekBeat.
  ///
  /// In en, this message translates to:
  /// **'Week {n} beat the goal by {time}'**
  String insightsWeekBeat(int n, String time);

  /// No description provided for @insightsWeekShort.
  ///
  /// In en, this message translates to:
  /// **'Best was week {n}, {time} short of the goal'**
  String insightsWeekShort(int n, String time);

  /// No description provided for @insightsGoalCompletion.
  ///
  /// In en, this message translates to:
  /// **'Goal completion'**
  String get insightsGoalCompletion;

  /// No description provided for @insightsDaysOf.
  ///
  /// In en, this message translates to:
  /// **'{done}/{total} days'**
  String insightsDaysOf(int done, int total);

  /// No description provided for @insightsNoGoals.
  ///
  /// In en, this message translates to:
  /// **'No goals yet. Add one to see your progress here.'**
  String get insightsNoGoals;

  /// No description provided for @insightsManageGoals.
  ///
  /// In en, this message translates to:
  /// **'Manage'**
  String get insightsManageGoals;

  /// No description provided for @insightsGoalFocus.
  ///
  /// In en, this message translates to:
  /// **'Daily focus: {hours} hours'**
  String insightsGoalFocus(String hours);

  /// No description provided for @insightsGoalBlock.
  ///
  /// In en, this message translates to:
  /// **'Block social apps'**
  String get insightsGoalBlock;

  /// No description provided for @insightsGoalPomo.
  ///
  /// In en, this message translates to:
  /// **'{n} Pomodoros per day'**
  String insightsGoalPomo(int n);

  /// No description provided for @insightsGoalScreen.
  ///
  /// In en, this message translates to:
  /// **'Under {time} screen time'**
  String insightsGoalScreen(String time);

  /// No description provided for @insightsGoalPhoneFree.
  ///
  /// In en, this message translates to:
  /// **'Phone-free time'**
  String get insightsGoalPhoneFree;

  /// No description provided for @insightsEmptyBadge.
  ///
  /// In en, this message translates to:
  /// **'No sessions yet'**
  String get insightsEmptyBadge;

  /// No description provided for @insightsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your insights start with one session'**
  String get insightsEmptyTitle;

  /// No description provided for @insightsEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Finish a focus session and your scores, charts and goal progress will show up here.'**
  String get insightsEmptyBody;

  /// No description provided for @insightsEmptyCta.
  ///
  /// In en, this message translates to:
  /// **'Start a focus session'**
  String get insightsEmptyCta;

  /// No description provided for @insightsDailyUsage.
  ///
  /// In en, this message translates to:
  /// **'Daily usage'**
  String get insightsDailyUsage;

  /// No description provided for @insightsFocusTime.
  ///
  /// In en, this message translates to:
  /// **'Focus time'**
  String get insightsFocusTime;

  /// No description provided for @insightsVsAvg.
  ///
  /// In en, this message translates to:
  /// **'vs avg'**
  String get insightsVsAvg;

  /// No description provided for @insightsUsageByDay.
  ///
  /// In en, this message translates to:
  /// **'Usage by day'**
  String get insightsUsageByDay;

  /// No description provided for @insightsUsageByWeek.
  ///
  /// In en, this message translates to:
  /// **'Usage by week'**
  String get insightsUsageByWeek;

  /// No description provided for @insightsUsage.
  ///
  /// In en, this message translates to:
  /// **'Usage'**
  String get insightsUsage;

  /// No description provided for @insightsTrend.
  ///
  /// In en, this message translates to:
  /// **'{n}-day trend'**
  String insightsTrend(int n);

  /// No description provided for @insightsImproving.
  ///
  /// In en, this message translates to:
  /// **'Improving'**
  String get insightsImproving;

  /// No description provided for @insightsRising.
  ///
  /// In en, this message translates to:
  /// **'Rising'**
  String get insightsRising;

  /// No description provided for @insightsDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'{n} days ago'**
  String insightsDaysAgo(int n);

  /// No description provided for @insightsMostUsed.
  ///
  /// In en, this message translates to:
  /// **'Most used apps'**
  String get insightsMostUsed;

  /// No description provided for @insightsAllApps.
  ///
  /// In en, this message translates to:
  /// **'All apps'**
  String get insightsAllApps;

  /// No description provided for @insightsBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Usage breakdown'**
  String get insightsBreakdown;

  /// No description provided for @insightsTotal.
  ///
  /// In en, this message translates to:
  /// **'total'**
  String get insightsTotal;

  /// No description provided for @insightsNoUsage.
  ///
  /// In en, this message translates to:
  /// **'No screen time recorded for this period.'**
  String get insightsNoUsage;

  /// No description provided for @insightsLockApp.
  ///
  /// In en, this message translates to:
  /// **'Lock this app'**
  String get insightsLockApp;

  /// No description provided for @insightsLocked.
  ///
  /// In en, this message translates to:
  /// **'{app} is now locked'**
  String insightsLocked(String app);

  /// No description provided for @insightsCatSocial.
  ///
  /// In en, this message translates to:
  /// **'Social'**
  String get insightsCatSocial;

  /// No description provided for @insightsCatVideo.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get insightsCatVideo;

  /// No description provided for @insightsCatGames.
  ///
  /// In en, this message translates to:
  /// **'Games'**
  String get insightsCatGames;

  /// No description provided for @insightsCatShopping.
  ///
  /// In en, this message translates to:
  /// **'Shopping'**
  String get insightsCatShopping;

  /// No description provided for @insightsCatCommunity.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get insightsCatCommunity;

  /// No description provided for @insightsCatOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get insightsCatOther;

  /// No description provided for @nativeBlockTitle.
  ///
  /// In en, this message translates to:
  /// **'{app} is paused'**
  String nativeBlockTitle(String app);

  /// No description provided for @nativeReasonLimit.
  ///
  /// In en, this message translates to:
  /// **'You\'ve used today\'s time for this app.'**
  String get nativeReasonLimit;

  /// No description provided for @nativeReasonSchedule.
  ///
  /// In en, this message translates to:
  /// **'A lock schedule is active right now.'**
  String get nativeReasonSchedule;

  /// No description provided for @nativeReasonGlobal.
  ///
  /// In en, this message translates to:
  /// **'This app is locked in Pausey.'**
  String get nativeReasonGlobal;

  /// No description provided for @nativeReasonFocus.
  ///
  /// In en, this message translates to:
  /// **'You\'re in a focus session.'**
  String get nativeReasonFocus;

  /// No description provided for @nativeClose.
  ///
  /// In en, this message translates to:
  /// **'Close app'**
  String get nativeClose;

  /// No description provided for @nativeNotifTitle.
  ///
  /// In en, this message translates to:
  /// **'Pausey is keeping your limits'**
  String get nativeNotifTitle;

  /// No description provided for @nativeNotifText.
  ///
  /// In en, this message translates to:
  /// **'App limits and lock schedules are on'**
  String get nativeNotifText;

  /// No description provided for @profileSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get profileSettings;

  /// No description provided for @profileGuestName.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get profileGuestName;

  /// No description provided for @profileGuestBadge.
  ///
  /// In en, this message translates to:
  /// **'Guest · saved on this phone'**
  String get profileGuestBadge;

  /// No description provided for @profileEditName.
  ///
  /// In en, this message translates to:
  /// **'Edit name'**
  String get profileEditName;

  /// No description provided for @profileNameHint.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get profileNameHint;

  /// No description provided for @profileSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get profileSave;

  /// No description provided for @profileMemberSince.
  ///
  /// In en, this message translates to:
  /// **'Member since {date}'**
  String profileMemberSince(String date);

  /// No description provided for @profileProActive.
  ///
  /// In en, this message translates to:
  /// **'Pro · Active'**
  String get profileProActive;

  /// No description provided for @profileFree.
  ///
  /// In en, this message translates to:
  /// **'Free plan'**
  String get profileFree;

  /// No description provided for @profileUpgrade.
  ///
  /// In en, this message translates to:
  /// **'Upgrade'**
  String get profileUpgrade;

  /// No description provided for @profileBadges.
  ///
  /// In en, this message translates to:
  /// **'Badges'**
  String get profileBadges;

  /// No description provided for @profileNoBadges.
  ///
  /// In en, this message translates to:
  /// **'Finish focus sessions to earn badges'**
  String get profileNoBadges;

  /// No description provided for @profileFocusTime.
  ///
  /// In en, this message translates to:
  /// **'Focus time'**
  String get profileFocusTime;

  /// No description provided for @profileGoalsDone.
  ///
  /// In en, this message translates to:
  /// **'Goals done'**
  String get profileGoalsDone;

  /// No description provided for @profileDayStreak.
  ///
  /// In en, this message translates to:
  /// **'Day streak'**
  String get profileDayStreak;

  /// No description provided for @profileAppsBlocked.
  ///
  /// In en, this message translates to:
  /// **'Apps blocked'**
  String get profileAppsBlocked;

  /// No description provided for @profileFocusActivity.
  ///
  /// In en, this message translates to:
  /// **'Focus Activity'**
  String get profileFocusActivity;

  /// No description provided for @profileLast4Weeks.
  ///
  /// In en, this message translates to:
  /// **'Last 4 weeks'**
  String get profileLast4Weeks;

  /// No description provided for @profileRecentActivity.
  ///
  /// In en, this message translates to:
  /// **'Recent Activity'**
  String get profileRecentActivity;

  /// No description provided for @profileSessionDone.
  ///
  /// In en, this message translates to:
  /// **'Focus session completed'**
  String get profileSessionDone;

  /// No description provided for @profileSessionStopped.
  ///
  /// In en, this message translates to:
  /// **'Session ended early'**
  String get profileSessionStopped;

  /// No description provided for @profileModePomodoro.
  ///
  /// In en, this message translates to:
  /// **'Pomodoro'**
  String get profileModePomodoro;

  /// No description provided for @profileModeDeep.
  ///
  /// In en, this message translates to:
  /// **'Deep work'**
  String get profileModeDeep;

  /// No description provided for @profileModeCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get profileModeCustom;

  /// No description provided for @profileJustNow.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get profileJustNow;

  /// No description provided for @profileAgoMinutes.
  ///
  /// In en, this message translates to:
  /// **'{n}m ago'**
  String profileAgoMinutes(int n);

  /// No description provided for @profileAgoHours.
  ///
  /// In en, this message translates to:
  /// **'{n}h ago'**
  String profileAgoHours(int n);

  /// No description provided for @profileYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get profileYesterday;

  /// No description provided for @profileEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No focus sessions yet'**
  String get profileEmptyTitle;

  /// No description provided for @profileEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Start your first session — your activity, streak and badges will show up here.'**
  String get profileEmptyBody;

  /// No description provided for @profileStartFocus.
  ///
  /// In en, this message translates to:
  /// **'Start focusing'**
  String get profileStartFocus;

  /// No description provided for @profileMyGoals.
  ///
  /// In en, this message translates to:
  /// **'My Goals'**
  String get profileMyGoals;

  /// No description provided for @profileStreaks.
  ///
  /// In en, this message translates to:
  /// **'Streaks & badges'**
  String get profileStreaks;

  /// No description provided for @profileSubscription.
  ///
  /// In en, this message translates to:
  /// **'Subscription'**
  String get profileSubscription;

  /// No description provided for @profileSignOutTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign out?'**
  String get profileSignOutTitle;

  /// No description provided for @profileSignOutBody.
  ///
  /// In en, this message translates to:
  /// **'You can log back in any time.'**
  String get profileSignOutBody;

  /// No description provided for @profileSecNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get profileSecNotifications;

  /// No description provided for @profileSecAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get profileSecAppearance;

  /// No description provided for @profileSecFocus.
  ///
  /// In en, this message translates to:
  /// **'Focus & Blocking'**
  String get profileSecFocus;

  /// No description provided for @profileSecPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy & Security'**
  String get profileSecPrivacy;

  /// No description provided for @profileSecAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get profileSecAccount;

  /// No description provided for @profilePush.
  ///
  /// In en, this message translates to:
  /// **'Push notifications'**
  String get profilePush;

  /// No description provided for @profilePushSub.
  ///
  /// In en, this message translates to:
  /// **'Focus reminders & alerts'**
  String get profilePushSub;

  /// No description provided for @profileReminder.
  ///
  /// In en, this message translates to:
  /// **'Focus start reminder'**
  String get profileReminder;

  /// No description provided for @profileReminderSub.
  ///
  /// In en, this message translates to:
  /// **'Daily at {time}'**
  String profileReminderSub(String time);

  /// No description provided for @profileStreakAlerts.
  ///
  /// In en, this message translates to:
  /// **'Streak alerts'**
  String get profileStreakAlerts;

  /// No description provided for @profileStreakAlertsSub.
  ///
  /// In en, this message translates to:
  /// **'Before your streak breaks'**
  String get profileStreakAlertsSub;

  /// No description provided for @profileGoalMilestones.
  ///
  /// In en, this message translates to:
  /// **'Goal milestones'**
  String get profileGoalMilestones;

  /// No description provided for @profileGoalMilestonesSub.
  ///
  /// In en, this message translates to:
  /// **'When you reach a goal'**
  String get profileGoalMilestonesSub;

  /// No description provided for @profileDarkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get profileDarkMode;

  /// No description provided for @profileOn.
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get profileOn;

  /// No description provided for @profileOff.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get profileOff;

  /// No description provided for @profileTextSize.
  ///
  /// In en, this message translates to:
  /// **'Text size'**
  String get profileTextSize;

  /// No description provided for @profileTextSmall.
  ///
  /// In en, this message translates to:
  /// **'Small'**
  String get profileTextSmall;

  /// No description provided for @profileTextMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get profileTextMedium;

  /// No description provided for @profileTextLarge.
  ///
  /// In en, this message translates to:
  /// **'Large'**
  String get profileTextLarge;

  /// No description provided for @profileTextHuge.
  ///
  /// In en, this message translates to:
  /// **'Extra large'**
  String get profileTextHuge;

  /// No description provided for @profilePomodoroLen.
  ///
  /// In en, this message translates to:
  /// **'Pomodoro length'**
  String get profilePomodoroLen;

  /// No description provided for @profileBreakLen.
  ///
  /// In en, this message translates to:
  /// **'Break length'**
  String get profileBreakLen;

  /// No description provided for @profileMinutes.
  ///
  /// In en, this message translates to:
  /// **'{n} min'**
  String profileMinutes(int n);

  /// No description provided for @profileFaceIdUnlock.
  ///
  /// In en, this message translates to:
  /// **'Face ID for unlocks'**
  String get profileFaceIdUnlock;

  /// No description provided for @profileFaceIdUnlockSub.
  ///
  /// In en, this message translates to:
  /// **'Confirm before unlocking an app'**
  String get profileFaceIdUnlockSub;

  /// No description provided for @profileBypass.
  ///
  /// In en, this message translates to:
  /// **'Emergency bypass'**
  String get profileBypass;

  /// No description provided for @profileBypassSub.
  ///
  /// In en, this message translates to:
  /// **'{n, plural, =1{1 unlock per day} other{{n} unlocks per day}}'**
  String profileBypassSub(int n);

  /// No description provided for @profileAppLock.
  ///
  /// In en, this message translates to:
  /// **'Lock Pausey with Face ID'**
  String get profileAppLock;

  /// No description provided for @profileAppLockSub.
  ///
  /// In en, this message translates to:
  /// **'Ask when opening the app'**
  String get profileAppLockSub;

  /// No description provided for @profileHideUsage.
  ///
  /// In en, this message translates to:
  /// **'Hide usage data'**
  String get profileHideUsage;

  /// No description provided for @profileHideUsageSub.
  ///
  /// In en, this message translates to:
  /// **'Hide screen-time numbers'**
  String get profileHideUsageSub;

  /// No description provided for @profileClearData.
  ///
  /// In en, this message translates to:
  /// **'Clear activity data'**
  String get profileClearData;

  /// No description provided for @profileClearDataSub.
  ///
  /// In en, this message translates to:
  /// **'Removes sessions and goal history'**
  String get profileClearDataSub;

  /// No description provided for @profileClearTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear activity data?'**
  String get profileClearTitle;

  /// No description provided for @profileClearBody.
  ///
  /// In en, this message translates to:
  /// **'This deletes all focus sessions and goal check-ins on this phone. It can\'t be undone.'**
  String get profileClearBody;

  /// No description provided for @profileClear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get profileClear;

  /// No description provided for @profileCleared.
  ///
  /// In en, this message translates to:
  /// **'Activity data cleared'**
  String get profileCleared;

  /// No description provided for @profileExport.
  ///
  /// In en, this message translates to:
  /// **'Export my data'**
  String get profileExport;

  /// No description provided for @profileExportSub.
  ///
  /// In en, this message translates to:
  /// **'Copy as JSON'**
  String get profileExportSub;

  /// No description provided for @profileExported.
  ///
  /// In en, this message translates to:
  /// **'Your data was copied to the clipboard'**
  String get profileExported;

  /// No description provided for @profileStreaksTitle.
  ///
  /// In en, this message translates to:
  /// **'Streaks'**
  String get profileStreaksTitle;

  /// No description provided for @profileShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get profileShare;

  /// No description provided for @profileShareText.
  ///
  /// In en, this message translates to:
  /// **'I\'m on a {n}-day focus streak with Pausey!'**
  String profileShareText(int n);

  /// No description provided for @profileCopied.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get profileCopied;

  /// No description provided for @profileNextMilestone.
  ///
  /// In en, this message translates to:
  /// **'Keep it going – {n, plural, =1{1 day} other{{n} days}} to your next milestone!'**
  String profileNextMilestone(int n);

  /// No description provided for @profileAllMilestones.
  ///
  /// In en, this message translates to:
  /// **'Every milestone reached. Legendary!'**
  String get profileAllMilestones;

  /// No description provided for @profileStartStreak.
  ///
  /// In en, this message translates to:
  /// **'Finish a focus session today to start a streak.'**
  String get profileStartStreak;

  /// No description provided for @profileBest.
  ///
  /// In en, this message translates to:
  /// **'Best'**
  String get profileBest;

  /// No description provided for @profileThisWeek.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get profileThisWeek;

  /// No description provided for @profileDaysCompleted.
  ///
  /// In en, this message translates to:
  /// **'{n}/7 days completed'**
  String profileDaysCompleted(int n);

  /// No description provided for @profileCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get profileCompleted;

  /// No description provided for @profilePartial.
  ///
  /// In en, this message translates to:
  /// **'Partial'**
  String get profilePartial;

  /// No description provided for @profileMissed.
  ///
  /// In en, this message translates to:
  /// **'Missed'**
  String get profileMissed;

  /// No description provided for @profilePrevMonth.
  ///
  /// In en, this message translates to:
  /// **'Previous month'**
  String get profilePrevMonth;

  /// No description provided for @profileNextMonth.
  ///
  /// In en, this message translates to:
  /// **'Next month'**
  String get profileNextMonth;

  /// No description provided for @profileMilestones.
  ///
  /// In en, this message translates to:
  /// **'Streak Milestones'**
  String get profileMilestones;

  /// No description provided for @profileAchievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get profileAchievements;

  /// No description provided for @profileAchOnFire.
  ///
  /// In en, this message translates to:
  /// **'On Fire'**
  String get profileAchOnFire;

  /// No description provided for @profileAchIronWill.
  ///
  /// In en, this message translates to:
  /// **'Iron Will'**
  String get profileAchIronWill;

  /// No description provided for @profileAchFocusMaster.
  ///
  /// In en, this message translates to:
  /// **'Focus Master'**
  String get profileAchFocusMaster;

  /// No description provided for @profileAchMonk.
  ///
  /// In en, this message translates to:
  /// **'Digital Monk'**
  String get profileAchMonk;

  /// No description provided for @profileAchLegend.
  ///
  /// In en, this message translates to:
  /// **'Legendary'**
  String get profileAchLegend;

  /// No description provided for @profileAchSpeed.
  ///
  /// In en, this message translates to:
  /// **'Speed Demon'**
  String get profileAchSpeed;

  /// No description provided for @profileAchStreakDesc.
  ///
  /// In en, this message translates to:
  /// **'{n}-day streak'**
  String profileAchStreakDesc(int n);

  /// No description provided for @profileAchSessionsDesc.
  ///
  /// In en, this message translates to:
  /// **'{n} sessions completed'**
  String profileAchSessionsDesc(int n);

  /// No description provided for @profileAchHoursDesc.
  ///
  /// In en, this message translates to:
  /// **'{n}h total focus'**
  String profileAchHoursDesc(int n);

  /// No description provided for @profileAchDayDesc.
  ///
  /// In en, this message translates to:
  /// **'{n} sessions in a day'**
  String profileAchDayDesc(int n);

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navBlock.
  ///
  /// In en, this message translates to:
  /// **'Block'**
  String get navBlock;

  /// No description provided for @navFocus.
  ///
  /// In en, this message translates to:
  /// **'Focus'**
  String get navFocus;

  /// No description provided for @navInsights.
  ///
  /// In en, this message translates to:
  /// **'Insights'**
  String get navInsights;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @unitH.
  ///
  /// In en, this message translates to:
  /// **'h'**
  String get unitH;

  /// No description provided for @unitM.
  ///
  /// In en, this message translates to:
  /// **'m'**
  String get unitM;

  /// No description provided for @sampleData.
  ///
  /// In en, this message translates to:
  /// **'Sample data'**
  String get sampleData;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 day} other{{count} days}}'**
  String days(int count);

  /// No description provided for @statesTitle.
  ///
  /// In en, this message translates to:
  /// **'States'**
  String get statesTitle;

  /// No description provided for @statesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Friendly error, empty & loading screens'**
  String get statesSubtitle;

  /// No description provided for @statesNoInternet.
  ///
  /// In en, this message translates to:
  /// **'No internet'**
  String get statesNoInternet;

  /// No description provided for @statesConnectionLost.
  ///
  /// In en, this message translates to:
  /// **'Connection lost'**
  String get statesConnectionLost;

  /// No description provided for @statesOfflineTitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re offline'**
  String get statesOfflineTitle;

  /// No description provided for @statesOfflineMsg.
  ///
  /// In en, this message translates to:
  /// **'Pausey can\'t reach the server right now. Check your Wi-Fi or mobile data and try again – your local data is safe.'**
  String get statesOfflineMsg;

  /// No description provided for @statesTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get statesTryAgain;

  /// No description provided for @statesOpenSettings.
  ///
  /// In en, this message translates to:
  /// **'Open settings'**
  String get statesOpenSettings;

  /// No description provided for @statesOfflineMode.
  ///
  /// In en, this message translates to:
  /// **'Offline mode active'**
  String get statesOfflineMode;

  /// No description provided for @statesLimited.
  ///
  /// In en, this message translates to:
  /// **'Limited'**
  String get statesLimited;

  /// No description provided for @statesAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get statesAvailable;

  /// No description provided for @statesUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Unavailable'**
  String get statesUnavailable;

  /// No description provided for @statesCapSessions.
  ///
  /// In en, this message translates to:
  /// **'View previous sessions'**
  String get statesCapSessions;

  /// No description provided for @statesCapApps.
  ///
  /// In en, this message translates to:
  /// **'Access locked app list'**
  String get statesCapApps;

  /// No description provided for @statesCapTimer.
  ///
  /// In en, this message translates to:
  /// **'Run local focus timer'**
  String get statesCapTimer;

  /// No description provided for @statesCapSync.
  ///
  /// In en, this message translates to:
  /// **'Sync streak & goals'**
  String get statesCapSync;

  /// No description provided for @statesCapAnalytics.
  ///
  /// In en, this message translates to:
  /// **'Refresh analytics data'**
  String get statesCapAnalytics;

  /// No description provided for @statesOfflineNote.
  ///
  /// In en, this message translates to:
  /// **'All your focus data is stored locally. Nothing is lost when you\'re offline.'**
  String get statesOfflineNote;

  /// No description provided for @statesBackOnline.
  ///
  /// In en, this message translates to:
  /// **'Back online – everything is synced'**
  String get statesBackOnline;

  /// No description provided for @statesShowAgain.
  ///
  /// In en, this message translates to:
  /// **'Show state again'**
  String get statesShowAgain;

  /// No description provided for @statesPermDenied.
  ///
  /// In en, this message translates to:
  /// **'Permission denied'**
  String get statesPermDenied;

  /// No description provided for @statesPermRequired.
  ///
  /// In en, this message translates to:
  /// **'Permission required'**
  String get statesPermRequired;

  /// No description provided for @statesPermTitle.
  ///
  /// In en, this message translates to:
  /// **'Access blocked'**
  String get statesPermTitle;

  /// No description provided for @statesPermMsg.
  ///
  /// In en, this message translates to:
  /// **'Pausey needs Screen Time access to block apps. Without it, app blocking won\'t work.'**
  String get statesPermMsg;

  /// No description provided for @statesGrant.
  ///
  /// In en, this message translates to:
  /// **'Grant access'**
  String get statesGrant;

  /// No description provided for @statesLearnMore.
  ///
  /// In en, this message translates to:
  /// **'Learn more'**
  String get statesLearnMore;

  /// No description provided for @statesLearnMoreMsg.
  ///
  /// In en, this message translates to:
  /// **'Screen Time access lets Pausey see and pause distracting apps. Your data never leaves your phone.'**
  String get statesLearnMoreMsg;

  /// No description provided for @statesRequiredPerms.
  ///
  /// In en, this message translates to:
  /// **'Required permissions'**
  String get statesRequiredPerms;

  /// No description provided for @statesPermNotif.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get statesPermNotif;

  /// No description provided for @statesPermScreenTime.
  ///
  /// In en, this message translates to:
  /// **'Screen Time access'**
  String get statesPermScreenTime;

  /// No description provided for @statesPermUsage.
  ///
  /// In en, this message translates to:
  /// **'App usage stats'**
  String get statesPermUsage;

  /// No description provided for @statesPermBio.
  ///
  /// In en, this message translates to:
  /// **'Face ID / biometrics'**
  String get statesPermBio;

  /// No description provided for @statesGranted.
  ///
  /// In en, this message translates to:
  /// **'Granted'**
  String get statesGranted;

  /// No description provided for @statesDenied.
  ///
  /// In en, this message translates to:
  /// **'Denied'**
  String get statesDenied;

  /// No description provided for @statesPermNote.
  ///
  /// In en, this message translates to:
  /// **'Without Screen Time, the app can still run focus timers but cannot block apps.'**
  String get statesPermNote;

  /// No description provided for @statesAccessGranted.
  ///
  /// In en, this message translates to:
  /// **'Access granted – app blocking is ready'**
  String get statesAccessGranted;

  /// No description provided for @statesDataNA.
  ///
  /// In en, this message translates to:
  /// **'Data not available'**
  String get statesDataNA;

  /// No description provided for @statesSyncFailed.
  ///
  /// In en, this message translates to:
  /// **'Sync failed'**
  String get statesSyncFailed;

  /// No description provided for @statesLoadTitle.
  ///
  /// In en, this message translates to:
  /// **'Data couldn\'t load'**
  String get statesLoadTitle;

  /// No description provided for @statesLoadMsg.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong fetching your analytics. This might be a temporary server hiccup – your local data is untouched.'**
  String get statesLoadMsg;

  /// No description provided for @statesRetrySync.
  ///
  /// In en, this message translates to:
  /// **'Retry sync'**
  String get statesRetrySync;

  /// No description provided for @statesUseCached.
  ///
  /// In en, this message translates to:
  /// **'Use cached'**
  String get statesUseCached;

  /// No description provided for @statesErrorDetails.
  ///
  /// In en, this message translates to:
  /// **'Error details'**
  String get statesErrorDetails;

  /// No description provided for @statesErrorCode.
  ///
  /// In en, this message translates to:
  /// **'Error code'**
  String get statesErrorCode;

  /// No description provided for @statesTimestamp.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get statesTimestamp;

  /// No description provided for @statesRetryCount.
  ///
  /// In en, this message translates to:
  /// **'Retry count'**
  String get statesRetryCount;

  /// No description provided for @statesAttempts.
  ///
  /// In en, this message translates to:
  /// **'{n} / 3 attempts'**
  String statesAttempts(int n);

  /// No description provided for @statesReport.
  ///
  /// In en, this message translates to:
  /// **'Report to support'**
  String get statesReport;

  /// No description provided for @statesReported.
  ///
  /// In en, this message translates to:
  /// **'Thanks – the report was sent'**
  String get statesReported;

  /// No description provided for @statesCachedNote.
  ///
  /// In en, this message translates to:
  /// **'Cached data from your last successful sync is available in the meantime.'**
  String get statesCachedNote;

  /// No description provided for @statesDataLoaded.
  ///
  /// In en, this message translates to:
  /// **'Analytics loaded'**
  String get statesDataLoaded;

  /// No description provided for @statesCachedShown.
  ///
  /// In en, this message translates to:
  /// **'Showing cached data'**
  String get statesCachedShown;

  /// No description provided for @statesWeekFocus.
  ///
  /// In en, this message translates to:
  /// **'Focus this week: {time}'**
  String statesWeekFocus(String time);

  /// No description provided for @statesEmpty.
  ///
  /// In en, this message translates to:
  /// **'Empty state'**
  String get statesEmpty;

  /// No description provided for @statesNothingYet.
  ///
  /// In en, this message translates to:
  /// **'Nothing yet'**
  String get statesNothingYet;

  /// No description provided for @statesEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No sessions yet'**
  String get statesEmptyTitle;

  /// No description provided for @statesEmptyMsg.
  ///
  /// In en, this message translates to:
  /// **'Start your first focus session and your progress will show up here.'**
  String get statesEmptyMsg;

  /// No description provided for @statesStartFocus.
  ///
  /// In en, this message translates to:
  /// **'Start focusing'**
  String get statesStartFocus;

  /// No description provided for @statesLoadingSection.
  ///
  /// In en, this message translates to:
  /// **'Loading states'**
  String get statesLoadingSection;

  /// No description provided for @statesDashLoading.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get statesDashLoading;

  /// No description provided for @statesAnalyticsLoading.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get statesAnalyticsLoading;

  /// No description provided for @statesGoalsLoading.
  ///
  /// In en, this message translates to:
  /// **'Goals'**
  String get statesGoalsLoading;

  /// No description provided for @statesProfileLoading.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get statesProfileLoading;

  /// No description provided for @statesCrunching.
  ///
  /// In en, this message translates to:
  /// **'Crunching your data…'**
  String get statesCrunching;

  /// No description provided for @statesLoadingGoals.
  ///
  /// In en, this message translates to:
  /// **'Loading your goals…'**
  String get statesLoadingGoals;

  /// No description provided for @statesLoadingProfile.
  ///
  /// In en, this message translates to:
  /// **'Loading your profile…'**
  String get statesLoadingProfile;

  /// No description provided for @statesReplay.
  ///
  /// In en, this message translates to:
  /// **'Replay'**
  String get statesReplay;
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
    'id',
    'it',
    'ja',
    'ko',
    'pt',
    'ru',
    'tr',
    'ur',
    'zh',
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
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
    case 'ur':
      return AppLocalizationsUr();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
