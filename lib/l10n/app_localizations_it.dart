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
  String get ob7Title =>
      'Imposta il tuo obiettivo giornaliero di tempo schermo';

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
  String get logInTitle => 'Bentornato';

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
}
