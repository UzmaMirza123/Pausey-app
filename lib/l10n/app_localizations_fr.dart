// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Pausey';

  @override
  String get tagline => 'Reprenez votre temps';

  @override
  String get versionLabel => 'Version 2.0 · Édition App Store';

  @override
  String get skip => 'Passer';

  @override
  String get continueLabel => 'Continuer';

  @override
  String get back => 'Retour';

  @override
  String get freeToStart => 'Gratuit pour commencer · Sans carte bancaire';

  @override
  String get dataStaysOnDevice =>
      'Vos données ne quittent jamais votre appareil.';

  @override
  String get switchToLight => 'Passer en mode clair';

  @override
  String get switchToDark => 'Passer en mode sombre';

  @override
  String get language => 'Langue';

  @override
  String get phoneLanguage => 'Langue du téléphone';

  @override
  String get authTitle => 'Stoppez le scroll.\nMaîtrisez votre journée.';

  @override
  String get authSubtitle =>
      'Créez un compte pour synchroniser vos objectifs et séries, ou essayez Pausey en invité.';

  @override
  String get continueWithApple => 'Continuer avec Apple';

  @override
  String get continueWithGoogle => 'Continuer avec Google';

  @override
  String get signUpWithEmail => 'S\'inscrire par e-mail';

  @override
  String get continueAsGuest => 'Continuer en invité';

  @override
  String get guestNote =>
      'Les données invité sont enregistrées uniquement sur ce téléphone.';

  @override
  String get or => 'ou';

  @override
  String get haveAccount => 'Vous avez déjà un compte ?';

  @override
  String get noAccount => 'Nouveau sur Pausey ?';

  @override
  String get logIn => 'Se connecter';

  @override
  String get signUp => 'S\'inscrire';

  @override
  String get createAccount => 'Créer un compte';

  @override
  String get signUpTitle => 'Créez votre compte';

  @override
  String get signUpSubtitle =>
      'Commencez à adopter de meilleures habitudes d\'écran.';

  @override
  String get logInTitle => 'Bon retour';

  @override
  String get logInSubtitle => 'Connectez-vous pour reprendre votre série.';

  @override
  String get fullName => 'Nom complet';

  @override
  String get email => 'E-mail';

  @override
  String get password => 'Mot de passe';

  @override
  String get confirmPassword => 'Confirmer le mot de passe';

  @override
  String get showPassword => 'Afficher le mot de passe';

  @override
  String get hidePassword => 'Masquer le mot de passe';

  @override
  String get forgotPassword => 'Mot de passe oublié ?';

  @override
  String get resetTitle => 'Réinitialiser le mot de passe';

  @override
  String get resetSubtitle =>
      'Saisissez votre e-mail, nous vous enverrons un lien.';

  @override
  String get sendLink => 'Envoyer le lien';

  @override
  String get resetSent => 'Consultez votre boîte de réception.';

  @override
  String get agreeTerms =>
      'J\'accepte les Conditions et la Politique de confidentialité';

  @override
  String get passwordStrength => 'Force du mot de passe';

  @override
  String get strengthWeak => 'Faible';

  @override
  String get strengthOk => 'Correct';

  @override
  String get strengthStrong => 'Fort';

  @override
  String get errNameRequired => 'Saisissez votre nom';

  @override
  String get errEmailInvalid => 'Saisissez un e-mail valide';

  @override
  String get errPasswordShort => 'Au moins 8 caractères';

  @override
  String get errPasswordMismatch => 'Les mots de passe ne correspondent pas';

  @override
  String get errTerms => 'Acceptez les conditions pour continuer';

  @override
  String get authErr_not_configured =>
      'La connexion n\'est pas encore configurée. Continuez en invité.';

  @override
  String get authErr_cancelled => 'Connexion annulée.';

  @override
  String get authErr_invalid_email => 'Cet e-mail semble incorrect.';

  @override
  String get authErr_wrong_password => 'E-mail ou mot de passe incorrect.';

  @override
  String get authErr_user_not_found =>
      'Aucun compte avec cet e-mail. S\'inscrire ?';

  @override
  String get authErr_email_in_use =>
      'Un compte existe déjà avec cet e-mail. Connectez-vous.';

  @override
  String get authErr_weak_password => 'Choisissez un mot de passe plus fort.';

  @override
  String get authErr_network => 'Pas de connexion. Réessayez.';

  @override
  String get authErr_too_many => 'Trop de tentatives. Patientez une minute.';

  @override
  String get authErr_unknown => 'Une erreur s\'est produite. Réessayez.';

  @override
  String homeHello(String name) {
    return 'Bonjour, $name';
  }

  @override
  String get homeHelloGuest => 'Bonjour';

  @override
  String get homeGuestBadge => 'Mode invité · enregistré sur ce téléphone';

  @override
  String get homeSubtitle => 'Votre plan est prêt. Voici vos choix.';

  @override
  String get homeDailyGoal => 'Objectif quotidien';

  @override
  String get homeLockedApps => 'Apps verrouillées';

  @override
  String get homeScreenTime => 'Temps d\'écran actuel';

  @override
  String get homeNotSet => 'Non défini';

  @override
  String get homeCreateAccount => 'Créez un compte pour sauvegarder';

  @override
  String get signOut => 'Se déconnecter';

  @override
  String get signOutGuestWarn => 'Se déconnecter supprime les données invité.';

  @override
  String get cancel => 'Annuler';
}
