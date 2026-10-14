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
  String alSummary(int locked, int total) {
    return '$locked restreintes · $total gérées';
  }

  @override
  String alSummaryOff(int total) {
    return '$total gérées · blocage inactif';
  }

  @override
  String get alFromInstalled => 'Choisir parmi les apps installées';

  @override
  String get alFromInstalledSub => 'N\'importe quelle app du téléphone';

  @override
  String get alPermTitle => 'Le blocage n\'est pas encore actif';

  @override
  String get alPermMsg =>
      'Vos règles sont enregistrées, mais Pausey ne peut rien bloquer sans ces deux autorisations :';

  @override
  String get alPermUsage => 'Accès à l\'utilisation';

  @override
  String get alPermUsageSub => 'Voir l\'app ouverte et son temps du jour';

  @override
  String get alPermOverlay => 'Afficher par-dessus les apps';

  @override
  String get alPermOverlaySub => 'Afficher l\'écran de verrouillage';

  @override
  String get alAllow => 'Autoriser';

  @override
  String get alAllowed => 'Autorisé';

  @override
  String get alPermReturn =>
      'Revenez dans Pausey ensuite : la vérification est automatique.';

  @override
  String get alAndroidOnly =>
      'Le blocage ne fonctionne que sur Android. Vous pouvez quand même régler vos règles ici.';

  @override
  String get alSearchHint => 'Rechercher une app';

  @override
  String get alFilterAll => 'Toutes';

  @override
  String get alFilterLocked => 'Bloquées';

  @override
  String get alFilterScheduled => 'Planifiées';

  @override
  String get alFilterAvailable => 'Disponibles';

  @override
  String get alStateLocked => 'Bloquée';

  @override
  String get alStateWillLock => 'À bloquer';

  @override
  String get alStateScheduled => 'Planifiée';

  @override
  String get alStateAvailable => 'Disponible';

  @override
  String alUsedOf(String used, String limit) {
    return '$used utilisées sur $limit';
  }

  @override
  String alUsedToday(String used) {
    return '$used aujourd\'hui';
  }

  @override
  String get alNoLimit => 'Sans limite';

  @override
  String alLimitNoUsage(String limit) {
    return 'Limite $limit · usage indisponible';
  }

  @override
  String get alRulesOff => 'Restrictions désactivées';

  @override
  String alNextLock(String time) {
    return 'Prochain blocage : $time';
  }

  @override
  String alUnlockedUntil(String time) {
    return 'Débloquée jusqu\'à $time';
  }

  @override
  String get alReasonLimit => 'Limite atteinte';

  @override
  String get alReasonSchedule => 'Plage de blocage active';

  @override
  String get alReasonGeneral => 'Planning général actif';

  @override
  String get alReasonAllDay => 'Bloquée toute la journée';

  @override
  String get alReasonFocus => 'Session de concentration en cours';

  @override
  String get alNoMatches => 'Aucune app ne correspond';

  @override
  String get alGeneral => 'Général';

  @override
  String get alGeneralScheduleSub =>
      'Pour les apps avec « Suivre le planning général »';

  @override
  String get alLockAllSub => 'Activer les restrictions partout';

  @override
  String get alSaved => 'Enregistré';

  @override
  String get alChangesApply => 'Les changements s\'appliquent tout de suite';

  @override
  String get alDetailsTitle => 'Limites de l\'app';

  @override
  String get alBlockingOff => 'Le blocage est inactif sur ce téléphone';

  @override
  String get alRestrictApp => 'Restreindre cette app';

  @override
  String get alMasterOff => 'Désactivé : Pausey ne la restreint pas';

  @override
  String get alMasterOnRules =>
      'La limite et les plages ci-dessous s\'appliquent';

  @override
  String get alMasterOnAllDay =>
      'Ni limite ni plage : bloquée toute la journée';

  @override
  String get alMasterOnGeneral => 'Bloquée pendant le planning général';

  @override
  String get alFollowGeneral => 'Suivre le planning général';

  @override
  String alFollowGeneralSub(String start, String end) {
    return 'Bloquer aussi $start – $end';
  }

  @override
  String get alGeneralOff => 'Le planning général est désactivé';

  @override
  String get alDailyLimit => 'Limite quotidienne';

  @override
  String get alDailyLimitOffSub => 'Bloque l\'app après un temps fixé par jour';

  @override
  String get alCustom => 'Personnalisé';

  @override
  String get alUsedLabel => 'Utilisé aujourd\'hui';

  @override
  String get alLeftLabel => 'Restant';

  @override
  String get alLimitReached => 'Limite du jour atteinte';

  @override
  String get alResets => 'Remise à zéro à minuit (heure du téléphone)';

  @override
  String get alUsageUnavailable => 'Usage indisponible';

  @override
  String get alUsageNeedsAccess =>
      'Autorisez l\'accès à l\'utilisation pour que Pausey compte le temps du jour.';

  @override
  String get alUsageAndroidOnly =>
      'L\'usage n\'est mesuré que sur Android. La limite est enregistrée et s\'y applique.';

  @override
  String get alGrantUsage => 'Autoriser l\'accès';

  @override
  String get alCustomLimitTitle => 'Limite personnalisée';

  @override
  String get alHours => 'Heures';

  @override
  String get alMinutes => 'Minutes';

  @override
  String get alErrZeroLimit => 'Choisissez plus de zéro';

  @override
  String get alSave => 'Enregistrer';

  @override
  String get alScheduledLocking => 'Blocage planifié';

  @override
  String get alScheduledOffSub => 'Bloque cette app à heures fixes';

  @override
  String get alNoSchedules => 'Aucune plage pour l\'instant';

  @override
  String get alAddSchedule => 'Ajouter une plage';

  @override
  String get alActiveNow => 'En cours';

  @override
  String get alScheduleDefault => 'Plage de blocage';

  @override
  String get alEndsNextDay => 'Finit le lendemain';

  @override
  String get alEdit => 'Modifier';

  @override
  String get alDelete => 'Supprimer';

  @override
  String get alDeleteScheduleQ => 'Supprimer cette plage ?';

  @override
  String alDeleteScheduleMsg(String title) {
    return '« $title » ne bloquera plus cette app.';
  }

  @override
  String get alNewSchedule => 'Nouvelle plage';

  @override
  String get alEditSchedule => 'Modifier la plage';

  @override
  String get alTitleOptional => 'Titre (facultatif)';

  @override
  String get alPresetStudy => 'Études';

  @override
  String get alPresetEvening => 'Soirée';

  @override
  String get alPresetSleep => 'Sommeil';

  @override
  String get alRepeatOn => 'Répéter le';

  @override
  String get alErrSameTime =>
      'Le début et la fin ne peuvent pas être identiques';

  @override
  String get alErrNoDays => 'Choisissez au moins un jour';

  @override
  String alTempUnlock(int minutes) {
    return 'Débloquer $minutes min';
  }

  @override
  String alTempUnlockSub(int n) {
    return 'Utilise 1 déblocage · $n restants';
  }

  @override
  String get alTempUnlockFocus =>
      'Impossible pendant une session de concentration';

  @override
  String get alTempUnlockNotLocked => 'Utile seulement si l\'app est bloquée';

  @override
  String alTempUnlockQ(String app, int minutes) {
    return 'Débloquer $app pendant $minutes minutes ?';
  }

  @override
  String get alUnlock => 'Débloquer';

  @override
  String get alEndEarly => 'Arrêter';

  @override
  String get alResetRules => 'Réinitialiser les règles';

  @override
  String get alResetRulesSub => 'Supprime la limite et les plages';

  @override
  String alResetQ(String app) {
    return 'Réinitialiser les règles de $app ?';
  }

  @override
  String get alResetMsg =>
      'Sa limite et toutes ses plages seront supprimées. L\'app reste dans la liste.';

  @override
  String get alReset => 'Réinitialiser';

  @override
  String get alResetDone => 'Règles réinitialisées';

  @override
  String get alRemoveApp => 'Retirer l\'app';

  @override
  String get alRemoveAppSub => 'Ne plus gérer cette app';

  @override
  String alRemoveQ(String app) {
    return 'Retirer $app ?';
  }

  @override
  String get alRemoveMsg =>
      'Pausey cessera de la restreindre et oubliera sa limite et ses plages.';

  @override
  String get alRemove => 'Retirer';

  @override
  String get alNoPackage =>
      'Les limites et plages par app demandent une app installée précise. Sur Android, ajoutez-la via « Choisir parmi les apps installées ».';

  @override
  String get alNotFound => 'Cette app n\'est plus gérée';

  @override
  String get alPickerTitle => 'Apps installées';

  @override
  String get alPickerAdded => 'Déjà ajoutée';

  @override
  String alPickerAdd(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Ajouter $n apps',
      one: 'Ajouter 1 app',
      zero: 'Ajouter',
    );
    return '$_temp0';
  }

  @override
  String get alPickerEmpty => 'Aucune app trouvée';

  @override
  String get blockTitle => 'Verrou d\'apps';

  @override
  String get blockAddApp => 'Ajouter';

  @override
  String get blockFaceIdTitle => 'Protection Face ID';

  @override
  String get blockFaceIdSub => 'Face ID requis pour déverrouiller';

  @override
  String get blockFaceIdUnavailable =>
      'Biométrie indisponible sur cet appareil';

  @override
  String get blockFaceIdReason => 'Confirmez votre identité pour activer';

  @override
  String get blockFaceIdFailed =>
      'Échec de vérification, protection désactivée';

  @override
  String get blockScheduleTitle => 'Verrou planifié';

  @override
  String get blockStart => 'Début';

  @override
  String get blockEnd => 'Fin';

  @override
  String get blockNeedOneDay => 'Gardez au moins un jour';

  @override
  String get blockManagedApps => 'Apps gérées';

  @override
  String get blockLockAll => 'Tout verrouiller';

  @override
  String get blockAllLocked => 'Toutes les apps sont verrouillées';

  @override
  String blockRemoved(String app) {
    return '$app retirée';
  }

  @override
  String get blockAppsUpdated => 'Apps mises à jour';

  @override
  String get blockCatSocial => 'Social';

  @override
  String get blockCatVideo => 'Vidéo';

  @override
  String get blockCatGames => 'Jeux';

  @override
  String get blockCatShopping => 'Shopping';

  @override
  String get blockCatCommunity => 'Communauté';

  @override
  String get blockCatOther => 'Autres';

  @override
  String get blockEmptyBadge => 'Rien de bloqué';

  @override
  String get blockEmptyTitle => 'Aucune app pour l\'instant';

  @override
  String get blockEmptyMsg =>
      'Ajoutez les apps qui vous distraient et Pausey les verrouillera.';

  @override
  String get blockEmergencyTitle => 'Déblocage d\'urgence';

  @override
  String blockEmergencySub(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n restants',
      one: '1 restant',
    );
    return 'Tout débloquer temporairement · $_temp0 aujourd\'hui';
  }

  @override
  String get blockEmergencyOff => 'Désactivé dans Réglages';

  @override
  String get blockEmergencyUse => 'Utiliser';

  @override
  String get blockEmergencyConfirmTitle => 'Utiliser le déblocage d\'urgence ?';

  @override
  String blockEmergencyConfirmMsg(int n) {
    return 'Cela utilise un des $n déblocages restants aujourd\'hui. Seulement en cas de besoin.';
  }

  @override
  String get blockEmergencyUsed => 'Déblocage utilisé : apps ouvertes';

  @override
  String get blockEmergencyNone => 'Plus aucun déblocage aujourd\'hui';

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

  @override
  String get ob6OtherHint => 'Saisissez votre métier';

  @override
  String get timeSecondLabel => 'Seconde';

  @override
  String get focusModePomodoro => 'Pomodoro';

  @override
  String get focusModeDeep => 'Focus profond';

  @override
  String get focusModeCustom => 'Perso';

  @override
  String get focusRemaining => 'RESTANT';

  @override
  String get focusBreakLabel => 'PAUSE';

  @override
  String get focusReadyLabel => 'PRÊT';

  @override
  String get focusInSession => 'En session';

  @override
  String get focusPausedState => 'En pause';

  @override
  String get focusOnBreak => 'En pause';

  @override
  String get focusIdleState => 'Appuyez sur lecture';

  @override
  String get focusSessionsDone => 'Sessions faites';

  @override
  String get focusProgress => 'Progression';

  @override
  String get focusBreakAfter => 'Pause après';

  @override
  String get focusFocusedToday => 'Aujourd\'hui';

  @override
  String focusAppsBlocked(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count apps bloquées',
      one: '1 app bloquée',
    );
    return '$_temp0';
  }

  @override
  String get focusAppsBlockedSub => 'Les distractions sont verrouillées.';

  @override
  String get focusNoApps => 'Aucune app bloquée';

  @override
  String get focusNoAppsSub => 'Choisissez les apps à verrouiller.';

  @override
  String get focusEdit => 'Modifier';

  @override
  String get focusAdd => 'Ajouter';

  @override
  String get focusAmbient => 'Son d\'ambiance';

  @override
  String get focusSoundOff => 'Désactivé';

  @override
  String get focusSoundRain => 'Pluie';

  @override
  String get focusSoundForest => 'Forêt';

  @override
  String get focusSoundWaves => 'Vagues';

  @override
  String get focusSoundWhite => 'Bruit blanc';

  @override
  String get focusVolume => 'Volume';

  @override
  String get focusStart => 'Démarrer';

  @override
  String get focusPause => 'Pause';

  @override
  String get focusResume => 'Reprendre';

  @override
  String get focusStop => 'Arrêter';

  @override
  String get focusRestart => 'Recommencer';

  @override
  String get focusSkipBreak => 'Passer la pause';

  @override
  String get focusDurations => 'Durée des sessions';

  @override
  String focusMinutesN(int n) {
    return '$n min';
  }

  @override
  String get focusBreakLength => 'Pause';

  @override
  String get focusCustomTitle => 'Durée perso';

  @override
  String get focusSet => 'Valider';

  @override
  String get focusStopTitle => 'Terminer plus tôt ?';

  @override
  String get focusStopBody => 'Le temps déjà concentré sera enregistré.';

  @override
  String get focusEndSession => 'Terminer';

  @override
  String get focusKeepGoing => 'Continuer';

  @override
  String get focusTooShort => 'Moins d\'une minute : non enregistré.';

  @override
  String get focusBreakOver => 'Pause terminée, on repart ?';

  @override
  String get focusBusy => 'Terminez la session pour changer de mode.';

  @override
  String get focusFirstHint => 'Votre première session commence ici.';

  @override
  String get focusCompleteA => 'Session';

  @override
  String get focusCompleteB => 'terminée !';

  @override
  String get focusEndedTitle => 'Session terminée';

  @override
  String focusCompleteMsg(String mode) {
    return 'Excellent ! Vous avez terminé votre session $mode sans distraction.';
  }

  @override
  String get focusEndedMsg =>
      'Chaque minute compte. Visez une session complète.';

  @override
  String get focusDurationLabel => 'DURÉE DE FOCUS';

  @override
  String get focusMinUnit => 'min';

  @override
  String get focusDayStreak => 'Série';

  @override
  String get focusAppsLabel => 'Apps bloquées';

  @override
  String get focusTodayGoal => 'Objectif du jour';

  @override
  String focusPctCompleted(int pct) {
    return '$pct % atteint';
  }

  @override
  String focusPlusPct(int pct) {
    return '+$pct % grâce à cette session';
  }

  @override
  String get focusMomentum => 'Gardez le rythme !';

  @override
  String get focusQuote1 =>
      'La régularité bat l\'intensité. Chaque session compte.';

  @override
  String get focusQuote2 =>
      'De petits blocs de focus font de grands résultats.';

  @override
  String get focusQuote3 => 'Pas de scroll, du concret. Recommencez.';

  @override
  String get focusStartNext => 'Session suivante';

  @override
  String get focusBackHome => 'Retour à l\'accueil';

  @override
  String get goalsTitle => 'Mes objectifs';

  @override
  String goalsSubtitle(int active, int done) {
    return '$active actifs · $done terminés';
  }

  @override
  String get goalsAdd => 'Ajouter';

  @override
  String get goalsCompleted => 'Terminés';

  @override
  String get goalsActive => 'Actifs';

  @override
  String get goalsStreak => 'Série';

  @override
  String get goalsOverall => 'Progression globale';

  @override
  String goalsWeeklyHit(int hit, int total) {
    return '$hit sur $total objectifs de la semaine';
  }

  @override
  String goalsVsLastWeek(String delta) {
    return '$delta vs semaine passée';
  }

  @override
  String get goalsFilterAll => 'Tous';

  @override
  String get goalsDone => 'Fait';

  @override
  String get goalsCatFocus => 'Concentration';

  @override
  String get goalsCatDiscipline => 'Discipline';

  @override
  String get goalsCatWellness => 'Bien-être';

  @override
  String goalsTitleFocusHours(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Concentration : $n heures',
      one: 'Concentration : 1 heure',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleFocusDur(String duration) {
    return 'Concentration : $duration';
  }

  @override
  String get goalsTitleBlock => 'Bloquer les réseaux sociaux';

  @override
  String goalsTitleSessions(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Pomodoros par jour',
      one: '1 Pomodoro par jour',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleScreen(String duration) {
    return 'Moins de $duration d\'écran';
  }

  @override
  String get goalsTitlePhoneFree => 'Temps sans téléphone';

  @override
  String goalsDescFocus(String duration) {
    return 'Atteignez $duration de concentration chaque jour';
  }

  @override
  String goalsDescBlock(int n) {
    return 'Gardez vos apps bloquées $n jours par semaine';
  }

  @override
  String goalsDescSessions(int n) {
    return 'Terminez au moins $n sessions par jour';
  }

  @override
  String goalsDescScreen(String duration) {
    return 'Moins de $duration de téléphone par jour';
  }

  @override
  String goalsDescPhoneFree(int n) {
    return '$n jours sans téléphone par semaine — cochez-les';
  }

  @override
  String goalsProgressDays(int done, int total) {
    return '$done / $total jours';
  }

  @override
  String goalsProgressSessions(int done, int total) {
    return '$done / $total sessions';
  }

  @override
  String goalsStreakShort(int n) {
    return '$n j';
  }

  @override
  String goalsStreakN(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Série de $n jours',
      one: 'Série de 1 jour',
    );
    return '$_temp0';
  }

  @override
  String get goalsCheckIn => 'Valider aujourd\'hui';

  @override
  String get goalsCheckedIn => 'Fait aujourd\'hui';

  @override
  String get goalsCheckedSnack => 'Bravo ! Aujourd\'hui est validé.';

  @override
  String get goalsUncheckedSnack => 'Aujourd\'hui n\'est plus validé.';

  @override
  String get goalsCreateNew => 'Créer un objectif';

  @override
  String get goalsEmptyBadge => 'Commencez';

  @override
  String get goalsEmptyTitle => 'Aucun objectif';

  @override
  String get goalsEmptyMsg =>
      'Fixez un petit objectif quotidien, Pausey le suivra pour vous.';

  @override
  String get goalsFilterEmpty => 'Aucun objectif pour ce filtre.';

  @override
  String get goalsNewGoal => 'Nouvel objectif';

  @override
  String get goalsEditGoal => 'Modifier l\'objectif';

  @override
  String get goalsType => 'Type d\'objectif';

  @override
  String get goalsTypeFocus => 'Temps de concentration';

  @override
  String get goalsTypeSessions => 'Sessions';

  @override
  String get goalsTypeBlock => 'Bloquer des apps';

  @override
  String get goalsTypePhoneFree => 'Jours sans téléphone';

  @override
  String get goalsTypeScreen => 'Limite d\'écran';

  @override
  String get goalsCategory => 'Catégorie';

  @override
  String get goalsTarget => 'Cible';

  @override
  String get goalsPerDay => 'par jour';

  @override
  String get goalsPerWeek => 'jours par semaine';

  @override
  String get goalsMaxPerDay => 'maximum par jour';

  @override
  String get goalsTitleOptional => 'Titre (facultatif)';

  @override
  String get goalsSave => 'Enregistrer';

  @override
  String get goalsCreate => 'Créer l\'objectif';

  @override
  String get goalsSavedSnack => 'Objectif enregistré';

  @override
  String get goalsCreatedSnack => 'Objectif créé';

  @override
  String get goalsEdit => 'Modifier';

  @override
  String get goalsDelete => 'Supprimer l\'objectif';

  @override
  String get goalsDeleteQ => 'Supprimer cet objectif ?';

  @override
  String get goalsDeleteMsg =>
      'Ses validations seront supprimées. Action irréversible.';

  @override
  String get goalsDeletedSnack => 'Objectif supprimé';

  @override
  String get goalsComplete => 'terminé';

  @override
  String get goalsDaysActive => 'Jours actifs';

  @override
  String get goalsTotalTime => 'Temps total';

  @override
  String get goalsSessionsLabel => 'Sessions';

  @override
  String get goals7Day => 'Progression sur 7 jours';

  @override
  String get goals7DaysAgo => 'Il y a 7 jours';

  @override
  String get goalsToday => 'Aujourd\'hui';

  @override
  String goalsTodayDate(String date) {
    return 'Aujourd\'hui, $date';
  }

  @override
  String goalsYesterdayDate(String date) {
    return 'Hier, $date';
  }

  @override
  String get goalsMilestones => 'Étapes';

  @override
  String get goalsMsFirst => 'Premier jour réussi';

  @override
  String get goalsMs3 => 'Série de 3 jours';

  @override
  String get goalsMsHalf => '50 % de l\'objectif hebdo';

  @override
  String get goalsMs5 => 'Série de 5 jours';

  @override
  String get goalsMsWeek => 'Semaine complète';

  @override
  String get goalsMsLocked => 'Pas encore';

  @override
  String get goalsHistory => 'Historique';

  @override
  String get goalsShowLess => 'Voir moins';

  @override
  String get goalsStartSession => 'Lancer une session';

  @override
  String get goalsManageApps => 'Gérer les apps bloquées';

  @override
  String get goalsBlockHint =>
      'Compté automatiquement quand le planning de blocage est actif.';

  @override
  String goalsScreenToday(String used) {
    return 'Écran aujourd\'hui : $used';
  }

  @override
  String get goalsNotFound => 'Cet objectif n\'existe plus.';

  @override
  String get goalsMore => 'Plus d\'options';

  @override
  String goalsFreeLimit(int n) {
    return 'Offre gratuite : $n objectifs max';
  }

  @override
  String get homeGoodMorning => 'Bonjour';

  @override
  String get homeGoodAfternoon => 'Bon après-midi';

  @override
  String get homeGoodEvening => 'Bonsoir';

  @override
  String get homeFriend => 'Ami';

  @override
  String get homeTodayFocus => 'Focus du jour';

  @override
  String homeVsYesterday(String pct) {
    return '$pct % vs hier';
  }

  @override
  String get homeStartToday => 'Pas encore de focus';

  @override
  String get homeDayStreak => 'Jours d\'affilée';

  @override
  String get homeTodayGoal => 'Objectif du jour';

  @override
  String homePctCompleted(int pct) {
    return '$pct % terminé';
  }

  @override
  String get homeOnTrack => 'En bonne voie !';

  @override
  String get homeKeepGoing => 'Continuez';

  @override
  String get homeGoalMet => 'Objectif atteint !';

  @override
  String get homeScreenTimeTitle => 'Temps d\'écran';

  @override
  String get homeToday => 'Aujourd\'hui';

  @override
  String homeVsAvg(String pct) {
    return '$pct % vs moyenne';
  }

  @override
  String get homeQuickStart => 'Lancer une session de focus';

  @override
  String get homeManage => 'Gérer';

  @override
  String get homeNoApps =>
      'Choisissez les apps qui vous distraient le plus et verrouillez-les.';

  @override
  String get homeAddApps => 'Ajouter des apps';

  @override
  String homeAppLocked(String app) {
    return '$app verrouillée';
  }

  @override
  String homeAppUnlocked(String app) {
    return '$app déverrouillée';
  }

  @override
  String homeLockApp(String app) {
    return 'Verrouiller ou déverrouiller $app';
  }

  @override
  String get homeUpgradeTitle => 'Passer à Premium';

  @override
  String get homeUpgradeBody => 'Blocages, objectifs et analyses illimités.';

  @override
  String get homeTryFree => 'Essai gratuit';

  @override
  String get homePro => 'PRO';

  @override
  String get homeProActive => 'Pausey Pro est actif';

  @override
  String get homeProActiveBody => 'Tout est débloqué. Merci de votre soutien !';

  @override
  String get homeNotifications => 'Notifications';

  @override
  String get homeNoNotifications => 'Vous êtes à jour.';

  @override
  String get homePushLabel => 'Notifications push';

  @override
  String get homeFocusReminder => 'Rappel quotidien';

  @override
  String get homeStreakAlerts => 'Alertes de série';

  @override
  String get homePwTitle => 'Débloquez Pausey Pro';

  @override
  String get homePwSubtitle =>
      'Retrouvez votre concentration et battez l\'addiction au téléphone.';

  @override
  String get homePwMonthly => 'Mensuel';

  @override
  String get homePwBilledMonthly => 'Facturé chaque mois';

  @override
  String get homePwYearly => 'Annuel';

  @override
  String get homePwPopular => 'Populaire';

  @override
  String homePwSave(int pct) {
    return '−$pct %';
  }

  @override
  String homePwBilledYearly(String price) {
    return '$price facturé par an';
  }

  @override
  String get homePwLifetime => 'À vie';

  @override
  String get homePwBestValue => 'Meilleur prix';

  @override
  String get homePwPayOnce => 'Payez une fois, à vie';

  @override
  String get homePwPerMonth => '/ mois';

  @override
  String get homePwOnce => 'une fois';

  @override
  String get homePwStartTrial => 'Essai gratuit de 7 jours';

  @override
  String get homePwBuyLifetime => 'Accès à vie';

  @override
  String get homePwNoCharge =>
      'Rien à payer aujourd\'hui · Annulable à tout moment';

  @override
  String get homePwOneTime => 'Paiement unique · Sans abonnement';

  @override
  String get homePwFree => 'Gratuit';

  @override
  String get homePwProCol => 'Pro';

  @override
  String get homePwFeatBlocking => 'Blocage d\'apps illimité';

  @override
  String get homePwFeatSessions => 'Tous les modes de focus';

  @override
  String get homePwFeatGoals => 'Objectifs illimités';

  @override
  String get homePwFeatAnalytics => 'Analyses avancées';

  @override
  String get homePwFeatStreak => 'Protection de série';

  @override
  String get homePwFeatSchedule => 'Planification du focus';

  @override
  String get homePwFeatFaceId => 'Verrouillage Face ID';

  @override
  String get homePwFeatNotif => 'Notifications intelligentes';

  @override
  String homePwMax(int n) {
    return '$n max';
  }

  @override
  String get homePwSecure => 'Paiement sécurisé';

  @override
  String get homePwCancelAnytime => 'Annulable';

  @override
  String get homePwPrivacyFirst => 'Confidentialité';

  @override
  String get homePwRestore => 'Restaurer les achats';

  @override
  String get homePwTerms => 'Conditions d\'utilisation';

  @override
  String get homePwPrivacyPolicy => 'Politique de confidentialité';

  @override
  String get homePwWelcome => 'Bienvenue dans Pausey Pro !';

  @override
  String get homePwNothingToRestore => 'Aucun achat précédent trouvé.';

  @override
  String get homePwRestored => 'Votre accès Pro est actif.';

  @override
  String get homePwLinkSoon => 'Cette page s\'ouvrira bientôt sur notre site.';

  @override
  String get homePwYouArePro => 'Vous êtes Pro, profitez-en !';

  @override
  String get homePwClose => 'Fermer';

  @override
  String get homeAvgLegend => 'Moyenne sur 7 jours';

  @override
  String homeGoalOf(String done, String goal) {
    return '$done sur $goal';
  }

  @override
  String get homeBest => 'Record :';

  @override
  String get insightsAnalytics => 'Analyses';

  @override
  String get insightsScreenTime => 'Temps d\'écran';

  @override
  String get insightsToday => 'Aujourd\'hui';

  @override
  String get insightsWeek => 'Semaine';

  @override
  String get insightsMonth => 'Mois';

  @override
  String get insightsProductivity => 'Score de productivité';

  @override
  String insightsPts(String delta) {
    return '$delta pts';
  }

  @override
  String get insightsVsLastWeek => 'vs semaine dernière';

  @override
  String get insightsVsLastMonth => 'vs mois dernier';

  @override
  String insightsScoreDays(int n) {
    return 'Score sur $n jours';
  }

  @override
  String get insightsFocusHours => 'Heures de focus';

  @override
  String get insightsThisWeek => 'cette semaine';

  @override
  String get insightsThisMonth => 'ce mois-ci';

  @override
  String insightsGoalOf(String done, String goal) {
    return '$done / $goal objectif';
  }

  @override
  String get insightsFocusScore => 'Focus';

  @override
  String get insightsGoals => 'Objectifs';

  @override
  String get insightsConsistency => 'Régularité';

  @override
  String get insightsWeeklyFocus => 'Heures de focus de la semaine';

  @override
  String insightsDailyFocus(int n) {
    return 'Focus quotidien, $n derniers jours';
  }

  @override
  String insightsBestDay(String day, String time) {
    return 'Meilleur jour : $day · $time';
  }

  @override
  String insightsAvgDay(String time) {
    return 'Moy. $time / jour';
  }

  @override
  String get insightsMonthlyTrends => 'Tendances du mois';

  @override
  String get insightsActual => 'Réel';

  @override
  String get insightsGoal => 'Objectif';

  @override
  String insightsWk(int n) {
    return 'Sem $n';
  }

  @override
  String insightsWeekBeat(int n, String time) {
    return 'Semaine $n : objectif dépassé de $time';
  }

  @override
  String insightsWeekShort(int n, String time) {
    return 'Meilleure : semaine $n, à $time de l\'objectif';
  }

  @override
  String get insightsGoalCompletion => 'Objectifs atteints';

  @override
  String insightsDaysOf(int done, int total) {
    return '$done/$total jours';
  }

  @override
  String get insightsNoGoals =>
      'Aucun objectif. Ajoutez-en un pour suivre vos progrès ici.';

  @override
  String get insightsManageGoals => 'Gérer';

  @override
  String insightsGoalFocus(String hours) {
    return 'Focus quotidien : $hours heures';
  }

  @override
  String get insightsGoalBlock => 'Bloquer les réseaux sociaux';

  @override
  String insightsGoalPomo(int n) {
    return '$n pomodoros par jour';
  }

  @override
  String insightsGoalScreen(String time) {
    return 'Moins de $time d\'écran';
  }

  @override
  String get insightsGoalPhoneFree => 'Temps sans téléphone';

  @override
  String get insightsEmptyBadge => 'Aucune session';

  @override
  String get insightsEmptyTitle =>
      'Vos statistiques commencent par une session';

  @override
  String get insightsEmptyBody =>
      'Terminez une session de focus pour voir ici vos scores, graphiques et objectifs.';

  @override
  String get insightsEmptyCta => 'Lancer une session';

  @override
  String get insightsDailyUsage => 'Usage quotidien';

  @override
  String get insightsFocusTime => 'Temps de focus';

  @override
  String get insightsVsAvg => 'vs moy.';

  @override
  String get insightsUsageByDay => 'Usage par jour';

  @override
  String get insightsUsageByWeek => 'Usage par semaine';

  @override
  String get insightsUsage => 'Usage';

  @override
  String insightsTrend(int n) {
    return 'Tendance sur $n jours';
  }

  @override
  String get insightsImproving => 'En progrès';

  @override
  String get insightsRising => 'En hausse';

  @override
  String insightsDaysAgo(int n) {
    return 'Il y a $n jours';
  }

  @override
  String get insightsMostUsed => 'Apps les plus utilisées';

  @override
  String get insightsAllApps => 'Toutes les apps';

  @override
  String get insightsBreakdown => 'Répartition';

  @override
  String get insightsTotal => 'total';

  @override
  String get insightsNoUsage => 'Aucun temps d\'écran sur cette période.';

  @override
  String get insightsLockApp => 'Bloquer cette app';

  @override
  String insightsLocked(String app) {
    return '$app est bloquée';
  }

  @override
  String get insightsCatSocial => 'Social';

  @override
  String get insightsCatVideo => 'Vidéo';

  @override
  String get insightsCatGames => 'Jeux';

  @override
  String get insightsCatShopping => 'Shopping';

  @override
  String get insightsCatCommunity => 'Communauté';

  @override
  String get insightsCatOther => 'Autres';

  @override
  String nativeBlockTitle(String app) {
    return '$app est en pause';
  }

  @override
  String get nativeReasonLimit =>
      'Vous avez utilisé le temps du jour pour cette appli.';

  @override
  String get nativeReasonSchedule => 'Un horaire de blocage est actif.';

  @override
  String get nativeReasonGlobal => 'Cette appli est verrouillée dans Pausey.';

  @override
  String get nativeReasonFocus => 'Vous êtes en session de concentration.';

  @override
  String get nativeClose => 'Fermer l\'appli';

  @override
  String get nativeNotifTitle => 'Pausey veille sur vos limites';

  @override
  String get nativeNotifText => 'Limites et horaires de blocage actifs';

  @override
  String get profileSettings => 'Réglages';

  @override
  String get profileGuestName => 'Invité';

  @override
  String get profileGuestBadge => 'Invité · enregistré sur ce téléphone';

  @override
  String get profileEditName => 'Modifier le nom';

  @override
  String get profileNameHint => 'Votre nom';

  @override
  String get profileSave => 'Enregistrer';

  @override
  String profileMemberSince(String date) {
    return 'Membre depuis $date';
  }

  @override
  String get profileProActive => 'Pro · Actif';

  @override
  String get profileFree => 'Offre gratuite';

  @override
  String get profileUpgrade => 'Passer Pro';

  @override
  String get profileBadges => 'Badges';

  @override
  String get profileNoBadges => 'Terminez des sessions pour gagner des badges';

  @override
  String get profileFocusTime => 'Temps de focus';

  @override
  String get profileGoalsDone => 'Objectifs atteints';

  @override
  String get profileDayStreak => 'Jours d\'affilée';

  @override
  String get profileAppsBlocked => 'Apps bloquées';

  @override
  String get profileFocusActivity => 'Activité de focus';

  @override
  String get profileLast4Weeks => '4 dernières semaines';

  @override
  String get profileRecentActivity => 'Activité récente';

  @override
  String get profileSessionDone => 'Session terminée';

  @override
  String get profileSessionStopped => 'Session arrêtée tôt';

  @override
  String get profileModePomodoro => 'Pomodoro';

  @override
  String get profileModeDeep => 'Travail profond';

  @override
  String get profileModeCustom => 'Personnalisé';

  @override
  String get profileJustNow => 'À l\'instant';

  @override
  String profileAgoMinutes(int n) {
    return 'il y a $n min';
  }

  @override
  String profileAgoHours(int n) {
    return 'il y a $n h';
  }

  @override
  String get profileYesterday => 'Hier';

  @override
  String get profileEmptyTitle => 'Pas encore de session';

  @override
  String get profileEmptyBody =>
      'Lancez votre première session : activité, série et badges apparaîtront ici.';

  @override
  String get profileStartFocus => 'Commencer';

  @override
  String get profileMyGoals => 'Mes objectifs';

  @override
  String get profileStreaks => 'Séries et badges';

  @override
  String get profileSubscription => 'Abonnement';

  @override
  String get profileSignOutTitle => 'Se déconnecter ?';

  @override
  String get profileSignOutBody =>
      'Vous pourrez vous reconnecter à tout moment.';

  @override
  String get profileSecNotifications => 'Notifications';

  @override
  String get profileSecAppearance => 'Apparence';

  @override
  String get profileSecFocus => 'Focus et blocage';

  @override
  String get profileSecPrivacy => 'Confidentialité et sécurité';

  @override
  String get profileSecAccount => 'Compte';

  @override
  String get profilePush => 'Notifications push';

  @override
  String get profilePushSub => 'Rappels et alertes';

  @override
  String get profileReminder => 'Rappel de démarrage';

  @override
  String profileReminderSub(String time) {
    return 'Tous les jours à $time';
  }

  @override
  String get profileStreakAlerts => 'Alertes de série';

  @override
  String get profileStreakAlertsSub => 'Avant de perdre votre série';

  @override
  String get profileGoalMilestones => 'Étapes d\'objectifs';

  @override
  String get profileGoalMilestonesSub => 'Quand vous atteignez un objectif';

  @override
  String get profileDarkMode => 'Mode sombre';

  @override
  String get profileOn => 'Activé';

  @override
  String get profileOff => 'Désactivé';

  @override
  String get profileTextSize => 'Taille du texte';

  @override
  String get profileTextSmall => 'Petit';

  @override
  String get profileTextMedium => 'Moyen';

  @override
  String get profileTextLarge => 'Grand';

  @override
  String get profileTextHuge => 'Très grand';

  @override
  String get profilePomodoroLen => 'Durée du pomodoro';

  @override
  String get profileBreakLen => 'Durée de la pause';

  @override
  String profileMinutes(int n) {
    return '$n min';
  }

  @override
  String get profileFaceIdUnlock => 'Face ID pour déverrouiller';

  @override
  String get profileFaceIdUnlockSub => 'Confirmer avant de déverrouiller';

  @override
  String get profileBypass => 'Accès d\'urgence';

  @override
  String profileBypassSub(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n déverrouillages par jour',
      one: '1 déverrouillage par jour',
    );
    return '$_temp0';
  }

  @override
  String get profileAppLock => 'Verrouiller Pausey avec Face ID';

  @override
  String get profileAppLockSub => 'Demander à l\'ouverture';

  @override
  String get profileHideUsage => 'Masquer les données d\'usage';

  @override
  String get profileHideUsageSub => 'Masquer le temps d\'écran';

  @override
  String get profileClearData => 'Effacer l\'activité';

  @override
  String get profileClearDataSub => 'Supprime sessions et historique';

  @override
  String get profileClearTitle => 'Effacer l\'activité ?';

  @override
  String get profileClearBody =>
      'Toutes les sessions et validations d\'objectifs de ce téléphone seront supprimées. Action irréversible.';

  @override
  String get profileClear => 'Effacer';

  @override
  String get profileCleared => 'Activité effacée';

  @override
  String get profileExport => 'Exporter mes données';

  @override
  String get profileExportSub => 'Copier en JSON';

  @override
  String get profileExported => 'Vos données ont été copiées';

  @override
  String get profileStreaksTitle => 'Séries';

  @override
  String get profileShare => 'Partager';

  @override
  String profileShareText(int n) {
    return 'Je suis à $n jours de focus d\'affilée avec Pausey !';
  }

  @override
  String get profileCopied => 'Copié dans le presse-papiers';

  @override
  String profileNextMilestone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n jours',
      one: '1 jour',
    );
    return 'Continuez – encore $_temp0 avant la prochaine étape !';
  }

  @override
  String get profileAllMilestones =>
      'Toutes les étapes atteintes. Légendaire !';

  @override
  String get profileStartStreak =>
      'Terminez une session aujourd\'hui pour lancer une série.';

  @override
  String get profileBest => 'Record';

  @override
  String get profileThisWeek => 'Cette semaine';

  @override
  String profileDaysCompleted(int n) {
    return '$n/7 jours réussis';
  }

  @override
  String get profileCompleted => 'Réussi';

  @override
  String get profilePartial => 'Partiel';

  @override
  String get profileMissed => 'Manqué';

  @override
  String get profilePrevMonth => 'Mois précédent';

  @override
  String get profileNextMonth => 'Mois suivant';

  @override
  String get profileMilestones => 'Étapes de série';

  @override
  String get profileAchievements => 'Succès';

  @override
  String get profileAchOnFire => 'En feu';

  @override
  String get profileAchIronWill => 'Volonté de fer';

  @override
  String get profileAchFocusMaster => 'Maître du focus';

  @override
  String get profileAchMonk => 'Moine numérique';

  @override
  String get profileAchLegend => 'Légendaire';

  @override
  String get profileAchSpeed => 'Inarrêtable';

  @override
  String profileAchStreakDesc(int n) {
    return 'Série de $n jours';
  }

  @override
  String profileAchSessionsDesc(int n) {
    return '$n sessions terminées';
  }

  @override
  String profileAchHoursDesc(int n) {
    return '$n h de focus';
  }

  @override
  String profileAchDayDesc(int n) {
    return '$n sessions en un jour';
  }

  @override
  String get navHome => 'Accueil';

  @override
  String get navBlock => 'Bloquer';

  @override
  String get navFocus => 'Focus';

  @override
  String get navInsights => 'Statistiques';

  @override
  String get navProfile => 'Profil';

  @override
  String get unitH => 'h';

  @override
  String get unitM => 'min';

  @override
  String get sampleData => 'Données d\'exemple';

  @override
  String get seeAll => 'Tout voir';

  @override
  String days(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jours',
      one: '1 jour',
    );
    return '$_temp0';
  }

  @override
  String get statesTitle => 'États';

  @override
  String get statesSubtitle => 'Écrans d\'erreur, vides et de chargement';

  @override
  String get statesNoInternet => 'Pas d\'internet';

  @override
  String get statesConnectionLost => 'Connexion perdue';

  @override
  String get statesOfflineTitle => 'Vous êtes hors ligne';

  @override
  String get statesOfflineMsg =>
      'Pausey ne peut pas joindre le serveur. Vérifiez votre Wi-Fi ou vos données mobiles et réessayez – vos données locales sont en sécurité.';

  @override
  String get statesTryAgain => 'Réessayer';

  @override
  String get statesOpenSettings => 'Ouvrir les réglages';

  @override
  String get statesOfflineMode => 'Mode hors ligne actif';

  @override
  String get statesLimited => 'Limité';

  @override
  String get statesAvailable => 'Disponible';

  @override
  String get statesUnavailable => 'Indisponible';

  @override
  String get statesCapSessions => 'Voir les sessions passées';

  @override
  String get statesCapApps => 'Liste des apps verrouillées';

  @override
  String get statesCapTimer => 'Minuteur de focus local';

  @override
  String get statesCapSync => 'Synchroniser série et objectifs';

  @override
  String get statesCapAnalytics => 'Actualiser les statistiques';

  @override
  String get statesOfflineNote =>
      'Toutes vos données sont stockées localement. Rien n\'est perdu hors ligne.';

  @override
  String get statesBackOnline => 'De retour en ligne – tout est synchronisé';

  @override
  String get statesShowAgain => 'Réafficher';

  @override
  String get statesPermDenied => 'Autorisation refusée';

  @override
  String get statesPermRequired => 'Autorisation requise';

  @override
  String get statesPermTitle => 'Accès bloqué';

  @override
  String get statesPermMsg =>
      'Pausey a besoin de l\'accès Temps d\'écran pour bloquer les apps. Sans lui, le blocage ne fonctionne pas.';

  @override
  String get statesGrant => 'Autoriser';

  @override
  String get statesLearnMore => 'En savoir plus';

  @override
  String get statesLearnMoreMsg =>
      'L\'accès Temps d\'écran permet à Pausey de mettre en pause les apps distrayantes. Vos données restent sur le téléphone.';

  @override
  String get statesRequiredPerms => 'Autorisations requises';

  @override
  String get statesPermNotif => 'Notifications';

  @override
  String get statesPermScreenTime => 'Accès Temps d\'écran';

  @override
  String get statesPermUsage => 'Statistiques d\'usage';

  @override
  String get statesPermBio => 'Face ID / biométrie';

  @override
  String get statesGranted => 'Accordé';

  @override
  String get statesDenied => 'Refusé';

  @override
  String get statesPermNote =>
      'Sans Temps d\'écran, le minuteur fonctionne mais les apps ne sont pas bloquées.';

  @override
  String get statesAccessGranted => 'Accès accordé – blocage prêt';

  @override
  String get statesDataNA => 'Données indisponibles';

  @override
  String get statesSyncFailed => 'Échec de synchro';

  @override
  String get statesLoadTitle => 'Chargement impossible';

  @override
  String get statesLoadMsg =>
      'Un problème est survenu en récupérant vos statistiques. Probablement passager – vos données locales sont intactes.';

  @override
  String get statesRetrySync => 'Resynchroniser';

  @override
  String get statesUseCached => 'Utiliser le cache';

  @override
  String get statesErrorDetails => 'Détails de l\'erreur';

  @override
  String get statesErrorCode => 'Code';

  @override
  String get statesTimestamp => 'Heure';

  @override
  String get statesRetryCount => 'Tentatives';

  @override
  String statesAttempts(int n) {
    return '$n / 3 tentatives';
  }

  @override
  String get statesReport => 'Signaler au support';

  @override
  String get statesReported => 'Merci – rapport envoyé';

  @override
  String get statesCachedNote =>
      'En attendant, les données de la dernière synchro sont disponibles.';

  @override
  String get statesDataLoaded => 'Statistiques chargées';

  @override
  String get statesCachedShown => 'Données en cache affichées';

  @override
  String statesWeekFocus(String time) {
    return 'Focus cette semaine : $time';
  }

  @override
  String get statesEmpty => 'État vide';

  @override
  String get statesNothingYet => 'Rien pour l\'instant';

  @override
  String get statesEmptyTitle => 'Aucune session';

  @override
  String get statesEmptyMsg =>
      'Lancez votre première session : vos progrès s\'afficheront ici.';

  @override
  String get statesStartFocus => 'Commencer';

  @override
  String get statesLoadingSection => 'Chargement';

  @override
  String get statesDashLoading => 'Tableau de bord';

  @override
  String get statesAnalyticsLoading => 'Statistiques';

  @override
  String get statesGoalsLoading => 'Objectifs';

  @override
  String get statesProfileLoading => 'Profil';

  @override
  String get statesCrunching => 'Analyse en cours…';

  @override
  String get statesLoadingGoals => 'Chargement des objectifs…';

  @override
  String get statesLoadingProfile => 'Chargement du profil…';

  @override
  String get statesReplay => 'Rejouer';
}
