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
  String get ob1ArtNote1 => 'Weniger scrollen';

  @override
  String get ob1ArtNote2 => 'Mehr du';

  @override
  String get ob1BookFocus => 'Fokus';

  @override
  String get ob1BookBalance => 'Balance';

  @override
  String get ob1BookHappier => 'Glücklicher du';

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
  String get ob3RingStreak => 'Tage in Folge';

  @override
  String ob3RingSessions(int done, int total) {
    return '$done von $total Sitzungen';
  }

  @override
  String get ob3RingTagline => 'Fokus macht\ndich besser';

  @override
  String get ob4ArtScore => 'Punkte';

  @override
  String get ob4ArtProductivity => 'Produktivität';

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
  String get ob7Title => 'Dein tägliches Bildschirmziel';

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
  String alSummary(int locked, int total) {
    return '$locked jetzt gesperrt · $total verwaltet';
  }

  @override
  String alSummaryOff(int total) {
    return '$total verwaltet · Sperre inaktiv';
  }

  @override
  String get alFromInstalled => 'Aus installierten Apps wählen';

  @override
  String get alFromInstalledSub => 'Jede App auf diesem Handy';

  @override
  String get alPermTitle => 'Sperre ist noch nicht aktiv';

  @override
  String get alPermMsg =>
      'Deine Regeln sind gespeichert, aber Pausey kann erst sperren, wenn du diese zwei Berechtigungen erlaubst:';

  @override
  String get alPermUsage => 'Nutzungszugriff';

  @override
  String get alPermUsageSub => 'Erkennt die offene App und die heutige Zeit';

  @override
  String get alPermOverlay => 'Über anderen Apps einblenden';

  @override
  String get alPermOverlaySub => 'Zeigt den Sperrbildschirm an';

  @override
  String get alAllow => 'Erlauben';

  @override
  String get alAllowed => 'Erlaubt';

  @override
  String get alPermReturn =>
      'Danach zurück zu Pausey – es prüft automatisch erneut.';

  @override
  String get alAndroidOnly =>
      'Sperren funktioniert nur auf Android. Regeln kannst du trotzdem hier anlegen.';

  @override
  String get alSearchHint => 'Apps suchen';

  @override
  String get alFilterAll => 'Alle';

  @override
  String get alFilterLocked => 'Gesperrt';

  @override
  String get alFilterScheduled => 'Geplant';

  @override
  String get alFilterAvailable => 'Frei';

  @override
  String get alStateLocked => 'Gesperrt';

  @override
  String get alStateWillLock => 'Wird gesperrt';

  @override
  String get alStateScheduled => 'Geplant';

  @override
  String get alStateAvailable => 'Frei';

  @override
  String alUsedOf(String used, String limit) {
    return '$used von $limit genutzt';
  }

  @override
  String alUsedToday(String used) {
    return 'Heute $used';
  }

  @override
  String get alNoLimit => 'Kein Tageslimit';

  @override
  String alLimitNoUsage(String limit) {
    return 'Limit $limit · ohne Daten';
  }

  @override
  String get alRulesOff => 'Regeln aus';

  @override
  String alNextLock(String time) {
    return 'Nächste Sperre: $time';
  }

  @override
  String alUnlockedUntil(String time) {
    return 'Frei bis $time';
  }

  @override
  String get alReasonLimit => 'Tageslimit erreicht';

  @override
  String get alReasonSchedule => 'Sperrzeit aktiv';

  @override
  String get alReasonGeneral => 'Allgemeiner Zeitplan aktiv';

  @override
  String get alReasonAllDay => 'Ganztägig gesperrt';

  @override
  String get alReasonFocus => 'Fokus-Sitzung läuft';

  @override
  String get alNoMatches => 'Keine passenden Apps';

  @override
  String get alGeneral => 'Allgemein';

  @override
  String get alGeneralScheduleSub =>
      'Für Apps mit „Allgemeinem Zeitplan folgen“';

  @override
  String get alLockAllSub => 'Regeln für alle Apps einschalten';

  @override
  String get alSaved => 'Gespeichert';

  @override
  String get alChangesApply => 'Änderungen gelten sofort';

  @override
  String get alDetailsTitle => 'App-Limits';

  @override
  String get alBlockingOff => 'Sperre ist auf diesem Handy inaktiv';

  @override
  String get alRestrictApp => 'Diese App beschränken';

  @override
  String get alMasterOff => 'Aus – Pausey beschränkt diese App nicht';

  @override
  String get alMasterOnRules => 'Limit und Zeitpläne unten gelten';

  @override
  String get alMasterOnAllDay =>
      'Noch kein Limit/Zeitplan – ganztägig gesperrt';

  @override
  String get alMasterOnGeneral => 'Im allgemeinen Zeitplan gesperrt';

  @override
  String get alFollowGeneral => 'Allgemeinem Zeitplan folgen';

  @override
  String alFollowGeneralSub(String start, String end) {
    return 'Auch $start – $end sperren';
  }

  @override
  String get alGeneralOff => 'Der allgemeine Zeitplan ist aus';

  @override
  String get alDailyLimit => 'Tageslimit';

  @override
  String get alDailyLimitOffSub => 'Sperrt die App nach einer Tageszeit';

  @override
  String get alCustom => 'Eigene';

  @override
  String get alUsedLabel => 'Heute genutzt';

  @override
  String get alLeftLabel => 'Übrig';

  @override
  String get alLimitReached => 'Limit für heute erreicht';

  @override
  String get alResets => 'Wird um Mitternacht zurückgesetzt (Handyzeit)';

  @override
  String get alUsageUnavailable => 'Nutzung nicht verfügbar';

  @override
  String get alUsageNeedsAccess =>
      'Erlaube den Nutzungszugriff, damit Pausey die heutige Zeit zählt.';

  @override
  String get alUsageAndroidOnly =>
      'Nutzung wird nur auf Android gemessen. Das Limit wird gespeichert und gilt dort.';

  @override
  String get alGrantUsage => 'Zugriff erlauben';

  @override
  String get alCustomLimitTitle => 'Eigenes Tageslimit';

  @override
  String get alHours => 'Stunden';

  @override
  String get alMinutes => 'Minuten';

  @override
  String get alErrZeroLimit => 'Mehr als null wählen';

  @override
  String get alSave => 'Speichern';

  @override
  String get alScheduledLocking => 'Geplante Sperre';

  @override
  String get alScheduledOffSub => 'Sperrt diese App zu festen Zeiten';

  @override
  String get alNoSchedules => 'Noch keine Zeitpläne';

  @override
  String get alAddSchedule => 'Zeitplan hinzufügen';

  @override
  String get alActiveNow => 'Jetzt aktiv';

  @override
  String get alScheduleDefault => 'Sperrzeit';

  @override
  String get alEndsNextDay => 'Endet am Folgetag';

  @override
  String get alEdit => 'Bearbeiten';

  @override
  String get alDelete => 'Löschen';

  @override
  String get alDeleteScheduleQ => 'Diesen Zeitplan löschen?';

  @override
  String alDeleteScheduleMsg(String title) {
    return '„$title“ sperrt diese App dann nicht mehr.';
  }

  @override
  String get alNewSchedule => 'Neuer Zeitplan';

  @override
  String get alEditSchedule => 'Zeitplan bearbeiten';

  @override
  String get alTitleOptional => 'Titel (optional)';

  @override
  String get alPresetStudy => 'Lernen';

  @override
  String get alPresetEvening => 'Abend';

  @override
  String get alPresetSleep => 'Schlafen';

  @override
  String get alRepeatOn => 'Wiederholen am';

  @override
  String get alErrSameTime => 'Beginn und Ende dürfen nicht gleich sein';

  @override
  String get alErrNoDays => 'Wähle mindestens einen Tag';

  @override
  String alTempUnlock(int minutes) {
    return '$minutes Min. entsperren';
  }

  @override
  String alTempUnlockSub(int n) {
    return 'Nutzt 1 Notfall-Entsperrung · heute noch $n';
  }

  @override
  String get alTempUnlockFocus => 'Während einer Fokus-Sitzung nicht möglich';

  @override
  String get alTempUnlockNotLocked => 'Nur nötig, wenn die App gesperrt ist';

  @override
  String alTempUnlockQ(String app, int minutes) {
    return '$app für $minutes Minuten entsperren?';
  }

  @override
  String get alUnlock => 'Entsperren';

  @override
  String get alEndEarly => 'Früher beenden';

  @override
  String get alResetRules => 'Regeln zurücksetzen';

  @override
  String get alResetRulesSub => 'Entfernt Limit und Zeitpläne';

  @override
  String alResetQ(String app) {
    return 'Regeln für $app zurücksetzen?';
  }

  @override
  String get alResetMsg =>
      'Tageslimit und alle Zeitpläne werden entfernt. Die App bleibt in der Liste.';

  @override
  String get alReset => 'Zurücksetzen';

  @override
  String get alResetDone => 'Regeln zurückgesetzt';

  @override
  String get alRemoveApp => 'App entfernen';

  @override
  String get alRemoveAppSub => 'Diese App nicht mehr verwalten';

  @override
  String alRemoveQ(String app) {
    return '$app entfernen?';
  }

  @override
  String get alRemoveMsg =>
      'Pausey beschränkt sie nicht mehr und vergisst Limit und Zeitpläne.';

  @override
  String get alRemove => 'Entfernen';

  @override
  String get alNoPackage =>
      'Limits und Zeitpläne pro App brauchen eine bestimmte installierte App. Auf Android über „Aus installierten Apps wählen“ hinzufügen.';

  @override
  String get alNotFound => 'Diese App wird nicht mehr verwaltet';

  @override
  String get alPickerTitle => 'Installierte Apps';

  @override
  String get alPickerAdded => 'Bereits hinzugefügt';

  @override
  String alPickerAdd(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Apps hinzufügen',
      one: '1 App hinzufügen',
      zero: 'Apps hinzufügen',
    );
    return '$_temp0';
  }

  @override
  String get alPickerEmpty => 'Keine Apps gefunden';

  @override
  String get blockTitle => 'App-Sperre';

  @override
  String get blockAddApp => 'App hinzufügen';

  @override
  String get blockFaceIdTitle => 'Face-ID-Schutz';

  @override
  String get blockFaceIdSub => 'Face ID zum Entsperren verlangen';

  @override
  String get blockFaceIdUnavailable =>
      'Biometrie ist auf diesem Gerät nicht verfügbar';

  @override
  String get blockFaceIdReason => 'Bestätige deine Identität zum Aktivieren';

  @override
  String get blockFaceIdFailed => 'Nicht bestätigt – Schutz bleibt aus';

  @override
  String get blockScheduleTitle => 'Zeitplan-Sperre';

  @override
  String get blockStart => 'Beginn';

  @override
  String get blockEnd => 'Ende';

  @override
  String get blockNeedOneDay => 'Mindestens ein Tag muss aktiv sein';

  @override
  String get blockManagedApps => 'Verwaltete Apps';

  @override
  String get blockLockAll => 'Alle sperren';

  @override
  String get blockAllLocked => 'Alle Apps sind gesperrt';

  @override
  String blockRemoved(String app) {
    return '$app entfernt';
  }

  @override
  String get blockAppsUpdated => 'Apps aktualisiert';

  @override
  String get blockCatSocial => 'Sozial';

  @override
  String get blockCatVideo => 'Video';

  @override
  String get blockCatGames => 'Spiele';

  @override
  String get blockCatShopping => 'Shopping';

  @override
  String get blockCatCommunity => 'Community';

  @override
  String get blockCatOther => 'Sonstige';

  @override
  String get blockEmptyBadge => 'Nichts gesperrt';

  @override
  String get blockEmptyTitle => 'Noch keine Apps';

  @override
  String get blockEmptyMsg =>
      'Füge deine größten Ablenkungen hinzu – Pausey sperrt sie für dich.';

  @override
  String get blockEmergencyTitle => 'Notfall-Entsperrung';

  @override
  String blockEmergencySub(int n) {
    return 'Alle Apps kurz entsperren · heute noch $n';
  }

  @override
  String get blockEmergencyOff => 'In Einstellungen deaktiviert';

  @override
  String get blockEmergencyUse => 'Nutzen';

  @override
  String get blockEmergencyConfirmTitle => 'Notfall-Entsperrung nutzen?';

  @override
  String blockEmergencyConfirmMsg(int n) {
    return 'Das verbraucht eine deiner $n verbleibenden Entsperrungen heute. Nur im echten Notfall.';
  }

  @override
  String get blockEmergencyUsed => 'Entsperrung genutzt – Apps sind frei';

  @override
  String get blockEmergencyNone => 'Heute keine mehr übrig';

  @override
  String get cvNoAccount => 'Noch kein Konto?';

  @override
  String get cvYourName => 'Dein Name';

  @override
  String get cvAppsLoadFailed =>
      'Die Apps auf diesem Handy konnten nicht gelesen werden.';

  @override
  String get cvTryAgain => 'Erneut versuchen';

  @override
  String get cvGetStarted => 'Los geht\'s';

  @override
  String get cvHaveAccount => 'Ich habe schon ein Konto';

  @override
  String get cvWelcomeTitle => 'Deine Zeit gehört dir.';

  @override
  String get cvWelcomeBody => 'Lass uns mehr Raum schaffen für das, was zählt.';

  @override
  String get cvNext => 'Weiter';

  @override
  String get cvSkipForNow => 'Erst mal überspringen';

  @override
  String get cvRelateTitle => 'Die Zeit vergessen?';

  @override
  String get cvRelateSub => 'Sei ehrlich, es gibt keine falsche Antwort.';

  @override
  String get cvRelateOften => 'Ständig';

  @override
  String get cvRelateSometimes => 'Manchmal';

  @override
  String get cvRelateRarely => 'Selten';

  @override
  String get cvRelateReplyOften =>
      'Damit bist du nicht allein. Handys sind darauf ausgelegt, uns festzuhalten.';

  @override
  String get cvRelateReplySometimes =>
      'Das passiert den meisten von uns, meist ganz unbemerkt.';

  @override
  String get cvRelateReplyRarely => 'Schön. Lass uns das so beibehalten.';

  @override
  String get cvRelateCta => 'Das bin ich';

  @override
  String get cvGoalTitle => 'Mehr Zeit wofür?';

  @override
  String get cvGoalSub => 'Wähle, was dir gerade am wichtigsten ist.';

  @override
  String get cvGoalFocus => 'Besserer Fokus';

  @override
  String get cvGoalSleep => 'Besserer Schlaf';

  @override
  String get cvGoalScrolling => 'Weniger Scrollen';

  @override
  String get cvGoalMe => 'Mehr Zeit für mich';

  @override
  String get cvGoalHabits => 'Gesündere Alltagsgewohnheiten';

  @override
  String get cvGoalOther => 'Etwas anderes';

  @override
  String get cvGoalOtherHint => 'Wofür hättest du gern mehr Zeit?';

  @override
  String get cvGoalReplyFocus => 'Also Fokus. Wir schützen ihn.';

  @override
  String get cvGoalReplySleep => 'Guter Schlaf beginnt mit ruhigen Abenden.';

  @override
  String get cvGoalReplyScrolling =>
      'Lass Scrollen eine Entscheidung sein, keine Gewohnheit.';

  @override
  String get cvGoalReplyMe =>
      'Zeit für dich ist wichtig. Lass uns welche finden.';

  @override
  String get cvGoalReplyHabits =>
      'Kleine Schritte summieren sich. Wir halten sie einfach.';

  @override
  String get cvGoalReplyOther => 'Verstanden. Wir richten alles danach aus.';

  @override
  String get cvAppsTitle => 'Welche Apps lenken dich ab?';

  @override
  String get cvAppsSubReal =>
      'Die Apps, die du auf diesem Handy am meisten nutzt. Alle werden pausiert; tippe auf ✕, um eine freizulassen.';

  @override
  String get cvAppsSubPopular =>
      'Die Apps, die du auf diesem Handy am meisten nutzt. Alle werden pausiert; tippe auf ✕, um eine freizulassen.';

  @override
  String get cvAppsSearch => 'Apps suchen';

  @override
  String cvAppsReply(String apps) {
    return 'Notiert: $apps. Damit fangen wir an.';
  }

  @override
  String cvAnd(String a, String b) {
    return '$a und $b';
  }

  @override
  String cvAndMore(String a, String b, int count) {
    return '$a, $b und $count weitere';
  }

  @override
  String get cvStTitle => 'Deine tägliche Bildschirmzeit';

  @override
  String get cvStSub => 'Eine Schätzung reicht. Das bleibt auf deinem Handy.';

  @override
  String cvStMeasured(String time) {
    return 'Heute bisher auf diesem Handy gemessen: $time';
  }

  @override
  String get cvStUnder2 => 'Unter 2 Stunden';

  @override
  String get cvSt2to4 => '2 bis 4 Stunden';

  @override
  String get cvSt4to6 => '4 bis 6 Stunden';

  @override
  String get cvStOver6 => 'Mehr als 6 Stunden';

  @override
  String get cvStNotSure => 'Weiß nicht';

  @override
  String get cvStReplyUnder2 =>
      'Das ist eine gute Balance. Wir helfen dir, sie zu halten.';

  @override
  String get cvStReply2to4 =>
      'Ein paar kleine Änderungen können echt Zeit freimachen.';

  @override
  String get cvStReply4to6 => 'Das ist viel. Holen wir uns etwas zurück.';

  @override
  String get cvStReplyOver6 =>
      'Das ist ein großer Teil des Tages, also fangen wir klein an.';

  @override
  String get cvStReplyNotSure => 'Kein Problem. Pausey kann es messen.';

  @override
  String get cvPhraseFocus => 'mehr Fokus';

  @override
  String get cvPhraseSleep => 'besserer Schlaf';

  @override
  String get cvPhraseScrolling => 'weniger Scrollen';

  @override
  String get cvPhraseMe => 'mehr Zeit für dich';

  @override
  String get cvPhraseHabits => 'gesündere Gewohnheiten';

  @override
  String get cvPhraseOther => 'mehr Raum für das, was zählt';

  @override
  String cvPhraseOtherNamed(String thing) {
    return 'mehr Zeit für $thing';
  }

  @override
  String cvReflectApps(String goal, String apps) {
    return 'Dein Ziel: $goal. Aber du landest immer wieder bei $apps.';
  }

  @override
  String cvReflectNoApps(String goal) {
    return 'Dein Ziel: $goal. Nur kommt dir manchmal das Handy dazwischen.';
  }

  @override
  String cvReflectEstimate(String time) {
    return 'Etwa $time am Tag (deine Schätzung)';
  }

  @override
  String cvReflectMeasured(String time) {
    return 'Heute bisher $time (gemessen)';
  }

  @override
  String get cvReflectHelp =>
      'Pausey hilft dir, eine Routine aufzubauen, die deiner Aufmerksamkeit Luft zum Atmen gibt.';

  @override
  String get cvShowMeHow => 'Zeig mir, wie';

  @override
  String get cvHowTitle => 'So hilft dir Pausey';

  @override
  String get cvHowPauseTab => 'Pause';

  @override
  String get cvHowLimitTab => 'Limits';

  @override
  String get cvHowFocusTab => 'Fokus';

  @override
  String get cvHowPauseTitle => 'Eine ruhige Pause, keine Strafe';

  @override
  String get cvHowPauseBody =>
      'Ist die Zeit einer App um, legt Pausey einen ruhigen Pausenbildschirm darüber, mit einem Ausweg.';

  @override
  String get cvHowLimitTitle => 'Ein Tageskontingent für jede App';

  @override
  String get cvHowLimitBody =>
      'Gib jeder App eigene Tageszeit und Sperrzeiten. Änderst du eine, bleiben die anderen gleich.';

  @override
  String get cvHowFocusTitle => 'Fokus-Sitzungen';

  @override
  String get cvHowFocusBody =>
      'Starte einen Timer zum Arbeiten, Lernen oder Ausruhen. Deine gewählten Apps bleiben bis zum Ende pausiert.';

  @override
  String get cvPreview => 'Vorschau';

  @override
  String get cvYourApp => 'Deine App';

  @override
  String get cvAnotherApp => 'Andere App';

  @override
  String cvMinOf(int used, int limit) {
    return '$used von $limit Min.';
  }

  @override
  String get cvBuildPlan => 'Meinen Plan erstellen';

  @override
  String get cvPlanTitle => 'Ein sanfter Einstieg für dich';

  @override
  String get cvPlanSub =>
      'Vorgeschlagen anhand deiner Antworten. Ändere, was du willst.';

  @override
  String get cvPlanFocus => 'Fokus-Sitzung';

  @override
  String cvPlanFocusSub(String time) {
    return '$time pro Sitzung';
  }

  @override
  String get cvPlanDaily => 'Tägliches Fokusziel';

  @override
  String cvPlanDailySub(String time) {
    return '$time Fokus am Tag';
  }

  @override
  String get cvPlanLimit => 'Tägliches App-Limit';

  @override
  String cvPlanLimitSub(String app, String time) {
    return '$app: $time am Tag';
  }

  @override
  String get cvPlanLimitNoPkg =>
      'Diese App ist nicht in der Liste des Handys. Das Limit kannst du später in der App-Sperre festlegen.';

  @override
  String get cvPlanWind => 'Abendruhe';

  @override
  String cvPlanWindSub(String start, String end) {
    return 'Deine gewählten Apps pausieren von $start bis $end';
  }

  @override
  String get cvPlanOff => 'Aus';

  @override
  String get cvStarts => 'Beginn';

  @override
  String get cvEnds => 'Ende';

  @override
  String get cvPlanNote =>
      'Noch ist nichts aktiv. Es startet erst, wenn du die Einrichtung abschließt, und du kannst es jederzeit ändern.';

  @override
  String get cvUsePlan => 'Diesen Plan nutzen';

  @override
  String get cvPermTitle => 'Ein paar Berechtigungen, damit es funktioniert';

  @override
  String get cvPermSub =>
      'Damit kann Pausey seine Arbeit machen und dir das beste Erlebnis bieten.';

  @override
  String get cvPermUnsupported =>
      'App-Limits und Pausenbildschirme gibt es auf Android-Handys. Alles andere funktioniert auch hier.';

  @override
  String get cvPermUsageTitle => 'Nutzungszugriff';

  @override
  String get cvPermUsageWhy =>
      'Damit sieht Pausey, wie lange jede App heute offen ist und welche gerade läuft.';

  @override
  String get cvPermUsageWithout =>
      'Ohne ihn kann Pausey weder die Bildschirmzeit messen noch erkennen, wann ein Limit erreicht ist.';

  @override
  String get cvPermOverlayTitle => 'Über anderen Apps einblenden';

  @override
  String get cvPermOverlayWhy =>
      'Damit kann Pausey seinen Pausenbildschirm über eine App legen, wenn ihre Zeit um ist.';

  @override
  String get cvPermOverlayWithout =>
      'Ohne sie können Apps nicht pausiert werden. Dein Plan bleibt für später gespeichert.';

  @override
  String get cvPermBatteryTitle => 'Pausey aktiv halten';

  @override
  String get cvPermBatteryWhy =>
      'Manche Handys stoppen Hintergrund-Apps, um Akku zu sparen. Erlaubst du Pausey, laufen deine Limits weiter.';

  @override
  String get cvPermBatteryWithout =>
      'Ohne sie funktionieren Limits eventuell erst wieder, wenn du Pausey öffnest.';

  @override
  String get cvPermLater =>
      'Du kannst das später in den Android-Einstellungen ändern.';

  @override
  String get cvPermPrivacy =>
      'Pausey liest nur App-Namen und Zeiten. Nichts verlässt dein Handy.';

  @override
  String get cvAllowInSettings => 'In Einstellungen erlauben';

  @override
  String get cvAllowed => 'Erlaubt';

  @override
  String get cvOptional => 'Optional';

  @override
  String get cvContinueAnyway => 'Erst mal weiter';

  @override
  String get cvAccountTitle => 'Behalte deinen Fortschritt';

  @override
  String get cvAccountSub => 'Nutze Pausey als Gast oder melde dich an.';

  @override
  String get cvNameLabel => 'Dein Name (optional)';

  @override
  String get cvNameHint => 'Wie sollen wir dich nennen?';

  @override
  String get cvContinueGuest => 'Als Gast fortfahren';

  @override
  String get cvAccountNote =>
      'Die Anmeldung sichert deine Daten noch nicht. So oder so bleiben deine Einstellungen auf diesem Handy.';

  @override
  String get cvReadyTitle => 'Dein erster Schritt beginnt hier.';

  @override
  String cvReadyTitleNamed(String name) {
    return '$name, dein erster Schritt beginnt hier.';
  }

  @override
  String get cvReadyFocus => 'Lass uns etwas mehr Raum für Fokus schaffen.';

  @override
  String get cvReadySleep => 'Lass uns deine Abende etwas ruhiger machen.';

  @override
  String get cvReadyScrolling =>
      'Lass uns dem Scrollen etwas weniger von deinem Tag geben.';

  @override
  String get cvReadyMe => 'Lass uns etwas mehr Zeit für dich schaffen.';

  @override
  String get cvReadyHabits =>
      'Lass uns Gewohnheiten aufbauen, die sich gut anfühlen.';

  @override
  String get cvReadyOther =>
      'Lass uns mehr Raum schaffen für das, was dir wichtig ist.';

  @override
  String get cvYourPlan => 'Dein Plan';

  @override
  String cvSumGoal(String goal) {
    return 'Ziel: $goal';
  }

  @override
  String cvSumApps(String apps) {
    return 'Apps: $apps';
  }

  @override
  String cvSumFocus(String session, String daily) {
    return 'Fokus-Sitzungen à $session, $daily am Tag';
  }

  @override
  String get cvReadyNeedsPerm =>
      'App-Limits sind gespeichert, laufen aber erst, wenn beide Berechtigungen erlaubt sind.';

  @override
  String get cvReadyChange => 'Du kannst all das später ändern.';

  @override
  String get cvStartFirstFocus => 'Ersten Fokus starten';

  @override
  String get cvFinishLimits => 'App-Limits fertig einrichten';

  @override
  String get cvJourneyTitle => 'Starte deine Pausey-Reise';

  @override
  String get cvJourneySub =>
      'Erstelle ein Konto, um deinen Fortschritt zu synchronisieren, oder mach als Gast weiter.';

  @override
  String get cvUsageNone => 'Heute nicht genutzt';

  @override
  String get cvUsageUnder1 => 'Heute unter 1 Min.';

  @override
  String cvUsageToday(String time) {
    return 'Heute $time';
  }

  @override
  String cvAppsSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Apps ausgewählt',
      one: '1 App ausgewählt',
    );
    return '$_temp0';
  }

  @override
  String get cvAppsUsageNeeded =>
      'Erlaube den Zugriff auf die Bildschirmzeit, damit Pausey deine meistgenutzten Apps zeigt.';

  @override
  String cvRemoveApp(String app) {
    return '$app entfernen';
  }

  @override
  String get cvNotifAskTitle => 'Erinnerung, bevor die Zeit um ist?';

  @override
  String get cvNotNow => 'Nicht jetzt';

  @override
  String get cvA11yTitle => 'Noch eine letzte Sache';

  @override
  String get cvA11ySub =>
      'Aktiviere Bedienungshilfen, damit Pausey sieht, welche App offen ist und wie lange. Dann kann es deine Apps sperren, entsperren und planen.';

  @override
  String get cvA11yReads => 'Pausey liest nur:';

  @override
  String get cvA11yRead1 => 'App-Namen';

  @override
  String get cvA11yRead2 => 'Zeit in jeder App';

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
  String get logInTitle => 'In dein Konto einloggen';

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
  String get ob6OtherHint => 'Beruf eingeben';

  @override
  String get timeSecondLabel => 'Sekunde';

  @override
  String get focusModePomodoro => 'Pomodoro';

  @override
  String get focusModeDeep => 'Tiefer Fokus';

  @override
  String get focusModeCustom => 'Eigene';

  @override
  String get focusRemaining => 'VERBLEIBEND';

  @override
  String get focusBreakLabel => 'PAUSE';

  @override
  String get focusReadyLabel => 'BEREIT';

  @override
  String get focusInSession => 'Läuft';

  @override
  String get focusPausedState => 'Pausiert';

  @override
  String get focusOnBreak => 'In der Pause';

  @override
  String get focusIdleState => 'Zum Starten tippen';

  @override
  String get focusSessionsDone => 'Sitzungen';

  @override
  String get focusProgress => 'Fortschritt';

  @override
  String get focusBreakAfter => 'Pause danach';

  @override
  String get focusFocusedToday => 'Heute';

  @override
  String focusAppsBlocked(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Apps gesperrt',
      one: '1 App gesperrt',
    );
    return '$_temp0';
  }

  @override
  String get focusAppsBlockedSub =>
      'Ablenkungen sind für diese Sitzung gesperrt.';

  @override
  String get focusNoApps => 'Keine Apps gesperrt';

  @override
  String get focusNoAppsSub => 'Wähle Apps, die beim Fokus gesperrt werden.';

  @override
  String get focusEdit => 'Ändern';

  @override
  String get focusAdd => 'Hinzufügen';

  @override
  String get focusAmbient => 'Hintergrundklang';

  @override
  String get focusSoundOff => 'Aus';

  @override
  String get focusSoundRain => 'Regen';

  @override
  String get focusSoundForest => 'Wald';

  @override
  String get focusSoundWaves => 'Meereswellen';

  @override
  String get focusSoundWhite => 'Weißes Rauschen';

  @override
  String get focusVolume => 'Lautstärke';

  @override
  String get focusStart => 'Starten';

  @override
  String get focusPause => 'Pausieren';

  @override
  String get focusResume => 'Fortsetzen';

  @override
  String get focusStop => 'Stoppen';

  @override
  String get focusRestart => 'Neu starten';

  @override
  String get focusSkipBreak => 'Pause überspringen';

  @override
  String get focusDurations => 'Sitzungsdauer';

  @override
  String focusMinutesN(int n) {
    return '$n Min.';
  }

  @override
  String get focusBreakLength => 'Pause';

  @override
  String get focusCustomTitle => 'Eigene Dauer';

  @override
  String get focusSet => 'Festlegen';

  @override
  String get focusStopTitle => 'Sitzung vorzeitig beenden?';

  @override
  String get focusStopBody => 'Deine bisherige Fokuszeit wird gespeichert.';

  @override
  String get focusEndSession => 'Beenden';

  @override
  String get focusKeepGoing => 'Weitermachen';

  @override
  String get focusTooShort => 'Unter einer Minute – nicht gespeichert.';

  @override
  String get focusBreakOver => 'Pause vorbei – bereit für die nächste?';

  @override
  String get focusBusy => 'Beende die Sitzung, um den Modus zu ändern.';

  @override
  String get focusFirstHint => 'Deine erste Sitzung startet hier – drück Play.';

  @override
  String get focusCompleteA => 'Sitzung';

  @override
  String get focusCompleteB => 'geschafft!';

  @override
  String get focusEndedTitle => 'Sitzung beendet';

  @override
  String focusCompleteMsg(String mode) {
    return 'Stark! Du hast deine $mode-Sitzung ohne Ablenkung beendet.';
  }

  @override
  String get focusEndedMsg =>
      'Jede Minute zählt. Nächstes Mal die ganze Sitzung!';

  @override
  String get focusDurationLabel => 'FOKUSDAUER';

  @override
  String get focusMinUnit => 'Min.';

  @override
  String get focusDayStreak => 'Serie';

  @override
  String get focusAppsLabel => 'Gesperrte Apps';

  @override
  String get focusTodayGoal => 'Tagesziel';

  @override
  String focusPctCompleted(int pct) {
    return '$pct % erreicht';
  }

  @override
  String focusPlusPct(int pct) {
    return '+$pct % durch diese Sitzung';
  }

  @override
  String get focusMomentum => 'Bleib dran!';

  @override
  String get focusQuote1 =>
      'Beständigkeit schlägt Intensität. Jede Sitzung zählt.';

  @override
  String get focusQuote2 => 'Kleine Fokusblöcke ergeben große Ergebnisse.';

  @override
  String get focusQuote3 => 'Nicht gescrollt – sondern geschafft. Nochmal!';

  @override
  String get focusStartNext => 'Nächste Sitzung';

  @override
  String get focusBackHome => 'Zurück zur Übersicht';

  @override
  String get goalsTitle => 'Meine Ziele';

  @override
  String goalsSubtitle(int active, int done) {
    return '$active aktiv · $done erreicht';
  }

  @override
  String get goalsAdd => 'Ziel hinzufügen';

  @override
  String get goalsCompleted => 'Erreicht';

  @override
  String get goalsActive => 'Aktiv';

  @override
  String get goalsStreak => 'Serie';

  @override
  String get goalsOverall => 'Gesamtfortschritt';

  @override
  String goalsWeeklyHit(int hit, int total) {
    return '$hit von $total Wochenzielen erreicht';
  }

  @override
  String goalsVsLastWeek(String delta) {
    return '$delta ggü. Vorwoche';
  }

  @override
  String get goalsFilterAll => 'Alle';

  @override
  String get goalsDone => 'Erledigt';

  @override
  String get goalsCatFocus => 'Fokus';

  @override
  String get goalsCatDiscipline => 'Disziplin';

  @override
  String get goalsCatWellness => 'Wohlbefinden';

  @override
  String goalsTitleFocusHours(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Täglich $n Stunden Fokus',
      one: 'Täglich 1 Stunde Fokus',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleFocusDur(String duration) {
    return 'Täglich $duration Fokus';
  }

  @override
  String get goalsTitleBlock => 'Social-Apps sperren';

  @override
  String goalsTitleSessions(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Pomodoros pro Tag',
      one: '1 Pomodoro pro Tag',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleScreen(String duration) {
    return 'Unter $duration Bildschirmzeit';
  }

  @override
  String get goalsTitlePhoneFree => 'Handyfreie Zeit';

  @override
  String goalsDescFocus(String duration) {
    return 'Jeden Tag $duration konzentriert arbeiten';
  }

  @override
  String goalsDescBlock(int n) {
    return 'Gesperrte Apps an $n Tagen pro Woche gesperrt lassen';
  }

  @override
  String goalsDescSessions(int n) {
    return 'Mindestens $n Fokus-Sessions pro Tag abschließen';
  }

  @override
  String goalsDescScreen(String duration) {
    return 'Tägliche Handynutzung unter $duration halten';
  }

  @override
  String goalsDescPhoneFree(int n) {
    return '$n handyfreie Tage pro Woche – hake sie ab';
  }

  @override
  String goalsProgressDays(int done, int total) {
    return '$done / $total Tage';
  }

  @override
  String goalsProgressSessions(int done, int total) {
    return '$done / $total Sessions';
  }

  @override
  String goalsStreakShort(int n) {
    return '$n T';
  }

  @override
  String goalsStreakN(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Tage Serie',
      one: '1 Tag Serie',
    );
    return '$_temp0';
  }

  @override
  String get goalsCheckIn => 'Heute abhaken';

  @override
  String get goalsCheckedIn => 'Heute erledigt';

  @override
  String get goalsCheckedSnack => 'Super! Heute ist abgehakt.';

  @override
  String get goalsUncheckedSnack => 'Heute ist nicht mehr abgehakt.';

  @override
  String get goalsCreateNew => 'Neues Ziel erstellen';

  @override
  String get goalsEmptyBadge => 'Los geht\'s';

  @override
  String get goalsEmptyTitle => 'Noch keine Ziele';

  @override
  String get goalsEmptyMsg =>
      'Setz dir ein kleines Tagesziel – Pausey verfolgt es für dich.';

  @override
  String get goalsFilterEmpty => 'Keine Ziele für diesen Filter.';

  @override
  String get goalsNewGoal => 'Neues Ziel';

  @override
  String get goalsEditGoal => 'Ziel bearbeiten';

  @override
  String get goalsType => 'Zieltyp';

  @override
  String get goalsTypeFocus => 'Fokuszeit';

  @override
  String get goalsTypeSessions => 'Fokus-Sessions';

  @override
  String get goalsTypeBlock => 'Apps sperren';

  @override
  String get goalsTypePhoneFree => 'Handyfreie Tage';

  @override
  String get goalsTypeScreen => 'Bildschirmzeit-Limit';

  @override
  String get goalsCategory => 'Kategorie';

  @override
  String get goalsTarget => 'Zielwert';

  @override
  String get goalsPerDay => 'pro Tag';

  @override
  String get goalsPerWeek => 'Tage pro Woche';

  @override
  String get goalsMaxPerDay => 'max. pro Tag';

  @override
  String get goalsTitleOptional => 'Titel (optional)';

  @override
  String get goalsSave => 'Ziel speichern';

  @override
  String get goalsCreate => 'Ziel erstellen';

  @override
  String get goalsSavedSnack => 'Ziel gespeichert';

  @override
  String get goalsCreatedSnack => 'Ziel erstellt';

  @override
  String get goalsEdit => 'Bearbeiten';

  @override
  String get goalsDelete => 'Ziel löschen';

  @override
  String get goalsDeleteQ => 'Dieses Ziel löschen?';

  @override
  String get goalsDeleteMsg =>
      'Die Einträge werden entfernt. Das kann nicht rückgängig gemacht werden.';

  @override
  String get goalsDeletedSnack => 'Ziel gelöscht';

  @override
  String get goalsComplete => 'erreicht';

  @override
  String get goalsDaysActive => 'Aktive Tage';

  @override
  String get goalsTotalTime => 'Gesamtzeit';

  @override
  String get goalsSessionsLabel => 'Sessions';

  @override
  String get goals7Day => '7-Tage-Verlauf';

  @override
  String get goals7DaysAgo => 'Vor 7 Tagen';

  @override
  String get goalsToday => 'Heute';

  @override
  String goalsTodayDate(String date) {
    return 'Heute, $date';
  }

  @override
  String goalsYesterdayDate(String date) {
    return 'Gestern, $date';
  }

  @override
  String get goalsMilestones => 'Meilensteine';

  @override
  String get goalsMsFirst => 'Erster Tag geschafft';

  @override
  String get goalsMs3 => '3 Tage in Folge';

  @override
  String get goalsMsHalf => '50 % des Wochenziels';

  @override
  String get goalsMs5 => '5 Tage in Folge';

  @override
  String get goalsMsWeek => 'Ganze Woche geschafft';

  @override
  String get goalsMsLocked => 'Noch nicht';

  @override
  String get goalsHistory => 'Verlauf';

  @override
  String get goalsShowLess => 'Weniger';

  @override
  String get goalsStartSession => 'Fokus-Session starten';

  @override
  String get goalsManageApps => 'Gesperrte Apps verwalten';

  @override
  String get goalsBlockHint =>
      'Zählt automatisch, solange dein Sperrplan aktiv ist.';

  @override
  String goalsScreenToday(String used) {
    return 'Bildschirmzeit heute: $used';
  }

  @override
  String get goalsNotFound => 'Dieses Ziel gibt es nicht mehr.';

  @override
  String get goalsMore => 'Weitere Optionen';

  @override
  String goalsFreeLimit(int n) {
    return 'Gratis: bis zu $n Ziele';
  }

  @override
  String get homeGoodMorning => 'Guten Morgen';

  @override
  String get homeGoodAfternoon => 'Guten Tag';

  @override
  String get homeGoodEvening => 'Guten Abend';

  @override
  String get homeFriend => 'Hallo';

  @override
  String get homeTodayFocus => 'Fokus heute';

  @override
  String homeVsYesterday(String pct) {
    return '$pct % ggü. gestern';
  }

  @override
  String get homeStartToday => 'Heute noch kein Fokus';

  @override
  String get homeDayStreak => 'Tage in Folge';

  @override
  String get homeTodayGoal => 'Tagesziel';

  @override
  String homePctCompleted(int pct) {
    return '$pct % erledigt';
  }

  @override
  String get homeOnTrack => 'Im Plan!';

  @override
  String get homeKeepGoing => 'Weiter so';

  @override
  String get homeGoalMet => 'Ziel erreicht!';

  @override
  String get homeScreenTimeTitle => 'Bildschirmzeit';

  @override
  String get homeToday => 'Heute';

  @override
  String homeVsAvg(String pct) {
    return '$pct % ggü. Ø';
  }

  @override
  String get homeQuickStart => 'Fokus-Sitzung starten';

  @override
  String get homeManage => 'Verwalten';

  @override
  String get homeNoApps =>
      'Wähle die Apps, die dich am meisten ablenken, und sperre sie hier.';

  @override
  String get homeAddApps => 'Apps hinzufügen';

  @override
  String homeAppLocked(String app) {
    return '$app gesperrt';
  }

  @override
  String homeAppUnlocked(String app) {
    return '$app entsperrt';
  }

  @override
  String homeLockApp(String app) {
    return '$app sperren oder entsperren';
  }

  @override
  String get homeUpgradeTitle => 'Upgrade auf Premium';

  @override
  String get homeUpgradeBody => 'Unbegrenzte Sperren, Ziele & Analysen.';

  @override
  String get homeTryFree => 'Gratis testen';

  @override
  String get homePro => 'PRO';

  @override
  String get homeProActive => 'Pausey Pro ist aktiv';

  @override
  String get homeProActiveBody =>
      'Alles freigeschaltet. Danke für deine Unterstützung!';

  @override
  String get homeNotifications => 'Benachrichtigungen';

  @override
  String get homeNoNotifications => 'Alles erledigt.';

  @override
  String get homePushLabel => 'Push-Mitteilungen';

  @override
  String get homeFocusReminder => 'Tägliche Erinnerung';

  @override
  String get homeStreakAlerts => 'Serien-Hinweise';

  @override
  String get homePwTitle => 'Pausey Pro freischalten';

  @override
  String get homePwSubtitle =>
      'Hol dir deinen Fokus zurück und besiege die Handysucht.';

  @override
  String get homePwMonthly => 'Monatlich';

  @override
  String get homePwBilledMonthly => 'Monatliche Abrechnung';

  @override
  String get homePwYearly => 'Jährlich';

  @override
  String get homePwPopular => 'Beliebt';

  @override
  String homePwSave(int pct) {
    return '−$pct %';
  }

  @override
  String homePwBilledYearly(String price) {
    return '$price jährlich';
  }

  @override
  String get homePwLifetime => 'Lebenslang';

  @override
  String get homePwBestValue => 'Bester Wert';

  @override
  String get homePwPayOnce => 'Einmal zahlen, für immer';

  @override
  String get homePwPerMonth => '/ Monat';

  @override
  String get homePwOnce => 'einmalig';

  @override
  String get homePwStartTrial => '7 Tage gratis testen';

  @override
  String get homePwBuyLifetime => 'Lebenslang freischalten';

  @override
  String get homePwNoCharge => 'Heute kostenlos · Jederzeit kündbar';

  @override
  String get homePwOneTime => 'Einmalzahlung · Kein Abo';

  @override
  String get homePwFree => 'Gratis';

  @override
  String get homePwProCol => 'Pro';

  @override
  String get homePwFeatBlocking => 'Unbegrenzt Apps sperren';

  @override
  String get homePwFeatSessions => 'Alle Fokus-Modi';

  @override
  String get homePwFeatGoals => 'Unbegrenzte Ziele';

  @override
  String get homePwFeatAnalytics => 'Erweiterte Statistik';

  @override
  String get homePwFeatStreak => 'Serienschutz';

  @override
  String get homePwFeatSchedule => 'Fokus-Zeitplan';

  @override
  String get homePwFeatFaceId => 'Face-ID-Sperre';

  @override
  String get homePwFeatNotif => 'Smarte Hinweise';

  @override
  String homePwMax(int n) {
    return 'max. $n';
  }

  @override
  String get homePwSecure => 'Sichere Zahlung';

  @override
  String get homePwCancelAnytime => 'Jederzeit kündbar';

  @override
  String get homePwPrivacyFirst => 'Datenschutz zuerst';

  @override
  String get homePwRestore => 'Käufe wiederherstellen';

  @override
  String get homePwTerms => 'Nutzungsbedingungen';

  @override
  String get homePwPrivacyPolicy => 'Datenschutzerklärung';

  @override
  String get homePwWelcome => 'Willkommen bei Pausey Pro!';

  @override
  String get homePwNothingToRestore => 'Keine früheren Käufe gefunden.';

  @override
  String get homePwRestored => 'Dein Pro-Zugang ist aktiv.';

  @override
  String get homePwLinkSoon => 'Diese Seite öffnet bald auf unserer Website.';

  @override
  String get homePwYouArePro => 'Du bist Pro – viel Spaß!';

  @override
  String get homePwClose => 'Schließen';

  @override
  String get homeAvgLegend => '7-Tage-Schnitt';

  @override
  String homeGoalOf(String done, String goal) {
    return '$done von $goal';
  }

  @override
  String get homeBest => 'Bestwert:';

  @override
  String get homeMyApps => 'Meine Apps';

  @override
  String get homeManageApps => 'Apps verwalten';

  @override
  String get homeUnblockApps => 'Apps freigeben';

  @override
  String homeAppsLocked(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Apps gesperrt',
      one: '1 App gesperrt',
    );
    return '$_temp0';
  }

  @override
  String homeAppNamesMore(String names, int count) {
    return '$names +$count';
  }

  @override
  String get homeNoLockedApps => 'Noch keine Apps gesperrt';

  @override
  String get homeNoLockedAppsSub => 'Wähle die Apps, die dich reinziehen';

  @override
  String get insightsAnalytics => 'Analysen';

  @override
  String get insightsScreenTime => 'Bildschirmzeit';

  @override
  String get insightsToday => 'Heute';

  @override
  String get insightsWeek => 'Woche';

  @override
  String get insightsMonth => 'Monat';

  @override
  String get insightsProductivity => 'Produktivitätswert';

  @override
  String insightsPts(String delta) {
    return '$delta Pkt.';
  }

  @override
  String get insightsVsLastWeek => 'ggü. Vorwoche';

  @override
  String get insightsVsLastMonth => 'ggü. Vormonat';

  @override
  String insightsScoreDays(int n) {
    return '$n-Tage-Wert';
  }

  @override
  String get insightsFocusHours => 'Fokusstunden';

  @override
  String get insightsThisWeek => 'diese Woche';

  @override
  String get insightsThisMonth => 'diesen Monat';

  @override
  String insightsGoalOf(String done, String goal) {
    return '$done / $goal Ziel';
  }

  @override
  String get insightsFocusScore => 'Fokus';

  @override
  String get insightsGoals => 'Ziele';

  @override
  String get insightsConsistency => 'Konstanz';

  @override
  String get insightsWeeklyFocus => 'Fokusstunden der Woche';

  @override
  String insightsDailyFocus(int n) {
    return 'Tagesfokus, letzte $n Tage';
  }

  @override
  String insightsBestDay(String day, String time) {
    return 'Bester Tag: $day · $time';
  }

  @override
  String insightsAvgDay(String time) {
    return 'Ø $time / Tag';
  }

  @override
  String get insightsMonthlyTrends => 'Monatstrends';

  @override
  String get insightsActual => 'Ist';

  @override
  String get insightsGoal => 'Ziel';

  @override
  String insightsWk(int n) {
    return 'W$n';
  }

  @override
  String insightsWeekBeat(int n, String time) {
    return 'Woche $n hat das Ziel um $time übertroffen';
  }

  @override
  String insightsWeekShort(int n, String time) {
    return 'Beste Woche: $n, $time unter dem Ziel';
  }

  @override
  String get insightsGoalCompletion => 'Zielerreichung';

  @override
  String insightsDaysOf(int done, int total) {
    return '$done/$total Tage';
  }

  @override
  String get insightsNoGoals =>
      'Noch keine Ziele. Füge eins hinzu, um hier deinen Fortschritt zu sehen.';

  @override
  String get insightsManageGoals => 'Verwalten';

  @override
  String insightsGoalFocus(String hours) {
    return 'Täglicher Fokus: $hours Stunden';
  }

  @override
  String get insightsGoalBlock => 'Social-Apps sperren';

  @override
  String insightsGoalPomo(int n) {
    return '$n Pomodoros pro Tag';
  }

  @override
  String insightsGoalScreen(String time) {
    return 'Unter $time Bildschirmzeit';
  }

  @override
  String get insightsGoalPhoneFree => 'Handyfreie Zeit';

  @override
  String get insightsEmptyBadge => 'Noch keine Sessions';

  @override
  String get insightsEmptyTitle => 'Deine Statistik beginnt mit einer Session';

  @override
  String get insightsEmptyBody =>
      'Schließe eine Fokus-Session ab, dann erscheinen hier Werte, Diagramme und Ziele.';

  @override
  String get insightsEmptyCta => 'Fokus-Session starten';

  @override
  String get insightsDailyUsage => 'Tägliche Nutzung';

  @override
  String get insightsFocusTime => 'Fokuszeit';

  @override
  String get insightsVsAvg => 'ggü. Ø';

  @override
  String get insightsUsageByDay => 'Nutzung pro Tag';

  @override
  String get insightsUsageByWeek => 'Nutzung pro Woche';

  @override
  String get insightsUsage => 'Nutzung';

  @override
  String insightsTrend(int n) {
    return '$n-Tage-Trend';
  }

  @override
  String get insightsImproving => 'Besser';

  @override
  String get insightsRising => 'Steigend';

  @override
  String insightsDaysAgo(int n) {
    return 'Vor $n Tagen';
  }

  @override
  String get insightsMostUsed => 'Meistgenutzte Apps';

  @override
  String get insightsAllApps => 'Alle Apps';

  @override
  String get insightsBreakdown => 'Aufteilung';

  @override
  String get insightsTotal => 'gesamt';

  @override
  String get insightsNoUsage => 'Keine Bildschirmzeit in diesem Zeitraum.';

  @override
  String get insightsLockApp => 'Diese App sperren';

  @override
  String insightsLocked(String app) {
    return '$app ist jetzt gesperrt';
  }

  @override
  String get insightsCatSocial => 'Social';

  @override
  String get insightsCatVideo => 'Video';

  @override
  String get insightsCatGames => 'Spiele';

  @override
  String get insightsCatShopping => 'Shopping';

  @override
  String get insightsCatCommunity => 'Community';

  @override
  String get insightsCatOther => 'Sonstige';

  @override
  String nativeBlockTitle(String app) {
    return '$app ist pausiert';
  }

  @override
  String get nativeReasonLimit =>
      'Die heutige Zeit für diese App ist aufgebraucht.';

  @override
  String get nativeReasonSchedule => 'Gerade ist ein Sperrzeitplan aktiv.';

  @override
  String get nativeReasonGlobal => 'Diese App ist in Pausey gesperrt.';

  @override
  String get nativeReasonFocus => 'Du bist in einer Fokus-Sitzung.';

  @override
  String get nativeClose => 'App schließen';

  @override
  String get nativeNotifTitle => 'Pausey achtet auf deine Limits';

  @override
  String get nativeNotifText => 'App-Limits und Sperrzeiten sind aktiv';

  @override
  String get profileSettings => 'Einstellungen';

  @override
  String get profileGuestName => 'Gast';

  @override
  String get profileGuestBadge => 'Gast · auf diesem Handy gespeichert';

  @override
  String get profileEditName => 'Namen ändern';

  @override
  String get profileNameHint => 'Dein Name';

  @override
  String get profileSave => 'Speichern';

  @override
  String profileMemberSince(String date) {
    return 'Mitglied seit $date';
  }

  @override
  String get profileProActive => 'Pro · Aktiv';

  @override
  String get profileFree => 'Gratis-Tarif';

  @override
  String get profileUpgrade => 'Upgrade';

  @override
  String get profileBadges => 'Abzeichen';

  @override
  String get profileNoBadges =>
      'Schließe Sitzungen ab, um Abzeichen zu verdienen';

  @override
  String get profileFocusTime => 'Fokuszeit';

  @override
  String get profileGoalsDone => 'Ziele erreicht';

  @override
  String get profileDayStreak => 'Tage in Folge';

  @override
  String get profileAppsBlocked => 'Gesperrte Apps';

  @override
  String get profileFocusActivity => 'Fokus-Aktivität';

  @override
  String get profileLast4Weeks => 'Letzte 4 Wochen';

  @override
  String get profileRecentActivity => 'Letzte Aktivität';

  @override
  String get profileSessionDone => 'Fokus-Sitzung abgeschlossen';

  @override
  String get profileSessionStopped => 'Sitzung vorzeitig beendet';

  @override
  String get profileModePomodoro => 'Pomodoro';

  @override
  String get profileModeDeep => 'Deep Work';

  @override
  String get profileModeCustom => 'Eigene';

  @override
  String get profileJustNow => 'Gerade eben';

  @override
  String profileAgoMinutes(int n) {
    return 'vor $n Min.';
  }

  @override
  String profileAgoHours(int n) {
    return 'vor $n Std.';
  }

  @override
  String get profileYesterday => 'Gestern';

  @override
  String get profileEmptyTitle => 'Noch keine Sitzungen';

  @override
  String get profileEmptyBody =>
      'Starte deine erste Sitzung – Aktivität, Serie und Abzeichen erscheinen dann hier.';

  @override
  String get profileStartFocus => 'Fokus starten';

  @override
  String get profileMyGoals => 'Meine Ziele';

  @override
  String get profileStreaks => 'Serien & Abzeichen';

  @override
  String get profileSubscription => 'Abo';

  @override
  String get profileSignOutTitle => 'Abmelden?';

  @override
  String get profileSignOutBody => 'Du kannst dich jederzeit wieder anmelden.';

  @override
  String get profileSecNotifications => 'Mitteilungen';

  @override
  String get profileSecAppearance => 'Darstellung';

  @override
  String get profileSecFocus => 'Fokus & Sperren';

  @override
  String get profileSecPrivacy => 'Datenschutz & Sicherheit';

  @override
  String get profileSecAccount => 'Konto';

  @override
  String get profilePush => 'Push-Mitteilungen';

  @override
  String get profilePushSub => 'Erinnerungen & Hinweise';

  @override
  String get profileReminder => 'Start-Erinnerung';

  @override
  String profileReminderSub(String time) {
    return 'Täglich um $time';
  }

  @override
  String get profileStreakAlerts => 'Serien-Hinweise';

  @override
  String get profileStreakAlertsSub => 'Bevor deine Serie reißt';

  @override
  String get profileGoalMilestones => 'Ziel-Meilensteine';

  @override
  String get profileGoalMilestonesSub => 'Wenn du ein Ziel erreichst';

  @override
  String get profileDarkMode => 'Dunkelmodus';

  @override
  String get profileOn => 'An';

  @override
  String get profileOff => 'Aus';

  @override
  String get profileTextSize => 'Textgröße';

  @override
  String get profileTextSmall => 'Klein';

  @override
  String get profileTextMedium => 'Mittel';

  @override
  String get profileTextLarge => 'Groß';

  @override
  String get profileTextHuge => 'Sehr groß';

  @override
  String get profilePomodoroLen => 'Pomodoro-Dauer';

  @override
  String get profileBreakLen => 'Pausendauer';

  @override
  String profileMinutes(int n) {
    return '$n Min.';
  }

  @override
  String get profileFaceIdUnlock => 'Face ID zum Entsperren';

  @override
  String get profileFaceIdUnlockSub => 'Vor dem Entsperren bestätigen';

  @override
  String get profileBypass => 'Notfall-Entsperrung';

  @override
  String profileBypassSub(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Entsperrungen pro Tag',
      one: '1 Entsperrung pro Tag',
    );
    return '$_temp0';
  }

  @override
  String get profileAppLock => 'Pausey mit Face ID sperren';

  @override
  String get profileAppLockSub => 'Beim Öffnen fragen';

  @override
  String get profileHideUsage => 'Nutzungsdaten ausblenden';

  @override
  String get profileHideUsageSub => 'Bildschirmzeit ausblenden';

  @override
  String get profileClearData => 'Aktivitätsdaten löschen';

  @override
  String get profileClearDataSub => 'Entfernt Sitzungen und Zielverlauf';

  @override
  String get profileClearTitle => 'Aktivitätsdaten löschen?';

  @override
  String get profileClearBody =>
      'Alle Fokus-Sitzungen und Ziel-Häkchen auf diesem Handy werden gelöscht. Das lässt sich nicht rückgängig machen.';

  @override
  String get profileClear => 'Löschen';

  @override
  String get profileCleared => 'Aktivitätsdaten gelöscht';

  @override
  String get profileExport => 'Meine Daten exportieren';

  @override
  String get profileExportSub => 'Als JSON kopieren';

  @override
  String get profileExported => 'Deine Daten wurden kopiert';

  @override
  String get profileStreaksTitle => 'Serien';

  @override
  String get profileShare => 'Teilen';

  @override
  String profileShareText(int n) {
    return 'Ich bin seit $n Tagen in Folge fokussiert mit Pausey!';
  }

  @override
  String get profileCopied => 'In die Zwischenablage kopiert';

  @override
  String profileNextMilestone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Tage',
      one: '1 Tag',
    );
    return 'Weiter so – noch $_temp0 bis zum nächsten Meilenstein!';
  }

  @override
  String get profileAllMilestones => 'Alle Meilensteine erreicht. Legendär!';

  @override
  String get profileStartStreak =>
      'Schließe heute eine Sitzung ab, um eine Serie zu starten.';

  @override
  String get profileBest => 'Rekord';

  @override
  String get profileThisWeek => 'Diese Woche';

  @override
  String profileDaysCompleted(int n) {
    return '$n/7 Tage geschafft';
  }

  @override
  String get profileCompleted => 'Geschafft';

  @override
  String get profilePartial => 'Teilweise';

  @override
  String get profileMissed => 'Verpasst';

  @override
  String get profilePrevMonth => 'Vorheriger Monat';

  @override
  String get profileNextMonth => 'Nächster Monat';

  @override
  String get profileMilestones => 'Serien-Meilensteine';

  @override
  String get profileAchievements => 'Erfolge';

  @override
  String get profileAchOnFire => 'Feuer & Flamme';

  @override
  String get profileAchIronWill => 'Eiserner Wille';

  @override
  String get profileAchFocusMaster => 'Fokus-Meister';

  @override
  String get profileAchMonk => 'Digitaler Mönch';

  @override
  String get profileAchLegend => 'Legendär';

  @override
  String get profileAchSpeed => 'Turbo';

  @override
  String profileAchStreakDesc(int n) {
    return '$n Tage in Folge';
  }

  @override
  String profileAchSessionsDesc(int n) {
    return '$n Sitzungen geschafft';
  }

  @override
  String profileAchHoursDesc(int n) {
    return '$n Std. Fokus';
  }

  @override
  String profileAchDayDesc(int n) {
    return '$n Sitzungen an einem Tag';
  }

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

  @override
  String get statesTitle => 'Zustände';

  @override
  String get statesSubtitle => 'Fehler-, Leer- und Ladeansichten';

  @override
  String get statesNoInternet => 'Kein Internet';

  @override
  String get statesConnectionLost => 'Verbindung verloren';

  @override
  String get statesOfflineTitle => 'Du bist offline';

  @override
  String get statesOfflineMsg =>
      'Pausey erreicht den Server gerade nicht. Prüfe WLAN oder mobile Daten und versuche es erneut – deine lokalen Daten sind sicher.';

  @override
  String get statesTryAgain => 'Erneut versuchen';

  @override
  String get statesOpenSettings => 'Einstellungen öffnen';

  @override
  String get statesOfflineMode => 'Offline-Modus aktiv';

  @override
  String get statesLimited => 'Eingeschränkt';

  @override
  String get statesAvailable => 'Verfügbar';

  @override
  String get statesUnavailable => 'Nicht verfügbar';

  @override
  String get statesCapSessions => 'Frühere Sitzungen ansehen';

  @override
  String get statesCapApps => 'Liste gesperrter Apps';

  @override
  String get statesCapTimer => 'Lokaler Fokus-Timer';

  @override
  String get statesCapSync => 'Serie & Ziele synchronisieren';

  @override
  String get statesCapAnalytics => 'Statistik aktualisieren';

  @override
  String get statesOfflineNote =>
      'Alle Fokusdaten sind lokal gespeichert. Offline geht nichts verloren.';

  @override
  String get statesBackOnline => 'Wieder online – alles synchronisiert';

  @override
  String get statesShowAgain => 'Erneut zeigen';

  @override
  String get statesPermDenied => 'Berechtigung verweigert';

  @override
  String get statesPermRequired => 'Berechtigung nötig';

  @override
  String get statesPermTitle => 'Zugriff blockiert';

  @override
  String get statesPermMsg =>
      'Pausey braucht Bildschirmzeit-Zugriff, um Apps zu sperren. Ohne ihn funktioniert das Sperren nicht.';

  @override
  String get statesGrant => 'Zugriff erlauben';

  @override
  String get statesLearnMore => 'Mehr erfahren';

  @override
  String get statesLearnMoreMsg =>
      'Mit Bildschirmzeit kann Pausey ablenkende Apps pausieren. Deine Daten bleiben auf dem Handy.';

  @override
  String get statesRequiredPerms => 'Nötige Berechtigungen';

  @override
  String get statesPermNotif => 'Mitteilungen';

  @override
  String get statesPermScreenTime => 'Bildschirmzeit-Zugriff';

  @override
  String get statesPermUsage => 'Nutzungsstatistik';

  @override
  String get statesPermBio => 'Face ID / Biometrie';

  @override
  String get statesGranted => 'Erlaubt';

  @override
  String get statesDenied => 'Verweigert';

  @override
  String get statesPermNote =>
      'Ohne Bildschirmzeit laufen Fokus-Timer, aber Apps werden nicht gesperrt.';

  @override
  String get statesAccessGranted => 'Zugriff erlaubt – Sperren bereit';

  @override
  String get statesDataNA => 'Daten nicht verfügbar';

  @override
  String get statesSyncFailed => 'Sync fehlgeschlagen';

  @override
  String get statesLoadTitle => 'Daten konnten nicht laden';

  @override
  String get statesLoadMsg =>
      'Beim Laden deiner Statistik ist etwas schiefgelaufen. Vermutlich nur kurz – deine lokalen Daten sind unberührt.';

  @override
  String get statesRetrySync => 'Erneut syncen';

  @override
  String get statesUseCached => 'Cache nutzen';

  @override
  String get statesErrorDetails => 'Fehlerdetails';

  @override
  String get statesErrorCode => 'Fehlercode';

  @override
  String get statesTimestamp => 'Zeit';

  @override
  String get statesRetryCount => 'Versuche';

  @override
  String statesAttempts(int n) {
    return '$n / 3 Versuche';
  }

  @override
  String get statesReport => 'An Support melden';

  @override
  String get statesReported => 'Danke – Bericht gesendet';

  @override
  String get statesCachedNote =>
      'Bis dahin sind die Daten der letzten Synchronisierung verfügbar.';

  @override
  String get statesDataLoaded => 'Statistik geladen';

  @override
  String get statesCachedShown => 'Zwischengespeicherte Daten';

  @override
  String statesWeekFocus(String time) {
    return 'Fokus diese Woche: $time';
  }

  @override
  String get statesEmpty => 'Leerzustand';

  @override
  String get statesNothingYet => 'Noch nichts';

  @override
  String get statesEmptyTitle => 'Noch keine Sitzungen';

  @override
  String get statesEmptyMsg =>
      'Starte deine erste Fokus-Sitzung – dein Fortschritt erscheint hier.';

  @override
  String get statesStartFocus => 'Fokus starten';

  @override
  String get statesLoadingSection => 'Ladezustände';

  @override
  String get statesDashLoading => 'Übersicht';

  @override
  String get statesAnalyticsLoading => 'Statistik';

  @override
  String get statesGoalsLoading => 'Ziele';

  @override
  String get statesProfileLoading => 'Profil';

  @override
  String get statesCrunching => 'Daten werden berechnet…';

  @override
  String get statesLoadingGoals => 'Ziele werden geladen…';

  @override
  String get statesLoadingProfile => 'Profil wird geladen…';

  @override
  String get statesReplay => 'Wiederholen';

  @override
  String get stHowCaption => 'So funktioniert\'s';

  @override
  String stHow1(String app) {
    return 'Du öffnest wieder $app';
  }

  @override
  String get stHow2 => 'Du scrollst los, aber…';

  @override
  String get stHow3 => 'Pausey blockiert sie ganz sanft.';

  @override
  String stBlockedTitle(String app) {
    return '$app ist blockiert';
  }

  @override
  String get stHow4 => 'Und erinnert vor dem Limit';

  @override
  String get stYourApp => 'deine App';

  @override
  String get stTapToContinue => 'Tippen zum Fortfahren';

  @override
  String get stNudgeGeneric => 'Fast am Tageslimit';

  @override
  String get stPermTitle => 'Erlaube ein paar Berechtigungen';

  @override
  String get stPermUsageTitle => 'Bildschirmzeit';

  @override
  String get stPermUsageWhy =>
      'Zeigt deine tägliche Bildschirmzeit und wann ein Limit erreicht ist.';

  @override
  String get stPermOverlayTitle => 'Über anderen Apps einblenden';

  @override
  String get stPermOverlayWhy =>
      'Damit Pausey seinen Pausenbildschirm über einer ablenkenden App zeigen kann.';

  @override
  String get stPermNotifTitle => 'Mitteilungen';

  @override
  String get stPermNotifWhy =>
      'Sanfte Hinweise, bevor ein Limit abläuft. Du kannst das später ausschalten.';

  @override
  String get stPermMore => 'Noch eine Sache …';

  @override
  String get stPermA11yTitle => 'Bedienungshilfen';

  @override
  String get stPermA11yWhy =>
      'Erkennt sofort, welche App offen ist – so greift die Pause direkt.';

  @override
  String get stPermA11yNote =>
      'Manche Handys zeigen danach einen eigenen Warnhinweis. Das ist normal – du kannst es jederzeit in den Einstellungen ausschalten.';

  @override
  String get stPermOnHint =>
      'Schon an. Zum Ausschalten: Android-Einstellungen › Apps › Pausey.';

  @override
  String get stA11yDialogTitle => 'Warum Bedienungshilfen?';

  @override
  String get stA11yDialogBody =>
      'Pausey nutzt Bedienungshilfen nur, um zu erkennen, welche App offen ist – damit deine Limits und Zeitpläne sofort greifen und der Schutz zuverlässig läuft.';

  @override
  String get stA11yNot => 'Was Pausey NICHT macht:';

  @override
  String get stA11yNot1 => 'Inhalte auf deinem Bildschirm lesen oder sammeln';

  @override
  String get stA11yNot2 => 'Persönliche Daten speichern';

  @override
  String get stA11yNot3 => 'Irgendetwas von deinem Handy weitergeben';

  @override
  String get stPw1 => 'Dein Plan für einen ruhigeren Tag';

  @override
  String get stPw2 => 'Sperren, die du dir nicht ausreden kannst';

  @override
  String get stPw3 => 'Sieh deinen Fortschritt Woche für Woche';

  @override
  String get stPwToday => 'Heute';

  @override
  String get stPwGoal => 'Dein Ziel';

  @override
  String stPwWeek(int n) {
    return 'W$n';
  }

  @override
  String get stPwFirstWeek => 'Deine erste Woche beginnt jetzt';

  @override
  String get stPwFocusWeek => 'Fokuszeit pro Woche';

  @override
  String nudgeTitle(String app) {
    return 'Fast am $app-Limit';
  }

  @override
  String nudgeText(String used, String limit) {
    return 'Heute $used von $limit genutzt';
  }

  @override
  String homeWaitFor(int s) {
    return 'Warte $s s';
  }

  @override
  String get homeWaitHint => 'Atme durch. Brauchst du es wirklich jetzt?';

  @override
  String get homeUnblockAllFor => 'Alle Apps freigeben für…';

  @override
  String get homeUnblock => 'Freigeben';

  @override
  String get homeNevermind => 'Doch nicht';

  @override
  String homeMinutesN(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Minuten',
      one: '1 Minute',
    );
    return '$_temp0';
  }

  @override
  String homeUnblockedLeft(String time) {
    return 'Frei · noch $time';
  }
}
