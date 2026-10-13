// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get ob1Title => 'Weniger Bildschirmsucht';

  @override
  String get ob1Body =>
      'Übernimm die Kontrolle über deine digitalen Gewohnheiten und verbringe weniger Zeit mit ablenkenden Apps.';

  @override
  String get ob1StatAvg => 'Ø tägliche Bildschirmzeit';

  @override
  String get ob1StatSocial => 'In sozialen Medien';

  @override
  String get ob2SelectApps => 'Apps auswählen';

  @override
  String get ob2Title => 'Ablenkende Apps sperren';

  @override
  String get ob2Body =>
      'Blockiere soziale Medien, Spiele und andere Ablenkungen mit starken App-Sperren.';

  @override
  String get ob2Feature1 => 'Jede App mit einem Tippen blockieren';

  @override
  String get ob2Feature2 => 'Sperrzeiten und Fokusphasen planen';

  @override
  String get ob2Feature3 =>
      'Sperren mit Passwort schützen, damit du dranbleibst';

  @override
  String get sheetTitle => 'Apps auswählen';

  @override
  String get sheetTotalLocked => 'Gesperrt';

  @override
  String get sheetAppsSelected => 'Apps ausgewählt';

  @override
  String get sheetTimeSaved => 'Zeit gespart';

  @override
  String get sheetPerDayAvg => 'Ø pro Tag';

  @override
  String sheetHoursValue(String h) {
    return '$h Std.';
  }

  @override
  String get sheetSearchHint => 'Apps suchen...';

  @override
  String get sheetCatAll => 'Alle';

  @override
  String get sheetCatSocial => 'Social';

  @override
  String get sheetCatEntertainment => 'Unterhaltung';

  @override
  String get sheetCatGames => 'Spiele';

  @override
  String get sheetAppsHeader => 'APPS';

  @override
  String sheetSelectedCount(int count) {
    return '$count ausgewählt';
  }

  @override
  String get sheetNoApps => 'Keine Apps gefunden';

  @override
  String get sheetLockSchedule => 'SPERRZEITEN';

  @override
  String get sheetAddCustomSemantic => 'Eigene Sperrzeit hinzufügen';

  @override
  String get sheetCustomBadge => '+ Eigene';

  @override
  String get sheetSchedMorning => 'Morgen';

  @override
  String get sheetSchedWork => 'Arbeit';

  @override
  String get sheetSchedEvening => 'Abend';

  @override
  String get sheetEveryDay => 'Jeden Tag';

  @override
  String get sheetWeekdays => 'Werktags';

  @override
  String get sheetWeekends => 'Wochenende';

  @override
  String get sheetUnlockMethod => 'ENTSPERRMETHODE';

  @override
  String get sheetPin => 'PIN-Code';

  @override
  String get sheetPinSub => '4-stellige PIN';

  @override
  String get sheetFaceId => 'Face ID';

  @override
  String get sheetFaceIdSub => 'Biometrisch';

  @override
  String get sheetTouchId => 'Touch ID';

  @override
  String get sheetTouchIdSub => 'Fingerabdruck';

  @override
  String get sheetFooter => 'Du kannst das später jederzeit ändern';

  @override
  String get sheetConfirmLock => 'Sperre bestätigen';

  @override
  String sheetRemove(String name) {
    return '$name entfernen';
  }

  @override
  String get sheetCustomTitle => 'Eigene Sperrzeit';

  @override
  String get sheetCustomBody =>
      'Deine ausgewählten Apps bleiben in dieser Zeit gesperrt.';

  @override
  String get sheetNameLabel => 'NAME';

  @override
  String get sheetNameHint => 'z. B. Lernzeit';

  @override
  String get sheetStarts => 'Beginn';

  @override
  String get sheetEnds => 'Ende';

  @override
  String get sheetSameTime => 'Beginn und Ende sind gleich';

  @override
  String sheetLockedFor(String duration) {
    return 'Gesperrt für $duration';
  }

  @override
  String sheetLockedForOvernight(String duration) {
    return 'Gesperrt für $duration (über Nacht)';
  }

  @override
  String sheetDurH(int h) {
    return '$h Std.';
  }

  @override
  String sheetDurM(int m) {
    return '$m Min.';
  }

  @override
  String sheetDurHM(int h, int m) {
    return '$h Std. $m Min.';
  }

  @override
  String get sheetLockStartsAt => 'SPERRE BEGINNT UM';

  @override
  String get sheetLockEndsAt => 'SPERRE ENDET UM';

  @override
  String get sheetRepeatOn => 'WIEDERHOLEN AN';

  @override
  String get sheetAddSchedule => 'Hinzufügen';

  @override
  String get sheetCustomDefaultName => 'Eigene';

  @override
  String sheetChangeTime(String label, String time) {
    return '$label $time. Zeit ändern';
  }

  @override
  String get ob3Title => 'Bleib jeden Tag fokussiert';

  @override
  String get ob3Body =>
      'Nutze Pomodoro- und Deep-Focus-Sitzungen, um produktiver zu sein und mehr zu erreichen.';

  @override
  String get ob3Pomodoro => 'Pomodoro';

  @override
  String ob3PomodoroSub(int min) {
    return '$min-Min.-Sitzungen';
  }

  @override
  String get ob3DeepFocus => 'Deep Focus';

  @override
  String ob3DeepFocusSub(int min) {
    return '$min Min. Flow';
  }

  @override
  String get ob3StatBoost => 'mehr Produktivität';

  @override
  String ob3StatStreakValue(int days) {
    return '$days Tage';
  }

  @override
  String get ob3StatStreak => 'Serie aufbauen';

  @override
  String get ob3StatGoal => 'Ziele erreicht';

  @override
  String get ob3StartTimer => 'Timer starten';

  @override
  String get ob3PauseTimer => 'Timer pausieren';

  @override
  String get ob4Title => 'Verfolge deinen Fortschritt';

  @override
  String get ob4Body =>
      'Behalte Bildschirmzeit, Fokusstunden, Ziele und Produktivität mit schönen Statistiken im Blick.';

  @override
  String get ob4Weekly => 'Wöchentlich';

  @override
  String get ob4WeeklySub => 'Berichte';

  @override
  String get ob4Goals => 'Ziele';

  @override
  String get ob4GoalsSub => 'Tracker';

  @override
  String get ob4Insights => 'Einblicke';

  @override
  String get ob4InsightsSub => 'KI-Coach';

  @override
  String get ob4Streaks => 'Serien';

  @override
  String get ob4StreaksSub => '& Abzeichen';

  @override
  String get ob5Title => 'Wie hoch ist deine tägliche Bildschirmzeit?';

  @override
  String get ob5Subtitle => 'Nur auf deinem Handy. Eine Schätzung reicht.';

  @override
  String get ob5More7 => 'Mehr als 7 Stunden';

  @override
  String get ob5H5to7 => '5-7 Stunden';

  @override
  String get ob5H4to5 => '4-5 Stunden';

  @override
  String get ob5H3to4 => '3-4 Stunden';

  @override
  String get ob5H1to3 => '1-3 Stunden';

  @override
  String get ob5Under1 => 'Unter 1 Stunde';

  @override
  String get ob6Title => 'Was ist dein Beruf?';

  @override
  String get ob6Subtitle =>
      'Wir passen deinen Fokusplan an deinen Arbeitsstil an.';

  @override
  String get ob6Software => 'Softwareentwicklung';

  @override
  String get ob6Founder => 'CEO / Gründer';

  @override
  String get ob6Remote => 'Remote-Arbeit';

  @override
  String get ob6Finance => 'Finanzen / Betrieb / Beratung';

  @override
  String get ob6Art => 'Kunst / Content';

  @override
  String get ob6Education => 'Bildung';

  @override
  String get ob6Others => 'Sonstiges';

  @override
  String get ob7Title => 'Lege dein tägliches Bildschirmzeit-Ziel fest';

  @override
  String get ob7Subtitle =>
      'Du kannst das jederzeit ändern. Wir erinnern dich, wenn du nah dran bist.';

  @override
  String ob7Hours(String hours) {
    return '$hours Std.';
  }

  @override
  String get ob7PerDay => 'pro Tag';

  @override
  String ob7HoursPerDay(String hours) {
    return '$hours pro Tag';
  }

  @override
  String get ob7DialLabel => 'Tägliches Bildschirmzeit-Ziel';

  @override
  String get ob7InfoNote =>
      'Im Schnitt verbringt man täglich über 4 Std. am Handy. Ein Ziel ist der erste Schritt, um deine Zeit zurückzugewinnen.';

  @override
  String get ob8Title => 'Wichtige Berechtigungen aktivieren';

  @override
  String get ob8Subtitle => 'Erteile Zugriff für das volle Pausey-Erlebnis.';

  @override
  String get ob8UsageTitle => 'Nutzungszugriff';

  @override
  String get ob8UsageSub =>
      'App-Nutzung überwachen und Fokus-Sitzungen durchsetzen.';

  @override
  String get ob8NotifTitle => 'Mitteilungen';

  @override
  String get ob8NotifSub =>
      'Rechtzeitige Erinnerungen und Fortschrittshinweise.';

  @override
  String get ob8TrackTitle => 'App-Nutzung verfolgen';

  @override
  String get ob8TrackSub => 'Tägliche und wöchentliche Übersichten.';

  @override
  String get ob9Title => 'Alles bereit!';

  @override
  String get ob9Subtitle => 'Deine Fokus-Umgebung ist startklar.';

  @override
  String get ob9Enter => 'Pausey öffnen';

  @override
  String get ob9Replay => 'Einführung wiederholen';

  @override
  String get ob9ScreenTime => 'Bildschirmzeit';

  @override
  String get ob9AppsLocked => 'Gesperrte Apps';

  @override
  String get ob9Permissions => 'Berechtigungen';

  @override
  String get ob9FocusMode => 'Fokusmodus';

  @override
  String get ob9AllOk => 'Alles OK';

  @override
  String get ob9On => 'AN';

  @override
  String get ob9Done => 'FERTIG';

  @override
  String get ob9StreakTitle => 'Tag-1-Serie startet jetzt';

  @override
  String get ob9StreakSub => 'Schließe eine Sitzung ab, um dranzubleiben';

  @override
  String get appName => 'Pausey';

  @override
  String get tagline => 'Hol dir deine Zeit zurück';

  @override
  String get versionLabel => 'Version 2.0 · App-Store-Edition';

  @override
  String get skip => 'Überspringen';

  @override
  String get continueLabel => 'Weiter';

  @override
  String get back => 'Zurück';

  @override
  String get freeToStart => 'Kostenlos starten · Keine Kreditkarte nötig';

  @override
  String get dataStaysOnDevice => 'Deine Daten verlassen nie dein Gerät.';

  @override
  String get switchToLight => 'Zum hellen Modus wechseln';

  @override
  String get switchToDark => 'Zum dunklen Modus wechseln';

  @override
  String get language => 'Sprache';

  @override
  String get phoneLanguage => 'Telefonsprache';

  @override
  String get authTitle => 'Stopp das Scrollen.\nGestalte deinen Tag.';

  @override
  String get authSubtitle =>
      'Erstelle ein Konto, um Ziele und Serien zu synchronisieren, oder teste Pausey als Gast.';

  @override
  String get continueWithApple => 'Weiter mit Apple';

  @override
  String get continueWithGoogle => 'Weiter mit Google';

  @override
  String get signUpWithEmail => 'Mit E-Mail registrieren';

  @override
  String get continueAsGuest => 'Als Gast fortfahren';

  @override
  String get guestNote => 'Gastdaten werden nur auf diesem Handy gespeichert.';

  @override
  String get or => 'oder';

  @override
  String get haveAccount => 'Schon ein Konto?';

  @override
  String get noAccount => 'Neu bei Pausey?';

  @override
  String get logIn => 'Anmelden';

  @override
  String get signUp => 'Registrieren';

  @override
  String get createAccount => 'Konto erstellen';

  @override
  String get signUpTitle => 'Erstelle dein Konto';

  @override
  String get signUpSubtitle => 'Starte mit ruhigeren Bildschirmgewohnheiten.';

  @override
  String get logInTitle => 'Willkommen zurück';

  @override
  String get logInSubtitle => 'Melde dich an, um deine Serie fortzusetzen.';

  @override
  String get fullName => 'Vollständiger Name';

  @override
  String get email => 'E-Mail';

  @override
  String get password => 'Passwort';

  @override
  String get confirmPassword => 'Passwort bestätigen';

  @override
  String get showPassword => 'Passwort anzeigen';

  @override
  String get hidePassword => 'Passwort verbergen';

  @override
  String get forgotPassword => 'Passwort vergessen?';

  @override
  String get resetTitle => 'Passwort zurücksetzen';

  @override
  String get resetSubtitle =>
      'Gib deine E-Mail ein, wir senden dir einen Link.';

  @override
  String get sendLink => 'Link senden';

  @override
  String get resetSent => 'Sieh in deinem Posteingang nach dem Link.';

  @override
  String get agreeTerms => 'Ich stimme den AGB und der Datenschutzerklärung zu';

  @override
  String get passwordStrength => 'Passwortstärke';

  @override
  String get strengthWeak => 'Schwach';

  @override
  String get strengthOk => 'Okay';

  @override
  String get strengthStrong => 'Stark';

  @override
  String get errNameRequired => 'Gib deinen Namen ein';

  @override
  String get errEmailInvalid => 'Gib eine gültige E-Mail ein';

  @override
  String get errPasswordShort => 'Mindestens 8 Zeichen';

  @override
  String get errPasswordMismatch => 'Passwörter stimmen nicht überein';

  @override
  String get errTerms => 'Bitte akzeptiere die Bedingungen';

  @override
  String get authErr_not_configured =>
      'Anmeldung ist noch nicht eingerichtet. Du kannst als Gast fortfahren.';

  @override
  String get authErr_cancelled => 'Anmeldung abgebrochen.';

  @override
  String get authErr_invalid_email => 'Diese E-Mail sieht falsch aus.';

  @override
  String get authErr_wrong_password => 'E-Mail oder Passwort ist falsch.';

  @override
  String get authErr_user_not_found =>
      'Kein Konto mit dieser E-Mail. Registrieren?';

  @override
  String get authErr_email_in_use =>
      'Mit dieser E-Mail gibt es schon ein Konto. Melde dich an.';

  @override
  String get authErr_weak_password => 'Wähle ein stärkeres Passwort.';

  @override
  String get authErr_network => 'Keine Internetverbindung. Versuch es erneut.';

  @override
  String get authErr_too_many => 'Zu viele Versuche. Warte eine Minute.';

  @override
  String get authErr_unknown => 'Etwas ist schiefgelaufen. Versuch es erneut.';

  @override
  String homeHello(String name) {
    return 'Hallo, $name';
  }

  @override
  String get homeHelloGuest => 'Hallo';

  @override
  String get homeGuestBadge => 'Gastmodus · auf diesem Handy gespeichert';

  @override
  String get homeSubtitle => 'Dein Plan ist fertig. Das hast du gewählt.';

  @override
  String get homeDailyGoal => 'Tagesziel';

  @override
  String get homeLockedApps => 'Gesperrte Apps';

  @override
  String get homeScreenTime => 'Aktuelle Bildschirmzeit';

  @override
  String get homeNotSet => 'Nicht festgelegt';

  @override
  String get homeCreateAccount => 'Konto erstellen zum Sichern';

  @override
  String get signOut => 'Abmelden';

  @override
  String get signOutGuestWarn =>
      'Abmelden löscht die Gastdaten auf diesem Handy.';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get navHome => 'Start';

  @override
  String get navBlock => 'Sperren';

  @override
  String get navFocus => 'Fokus';

  @override
  String get navInsights => 'Statistik';

  @override
  String get navProfile => 'Profil';

  @override
  String get unitH => 'Std.';

  @override
  String get unitM => 'Min.';

  @override
  String get sampleData => 'Beispieldaten';

  @override
  String get seeAll => 'Alle anzeigen';

  @override
  String days(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Tage',
      one: '1 Tag',
    );
    return '$_temp0';
  }
}
