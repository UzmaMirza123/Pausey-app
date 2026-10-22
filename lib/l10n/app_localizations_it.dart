// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get ob1Title => 'Riduci la dipendenza dallo schermo';

  @override
  String get ob1Body =>
      'Prendi il controllo delle tue abitudini digitali e passa meno tempo sulle app che distraggono.';

  @override
  String get ob1StatAvg => 'Tempo medio giornaliero sullo schermo';

  @override
  String get ob1StatSocial => 'Speso sui social';

  @override
  String get ob1ArtNote1 => 'Meno scroll';

  @override
  String get ob1ArtNote2 => 'Più te';

  @override
  String get ob1BookFocus => 'Concentrazione';

  @override
  String get ob1BookBalance => 'Equilibrio';

  @override
  String get ob1BookHappier => 'Te più felice';

  @override
  String get ob2SelectApps => 'Seleziona app';

  @override
  String get ob2Title => 'Blocca le app che distraggono';

  @override
  String get ob2Body =>
      'Blocca social, giochi e altre distrazioni con potenti strumenti di blocco delle app.';

  @override
  String get ob2Feature1 => 'Blocca qualsiasi app con un tocco';

  @override
  String get ob2Feature2 => 'Programma orari di blocco e concentrazione';

  @override
  String get ob2Feature3 =>
      'Proteggi i blocchi con una password per restare costante';

  @override
  String get sheetTitle => 'Seleziona app';

  @override
  String get sheetTotalLocked => 'Totale bloccate';

  @override
  String get sheetAppsSelected => 'app selezionate';

  @override
  String get sheetTimeSaved => 'Tempo risparmiato';

  @override
  String get sheetPerDayAvg => 'media al giorno';

  @override
  String sheetHoursValue(String h) {
    return '$h h';
  }

  @override
  String get sheetSearchHint => 'Cerca app...';

  @override
  String get sheetCatAll => 'Tutte';

  @override
  String get sheetCatSocial => 'Social';

  @override
  String get sheetCatEntertainment => 'Intrattenimento';

  @override
  String get sheetCatGames => 'Giochi';

  @override
  String get sheetAppsHeader => 'APP';

  @override
  String sheetSelectedCount(int count) {
    return '$count selezionate';
  }

  @override
  String get sheetNoApps => 'Nessuna app trovata';

  @override
  String get sheetLockSchedule => 'PROGRAMMA DI BLOCCO';

  @override
  String get sheetAddCustomSemantic => 'Aggiungi un programma personalizzato';

  @override
  String get sheetCustomBadge => '+ Personalizzato';

  @override
  String get sheetSchedMorning => 'Mattina';

  @override
  String get sheetSchedWork => 'Lavoro';

  @override
  String get sheetSchedEvening => 'Sera';

  @override
  String get sheetEveryDay => 'Ogni giorno';

  @override
  String get sheetWeekdays => 'Giorni feriali';

  @override
  String get sheetWeekends => 'Weekend';

  @override
  String get sheetUnlockMethod => 'METODO DI SBLOCCO';

  @override
  String get sheetPin => 'Codice PIN';

  @override
  String get sheetPinSub => 'PIN di 4 cifre';

  @override
  String get sheetFaceId => 'Face ID';

  @override
  String get sheetFaceIdSub => 'Biometrico';

  @override
  String get sheetTouchId => 'Touch ID';

  @override
  String get sheetTouchIdSub => 'Impronta digitale';

  @override
  String get sheetFooter => 'Puoi sempre cambiarlo in seguito';

  @override
  String get sheetConfirmLock => 'Conferma blocco';

  @override
  String sheetRemove(String name) {
    return 'Rimuovi $name';
  }

  @override
  String get sheetCustomTitle => 'Programma personalizzato';

  @override
  String get sheetCustomBody =>
      'Le app selezionate restano bloccate durante questo periodo.';

  @override
  String get sheetNameLabel => 'NOME';

  @override
  String get sheetNameHint => 'es. Studio';

  @override
  String get sheetStarts => 'Inizio';

  @override
  String get sheetEnds => 'Fine';

  @override
  String get sheetSameTime => 'Inizio e fine coincidono';

  @override
  String sheetLockedFor(String duration) {
    return 'Bloccato per $duration';
  }

  @override
  String sheetLockedForOvernight(String duration) {
    return 'Bloccato per $duration (di notte)';
  }

  @override
  String sheetDurH(int h) {
    return '$h h';
  }

  @override
  String sheetDurM(int m) {
    return '$m min';
  }

  @override
  String sheetDurHM(int h, int m) {
    return '$h h $m min';
  }

  @override
  String get sheetLockStartsAt => 'IL BLOCCO INIZIA ALLE';

  @override
  String get sheetLockEndsAt => 'IL BLOCCO FINISCE ALLE';

  @override
  String get sheetRepeatOn => 'RIPETI IL';

  @override
  String get sheetAddSchedule => 'Aggiungi programma';

  @override
  String get sheetCustomDefaultName => 'Personalizzato';

  @override
  String sheetChangeTime(String label, String time) {
    return '$label $time. Cambia orario';
  }

  @override
  String get ob3Title => 'Resta concentrato ogni giorno';

  @override
  String get ob3Body =>
      'Usa le sessioni Pomodoro e Focus profondo per aumentare la produttività e ottenere di più.';

  @override
  String get ob3Pomodoro => 'Pomodoro';

  @override
  String ob3PomodoroSub(int min) {
    return 'Sessioni da $min min';
  }

  @override
  String get ob3DeepFocus => 'Focus profondo';

  @override
  String ob3DeepFocusSub(int min) {
    return 'Flow da $min min';
  }

  @override
  String get ob3StatBoost => 'più produttività';

  @override
  String ob3StatStreakValue(int days) {
    return '$days giorni';
  }

  @override
  String get ob3StatStreak => 'serie in corso';

  @override
  String get ob3StatGoal => 'obiettivi raggiunti';

  @override
  String get ob3StartTimer => 'Avvia timer';

  @override
  String get ob3PauseTimer => 'Metti in pausa';

  @override
  String get ob4Title => 'Monitora i tuoi progressi';

  @override
  String get ob4Body =>
      'Monitora tempo di utilizzo, ore di concentrazione, obiettivi e produttività con statistiche bellissime.';

  @override
  String get ob4Weekly => 'Settimanali';

  @override
  String get ob4WeeklySub => 'report';

  @override
  String get ob4Goals => 'Obiettivi';

  @override
  String get ob4GoalsSub => 'tracker';

  @override
  String get ob4Insights => 'Approfondimenti';

  @override
  String get ob4InsightsSub => 'coach IA';

  @override
  String get ob4Streaks => 'Serie';

  @override
  String get ob4StreaksSub => 'e badge';

  @override
  String get ob3RingStreak => 'giorni di fila';

  @override
  String ob3RingSessions(int done, int total) {
    return '$done di $total sessioni';
  }

  @override
  String get ob3RingTagline => 'La concentrazione\nti rende migliore';

  @override
  String get ob4ArtScore => 'punteggio';

  @override
  String get ob4ArtProductivity => 'Produttività';

  @override
  String get ob5Title => 'Qual è il tuo tempo di utilizzo medio giornaliero?';

  @override
  String get ob5Subtitle => 'Solo sul telefono. Va bene anche una stima.';

  @override
  String get ob5More7 => 'Più di 7 ore';

  @override
  String get ob5H5to7 => '5-7 ore';

  @override
  String get ob5H4to5 => '4-5 ore';

  @override
  String get ob5H3to4 => '3-4 ore';

  @override
  String get ob5H1to3 => '1-3 ore';

  @override
  String get ob5Under1 => 'Meno di 1 ora';

  @override
  String get ob6Title => 'Qual è la tua professione?';

  @override
  String get ob6Subtitle =>
      'Personalizzeremo il tuo piano di concentrazione in base al tuo stile di lavoro.';

  @override
  String get ob6Software => 'Sviluppo software';

  @override
  String get ob6Founder => 'CEO / Fondatore';

  @override
  String get ob6Remote => 'Lavoro da remoto';

  @override
  String get ob6Finance => 'Finanza / Operazioni / Consulenza';

  @override
  String get ob6Art => 'Arte / Contenuti';

  @override
  String get ob6Education => 'Istruzione';

  @override
  String get ob6Others => 'Altro';

  @override
  String get ob7Title => 'Obiettivo schermo giornaliero';

  @override
  String get ob7Subtitle =>
      'Puoi cambiarlo quando vuoi. Ti avviseremo quando ti avvicini.';

  @override
  String ob7Hours(String hours) {
    return '$hours h';
  }

  @override
  String get ob7PerDay => 'al giorno';

  @override
  String ob7HoursPerDay(String hours) {
    return '$hours al giorno';
  }

  @override
  String get ob7DialLabel => 'Obiettivo giornaliero di tempo schermo';

  @override
  String get ob7InfoNote =>
      'In media si passano più di 4 ore al giorno sul telefono. Fissare un obiettivo è il primo passo per riprenderti il tuo tempo.';

  @override
  String get ob8Title => 'Attiva le autorizzazioni essenziali';

  @override
  String get ob8Subtitle =>
      'Concedi l\'accesso per sfruttare Pausey al massimo.';

  @override
  String get ob8UsageTitle => 'Accesso all\'utilizzo';

  @override
  String get ob8UsageSub =>
      'Monitora l\'uso delle app e applica le sessioni di concentrazione.';

  @override
  String get ob8NotifTitle => 'Notifiche';

  @override
  String get ob8NotifSub => 'Promemoria puntuali e avvisi sui progressi.';

  @override
  String get ob8TrackTitle => 'Monitora l\'uso delle app';

  @override
  String get ob8TrackSub => 'Riepiloghi giornalieri e settimanali.';

  @override
  String get ob9Title => 'Tutto pronto!';

  @override
  String get ob9Subtitle => 'Il tuo spazio di concentrazione è pronto.';

  @override
  String get ob9Enter => 'Entra in Pausey';

  @override
  String get ob9Replay => 'Rivedi l\'introduzione';

  @override
  String get ob9ScreenTime => 'Tempo di utilizzo';

  @override
  String get ob9AppsLocked => 'App bloccate';

  @override
  String get ob9Permissions => 'Autorizzazioni';

  @override
  String get ob9FocusMode => 'Modalità focus';

  @override
  String get ob9AllOk => 'Tutto OK';

  @override
  String get ob9On => 'ATTIVA';

  @override
  String get ob9Done => 'FATTO';

  @override
  String get ob9StreakTitle => 'La tua serie del giorno 1 inizia ora';

  @override
  String get ob9StreakSub => 'Completa una sessione per mantenerla';

  @override
  String alSummary(int locked, int total) {
    return '$locked limitate ora · $total gestite';
  }

  @override
  String alSummaryOff(int total) {
    return '$total gestite · blocco inattivo';
  }

  @override
  String get alFromInstalled => 'Scegli dalle app installate';

  @override
  String get alFromInstalledSub => 'Qualsiasi app del telefono';

  @override
  String get alPermTitle => 'Il blocco non è ancora attivo';

  @override
  String get alPermMsg =>
      'Le regole sono salvate, ma Pausey può bloccare solo dopo questi due permessi:';

  @override
  String get alPermUsage => 'Accesso all\'utilizzo';

  @override
  String get alPermUsageSub => 'Vede l\'app aperta e il tempo di oggi';

  @override
  String get alPermOverlay => 'Mostra sopra altre app';

  @override
  String get alPermOverlaySub => 'Mostra la schermata di blocco';

  @override
  String get alAllow => 'Consenti';

  @override
  String get alAllowed => 'Consentito';

  @override
  String get alPermReturn => 'Poi torna su Pausey: il controllo è automatico.';

  @override
  String get alAndroidOnly =>
      'Il blocco funziona solo su Android. Puoi comunque impostare le regole qui.';

  @override
  String get alSearchHint => 'Cerca app';

  @override
  String get alFilterAll => 'Tutte';

  @override
  String get alFilterLocked => 'Bloccate';

  @override
  String get alFilterScheduled => 'Pianificate';

  @override
  String get alFilterAvailable => 'Libere';

  @override
  String get alStateLocked => 'Bloccata';

  @override
  String get alStateWillLock => 'Da bloccare';

  @override
  String get alStateScheduled => 'Pianificata';

  @override
  String get alStateAvailable => 'Libera';

  @override
  String alUsedOf(String used, String limit) {
    return 'Usati $used su $limit';
  }

  @override
  String alUsedToday(String used) {
    return 'Oggi $used';
  }

  @override
  String get alNoLimit => 'Nessun limite';

  @override
  String alLimitNoUsage(String limit) {
    return 'Limite $limit · uso non disp.';
  }

  @override
  String get alRulesOff => 'Limiti disattivati';

  @override
  String alNextLock(String time) {
    return 'Prossimo blocco: $time';
  }

  @override
  String alUnlockedUntil(String time) {
    return 'Sbloccata fino alle $time';
  }

  @override
  String get alReasonLimit => 'Limite raggiunto';

  @override
  String get alReasonSchedule => 'Fascia di blocco attiva';

  @override
  String get alReasonGeneral => 'Orario generale attivo';

  @override
  String get alReasonAllDay => 'Bloccata tutto il giorno';

  @override
  String get alReasonFocus => 'Sessione di focus in corso';

  @override
  String get alNoMatches => 'Nessuna app trovata';

  @override
  String get alGeneral => 'Generale';

  @override
  String get alGeneralScheduleSub => 'Per le app con «Segui orario generale»';

  @override
  String get alLockAllSub => 'Attiva i limiti per tutte le app';

  @override
  String get alSaved => 'Salvato';

  @override
  String get alChangesApply => 'Le modifiche valgono subito';

  @override
  String get alDetailsTitle => 'Limiti app';

  @override
  String get alBlockingOff => 'Il blocco è inattivo su questo telefono';

  @override
  String get alRestrictApp => 'Limita questa app';

  @override
  String get alMasterOff => 'Disattivato: Pausey non la limita';

  @override
  String get alMasterOnRules => 'Valgono limite e orari qui sotto';

  @override
  String get alMasterOnAllDay => 'Nessun limite o orario: bloccata sempre';

  @override
  String get alMasterOnGeneral => 'Bloccata nell\'orario generale';

  @override
  String get alFollowGeneral => 'Segui orario generale';

  @override
  String alFollowGeneralSub(String start, String end) {
    return 'Blocca anche $start – $end';
  }

  @override
  String get alGeneralOff => 'L\'orario generale è disattivato';

  @override
  String get alDailyLimit => 'Limite giornaliero';

  @override
  String get alDailyLimitOffSub => 'Blocca l\'app dopo un tempo al giorno';

  @override
  String get alCustom => 'Personalizzato';

  @override
  String get alUsedLabel => 'Usato oggi';

  @override
  String get alLeftLabel => 'Rimanente';

  @override
  String get alLimitReached => 'Limite di oggi raggiunto';

  @override
  String get alResets => 'Si azzera a mezzanotte (ora del telefono)';

  @override
  String get alUsageUnavailable => 'Utilizzo non disponibile';

  @override
  String get alUsageNeedsAccess =>
      'Consenti l\'accesso all\'utilizzo per contare il tempo di oggi.';

  @override
  String get alUsageAndroidOnly =>
      'L\'utilizzo si misura solo su Android. Il limite resta salvato e vale lì.';

  @override
  String get alGrantUsage => 'Consenti accesso';

  @override
  String get alCustomLimitTitle => 'Limite personalizzato';

  @override
  String get alHours => 'Ore';

  @override
  String get alMinutes => 'Minuti';

  @override
  String get alErrZeroLimit => 'Scegli più di zero';

  @override
  String get alSave => 'Salva';

  @override
  String get alScheduledLocking => 'Blocco programmato';

  @override
  String get alScheduledOffSub => 'Blocca questa app in certe ore';

  @override
  String get alNoSchedules => 'Ancora nessun orario';

  @override
  String get alAddSchedule => 'Aggiungi orario';

  @override
  String get alActiveNow => 'Attivo ora';

  @override
  String get alScheduleDefault => 'Fascia di blocco';

  @override
  String get alEndsNextDay => 'Finisce il giorno dopo';

  @override
  String get alEdit => 'Modifica';

  @override
  String get alDelete => 'Elimina';

  @override
  String get alDeleteScheduleQ => 'Eliminare questo orario?';

  @override
  String alDeleteScheduleMsg(String title) {
    return '«$title» non bloccherà più questa app.';
  }

  @override
  String get alNewSchedule => 'Nuovo orario';

  @override
  String get alEditSchedule => 'Modifica orario';

  @override
  String get alTitleOptional => 'Titolo (facoltativo)';

  @override
  String get alPresetStudy => 'Studio';

  @override
  String get alPresetEvening => 'Sera';

  @override
  String get alPresetSleep => 'Sonno';

  @override
  String get alRepeatOn => 'Ripeti il';

  @override
  String get alErrSameTime => 'Inizio e fine non possono coincidere';

  @override
  String get alErrNoDays => 'Scegli almeno un giorno';

  @override
  String alTempUnlock(int minutes) {
    return 'Sblocca per $minutes min';
  }

  @override
  String alTempUnlockSub(int n) {
    return 'Usa 1 sblocco · ne restano $n oggi';
  }

  @override
  String get alTempUnlockFocus => 'Non si può durante una sessione di focus';

  @override
  String get alTempUnlockNotLocked => 'Serve solo se l\'app è bloccata';

  @override
  String alTempUnlockQ(String app, int minutes) {
    return 'Sbloccare $app per $minutes minuti?';
  }

  @override
  String get alUnlock => 'Sblocca';

  @override
  String get alEndEarly => 'Termina ora';

  @override
  String get alResetRules => 'Reimposta limiti';

  @override
  String get alResetRulesSub => 'Rimuove limite e orari';

  @override
  String alResetQ(String app) {
    return 'Reimpostare i limiti di $app?';
  }

  @override
  String get alResetMsg =>
      'Limite e orari verranno rimossi. L\'app resta nella lista.';

  @override
  String get alReset => 'Reimposta';

  @override
  String get alResetDone => 'Limiti reimpostati';

  @override
  String get alRemoveApp => 'Rimuovi app';

  @override
  String get alRemoveAppSub => 'Non gestire più questa app';

  @override
  String alRemoveQ(String app) {
    return 'Rimuovere $app?';
  }

  @override
  String get alRemoveMsg =>
      'Pausey smetterà di limitarla e ne dimenticherà limite e orari.';

  @override
  String get alRemove => 'Rimuovi';

  @override
  String get alNoPackage =>
      'Limiti e orari per app richiedono un\'app installata specifica. Su Android aggiungila con «Scegli dalle app installate».';

  @override
  String get alNotFound => 'Questa app non è più gestita';

  @override
  String get alPickerTitle => 'App installate';

  @override
  String get alPickerAdded => 'Già aggiunta';

  @override
  String alPickerAdd(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Aggiungi $n app',
      one: 'Aggiungi 1 app',
      zero: 'Aggiungi app',
    );
    return '$_temp0';
  }

  @override
  String get alPickerEmpty => 'Nessuna app trovata';

  @override
  String get blockTitle => 'Blocco app';

  @override
  String get blockAddApp => 'Aggiungi';

  @override
  String get blockFaceIdTitle => 'Protezione Face ID';

  @override
  String get blockFaceIdSub => 'Richiedi Face ID per sbloccare';

  @override
  String get blockFaceIdUnavailable =>
      'Biometria non disponibile su questo dispositivo';

  @override
  String get blockFaceIdReason => 'Conferma la tua identità per attivare';

  @override
  String get blockFaceIdFailed =>
      'Verifica non riuscita: protezione disattivata';

  @override
  String get blockScheduleTitle => 'Blocco programmato';

  @override
  String get blockStart => 'Inizio';

  @override
  String get blockEnd => 'Fine';

  @override
  String get blockNeedOneDay => 'Lascia almeno un giorno';

  @override
  String get blockManagedApps => 'App gestite';

  @override
  String get blockLockAll => 'Blocca tutte';

  @override
  String get blockAllLocked => 'Tutte le app bloccate';

  @override
  String blockRemoved(String app) {
    return '$app rimossa';
  }

  @override
  String get blockAppsUpdated => 'App aggiornate';

  @override
  String get blockCatSocial => 'Social';

  @override
  String get blockCatVideo => 'Video';

  @override
  String get blockCatGames => 'Giochi';

  @override
  String get blockCatShopping => 'Shopping';

  @override
  String get blockCatCommunity => 'Community';

  @override
  String get blockCatOther => 'Altro';

  @override
  String get blockEmptyBadge => 'Niente bloccato';

  @override
  String get blockEmptyTitle => 'Ancora nessuna app';

  @override
  String get blockEmptyMsg =>
      'Aggiungi le app che ti distraggono e Pausey le bloccherà.';

  @override
  String get blockEmergencyTitle => 'Sblocco di emergenza';

  @override
  String blockEmergencySub(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n rimasti',
      one: '1 rimasto',
    );
    return 'Sblocca tutto per poco · $_temp0 oggi';
  }

  @override
  String get blockEmergencyOff => 'Disattivato nelle Impostazioni';

  @override
  String get blockEmergencyUse => 'Usa';

  @override
  String get blockEmergencyConfirmTitle => 'Usare lo sblocco di emergenza?';

  @override
  String blockEmergencyConfirmMsg(int n) {
    return 'Userà uno dei $n sblocchi rimasti oggi. Usalo solo se serve davvero.';
  }

  @override
  String get blockEmergencyUsed => 'Sblocco usato: app sbloccate';

  @override
  String get blockEmergencyNone => 'Nessuno rimasto oggi';

  @override
  String get blkTabLocked => 'App bloccate';

  @override
  String get blkToday => 'Oggi';

  @override
  String get blkUnblocks => 'Sblocchi';

  @override
  String get blkScreenTime => 'Tempo di utilizzo';

  @override
  String get blkOpens => 'Aperture';

  @override
  String get blkBlock => 'Blocca';

  @override
  String get blkUnblock => 'Sblocca';

  @override
  String get blkBlocked => 'Bloccata';

  @override
  String get blkNotBlocked => 'Non bloccata';

  @override
  String get blkNoLocked => 'Nessuna app bloccata';

  @override
  String get blkNoScheduled => 'Nessuna app programmata';

  @override
  String blkBlockedSnack(String app) {
    return '$app è bloccata';
  }

  @override
  String blkUnblockedSnack(String app) {
    return '$app è sbloccata';
  }

  @override
  String get cvNoAccount => 'Non hai un account?';

  @override
  String get cvYourName => 'Il tuo nome';

  @override
  String get cvAppsLoadFailed =>
      'Impossibile leggere le app di questo telefono.';

  @override
  String get cvTryAgain => 'Riprova';

  @override
  String get cvGetStarted => 'Inizia';

  @override
  String get cvHaveAccount => 'Ho già un account';

  @override
  String get cvWelcomeTitle => 'Il tuo tempo è tuo.';

  @override
  String get cvWelcomeBody => 'Facciamo più spazio a ciò che conta.';

  @override
  String get cvNext => 'Avanti';

  @override
  String get cvSkipForNow => 'Salta per ora';

  @override
  String get cvRelateTitle => 'Il tempo ti sfugge?';

  @override
  String get cvRelateSub => 'Sii sincero, non ci sono risposte sbagliate.';

  @override
  String get cvRelateOften => 'Sempre';

  @override
  String get cvRelateSometimes => 'A volte';

  @override
  String get cvRelateRarely => 'Raramente';

  @override
  String get cvRelateReplyOften =>
      'Capita a tanti. I telefoni sono fatti per trattenerci.';

  @override
  String get cvRelateReplySometimes =>
      'Succede a quasi tutti, di solito senza accorgersene.';

  @override
  String get cvRelateReplyRarely => 'Ottimo. Continuiamo così.';

  @override
  String get cvRelateCta => 'Sono io';

  @override
  String get cvGoalTitle => 'Più tempo per cosa?';

  @override
  String get cvGoalSub => 'Scegli ciò che conta di più per te adesso.';

  @override
  String get cvGoalFocus => 'Più concentrazione';

  @override
  String get cvGoalSleep => 'Dormire meglio';

  @override
  String get cvGoalScrolling => 'Meno scroll';

  @override
  String get cvGoalMe => 'Più tempo per me';

  @override
  String get cvGoalHabits => 'Abitudini quotidiane più sane';

  @override
  String get cvGoalOther => 'Altro';

  @override
  String get cvGoalOtherHint => 'Per cosa vorresti avere più tempo?';

  @override
  String get cvGoalReplyFocus => 'Concentrazione, allora. La proteggiamo.';

  @override
  String get cvGoalReplySleep => 'Dormire bene parte da serate tranquille.';

  @override
  String get cvGoalReplyScrolling =>
      'Facciamo dello scroll una scelta, non un\'abitudine.';

  @override
  String get cvGoalReplyMe => 'Il tempo per te conta. Troviamone un po\'.';

  @override
  String get cvGoalReplyHabits =>
      'I piccoli passi si sommano. Li terremo semplici.';

  @override
  String get cvGoalReplyOther => 'Capito. Adatteremo tutto a questo.';

  @override
  String get cvAppsTitle => 'Quali app ti distraggono?';

  @override
  String get cvAppsSubReal =>
      'Le app che usi di più su questo telefono. Verranno messe tutte in pausa; tocca ✕ per lasciarne una libera.';

  @override
  String get cvAppsSubPopular =>
      'Le app che usi di più su questo telefono. Verranno messe tutte in pausa; tocca ✕ per lasciarne una libera.';

  @override
  String get cvAppsSearch => 'Cerca app';

  @override
  String cvAppsReply(String apps) {
    return 'Annotato: $apps. Partiamo da queste.';
  }

  @override
  String cvAnd(String a, String b) {
    return '$a e $b';
  }

  @override
  String cvAndMore(String a, String b, int count) {
    return '$a, $b e altre $count';
  }

  @override
  String get cvStTitle => 'Il tuo tempo schermo giornaliero';

  @override
  String get cvStSub => 'Va bene una stima. Resta sul tuo telefono.';

  @override
  String cvStMeasured(String time) {
    return 'Misurato oggi su questo telefono finora: $time';
  }

  @override
  String get cvStUnder2 => 'Meno di 2 ore';

  @override
  String get cvSt2to4 => 'Da 2 a 4 ore';

  @override
  String get cvSt4to6 => 'Da 4 a 6 ore';

  @override
  String get cvStOver6 => 'Più di 6 ore';

  @override
  String get cvStNotSure => 'Non so';

  @override
  String get cvStReplyUnder2 =>
      'È un buon equilibrio. Ti aiuteremo a mantenerlo.';

  @override
  String get cvStReply2to4 =>
      'Qualche piccolo cambiamento può liberare tempo vero.';

  @override
  String get cvStReply4to6 => 'È parecchio. Riprendiamone un po\'.';

  @override
  String get cvStReplyOver6 =>
      'È una grande parte della giornata, quindi partiremo con calma.';

  @override
  String get cvStReplyNotSure => 'Nessun problema. Pausey può misurarlo.';

  @override
  String get cvPhraseFocus => 'più concentrazione';

  @override
  String get cvPhraseSleep => 'dormire meglio';

  @override
  String get cvPhraseScrolling => 'scrollare meno';

  @override
  String get cvPhraseMe => 'più tempo per te';

  @override
  String get cvPhraseHabits => 'abitudini più sane';

  @override
  String get cvPhraseOther => 'più spazio per ciò che conta';

  @override
  String cvPhraseOtherNamed(String thing) {
    return 'più tempo per $thing';
  }

  @override
  String cvReflectApps(String goal, String apps) {
    return 'Vuoi $goal, ma finisci sempre per aprire $apps.';
  }

  @override
  String cvReflectNoApps(String goal) {
    return 'Vuoi $goal, e a volte il telefono si mette in mezzo.';
  }

  @override
  String cvReflectEstimate(String time) {
    return 'Circa $time al giorno (tua stima)';
  }

  @override
  String cvReflectMeasured(String time) {
    return '$time oggi finora (misurato)';
  }

  @override
  String get cvReflectHelp =>
      'Pausey può aiutarti a creare una routine che dia respiro alla tua attenzione.';

  @override
  String get cvShowMeHow => 'Fammi vedere';

  @override
  String get cvHowTitle => 'Ecco come ti aiuta Pausey';

  @override
  String get cvHowPauseTab => 'Pausa';

  @override
  String get cvHowLimitTab => 'Limiti';

  @override
  String get cvHowFocusTab => 'Focus';

  @override
  String get cvHowPauseTitle => 'Una pausa serena, non una punizione';

  @override
  String get cvHowPauseBody =>
      'Quando il tempo di un\'app finisce, Pausey la copre con una schermata di pausa tranquilla e una via d\'uscita.';

  @override
  String get cvHowLimitTitle => 'Un tempo giornaliero per ogni app';

  @override
  String get cvHowLimitBody =>
      'Dai a ogni app il suo tempo giornaliero e i suoi orari di blocco. Cambiarne una non cambia mai le altre.';

  @override
  String get cvHowFocusTitle => 'Sessioni di focus';

  @override
  String get cvHowFocusBody =>
      'Avvia un timer per lavoro, studio o riposo. Le app scelte restano in pausa fino alla fine.';

  @override
  String get cvPreview => 'Anteprima';

  @override
  String get cvYourApp => 'La tua app';

  @override
  String get cvAnotherApp => 'Un\'altra app';

  @override
  String cvMinOf(int used, int limit) {
    return '$used di $limit min';
  }

  @override
  String get cvBuildPlan => 'Crea il mio piano';

  @override
  String get cvPlanTitle => 'Ecco un inizio tranquillo';

  @override
  String get cvPlanSub =>
      'Suggerito in base alle tue risposte. Cambia ciò che vuoi.';

  @override
  String get cvPlanFocus => 'Sessione di focus';

  @override
  String cvPlanFocusSub(String time) {
    return '$time a sessione';
  }

  @override
  String get cvPlanDaily => 'Obiettivo di focus giornaliero';

  @override
  String cvPlanDailySub(String time) {
    return '$time di focus al giorno';
  }

  @override
  String get cvPlanLimit => 'Limite giornaliero app';

  @override
  String cvPlanLimitSub(String app, String time) {
    return '$app: $time al giorno';
  }

  @override
  String get cvPlanLimitNoPkg =>
      'Questa app non è nell\'elenco del telefono, quindi il limite si può impostare più tardi in Blocco app.';

  @override
  String get cvPlanWind => 'Relax serale';

  @override
  String cvPlanWindSub(String start, String end) {
    return 'Le app scelte vanno in pausa dalle $start alle $end';
  }

  @override
  String get cvPlanOff => 'Disattivato';

  @override
  String get cvStarts => 'Inizio';

  @override
  String get cvEnds => 'Fine';

  @override
  String get cvPlanNote =>
      'Non è ancora attivo nulla. Parte solo quando finisci la configurazione e puoi cambiarlo quando vuoi.';

  @override
  String get cvUsePlan => 'Usa questo piano';

  @override
  String get cvPermTitle => 'Servono alcuni permessi';

  @override
  String get cvPermSub =>
      'Aiutano Pausey a fare la sua magia e a offrirti l\'esperienza migliore.';

  @override
  String get cvPermUnsupported =>
      'Limiti app e schermate di pausa funzionano sui telefoni Android. Tutto il resto funziona anche qui.';

  @override
  String get cvPermUsageTitle => 'Accesso all\'utilizzo';

  @override
  String get cvPermUsageWhy =>
      'Permette a Pausey di vedere quanto è rimasta aperta ogni app oggi e quale è sullo schermo.';

  @override
  String get cvPermUsageWithout =>
      'Senza, Pausey non può misurare il tempo di utilizzo né sapere quando si raggiunge un limite.';

  @override
  String get cvPermOverlayTitle => 'Mostra sopra altre app';

  @override
  String get cvPermOverlayWhy =>
      'Permette a Pausey di mostrare la schermata di pausa sopra un\'app quando il suo tempo finisce.';

  @override
  String get cvPermOverlayWithout =>
      'Senza, le app non possono essere messe in pausa. Il tuo piano resta salvato per dopo.';

  @override
  String get cvPermBatteryTitle => 'Mantieni attivo Pausey';

  @override
  String get cvPermBatteryWhy =>
      'Alcuni telefoni fermano le app in background per risparmiare batteria. Consentire Pausey mantiene attivi i tuoi limiti.';

  @override
  String get cvPermBatteryWithout =>
      'Senza, i limiti potrebbero smettere di funzionare finché non riapri Pausey.';

  @override
  String get cvPermLater =>
      'Puoi cambiarlo più tardi nelle impostazioni di Android.';

  @override
  String get cvPermPrivacy =>
      'Pausey legge solo nomi delle app e tempi. Nulla lascia il tuo telefono.';

  @override
  String get cvAllowInSettings => 'Consenti nelle impostazioni';

  @override
  String get cvAllowed => 'Consentito';

  @override
  String get cvOptional => 'Facoltativo';

  @override
  String get cvContinueAnyway => 'Continua per ora';

  @override
  String get cvAccountTitle => 'Conserva i tuoi progressi';

  @override
  String get cvAccountSub => 'Usa Pausey come ospite o accedi.';

  @override
  String get cvNameLabel => 'Il tuo nome (facoltativo)';

  @override
  String get cvNameHint => 'Come ti chiamiamo?';

  @override
  String get cvContinueGuest => 'Continua come ospite';

  @override
  String get cvAccountNote =>
      'L\'accesso non esegue ancora il backup dei dati. In ogni caso, le impostazioni restano su questo telefono.';

  @override
  String get cvReadyTitle => 'Il tuo primo passo inizia qui.';

  @override
  String cvReadyTitleNamed(String name) {
    return '$name, il tuo primo passo inizia qui.';
  }

  @override
  String get cvReadyFocus =>
      'Facciamo un po\' più di spazio alla concentrazione.';

  @override
  String get cvReadySleep => 'Rendiamo le tue serate un po\' più tranquille.';

  @override
  String get cvReadyScrolling =>
      'Diamo allo scroll un po\' meno della tua giornata.';

  @override
  String get cvReadyMe => 'Troviamo un po\' più di tempo per te.';

  @override
  String get cvReadyHabits => 'Costruiamo abitudini che fanno stare bene.';

  @override
  String get cvReadyOther => 'Facciamo più spazio a ciò che conta per te.';

  @override
  String get cvYourPlan => 'Il tuo piano';

  @override
  String cvSumGoal(String goal) {
    return 'Obiettivo: $goal';
  }

  @override
  String cvSumApps(String apps) {
    return 'App: $apps';
  }

  @override
  String cvSumFocus(String session, String daily) {
    return 'Sessioni di focus da $session, $daily al giorno';
  }

  @override
  String get cvReadyNeedsPerm =>
      'I limiti delle app sono salvati, ma non funzioneranno finché non consenti i due permessi.';

  @override
  String get cvReadyChange => 'Puoi cambiare tutto più tardi.';

  @override
  String get cvStartFirstFocus => 'Inizia la mia prima sessione';

  @override
  String get cvFinishLimits => 'Completa i limiti delle app';

  @override
  String get cvJourneyTitle => 'Inizia il tuo viaggio con Pausey';

  @override
  String get cvJourneySub =>
      'Crea un account per sincronizzare i progressi o continua come ospite.';

  @override
  String get cvUsageNone => 'Non usata oggi';

  @override
  String get cvUsageUnder1 => 'Meno di 1 min oggi';

  @override
  String cvUsageToday(String time) {
    return '$time oggi';
  }

  @override
  String cvAppsSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count app selezionate',
      one: '1 app selezionata',
    );
    return '$_temp0';
  }

  @override
  String get cvAppsUsageNeeded =>
      'Consenti l\'accesso al tempo di utilizzo per mostrare le app che usi di più.';

  @override
  String cvRemoveApp(String app) {
    return 'Rimuovi $app';
  }

  @override
  String get cvNotifAskTitle => 'Un avviso prima che finisca il tempo?';

  @override
  String get cvNotNow => 'Non ora';

  @override
  String get cvA11yTitle => 'Un\'ultima cosa';

  @override
  String get cvA11ySub =>
      'Attiva l\'Accessibilità così Pausey vede quale app è aperta e per quanto tempo. Potrà bloccare, sbloccare e programmare le tue app.';

  @override
  String get cvA11yReads => 'Pausey legge solo:';

  @override
  String get cvA11yRead1 => 'Nomi delle app';

  @override
  String get cvA11yRead2 => 'Tempo in ogni app';

  @override
  String get appName => 'Pausey';

  @override
  String get tagline => 'Riprenditi il tuo tempo';

  @override
  String get versionLabel => 'Versione 2.0 · Edizione App Store';

  @override
  String get skip => 'Salta';

  @override
  String get continueLabel => 'Continua';

  @override
  String get back => 'Indietro';

  @override
  String get freeToStart => 'Inizia gratis · Nessuna carta di credito';

  @override
  String get dataStaysOnDevice =>
      'I tuoi dati non lasciano mai il dispositivo.';

  @override
  String get switchToLight => 'Passa alla modalità chiara';

  @override
  String get switchToDark => 'Passa alla modalità scura';

  @override
  String get language => 'Lingua';

  @override
  String get phoneLanguage => 'Lingua del telefono';

  @override
  String get authTitle =>
      'Metti in pausa lo scroll.\nPrendi in mano la giornata.';

  @override
  String get authSubtitle =>
      'Crea un account per sincronizzare obiettivi e serie, oppure prova Pausey come ospite.';

  @override
  String get continueWithApple => 'Continua con Apple';

  @override
  String get continueWithGoogle => 'Continua con Google';

  @override
  String get signUpWithEmail => 'Registrati con email';

  @override
  String get continueAsGuest => 'Continua come ospite';

  @override
  String get guestNote => 'I dati ospite sono salvati solo su questo telefono.';

  @override
  String get or => 'o';

  @override
  String get haveAccount => 'Hai già un account?';

  @override
  String get noAccount => 'Nuovo su Pausey?';

  @override
  String get logIn => 'Accedi';

  @override
  String get signUp => 'Registrati';

  @override
  String get createAccount => 'Crea account';

  @override
  String get signUpTitle => 'Crea il tuo account';

  @override
  String get signUpSubtitle => 'Inizia a creare abitudini digitali più serene.';

  @override
  String get logInTitle => 'Accedi al tuo account';

  @override
  String get logInSubtitle => 'Accedi per riprendere la tua serie.';

  @override
  String get fullName => 'Nome completo';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Conferma password';

  @override
  String get showPassword => 'Mostra password';

  @override
  String get hidePassword => 'Nascondi password';

  @override
  String get forgotPassword => 'Password dimenticata?';

  @override
  String get resetTitle => 'Reimposta password';

  @override
  String get resetSubtitle =>
      'Inserisci la tua email e ti invieremo un link di reimpostazione.';

  @override
  String get sendLink => 'Invia link';

  @override
  String get resetSent => 'Controlla la posta per il link di reimpostazione.';

  @override
  String get agreeTerms => 'Accetto i Termini e l\'Informativa sulla privacy';

  @override
  String get passwordStrength => 'Sicurezza della password';

  @override
  String get strengthWeak => 'Debole';

  @override
  String get strengthOk => 'Discreta';

  @override
  String get strengthStrong => 'Forte';

  @override
  String get errNameRequired => 'Inserisci il tuo nome';

  @override
  String get errEmailInvalid => 'Inserisci un\'email valida';

  @override
  String get errPasswordShort => 'Usa almeno 8 caratteri';

  @override
  String get errPasswordMismatch => 'Le password non coincidono';

  @override
  String get errTerms => 'Accetta i termini per continuare';

  @override
  String get authErr_not_configured =>
      'L\'accesso non è ancora configurato. Puoi continuare come ospite.';

  @override
  String get authErr_cancelled => 'Accesso annullato.';

  @override
  String get authErr_invalid_email => 'Questa email non sembra corretta.';

  @override
  String get authErr_wrong_password => 'Email o password non corretti.';

  @override
  String get authErr_user_not_found =>
      'Nessun account con questa email. Vuoi registrarti?';

  @override
  String get authErr_email_in_use =>
      'Esiste già un account con questa email. Accedi.';

  @override
  String get authErr_weak_password => 'Scegli una password più sicura.';

  @override
  String get authErr_network => 'Nessuna connessione a Internet. Riprova.';

  @override
  String get authErr_too_many =>
      'Troppi tentativi. Attendi un minuto e riprova.';

  @override
  String get authErr_unknown => 'Qualcosa è andato storto. Riprova.';

  @override
  String homeHello(String name) {
    return 'Ciao, $name';
  }

  @override
  String get homeHelloGuest => 'Ciao';

  @override
  String get homeGuestBadge => 'Modalità ospite · salvato su questo telefono';

  @override
  String get homeSubtitle => 'Il tuo piano è pronto. Ecco cosa hai scelto.';

  @override
  String get homeDailyGoal => 'Obiettivo giornaliero';

  @override
  String get homeLockedApps => 'App bloccate';

  @override
  String get homeScreenTime => 'Tempo di utilizzo attuale';

  @override
  String get homeNotSet => 'Non impostato';

  @override
  String get homeCreateAccount => 'Crea un account per il backup';

  @override
  String get signOut => 'Esci';

  @override
  String get signOutGuestWarn =>
      'Uscendo elimini i dati ospite su questo telefono.';

  @override
  String get cancel => 'Annulla';

  @override
  String get ob6OtherHint => 'Scrivi la tua professione';

  @override
  String get timeSecondLabel => 'Secondo';

  @override
  String get focusModePomodoro => 'Pomodoro';

  @override
  String get focusModeDeep => 'Focus profondo';

  @override
  String get focusModeCustom => 'Personale';

  @override
  String get focusRemaining => 'RIMANENTE';

  @override
  String get focusBreakLabel => 'PAUSA';

  @override
  String get focusReadyLabel => 'PRONTO';

  @override
  String get focusInSession => 'In sessione';

  @override
  String get focusPausedState => 'In pausa';

  @override
  String get focusOnBreak => 'In pausa';

  @override
  String get focusIdleState => 'Tocca play per iniziare';

  @override
  String get focusSessionsDone => 'Sessioni fatte';

  @override
  String get focusProgress => 'Progresso';

  @override
  String get focusBreakAfter => 'Pausa dopo';

  @override
  String get focusFocusedToday => 'Oggi';

  @override
  String focusAppsBlocked(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count app bloccate',
      one: '1 app bloccata',
    );
    return '$_temp0';
  }

  @override
  String get focusAppsBlockedSub => 'Le distrazioni sono bloccate.';

  @override
  String get focusNoApps => 'Nessuna app bloccata';

  @override
  String get focusNoAppsSub => 'Scegli le app da bloccare.';

  @override
  String get focusEdit => 'Modifica';

  @override
  String get focusAdd => 'Aggiungi';

  @override
  String get focusAmbient => 'Suono ambientale';

  @override
  String get focusSoundOff => 'Spento';

  @override
  String get focusSoundRain => 'Pioggia';

  @override
  String get focusSoundForest => 'Foresta';

  @override
  String get focusSoundWaves => 'Onde';

  @override
  String get focusSoundWhite => 'Rumore bianco';

  @override
  String get focusVolume => 'Volume';

  @override
  String get focusStart => 'Avvia';

  @override
  String get focusPause => 'Pausa';

  @override
  String get focusResume => 'Riprendi';

  @override
  String get focusStop => 'Ferma';

  @override
  String get focusRestart => 'Ricomincia';

  @override
  String get focusSkipBreak => 'Salta pausa';

  @override
  String get focusDurations => 'Durata sessioni';

  @override
  String focusMinutesN(int n) {
    return '$n min';
  }

  @override
  String get focusBreakLength => 'Pausa';

  @override
  String get focusCustomTitle => 'Durata personale';

  @override
  String get focusSet => 'Imposta';

  @override
  String get focusStopTitle => 'Terminare prima?';

  @override
  String get focusStopBody => 'Il tempo fatto finora verrà salvato.';

  @override
  String get focusEndSession => 'Termina';

  @override
  String get focusKeepGoing => 'Continua';

  @override
  String get focusTooShort => 'Meno di un minuto: non salvato.';

  @override
  String get focusBreakOver => 'Pausa finita: pronto per la prossima?';

  @override
  String get focusBusy => 'Termina la sessione per cambiare modo.';

  @override
  String get focusFirstHint => 'La tua prima sessione inizia qui: premi play.';

  @override
  String get focusCompleteA => 'Sessione';

  @override
  String get focusCompleteB => 'completata!';

  @override
  String get focusEndedTitle => 'Sessione terminata';

  @override
  String focusCompleteMsg(String mode) {
    return 'Ottimo lavoro! Hai finito la sessione $mode senza distrazioni.';
  }

  @override
  String get focusEndedMsg =>
      'Ogni minuto conta. La prossima volta arriva fino in fondo.';

  @override
  String get focusDurationLabel => 'DURATA FOCUS';

  @override
  String get focusMinUnit => 'min';

  @override
  String get focusDayStreak => 'Serie';

  @override
  String get focusAppsLabel => 'App bloccate';

  @override
  String get focusTodayGoal => 'Obiettivo di oggi';

  @override
  String focusPctCompleted(int pct) {
    return '$pct% completato';
  }

  @override
  String focusPlusPct(int pct) {
    return '+$pct% da questa sessione';
  }

  @override
  String get focusMomentum => 'Mantieni il ritmo!';

  @override
  String get focusQuote1 =>
      'La costanza batte l\'intensità. Ogni sessione conta.';

  @override
  String get focusQuote2 => 'Piccoli blocchi di focus, grandi risultati.';

  @override
  String get focusQuote3 => 'Niente scroll: hai costruito. Rifallo.';

  @override
  String get focusStartNext => 'Avvia la prossima';

  @override
  String get focusBackHome => 'Torna alla home';

  @override
  String get goalsTitle => 'I miei obiettivi';

  @override
  String goalsSubtitle(int active, int done) {
    return '$active attivi · $done completati';
  }

  @override
  String get goalsAdd => 'Aggiungi';

  @override
  String get goalsCompleted => 'Completati';

  @override
  String get goalsActive => 'Attivi';

  @override
  String get goalsStreak => 'Serie';

  @override
  String get goalsOverall => 'Completamento totale';

  @override
  String goalsWeeklyHit(int hit, int total) {
    return '$hit su $total obiettivi settimanali';
  }

  @override
  String goalsVsLastWeek(String delta) {
    return '$delta vs settimana scorsa';
  }

  @override
  String get goalsFilterAll => 'Tutti';

  @override
  String get goalsDone => 'Fatto';

  @override
  String get goalsCatFocus => 'Focus';

  @override
  String get goalsCatDiscipline => 'Disciplina';

  @override
  String get goalsCatWellness => 'Benessere';

  @override
  String goalsTitleFocusHours(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Focus giornaliero: $n ore',
      one: 'Focus giornaliero: 1 ora',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleFocusDur(String duration) {
    return 'Focus giornaliero: $duration';
  }

  @override
  String get goalsTitleBlock => 'Blocca i social';

  @override
  String goalsTitleSessions(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Pomodoro al giorno',
      one: '1 Pomodoro al giorno',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleScreen(String duration) {
    return 'Meno di $duration di schermo';
  }

  @override
  String get goalsTitlePhoneFree => 'Tempo senza telefono';

  @override
  String goalsDescFocus(String duration) {
    return 'Raggiungi $duration di focus ogni giorno';
  }

  @override
  String goalsDescBlock(int n) {
    return 'Tieni le app bloccate $n giorni a settimana';
  }

  @override
  String goalsDescSessions(int n) {
    return 'Completa almeno $n sessioni al giorno';
  }

  @override
  String goalsDescScreen(String duration) {
    return 'Usa il telefono meno di $duration al giorno';
  }

  @override
  String goalsDescPhoneFree(int n) {
    return '$n giorni senza telefono a settimana: spuntali';
  }

  @override
  String goalsProgressDays(int done, int total) {
    return '$done / $total giorni';
  }

  @override
  String goalsProgressSessions(int done, int total) {
    return '$done / $total sessioni';
  }

  @override
  String goalsStreakShort(int n) {
    return '$n g';
  }

  @override
  String goalsStreakN(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Serie di $n giorni',
      one: 'Serie di 1 giorno',
    );
    return '$_temp0';
  }

  @override
  String get goalsCheckIn => 'Segna oggi come fatto';

  @override
  String get goalsCheckedIn => 'Fatto oggi';

  @override
  String get goalsCheckedSnack => 'Ottimo! Oggi è segnato come fatto.';

  @override
  String get goalsUncheckedSnack => 'Oggi non è più segnato.';

  @override
  String get goalsCreateNew => 'Crea nuovo obiettivo';

  @override
  String get goalsEmptyBadge => 'Inizia';

  @override
  String get goalsEmptyTitle => 'Ancora nessun obiettivo';

  @override
  String get goalsEmptyMsg =>
      'Imposta un piccolo obiettivo giornaliero e Pausey lo seguirà.';

  @override
  String get goalsFilterEmpty => 'Nessun obiettivo per questo filtro.';

  @override
  String get goalsNewGoal => 'Nuovo obiettivo';

  @override
  String get goalsEditGoal => 'Modifica obiettivo';

  @override
  String get goalsType => 'Tipo di obiettivo';

  @override
  String get goalsTypeFocus => 'Tempo di focus';

  @override
  String get goalsTypeSessions => 'Sessioni';

  @override
  String get goalsTypeBlock => 'Blocca app';

  @override
  String get goalsTypePhoneFree => 'Giorni senza telefono';

  @override
  String get goalsTypeScreen => 'Limite di schermo';

  @override
  String get goalsCategory => 'Categoria';

  @override
  String get goalsTarget => 'Obiettivo';

  @override
  String get goalsPerDay => 'al giorno';

  @override
  String get goalsPerWeek => 'giorni a settimana';

  @override
  String get goalsMaxPerDay => 'massimo al giorno';

  @override
  String get goalsTitleOptional => 'Titolo (facoltativo)';

  @override
  String get goalsSave => 'Salva obiettivo';

  @override
  String get goalsCreate => 'Crea obiettivo';

  @override
  String get goalsSavedSnack => 'Obiettivo salvato';

  @override
  String get goalsCreatedSnack => 'Obiettivo creato';

  @override
  String get goalsEdit => 'Modifica';

  @override
  String get goalsDelete => 'Elimina obiettivo';

  @override
  String get goalsDeleteQ => 'Eliminare questo obiettivo?';

  @override
  String get goalsDeleteMsg =>
      'I suoi check-in verranno rimossi. Operazione irreversibile.';

  @override
  String get goalsDeletedSnack => 'Obiettivo eliminato';

  @override
  String get goalsComplete => 'completato';

  @override
  String get goalsDaysActive => 'Giorni attivi';

  @override
  String get goalsTotalTime => 'Tempo totale';

  @override
  String get goalsSessionsLabel => 'Sessioni';

  @override
  String get goals7Day => 'Completamento 7 giorni';

  @override
  String get goals7DaysAgo => '7 giorni fa';

  @override
  String get goalsToday => 'Oggi';

  @override
  String goalsTodayDate(String date) {
    return 'Oggi, $date';
  }

  @override
  String goalsYesterdayDate(String date) {
    return 'Ieri, $date';
  }

  @override
  String get goalsMilestones => 'Traguardi';

  @override
  String get goalsMsFirst => 'Primo giorno completato';

  @override
  String get goalsMs3 => 'Serie di 3 giorni';

  @override
  String get goalsMsHalf => '50% dell\'obiettivo settimanale';

  @override
  String get goalsMs5 => 'Serie di 5 giorni';

  @override
  String get goalsMsWeek => 'Settimana completa';

  @override
  String get goalsMsLocked => 'Non ancora';

  @override
  String get goalsHistory => 'Cronologia';

  @override
  String get goalsShowLess => 'Mostra meno';

  @override
  String get goalsStartSession => 'Avvia sessione';

  @override
  String get goalsManageApps => 'Gestisci app bloccate';

  @override
  String get goalsBlockHint =>
      'Conta in automatico mentre la pianificazione è attiva.';

  @override
  String goalsScreenToday(String used) {
    return 'Schermo oggi: $used';
  }

  @override
  String get goalsNotFound => 'Questo obiettivo non esiste più.';

  @override
  String get goalsMore => 'Altre opzioni';

  @override
  String goalsFreeLimit(int n) {
    return 'Piano gratuito: fino a $n obiettivi';
  }

  @override
  String get homeGoodMorning => 'Buongiorno';

  @override
  String get homeGoodAfternoon => 'Buon pomeriggio';

  @override
  String get homeGoodEvening => 'Buonasera';

  @override
  String get homeFriend => 'Amico';

  @override
  String get homeTodayFocus => 'Focus di oggi';

  @override
  String homeVsYesterday(String pct) {
    return '$pct% rispetto a ieri';
  }

  @override
  String get homeStartToday => 'Ancora nessun focus';

  @override
  String get homeDayStreak => 'Giorni di fila';

  @override
  String get homeTodayGoal => 'Obiettivo di oggi';

  @override
  String homePctCompleted(int pct) {
    return '$pct% completato';
  }

  @override
  String get homeOnTrack => 'Sei in linea!';

  @override
  String get homeKeepGoing => 'Continua';

  @override
  String get homeGoalMet => 'Obiettivo raggiunto!';

  @override
  String get homeScreenTimeTitle => 'Tempo di utilizzo';

  @override
  String get homeToday => 'Oggi';

  @override
  String homeVsAvg(String pct) {
    return '$pct% vs media';
  }

  @override
  String get homeQuickStart => 'Avvia sessione di focus';

  @override
  String get homeManage => 'Gestisci';

  @override
  String get homeNoApps =>
      'Scegli le app che ti distraggono di più e bloccale qui.';

  @override
  String get homeAddApps => 'Aggiungi app';

  @override
  String homeAppLocked(String app) {
    return '$app bloccata';
  }

  @override
  String homeAppUnlocked(String app) {
    return '$app sbloccata';
  }

  @override
  String homeLockApp(String app) {
    return 'Blocca o sblocca $app';
  }

  @override
  String get homeUpgradeTitle => 'Passa a Premium';

  @override
  String get homeUpgradeBody => 'Blocchi, obiettivi e analisi illimitati.';

  @override
  String get homeTryFree => 'Prova gratis';

  @override
  String get homePro => 'PRO';

  @override
  String get homeProActive => 'Pausey Pro è attivo';

  @override
  String get homeProActiveBody => 'Tutto sbloccato. Grazie del supporto!';

  @override
  String get homeNotifications => 'Notifiche';

  @override
  String get homeNoNotifications => 'Nessuna nuova notifica.';

  @override
  String get homePushLabel => 'Notifiche push';

  @override
  String get homeFocusReminder => 'Promemoria giornaliero';

  @override
  String get homeStreakAlerts => 'Avvisi serie';

  @override
  String get homePwTitle => 'Sblocca Pausey Pro';

  @override
  String get homePwSubtitle =>
      'Riprendi la concentrazione e batti la dipendenza dal telefono.';

  @override
  String get homePwMonthly => 'Mensile';

  @override
  String get homePwBilledMonthly => 'Fatturato mensilmente';

  @override
  String get homePwYearly => 'Annuale';

  @override
  String get homePwPopular => 'Più scelto';

  @override
  String homePwSave(int pct) {
    return 'Risparmi $pct%';
  }

  @override
  String homePwBilledYearly(String price) {
    return '$price all\'anno';
  }

  @override
  String get homePwLifetime => 'A vita';

  @override
  String get homePwBestValue => 'Più conveniente';

  @override
  String get homePwPayOnce => 'Paghi una volta, per sempre';

  @override
  String get homePwPerMonth => '/ mese';

  @override
  String get homePwOnce => 'una tantum';

  @override
  String get homePwStartTrial => 'Prova gratis 7 giorni';

  @override
  String get homePwBuyLifetime => 'Ottieni accesso a vita';

  @override
  String get homePwNoCharge => 'Nessun addebito oggi · Disdici quando vuoi';

  @override
  String get homePwOneTime => 'Pagamento unico · Nessun abbonamento';

  @override
  String get homePwFree => 'Gratis';

  @override
  String get homePwProCol => 'Pro';

  @override
  String get homePwFeatBlocking => 'Blocco app illimitato';

  @override
  String get homePwFeatSessions => 'Tutte le modalità focus';

  @override
  String get homePwFeatGoals => 'Obiettivi illimitati';

  @override
  String get homePwFeatAnalytics => 'Analisi avanzate';

  @override
  String get homePwFeatStreak => 'Protezione serie';

  @override
  String get homePwFeatSchedule => 'Programmazione focus';

  @override
  String get homePwFeatFaceId => 'Blocco Face ID';

  @override
  String get homePwFeatNotif => 'Notifiche smart';

  @override
  String homePwMax(int n) {
    return 'max $n';
  }

  @override
  String get homePwSecure => 'Pagamento sicuro';

  @override
  String get homePwCancelAnytime => 'Disdici quando vuoi';

  @override
  String get homePwPrivacyFirst => 'Privacy prima di tutto';

  @override
  String get homePwRestore => 'Ripristina acquisti';

  @override
  String get homePwTerms => 'Termini di servizio';

  @override
  String get homePwPrivacyPolicy => 'Informativa sulla privacy';

  @override
  String get homePwWelcome => 'Benvenuto in Pausey Pro!';

  @override
  String get homePwNothingToRestore => 'Nessun acquisto precedente trovato.';

  @override
  String get homePwRestored => 'Il tuo accesso Pro è attivo.';

  @override
  String get homePwLinkSoon => 'Questa pagina aprirà presto sul nostro sito.';

  @override
  String get homePwYouArePro => 'Sei Pro, buon divertimento!';

  @override
  String get homePwClose => 'Chiudi';

  @override
  String get homeAvgLegend => 'Media di 7 giorni';

  @override
  String homeGoalOf(String done, String goal) {
    return '$done su $goal';
  }

  @override
  String get homeBest => 'Record:';

  @override
  String get homeMyApps => 'Le mie app';

  @override
  String get homeManageApps => 'Gestisci app';

  @override
  String get homeUnblockApps => 'Sblocca app';

  @override
  String homeAppsLocked(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count app bloccate',
      one: '1 app bloccata',
    );
    return '$_temp0';
  }

  @override
  String homeAppNamesMore(String names, int count) {
    return '$names +$count';
  }

  @override
  String get homeNoLockedApps => 'Nessuna app bloccata';

  @override
  String get homeNoLockedAppsSub => 'Scegli le app che ti trascinano';

  @override
  String get insightsAnalytics => 'Analisi';

  @override
  String get insightsScreenTime => 'Tempo di utilizzo';

  @override
  String get insightsToday => 'Oggi';

  @override
  String get insightsWeek => 'Settimana';

  @override
  String get insightsMonth => 'Mese';

  @override
  String get insightsProductivity => 'Punteggio produttività';

  @override
  String insightsPts(String delta) {
    return '$delta pt';
  }

  @override
  String get insightsVsLastWeek => 'vs settimana scorsa';

  @override
  String get insightsVsLastMonth => 'vs mese scorso';

  @override
  String insightsScoreDays(int n) {
    return 'Punteggio $n giorni';
  }

  @override
  String get insightsFocusHours => 'Ore di focus';

  @override
  String get insightsThisWeek => 'questa settimana';

  @override
  String get insightsThisMonth => 'questo mese';

  @override
  String insightsGoalOf(String done, String goal) {
    return '$done / $goal obiettivo';
  }

  @override
  String get insightsFocusScore => 'Focus';

  @override
  String get insightsGoals => 'Obiettivi';

  @override
  String get insightsConsistency => 'Costanza';

  @override
  String get insightsWeeklyFocus => 'Ore di focus settimanali';

  @override
  String insightsDailyFocus(int n) {
    return 'Focus giornaliero, ultimi $n giorni';
  }

  @override
  String insightsBestDay(String day, String time) {
    return 'Giorno migliore: $day · $time';
  }

  @override
  String insightsAvgDay(String time) {
    return 'Media $time / giorno';
  }

  @override
  String get insightsMonthlyTrends => 'Tendenze mensili';

  @override
  String get insightsActual => 'Reale';

  @override
  String get insightsGoal => 'Obiettivo';

  @override
  String insightsWk(int n) {
    return 'Sett $n';
  }

  @override
  String insightsWeekBeat(int n, String time) {
    return 'La settimana $n ha superato l\'obiettivo di $time';
  }

  @override
  String insightsWeekShort(int n, String time) {
    return 'Migliore: settimana $n, a $time dall\'obiettivo';
  }

  @override
  String get insightsGoalCompletion => 'Obiettivi raggiunti';

  @override
  String insightsDaysOf(int done, int total) {
    return '$done/$total giorni';
  }

  @override
  String get insightsNoGoals =>
      'Nessun obiettivo. Aggiungine uno per vedere i progressi qui.';

  @override
  String get insightsManageGoals => 'Gestisci';

  @override
  String insightsGoalFocus(String hours) {
    return 'Focus quotidiano: $hours ore';
  }

  @override
  String get insightsGoalBlock => 'Blocca app social';

  @override
  String insightsGoalPomo(int n) {
    return '$n pomodoro al giorno';
  }

  @override
  String insightsGoalScreen(String time) {
    return 'Meno di $time di schermo';
  }

  @override
  String get insightsGoalPhoneFree => 'Tempo senza telefono';

  @override
  String get insightsEmptyBadge => 'Nessuna sessione';

  @override
  String get insightsEmptyTitle => 'Le statistiche iniziano da una sessione';

  @override
  String get insightsEmptyBody =>
      'Completa una sessione di focus e qui vedrai punteggi, grafici e obiettivi.';

  @override
  String get insightsEmptyCta => 'Inizia una sessione';

  @override
  String get insightsDailyUsage => 'Uso giornaliero';

  @override
  String get insightsFocusTime => 'Tempo di focus';

  @override
  String get insightsVsAvg => 'vs media';

  @override
  String get insightsUsageByDay => 'Uso per giorno';

  @override
  String get insightsUsageByWeek => 'Uso per settimana';

  @override
  String get insightsUsage => 'Uso';

  @override
  String insightsTrend(int n) {
    return 'Andamento $n giorni';
  }

  @override
  String get insightsImproving => 'In calo';

  @override
  String get insightsRising => 'In aumento';

  @override
  String insightsDaysAgo(int n) {
    return '$n giorni fa';
  }

  @override
  String get insightsMostUsed => 'App più usate';

  @override
  String get insightsAllApps => 'Tutte le app';

  @override
  String get insightsBreakdown => 'Ripartizione';

  @override
  String get insightsTotal => 'totale';

  @override
  String get insightsNoUsage => 'Nessun dato per questo periodo.';

  @override
  String get insightsLockApp => 'Blocca questa app';

  @override
  String insightsLocked(String app) {
    return '$app è bloccata';
  }

  @override
  String get insightsCatSocial => 'Social';

  @override
  String get insightsCatVideo => 'Video';

  @override
  String get insightsCatGames => 'Giochi';

  @override
  String get insightsCatShopping => 'Shopping';

  @override
  String get insightsCatCommunity => 'Community';

  @override
  String get insightsCatOther => 'Altro';

  @override
  String nativeBlockTitle(String app) {
    return '$app è in pausa';
  }

  @override
  String get nativeReasonLimit =>
      'Hai esaurito il tempo di oggi per questa app.';

  @override
  String get nativeReasonSchedule =>
      'Ora è attiva una pianificazione di blocco.';

  @override
  String get nativeReasonGlobal => 'Questa app è bloccata in Pausey.';

  @override
  String get nativeReasonFocus => 'Sei in una sessione di concentrazione.';

  @override
  String get nativeClose => 'Chiudi app';

  @override
  String get nativeNotifTitle => 'Pausey sta rispettando i tuoi limiti';

  @override
  String get nativeNotifText => 'Limiti e pianificazioni di blocco attivi';

  @override
  String get profileSettings => 'Impostazioni';

  @override
  String get profileGuestName => 'Ospite';

  @override
  String get profileGuestBadge => 'Ospite · salvato su questo telefono';

  @override
  String get profileEditName => 'Modifica nome';

  @override
  String get profileNameHint => 'Il tuo nome';

  @override
  String get profileSave => 'Salva';

  @override
  String profileMemberSince(String date) {
    return 'Membro da $date';
  }

  @override
  String get profileProActive => 'Pro · Attivo';

  @override
  String get profileFree => 'Piano gratuito';

  @override
  String get profileUpgrade => 'Passa a Pro';

  @override
  String get profileBadges => 'Badge';

  @override
  String get profileNoBadges => 'Completa sessioni per ottenere badge';

  @override
  String get profileFocusTime => 'Tempo di focus';

  @override
  String get profileGoalsDone => 'Obiettivi raggiunti';

  @override
  String get profileDayStreak => 'Giorni di fila';

  @override
  String get profileAppsBlocked => 'App bloccate';

  @override
  String get profileFocusActivity => 'Attività di focus';

  @override
  String get profileLast4Weeks => 'Ultime 4 settimane';

  @override
  String get profileRecentActivity => 'Attività recente';

  @override
  String get profileSessionDone => 'Sessione completata';

  @override
  String get profileSessionStopped => 'Sessione interrotta';

  @override
  String get profileModePomodoro => 'Pomodoro';

  @override
  String get profileModeDeep => 'Lavoro profondo';

  @override
  String get profileModeCustom => 'Personalizzato';

  @override
  String get profileJustNow => 'Adesso';

  @override
  String profileAgoMinutes(int n) {
    return '$n min fa';
  }

  @override
  String profileAgoHours(int n) {
    return '$n h fa';
  }

  @override
  String get profileYesterday => 'Ieri';

  @override
  String get profileEmptyTitle => 'Ancora nessuna sessione';

  @override
  String get profileEmptyBody =>
      'Avvia la prima sessione: attività, serie e badge appariranno qui.';

  @override
  String get profileStartFocus => 'Inizia';

  @override
  String get profileMyGoals => 'I miei obiettivi';

  @override
  String get profileStreaks => 'Serie e badge';

  @override
  String get profileSubscription => 'Abbonamento';

  @override
  String get profileSignOutTitle => 'Uscire?';

  @override
  String get profileSignOutBody => 'Puoi accedere di nuovo quando vuoi.';

  @override
  String get profileSecNotifications => 'Notifiche';

  @override
  String get profileSecAppearance => 'Aspetto';

  @override
  String get profileSecFocus => 'Focus e blocco';

  @override
  String get profileSecPrivacy => 'Privacy e sicurezza';

  @override
  String get profileSecAccount => 'Account';

  @override
  String get profilePush => 'Notifiche push';

  @override
  String get profilePushSub => 'Promemoria e avvisi';

  @override
  String get profileReminder => 'Promemoria di inizio';

  @override
  String profileReminderSub(String time) {
    return 'Ogni giorno alle $time';
  }

  @override
  String get profileStreakAlerts => 'Avvisi serie';

  @override
  String get profileStreakAlertsSub => 'Prima di perdere la serie';

  @override
  String get profileGoalMilestones => 'Traguardi obiettivi';

  @override
  String get profileGoalMilestonesSub => 'Quando raggiungi un obiettivo';

  @override
  String get profileDarkMode => 'Modalità scura';

  @override
  String get profileOn => 'Attivo';

  @override
  String get profileOff => 'Disattivo';

  @override
  String get profileTextSize => 'Dimensione testo';

  @override
  String get profileTextSmall => 'Piccolo';

  @override
  String get profileTextMedium => 'Medio';

  @override
  String get profileTextLarge => 'Grande';

  @override
  String get profileTextHuge => 'Molto grande';

  @override
  String get profilePomodoroLen => 'Durata pomodoro';

  @override
  String get profileBreakLen => 'Durata pausa';

  @override
  String profileMinutes(int n) {
    return '$n min';
  }

  @override
  String get profileFaceIdUnlock => 'Face ID per sbloccare';

  @override
  String get profileFaceIdUnlockSub => 'Conferma prima di sbloccare';

  @override
  String get profileBypass => 'Sblocco di emergenza';

  @override
  String profileBypassSub(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n sblocchi al giorno',
      one: '1 sblocco al giorno',
    );
    return '$_temp0';
  }

  @override
  String get profileAppLock => 'Blocca Pausey con Face ID';

  @override
  String get profileAppLockSub => 'Chiedi all\'apertura';

  @override
  String get profileHideUsage => 'Nascondi dati d\'uso';

  @override
  String get profileHideUsageSub => 'Nascondi il tempo di utilizzo';

  @override
  String get profileClearData => 'Cancella attività';

  @override
  String get profileClearDataSub => 'Rimuove sessioni e cronologia';

  @override
  String get profileClearTitle => 'Cancellare l\'attività?';

  @override
  String get profileClearBody =>
      'Verranno eliminate tutte le sessioni e i check degli obiettivi su questo telefono. Non si può annullare.';

  @override
  String get profileClear => 'Cancella';

  @override
  String get profileCleared => 'Attività cancellata';

  @override
  String get profileExport => 'Esporta i miei dati';

  @override
  String get profileExportSub => 'Copia come JSON';

  @override
  String get profileExported => 'Dati copiati negli appunti';

  @override
  String get profileStreaksTitle => 'Serie';

  @override
  String get profileShare => 'Condividi';

  @override
  String profileShareText(int n) {
    return 'Sono a $n giorni di focus di fila con Pausey!';
  }

  @override
  String get profileCopied => 'Copiato negli appunti';

  @override
  String profileNextMilestone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n giorni',
      one: '1 giorno',
    );
    return 'Continua così: $_temp0 al prossimo traguardo!';
  }

  @override
  String get profileAllMilestones =>
      'Tutti i traguardi raggiunti. Leggendario!';

  @override
  String get profileStartStreak =>
      'Completa una sessione oggi per iniziare una serie.';

  @override
  String get profileBest => 'Record';

  @override
  String get profileThisWeek => 'Questa settimana';

  @override
  String profileDaysCompleted(int n) {
    return '$n/7 giorni completati';
  }

  @override
  String get profileCompleted => 'Completato';

  @override
  String get profilePartial => 'Parziale';

  @override
  String get profileMissed => 'Saltato';

  @override
  String get profilePrevMonth => 'Mese precedente';

  @override
  String get profileNextMonth => 'Mese successivo';

  @override
  String get profileMilestones => 'Traguardi serie';

  @override
  String get profileAchievements => 'Traguardi';

  @override
  String get profileAchOnFire => 'In fiamme';

  @override
  String get profileAchIronWill => 'Volontà di ferro';

  @override
  String get profileAchFocusMaster => 'Maestro del focus';

  @override
  String get profileAchMonk => 'Monaco digitale';

  @override
  String get profileAchLegend => 'Leggendario';

  @override
  String get profileAchSpeed => 'Inarrestabile';

  @override
  String profileAchStreakDesc(int n) {
    return 'Serie di $n giorni';
  }

  @override
  String profileAchSessionsDesc(int n) {
    return '$n sessioni completate';
  }

  @override
  String profileAchHoursDesc(int n) {
    return '$n h di focus';
  }

  @override
  String profileAchDayDesc(int n) {
    return '$n sessioni in un giorno';
  }

  @override
  String get navHome => 'Home';

  @override
  String get navBlock => 'Blocca';

  @override
  String get navFocus => 'Focus';

  @override
  String get navInsights => 'Statistiche';

  @override
  String get navProfile => 'Profilo';

  @override
  String get unitH => 'h';

  @override
  String get unitM => 'min';

  @override
  String get sampleData => 'Dati di esempio';

  @override
  String get seeAll => 'Vedi tutto';

  @override
  String days(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count giorni',
      one: '1 giorno',
    );
    return '$_temp0';
  }

  @override
  String get statesTitle => 'Stati';

  @override
  String get statesSubtitle => 'Schermate di errore, vuote e di caricamento';

  @override
  String get statesNoInternet => 'Nessuna connessione';

  @override
  String get statesConnectionLost => 'Connessione persa';

  @override
  String get statesOfflineTitle => 'Sei offline';

  @override
  String get statesOfflineMsg =>
      'Pausey non riesce a raggiungere il server. Controlla Wi-Fi o dati mobili e riprova: i tuoi dati locali sono al sicuro.';

  @override
  String get statesTryAgain => 'Riprova';

  @override
  String get statesOpenSettings => 'Apri impostazioni';

  @override
  String get statesOfflineMode => 'Modalità offline attiva';

  @override
  String get statesLimited => 'Limitato';

  @override
  String get statesAvailable => 'Disponibile';

  @override
  String get statesUnavailable => 'Non disponibile';

  @override
  String get statesCapSessions => 'Vedi sessioni precedenti';

  @override
  String get statesCapApps => 'Elenco app bloccate';

  @override
  String get statesCapTimer => 'Timer di focus locale';

  @override
  String get statesCapSync => 'Sincronizza serie e obiettivi';

  @override
  String get statesCapAnalytics => 'Aggiorna statistiche';

  @override
  String get statesOfflineNote =>
      'Tutti i dati sono salvati sul dispositivo. Offline non si perde nulla.';

  @override
  String get statesBackOnline => 'Di nuovo online: tutto sincronizzato';

  @override
  String get statesShowAgain => 'Mostra di nuovo';

  @override
  String get statesPermDenied => 'Permesso negato';

  @override
  String get statesPermRequired => 'Permesso richiesto';

  @override
  String get statesPermTitle => 'Accesso bloccato';

  @override
  String get statesPermMsg =>
      'Pausey ha bisogno dell\'accesso a Tempo di utilizzo per bloccare le app. Senza, il blocco non funziona.';

  @override
  String get statesGrant => 'Consenti accesso';

  @override
  String get statesLearnMore => 'Scopri di più';

  @override
  String get statesLearnMoreMsg =>
      'Con Tempo di utilizzo Pausey mette in pausa le app che distraggono. I dati restano sul telefono.';

  @override
  String get statesRequiredPerms => 'Permessi richiesti';

  @override
  String get statesPermNotif => 'Notifiche';

  @override
  String get statesPermScreenTime => 'Accesso Tempo di utilizzo';

  @override
  String get statesPermUsage => 'Statistiche di utilizzo';

  @override
  String get statesPermBio => 'Face ID / biometria';

  @override
  String get statesGranted => 'Concesso';

  @override
  String get statesDenied => 'Negato';

  @override
  String get statesPermNote =>
      'Senza Tempo di utilizzo il timer funziona, ma le app non vengono bloccate.';

  @override
  String get statesAccessGranted => 'Accesso concesso: blocco pronto';

  @override
  String get statesDataNA => 'Dati non disponibili';

  @override
  String get statesSyncFailed => 'Sincronizzazione non riuscita';

  @override
  String get statesLoadTitle => 'Impossibile caricare i dati';

  @override
  String get statesLoadMsg =>
      'Errore nel recupero delle statistiche. Forse un problema temporaneo: i dati locali sono intatti.';

  @override
  String get statesRetrySync => 'Riprova sync';

  @override
  String get statesUseCached => 'Usa cache';

  @override
  String get statesErrorDetails => 'Dettagli errore';

  @override
  String get statesErrorCode => 'Codice';

  @override
  String get statesTimestamp => 'Ora';

  @override
  String get statesRetryCount => 'Tentativi';

  @override
  String statesAttempts(int n) {
    return '$n / 3 tentativi';
  }

  @override
  String get statesReport => 'Segnala al supporto';

  @override
  String get statesReported => 'Grazie, segnalazione inviata';

  @override
  String get statesCachedNote =>
      'Nel frattempo sono disponibili i dati dell\'ultima sincronizzazione.';

  @override
  String get statesDataLoaded => 'Statistiche caricate';

  @override
  String get statesCachedShown => 'Dati in cache';

  @override
  String statesWeekFocus(String time) {
    return 'Focus questa settimana: $time';
  }

  @override
  String get statesEmpty => 'Stato vuoto';

  @override
  String get statesNothingYet => 'Ancora niente';

  @override
  String get statesEmptyTitle => 'Nessuna sessione';

  @override
  String get statesEmptyMsg =>
      'Avvia la prima sessione e qui vedrai i tuoi progressi.';

  @override
  String get statesStartFocus => 'Inizia';

  @override
  String get statesLoadingSection => 'Caricamento';

  @override
  String get statesDashLoading => 'Pannello';

  @override
  String get statesAnalyticsLoading => 'Statistiche';

  @override
  String get statesGoalsLoading => 'Obiettivi';

  @override
  String get statesProfileLoading => 'Profilo';

  @override
  String get statesCrunching => 'Elaboro i tuoi dati…';

  @override
  String get statesLoadingGoals => 'Carico i tuoi obiettivi…';

  @override
  String get statesLoadingProfile => 'Carico il profilo…';

  @override
  String get statesReplay => 'Ripeti';

  @override
  String get stHowCaption => 'Come funziona';

  @override
  String stHow1(String app) {
    return 'Riapri $app';
  }

  @override
  String get stHow2 => 'Inizi a scorrere, ma…';

  @override
  String get stHow3 => 'Pausey la blocca con delicatezza.';

  @override
  String stBlockedTitle(String app) {
    return '$app è bloccata';
  }

  @override
  String get stHow4 => 'E avvisa prima del limite';

  @override
  String get stYourApp => 'la tua app';

  @override
  String get stTapToContinue => 'Tocca per continuare';

  @override
  String get stNudgeGeneric => 'Quasi al limite giornaliero';

  @override
  String get stPermTitle => 'Concedi alcuni permessi';

  @override
  String get stPermUsageTitle => 'Tempo di utilizzo';

  @override
  String get stPermUsageWhy =>
      'Mostra il tempo di utilizzo giornaliero e quando raggiungi un limite.';

  @override
  String get stPermOverlayTitle => 'Mostra sopra altre app';

  @override
  String get stPermOverlayWhy =>
      'Permette a Pausey di mostrare la schermata di pausa sopra un\'app che ti distrae.';

  @override
  String get stPermNotifTitle => 'Notifiche';

  @override
  String get stPermNotifWhy =>
      'Promemoria gentili prima che un limite finisca. Puoi disattivarli in seguito.';

  @override
  String get stPermMore => 'Un\'ultima cosa…';

  @override
  String get stPermA11yTitle => 'Accessibilità';

  @override
  String get stPermA11yWhy =>
      'Rileva subito quale app è aperta, così la pausa scatta immediatamente.';

  @override
  String get stPermA11yNote =>
      'Alcuni telefoni mostrano poi una propria schermata di avviso. È normale: puoi disattivarlo quando vuoi nelle Impostazioni.';

  @override
  String get stPermOnHint =>
      'È già attivo. Per disattivarlo apri Impostazioni Android › App › Pausey.';

  @override
  String get stA11yDialogTitle => 'Perché l\'accessibilità?';

  @override
  String get stA11yDialogBody =>
      'Pausey usa l\'accessibilità solo per capire quale app è aperta, così limiti e programmi si attivano subito e la protezione resta affidabile.';

  @override
  String get stA11yNot => 'Cosa Pausey NON fa:';

  @override
  String get stA11yNot1 => 'Leggere o raccogliere ciò che è sullo schermo';

  @override
  String get stA11yNot2 => 'Memorizzare informazioni personali';

  @override
  String get stA11yNot3 => 'Condividere dati fuori dal telefono';

  @override
  String get stPw1 => 'Il tuo piano per una giornata più calma';

  @override
  String get stPw2 => 'Blocchi che non puoi aggirare con le scuse';

  @override
  String get stPw3 => 'Guarda i tuoi progressi settimana dopo settimana';

  @override
  String get stPwToday => 'Oggi';

  @override
  String get stPwGoal => 'Il tuo obiettivo';

  @override
  String stPwWeek(int n) {
    return 'S$n';
  }

  @override
  String get stPwFirstWeek => 'La tua prima settimana inizia ora';

  @override
  String get stPwFocusWeek => 'Tempo di concentrazione a settimana';

  @override
  String nudgeTitle(String app) {
    return 'Quasi al limite di $app';
  }

  @override
  String nudgeText(String used, String limit) {
    return 'Oggi usati $used su $limit';
  }

  @override
  String get homeUnblockAllFor => 'Sblocca tutte le app per…';

  @override
  String homeMinutesN(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n minuti',
      one: '1 minuto',
    );
    return '$_temp0';
  }

  @override
  String homeUnblockedLeft(String time) {
    return 'Sbloccate · mancano $time';
  }
}
