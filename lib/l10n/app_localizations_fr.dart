// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get ob1Title => 'Réduisez l\'addiction aux écrans';

  @override
  String get ob1Body =>
      'Maîtrisez vos habitudes numériques et passez moins de temps sur les applis qui distraient.';

  @override
  String get ob1StatAvg => 'Temps d\'écran moyen par jour';

  @override
  String get ob1StatSocial => 'Sur les réseaux sociaux';

  @override
  String get ob2SelectApps => 'Choisir les applis';

  @override
  String get ob2Title => 'Verrouillez les applis distrayantes';

  @override
  String get ob2Body =>
      'Bloquez réseaux sociaux, jeux et autres distractions avec des outils de verrouillage puissants.';

  @override
  String get ob2Feature1 => 'Bloquez n\'importe quelle appli en un geste';

  @override
  String get ob2Feature2 =>
      'Planifiez verrouillages et plages de concentration';

  @override
  String get ob2Feature3 =>
      'Protégez les blocages par mot de passe pour tenir bon';

  @override
  String get sheetTitle => 'Choisir les applis';

  @override
  String get sheetTotalLocked => 'Total verrouillé';

  @override
  String get sheetAppsSelected => 'applis choisies';

  @override
  String get sheetTimeSaved => 'Temps gagné';

  @override
  String get sheetPerDayAvg => 'par jour en moy.';

  @override
  String sheetHoursValue(String h) {
    return '$h h';
  }

  @override
  String get sheetSearchHint => 'Rechercher des applis...';

  @override
  String get sheetCatAll => 'Toutes';

  @override
  String get sheetCatSocial => 'Social';

  @override
  String get sheetCatEntertainment => 'Divertissement';

  @override
  String get sheetCatGames => 'Jeux';

  @override
  String get sheetAppsHeader => 'APPLIS';

  @override
  String sheetSelectedCount(int count) {
    return '$count choisies';
  }

  @override
  String get sheetNoApps => 'Aucune appli trouvée';

  @override
  String get sheetLockSchedule => 'PLANNING DE VERROUILLAGE';

  @override
  String get sheetAddCustomSemantic => 'Ajouter un planning personnalisé';

  @override
  String get sheetCustomBadge => '+ Perso';

  @override
  String get sheetSchedMorning => 'Matin';

  @override
  String get sheetSchedWork => 'Travail';

  @override
  String get sheetSchedEvening => 'Soir';

  @override
  String get sheetEveryDay => 'Tous les jours';

  @override
  String get sheetWeekdays => 'En semaine';

  @override
  String get sheetWeekends => 'Week-ends';

  @override
  String get sheetUnlockMethod => 'MÉTHODE DE DÉVERROUILLAGE';

  @override
  String get sheetPin => 'Code PIN';

  @override
  String get sheetPinSub => 'PIN à 4 chiffres';

  @override
  String get sheetFaceId => 'Face ID';

  @override
  String get sheetFaceIdSub => 'Biométrie';

  @override
  String get sheetTouchId => 'Touch ID';

  @override
  String get sheetTouchIdSub => 'Empreinte';

  @override
  String get sheetFooter => 'Vous pourrez toujours le modifier plus tard';

  @override
  String get sheetConfirmLock => 'Confirmer';

  @override
  String sheetRemove(String name) {
    return 'Supprimer $name';
  }

  @override
  String get sheetCustomTitle => 'Planning personnalisé';

  @override
  String get sheetCustomBody =>
      'Vos applis choisies restent verrouillées pendant ce temps.';

  @override
  String get sheetNameLabel => 'NOM';

  @override
  String get sheetNameHint => 'ex. Révisions';

  @override
  String get sheetStarts => 'Début';

  @override
  String get sheetEnds => 'Fin';

  @override
  String get sheetSameTime => 'Le début et la fin sont identiques';

  @override
  String sheetLockedFor(String duration) {
    return 'Verrouillé pendant $duration';
  }

  @override
  String sheetLockedForOvernight(String duration) {
    return 'Verrouillé pendant $duration (la nuit)';
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
  String get sheetLockStartsAt => 'DÉBUT DU VERROUILLAGE';

  @override
  String get sheetLockEndsAt => 'FIN DU VERROUILLAGE';

  @override
  String get sheetRepeatOn => 'RÉPÉTER LE';

  @override
  String get sheetAddSchedule => 'Ajouter';

  @override
  String get sheetCustomDefaultName => 'Perso';

  @override
  String sheetChangeTime(String label, String time) {
    return '$label $time. Modifier l\'heure';
  }

  @override
  String get ob3Title => 'Restez concentré chaque jour';

  @override
  String get ob3Body =>
      'Utilisez les sessions Pomodoro et Concentration profonde pour être plus productif.';

  @override
  String get ob3Pomodoro => 'Pomodoro';

  @override
  String ob3PomodoroSub(int min) {
    return 'Sessions de $min min';
  }

  @override
  String get ob3DeepFocus => 'Concentration';

  @override
  String ob3DeepFocusSub(int min) {
    return 'Flow de $min min';
  }

  @override
  String get ob3StatBoost => 'productivité en plus';

  @override
  String ob3StatStreakValue(int days) {
    return '$days jours';
  }

  @override
  String get ob3StatStreak => 'série en cours';

  @override
  String get ob3StatGoal => 'objectifs atteints';

  @override
  String get ob3StartTimer => 'Démarrer le minuteur';

  @override
  String get ob3PauseTimer => 'Mettre en pause';

  @override
  String get ob4Title => 'Suivez vos progrès';

  @override
  String get ob4Body =>
      'Suivez temps d\'écran, heures de concentration, objectifs et productivité avec de belles statistiques.';

  @override
  String get ob4Weekly => 'Hebdo';

  @override
  String get ob4WeeklySub => 'rapports';

  @override
  String get ob4Goals => 'Objectifs';

  @override
  String get ob4GoalsSub => 'suivi';

  @override
  String get ob4Insights => 'Analyses';

  @override
  String get ob4InsightsSub => 'coach IA';

  @override
  String get ob4Streaks => 'Séries';

  @override
  String get ob4StreaksSub => 'et badges';

  @override
  String get ob5Title => 'Quel est votre temps d\'écran quotidien moyen ?';

  @override
  String get ob5Subtitle =>
      'Sur votre téléphone uniquement. Une estimation suffit.';

  @override
  String get ob5More7 => 'Plus de 7 heures';

  @override
  String get ob5H5to7 => '5-7 heures';

  @override
  String get ob5H4to5 => '4-5 heures';

  @override
  String get ob5H3to4 => '3-4 heures';

  @override
  String get ob5H1to3 => '1-3 heures';

  @override
  String get ob5Under1 => 'Moins d\'1 heure';

  @override
  String get ob6Title => 'Quelle est votre profession ?';

  @override
  String get ob6Subtitle =>
      'Nous adapterons votre plan de concentration à votre façon de travailler.';

  @override
  String get ob6Software => 'Développement logiciel';

  @override
  String get ob6Founder => 'PDG / Fondateur';

  @override
  String get ob6Remote => 'Télétravailleur';

  @override
  String get ob6Finance => 'Finance / Ops / Conseil';

  @override
  String get ob6Art => 'Art / Contenu';

  @override
  String get ob6Education => 'Éducation';

  @override
  String get ob6Others => 'Autres';

  @override
  String get ob7Title => 'Fixez votre objectif quotidien d\'écran';

  @override
  String get ob7Subtitle =>
      'Modifiable à tout moment. Nous vous préviendrons à l\'approche de la limite.';

  @override
  String ob7Hours(String hours) {
    return '$hours h';
  }

  @override
  String get ob7PerDay => 'par jour';

  @override
  String ob7HoursPerDay(String hours) {
    return '$hours par jour';
  }

  @override
  String get ob7DialLabel => 'Objectif quotidien d\'écran';

  @override
  String get ob7InfoNote =>
      'En moyenne, on passe plus de 4 h par jour sur son téléphone. Se fixer un objectif est le premier pas pour reprendre son temps.';

  @override
  String get ob8Title => 'Activez les autorisations essentielles';

  @override
  String get ob8Subtitle =>
      'Autorisez l\'accès pour profiter pleinement de Pausey.';

  @override
  String get ob8UsageTitle => 'Accès à l\'utilisation';

  @override
  String get ob8UsageSub =>
      'Suivez l\'usage des apps et appliquez les sessions de concentration.';

  @override
  String get ob8NotifTitle => 'Notifications';

  @override
  String get ob8NotifSub => 'Rappels ponctuels et alertes de progrès.';

  @override
  String get ob8TrackTitle => 'Suivi de l\'utilisation';

  @override
  String get ob8TrackSub => 'Bilans quotidiens et hebdomadaires.';

  @override
  String get ob9Title => 'Tout est prêt !';

  @override
  String get ob9Subtitle => 'Votre espace de concentration est prêt.';

  @override
  String get ob9Enter => 'Entrer dans Pausey';

  @override
  String get ob9Replay => 'Revoir l\'introduction';

  @override
  String get ob9ScreenTime => 'Temps d\'écran';

  @override
  String get ob9AppsLocked => 'Apps bloquées';

  @override
  String get ob9Permissions => 'Autorisations';

  @override
  String get ob9FocusMode => 'Mode focus';

  @override
  String get ob9AllOk => 'Tout OK';

  @override
  String get ob9On => 'ON';

  @override
  String get ob9Done => 'FINI';

  @override
  String get ob9StreakTitle => 'Votre série du jour 1 commence';

  @override
  String get ob9StreakSub => 'Terminez une session pour la poursuivre';

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
