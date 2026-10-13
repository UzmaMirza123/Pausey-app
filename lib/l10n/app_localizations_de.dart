// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

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
}
