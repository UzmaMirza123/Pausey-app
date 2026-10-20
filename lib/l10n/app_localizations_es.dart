// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get ob1Title => 'Reduce la adicción a la pantalla';

  @override
  String get ob1Body =>
      'Controla tus hábitos digitales y pasa menos tiempo en apps que distraen.';

  @override
  String get ob1StatAvg => 'Tiempo de pantalla diario medio';

  @override
  String get ob1StatSocial => 'En redes sociales';

  @override
  String get ob1ArtNote1 => 'Menos scroll';

  @override
  String get ob1ArtNote2 => 'Más tú';

  @override
  String get ob1BookFocus => 'Enfoque';

  @override
  String get ob1BookBalance => 'Equilibrio';

  @override
  String get ob1BookHappier => 'Tú más feliz';

  @override
  String get ob2SelectApps => 'Elegir apps';

  @override
  String get ob2Title => 'Bloquea las apps que distraen';

  @override
  String get ob2Body =>
      'Bloquea redes sociales, juegos y otras distracciones con potentes herramientas de bloqueo.';

  @override
  String get ob2Feature1 => 'Bloquea cualquier app con un toque';

  @override
  String get ob2Feature2 => 'Programa horas de bloqueo y de enfoque';

  @override
  String get ob2Feature3 => 'Protege los bloqueos con contraseña para no ceder';

  @override
  String get sheetTitle => 'Elegir apps';

  @override
  String get sheetTotalLocked => 'Total bloqueadas';

  @override
  String get sheetAppsSelected => 'apps elegidas';

  @override
  String get sheetTimeSaved => 'Tiempo ahorrado';

  @override
  String get sheetPerDayAvg => 'media diaria';

  @override
  String sheetHoursValue(String h) {
    return '$h h';
  }

  @override
  String get sheetSearchHint => 'Buscar apps...';

  @override
  String get sheetCatAll => 'Todas';

  @override
  String get sheetCatSocial => 'Social';

  @override
  String get sheetCatEntertainment => 'Entretenimiento';

  @override
  String get sheetCatGames => 'Juegos';

  @override
  String get sheetAppsHeader => 'APPS';

  @override
  String sheetSelectedCount(int count) {
    return '$count elegidas';
  }

  @override
  String get sheetNoApps => 'No se encontraron apps';

  @override
  String get sheetLockSchedule => 'HORARIO DE BLOQUEO';

  @override
  String get sheetAddCustomSemantic => 'Añadir un horario personalizado';

  @override
  String get sheetCustomBadge => '+ Personalizado';

  @override
  String get sheetSchedMorning => 'Mañana';

  @override
  String get sheetSchedWork => 'Trabajo';

  @override
  String get sheetSchedEvening => 'Noche';

  @override
  String get sheetEveryDay => 'Todos los días';

  @override
  String get sheetWeekdays => 'Entre semana';

  @override
  String get sheetWeekends => 'Fines de semana';

  @override
  String get sheetUnlockMethod => 'MÉTODO DE DESBLOQUEO';

  @override
  String get sheetPin => 'Código PIN';

  @override
  String get sheetPinSub => 'PIN de 4 dígitos';

  @override
  String get sheetFaceId => 'Face ID';

  @override
  String get sheetFaceIdSub => 'Biométrico';

  @override
  String get sheetTouchId => 'Touch ID';

  @override
  String get sheetTouchIdSub => 'Huella';

  @override
  String get sheetFooter => 'Puedes cambiarlo más tarde';

  @override
  String get sheetConfirmLock => 'Confirmar bloqueo';

  @override
  String sheetRemove(String name) {
    return 'Quitar $name';
  }

  @override
  String get sheetCustomTitle => 'Horario personalizado';

  @override
  String get sheetCustomBody =>
      'Tus apps elegidas quedan bloqueadas durante este tiempo.';

  @override
  String get sheetNameLabel => 'NOMBRE';

  @override
  String get sheetNameHint => 'p. ej. Estudio';

  @override
  String get sheetStarts => 'Empieza';

  @override
  String get sheetEnds => 'Termina';

  @override
  String get sheetSameTime => 'El inicio y el fin son iguales';

  @override
  String sheetLockedFor(String duration) {
    return 'Bloqueado durante $duration';
  }

  @override
  String sheetLockedForOvernight(String duration) {
    return 'Bloqueado durante $duration (de noche)';
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
  String get sheetLockStartsAt => 'EL BLOQUEO EMPIEZA A LAS';

  @override
  String get sheetLockEndsAt => 'EL BLOQUEO TERMINA A LAS';

  @override
  String get sheetRepeatOn => 'REPETIR';

  @override
  String get sheetAddSchedule => 'Añadir horario';

  @override
  String get sheetCustomDefaultName => 'Personalizado';

  @override
  String sheetChangeTime(String label, String time) {
    return '$label $time. Cambiar hora';
  }

  @override
  String get ob3Title => 'Mantén el foco cada día';

  @override
  String get ob3Body =>
      'Usa sesiones Pomodoro y Enfoque profundo para ser más productivo y lograr más.';

  @override
  String get ob3Pomodoro => 'Pomodoro';

  @override
  String ob3PomodoroSub(int min) {
    return 'Sesiones de $min min';
  }

  @override
  String get ob3DeepFocus => 'Enfoque profundo';

  @override
  String ob3DeepFocusSub(int min) {
    return 'Flujo de $min min';
  }

  @override
  String get ob3StatBoost => 'más productividad';

  @override
  String ob3StatStreakValue(int days) {
    return '$days días';
  }

  @override
  String get ob3StatStreak => 'racha en marcha';

  @override
  String get ob3StatGoal => 'metas cumplidas';

  @override
  String get ob3StartTimer => 'Iniciar temporizador';

  @override
  String get ob3PauseTimer => 'Pausar temporizador';

  @override
  String get ob4Title => 'Sigue tu progreso';

  @override
  String get ob4Body =>
      'Controla tu tiempo de pantalla, horas de enfoque, metas y productividad con estadísticas preciosas.';

  @override
  String get ob4Weekly => 'Semanal';

  @override
  String get ob4WeeklySub => 'informes';

  @override
  String get ob4Goals => 'Metas';

  @override
  String get ob4GoalsSub => 'seguimiento';

  @override
  String get ob4Insights => 'Análisis';

  @override
  String get ob4InsightsSub => 'coach IA';

  @override
  String get ob4Streaks => 'Rachas';

  @override
  String get ob4StreaksSub => 'e insignias';

  @override
  String get ob3RingStreak => 'días de racha';

  @override
  String ob3RingSessions(int done, int total) {
    return '$done de $total sesiones';
  }

  @override
  String get ob3RingTagline => 'El foco crea\nun mejor tú';

  @override
  String get ob4ArtScore => 'puntuación';

  @override
  String get ob4ArtProductivity => 'Productividad';

  @override
  String get ob5Title => '¿Cuál es tu tiempo de pantalla diario promedio?';

  @override
  String get ob5Subtitle => 'Solo en tu teléfono. Una estimación está bien.';

  @override
  String get ob5More7 => 'Más de 7 horas';

  @override
  String get ob5H5to7 => '5-7 horas';

  @override
  String get ob5H4to5 => '4-5 horas';

  @override
  String get ob5H3to4 => '3-4 horas';

  @override
  String get ob5H1to3 => '1-3 horas';

  @override
  String get ob5Under1 => 'Menos de 1 hora';

  @override
  String get ob6Title => '¿A qué te dedicas?';

  @override
  String get ob6Subtitle =>
      'Personalizaremos tu plan de enfoque según tu forma de trabajar.';

  @override
  String get ob6Software => 'Desarrollo de software';

  @override
  String get ob6Founder => 'CEO / Fundador';

  @override
  String get ob6Remote => 'Trabajo remoto';

  @override
  String get ob6Finance => 'Finanzas / Operaciones / Consultoría';

  @override
  String get ob6Art => 'Arte / Contenido';

  @override
  String get ob6Education => 'Educación';

  @override
  String get ob6Others => 'Otros';

  @override
  String get ob7Title => 'Tu meta diaria de pantalla';

  @override
  String get ob7Subtitle =>
      'Puedes cambiarlo cuando quieras. Te avisaremos cuando te acerques.';

  @override
  String ob7Hours(String hours) {
    return '$hours h';
  }

  @override
  String get ob7PerDay => 'al día';

  @override
  String ob7HoursPerDay(String hours) {
    return '$hours al día';
  }

  @override
  String get ob7DialLabel => 'Meta diaria de tiempo de pantalla';

  @override
  String get ob7InfoNote =>
      'La persona media pasa más de 4 h al día con el móvil. Fijar una meta es el primer paso para recuperar tu tiempo.';

  @override
  String get ob8Title => 'Activa los permisos esenciales';

  @override
  String get ob8Subtitle =>
      'Concede acceso para disfrutar de Pausey al completo.';

  @override
  String get ob8UsageTitle => 'Acceso de uso';

  @override
  String get ob8UsageSub =>
      'Controla el uso de apps y aplica sesiones de enfoque.';

  @override
  String get ob8NotifTitle => 'Notificaciones';

  @override
  String get ob8NotifSub => 'Recordatorios a tiempo y avisos de progreso.';

  @override
  String get ob8TrackTitle => 'Seguimiento de uso';

  @override
  String get ob8TrackSub => 'Resúmenes diarios y semanales.';

  @override
  String get ob9Title => '¡Todo listo!';

  @override
  String get ob9Subtitle => 'Tu entorno de enfoque está listo.';

  @override
  String get ob9Enter => 'Entrar en Pausey';

  @override
  String get ob9Replay => 'Repetir la introducción';

  @override
  String get ob9ScreenTime => 'Tiempo de pantalla';

  @override
  String get ob9AppsLocked => 'Apps bloqueadas';

  @override
  String get ob9Permissions => 'Permisos';

  @override
  String get ob9FocusMode => 'Modo enfoque';

  @override
  String get ob9AllOk => 'Todo OK';

  @override
  String get ob9On => 'ON';

  @override
  String get ob9Done => 'LISTO';

  @override
  String get ob9StreakTitle => 'Tu racha del día 1 empieza ya';

  @override
  String get ob9StreakSub => 'Completa una sesión para mantenerla';

  @override
  String alSummary(int locked, int total) {
    return '$locked restringidas ahora · $total gestionadas';
  }

  @override
  String alSummaryOff(int total) {
    return '$total gestionadas · bloqueo inactivo';
  }

  @override
  String get alFromInstalled => 'Elegir de apps instaladas';

  @override
  String get alFromInstalledSub => 'Cualquier app de este teléfono';

  @override
  String get alPermTitle => 'El bloqueo aún no está activo';

  @override
  String get alPermMsg =>
      'Tus reglas están guardadas, pero Pausey no puede bloquear apps hasta que permitas estos dos permisos:';

  @override
  String get alPermUsage => 'Acceso al uso';

  @override
  String get alPermUsageSub => 'Ver qué app está abierta y su tiempo de hoy';

  @override
  String get alPermOverlay => 'Mostrar sobre otras apps';

  @override
  String get alPermOverlaySub => 'Mostrar la pantalla de bloqueo';

  @override
  String get alAllow => 'Permitir';

  @override
  String get alAllowed => 'Permitido';

  @override
  String get alPermReturn =>
      'Vuelve a Pausey tras permitirlo; se comprueba solo.';

  @override
  String get alAndroidOnly =>
      'El bloqueo solo funciona en Android. Aquí puedes preparar tus reglas.';

  @override
  String get alSearchHint => 'Buscar apps';

  @override
  String get alFilterAll => 'Todas';

  @override
  String get alFilterLocked => 'Bloqueadas';

  @override
  String get alFilterScheduled => 'Programadas';

  @override
  String get alFilterAvailable => 'Disponibles';

  @override
  String get alStateLocked => 'Bloqueada';

  @override
  String get alStateWillLock => 'Se bloqueará';

  @override
  String get alStateScheduled => 'Programada';

  @override
  String get alStateAvailable => 'Disponible';

  @override
  String alUsedOf(String used, String limit) {
    return 'Usado $used de $limit';
  }

  @override
  String alUsedToday(String used) {
    return 'Hoy $used';
  }

  @override
  String get alNoLimit => 'Sin límite diario';

  @override
  String alLimitNoUsage(String limit) {
    return 'Límite $limit · uso no disponible';
  }

  @override
  String get alRulesOff => 'Restricciones desactivadas';

  @override
  String alNextLock(String time) {
    return 'Próximo bloqueo: $time';
  }

  @override
  String alUnlockedUntil(String time) {
    return 'Desbloqueada hasta las $time';
  }

  @override
  String get alReasonLimit => 'Límite diario alcanzado';

  @override
  String get alReasonSchedule => 'Horario de bloqueo activo';

  @override
  String get alReasonGeneral => 'Horario general activo';

  @override
  String get alReasonAllDay => 'Bloqueada todo el día';

  @override
  String get alReasonFocus => 'Sesión de enfoque en curso';

  @override
  String get alNoMatches => 'Ninguna app coincide';

  @override
  String get alGeneral => 'General';

  @override
  String get alGeneralScheduleSub => 'Para apps con «Seguir horario general»';

  @override
  String get alLockAllSub => 'Activar restricciones en todas';

  @override
  String get alSaved => 'Guardado';

  @override
  String get alChangesApply => 'Los cambios se aplican al instante';

  @override
  String get alDetailsTitle => 'Límites de la app';

  @override
  String get alBlockingOff => 'El bloqueo está inactivo en este teléfono';

  @override
  String get alRestrictApp => 'Restringir esta app';

  @override
  String get alMasterOff => 'Desactivado: Pausey no la restringe';

  @override
  String get alMasterOnRules => 'Se aplican el límite y horarios de abajo';

  @override
  String get alMasterOnAllDay => 'Sin límite ni horario: bloqueada todo el día';

  @override
  String get alMasterOnGeneral => 'Bloqueada durante el horario general';

  @override
  String get alFollowGeneral => 'Seguir horario general';

  @override
  String alFollowGeneralSub(String start, String end) {
    return 'Bloquear también $start – $end';
  }

  @override
  String get alGeneralOff => 'El horario general está desactivado';

  @override
  String get alDailyLimit => 'Límite diario';

  @override
  String get alDailyLimitOffSub => 'Bloquea la app tras un tiempo diario';

  @override
  String get alCustom => 'Personalizado';

  @override
  String get alUsedLabel => 'Usado hoy';

  @override
  String get alLeftLabel => 'Restante';

  @override
  String get alLimitReached => 'Límite de hoy alcanzado';

  @override
  String get alResets => 'Se reinicia a medianoche (hora del teléfono)';

  @override
  String get alUsageUnavailable => 'Uso no disponible';

  @override
  String get alUsageNeedsAccess =>
      'Permite el acceso al uso para que Pausey cuente el tiempo de hoy.';

  @override
  String get alUsageAndroidOnly =>
      'El uso solo se mide en Android. El límite se guarda y se aplica allí.';

  @override
  String get alGrantUsage => 'Dar acceso al uso';

  @override
  String get alCustomLimitTitle => 'Límite diario personalizado';

  @override
  String get alHours => 'Horas';

  @override
  String get alMinutes => 'Minutos';

  @override
  String get alErrZeroLimit => 'Elige más de cero';

  @override
  String get alSave => 'Guardar';

  @override
  String get alScheduledLocking => 'Bloqueo programado';

  @override
  String get alScheduledOffSub => 'Bloquea esta app a ciertas horas';

  @override
  String get alNoSchedules => 'Aún no hay horarios';

  @override
  String get alAddSchedule => 'Añadir horario';

  @override
  String get alActiveNow => 'Activo ahora';

  @override
  String get alScheduleDefault => 'Horario de bloqueo';

  @override
  String get alEndsNextDay => 'Termina al día siguiente';

  @override
  String get alEdit => 'Editar';

  @override
  String get alDelete => 'Eliminar';

  @override
  String get alDeleteScheduleQ => '¿Eliminar este horario?';

  @override
  String alDeleteScheduleMsg(String title) {
    return '«$title» dejará de bloquear esta app.';
  }

  @override
  String get alNewSchedule => 'Nuevo horario';

  @override
  String get alEditSchedule => 'Editar horario';

  @override
  String get alTitleOptional => 'Título (opcional)';

  @override
  String get alPresetStudy => 'Estudio';

  @override
  String get alPresetEvening => 'Tarde';

  @override
  String get alPresetSleep => 'Dormir';

  @override
  String get alRepeatOn => 'Repetir los';

  @override
  String get alErrSameTime => 'El inicio y el fin no pueden coincidir';

  @override
  String get alErrNoDays => 'Elige al menos un día';

  @override
  String alTempUnlock(int minutes) {
    return 'Desbloquear $minutes min';
  }

  @override
  String alTempUnlockSub(int n) {
    return 'Usa 1 anulación · quedan $n hoy';
  }

  @override
  String get alTempUnlockFocus => 'No se puede durante una sesión de enfoque';

  @override
  String get alTempUnlockNotLocked => 'Solo hace falta si está bloqueada';

  @override
  String alTempUnlockQ(String app, int minutes) {
    return '¿Desbloquear $app $minutes minutos?';
  }

  @override
  String get alUnlock => 'Desbloquear';

  @override
  String get alEndEarly => 'Terminar ya';

  @override
  String get alResetRules => 'Restablecer restricciones';

  @override
  String get alResetRulesSub => 'Quita el límite y los horarios';

  @override
  String alResetQ(String app) {
    return '¿Restablecer las restricciones de $app?';
  }

  @override
  String get alResetMsg =>
      'Se quitarán su límite diario y todos los horarios. La app sigue en tu lista.';

  @override
  String get alReset => 'Restablecer';

  @override
  String get alResetDone => 'Restricciones restablecidas';

  @override
  String get alRemoveApp => 'Quitar app';

  @override
  String get alRemoveAppSub => 'Dejar de gestionarla';

  @override
  String alRemoveQ(String app) {
    return '¿Quitar $app?';
  }

  @override
  String get alRemoveMsg =>
      'Pausey dejará de restringirla y olvidará su límite y horarios.';

  @override
  String get alRemove => 'Quitar';

  @override
  String get alNoPackage =>
      'Los límites y horarios por app necesitan una app instalada concreta. En Android, añádela con «Elegir de apps instaladas».';

  @override
  String get alNotFound => 'Esta app ya no está gestionada';

  @override
  String get alPickerTitle => 'Apps instaladas';

  @override
  String get alPickerAdded => 'Ya añadida';

  @override
  String alPickerAdd(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Añadir $n apps',
      one: 'Añadir 1 app',
      zero: 'Añadir apps',
    );
    return '$_temp0';
  }

  @override
  String get alPickerEmpty => 'No se encontraron apps';

  @override
  String get blockTitle => 'Bloqueo de apps';

  @override
  String get blockAddApp => 'Añadir app';

  @override
  String get blockFaceIdTitle => 'Protección Face ID';

  @override
  String get blockFaceIdSub => 'Pide Face ID para desbloquear apps';

  @override
  String get blockFaceIdUnavailable =>
      'La biometría no está disponible en este dispositivo';

  @override
  String get blockFaceIdReason => 'Confirma que eres tú para activarla';

  @override
  String get blockFaceIdFailed => 'No se pudo verificar; sigue desactivada';

  @override
  String get blockScheduleTitle => 'Bloqueo programado';

  @override
  String get blockStart => 'Inicio';

  @override
  String get blockEnd => 'Fin';

  @override
  String get blockNeedOneDay => 'Deja al menos un día';

  @override
  String get blockManagedApps => 'Apps gestionadas';

  @override
  String get blockLockAll => 'Bloquear todo';

  @override
  String get blockAllLocked => 'Todas las apps bloqueadas';

  @override
  String blockRemoved(String app) {
    return '$app quitada';
  }

  @override
  String get blockAppsUpdated => 'Apps actualizadas';

  @override
  String get blockCatSocial => 'Social';

  @override
  String get blockCatVideo => 'Vídeo';

  @override
  String get blockCatGames => 'Juegos';

  @override
  String get blockCatShopping => 'Compras';

  @override
  String get blockCatCommunity => 'Comunidad';

  @override
  String get blockCatOther => 'Otras';

  @override
  String get blockEmptyBadge => 'Nada bloqueado';

  @override
  String get blockEmptyTitle => 'Aún no hay apps';

  @override
  String get blockEmptyMsg =>
      'Añade las apps que más te distraen y Pausey las bloqueará.';

  @override
  String get blockEmergencyTitle => 'Anulación de emergencia';

  @override
  String blockEmergencySub(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'quedan $n hoy',
      one: 'queda 1 hoy',
    );
    return 'Desbloquea todo temporalmente · $_temp0';
  }

  @override
  String get blockEmergencyOff => 'Desactivado en Ajustes';

  @override
  String get blockEmergencyUse => 'Usar';

  @override
  String get blockEmergencyConfirmTitle => '¿Usar anulación de emergencia?';

  @override
  String blockEmergencyConfirmMsg(int n) {
    return 'Usará una de las $n que te quedan hoy. Úsala solo si de verdad la necesitas.';
  }

  @override
  String get blockEmergencyUsed => 'Anulación usada: apps desbloqueadas';

  @override
  String get blockEmergencyNone => 'No te quedan hoy';

  @override
  String get cvNoAccount => '¿No tienes cuenta?';

  @override
  String get cvYourName => 'Tu nombre';

  @override
  String get cvAppsLoadFailed =>
      'No se pudieron leer las apps de este teléfono.';

  @override
  String get cvTryAgain => 'Reintentar';

  @override
  String get cvGetStarted => 'Empezar';

  @override
  String get cvHaveAccount => 'Ya tengo una cuenta';

  @override
  String get cvWelcomeTitle => 'Tu tiempo es tuyo.';

  @override
  String get cvWelcomeBody => 'Hagamos más espacio para lo que importa.';

  @override
  String get cvNext => 'Siguiente';

  @override
  String get cvSkipForNow => 'Omitir por ahora';

  @override
  String get cvRelateTitle => '¿Se te va el tiempo?';

  @override
  String get cvRelateSub => 'Sé sincero, no hay respuestas incorrectas.';

  @override
  String get cvRelateOften => 'Todo el tiempo';

  @override
  String get cvRelateSometimes => 'A veces';

  @override
  String get cvRelateRarely => 'Rara vez';

  @override
  String get cvRelateReplyOften =>
      'No te pasa solo a ti. Los teléfonos están diseñados para retenernos.';

  @override
  String get cvRelateReplySometimes =>
      'Nos pasa a casi todos, normalmente sin darnos cuenta.';

  @override
  String get cvRelateReplyRarely => 'Genial. Sigamos así.';

  @override
  String get cvRelateCta => 'Así soy yo';

  @override
  String get cvGoalTitle => '¿Más tiempo para qué?';

  @override
  String get cvGoalSub => 'Elige lo que más te importa ahora.';

  @override
  String get cvGoalFocus => 'Más concentración';

  @override
  String get cvGoalSleep => 'Dormir mejor';

  @override
  String get cvGoalScrolling => 'Menos scroll';

  @override
  String get cvGoalMe => 'Más tiempo para mí';

  @override
  String get cvGoalHabits => 'Hábitos diarios más sanos';

  @override
  String get cvGoalOther => 'Otra cosa';

  @override
  String get cvGoalOtherHint => '¿Para qué te gustaría tener más tiempo?';

  @override
  String get cvGoalReplyFocus => 'Enfoque, entonces. Lo protegeremos.';

  @override
  String get cvGoalReplySleep => 'Dormir mejor empieza por tardes tranquilas.';

  @override
  String get cvGoalReplyScrolling =>
      'Hagamos del scroll una elección, no un hábito.';

  @override
  String get cvGoalReplyMe => 'El tiempo para ti importa. Busquemos un poco.';

  @override
  String get cvGoalReplyHabits =>
      'Los pasos pequeños suman. Los haremos fáciles.';

  @override
  String get cvGoalReplyOther => 'Entendido. Lo adaptaremos a eso.';

  @override
  String get cvAppsTitle => '¿Qué apps te distraen?';

  @override
  String get cvAppsSubReal =>
      'Las apps que más usas en este teléfono. Se pausarán todas; toca ✕ para dejar una libre.';

  @override
  String get cvAppsSubPopular =>
      'Las apps que más usas en este teléfono. Se pausarán todas; toca ✕ para dejar una libre.';

  @override
  String get cvAppsSearch => 'Buscar apps';

  @override
  String cvAppsReply(String apps) {
    return 'Anotado: $apps. Empezaremos con estas.';
  }

  @override
  String cvAnd(String a, String b) {
    return '$a y $b';
  }

  @override
  String cvAndMore(String a, String b, int count) {
    return '$a, $b y $count más';
  }

  @override
  String get cvStTitle => 'Tu tiempo de pantalla diario';

  @override
  String get cvStSub =>
      'Basta con una estimación. Esto se queda en tu teléfono.';

  @override
  String cvStMeasured(String time) {
    return 'Medido hoy en este teléfono hasta ahora: $time';
  }

  @override
  String get cvStUnder2 => 'Menos de 2 horas';

  @override
  String get cvSt2to4 => 'De 2 a 4 horas';

  @override
  String get cvSt4to6 => 'De 4 a 6 horas';

  @override
  String get cvStOver6 => 'Más de 6 horas';

  @override
  String get cvStNotSure => 'No lo sé';

  @override
  String get cvStReplyUnder2 =>
      'Es un buen equilibrio. Te ayudaremos a mantenerlo.';

  @override
  String get cvStReply2to4 =>
      'Unos pequeños cambios pueden liberar tiempo de verdad.';

  @override
  String get cvStReply4to6 => 'Es bastante. Recuperemos parte.';

  @override
  String get cvStReplyOver6 =>
      'Es una gran parte del día, así que empezaremos poco a poco.';

  @override
  String get cvStReplyNotSure => 'Sin problema. Pausey puede medirlo.';

  @override
  String get cvPhraseFocus => 'más concentración';

  @override
  String get cvPhraseSleep => 'dormir mejor';

  @override
  String get cvPhraseScrolling => 'menos scroll';

  @override
  String get cvPhraseMe => 'más tiempo para ti';

  @override
  String get cvPhraseHabits => 'hábitos más sanos';

  @override
  String get cvPhraseOther => 'más espacio para lo que importa';

  @override
  String cvPhraseOtherNamed(String thing) {
    return 'más tiempo para $thing';
  }

  @override
  String cvReflectApps(String goal, String apps) {
    return 'Quieres $goal, pero siempre acabas abriendo $apps.';
  }

  @override
  String cvReflectNoApps(String goal) {
    return 'Quieres $goal, y a veces el teléfono se interpone.';
  }

  @override
  String cvReflectEstimate(String time) {
    return 'Alrededor de $time al día (tu estimación)';
  }

  @override
  String cvReflectMeasured(String time) {
    return '$time hoy hasta ahora (medido)';
  }

  @override
  String get cvReflectHelp =>
      'Pausey puede ayudarte a crear una rutina que le dé un respiro a tu atención.';

  @override
  String get cvShowMeHow => 'Muéstrame cómo';

  @override
  String get cvHowTitle => 'Así te ayuda Pausey';

  @override
  String get cvHowPauseTab => 'Pausa';

  @override
  String get cvHowLimitTab => 'Límites';

  @override
  String get cvHowFocusTab => 'Enfoque';

  @override
  String get cvHowPauseTitle => 'Una pausa tranquila, no un castigo';

  @override
  String get cvHowPauseBody =>
      'Cuando se acaba el tiempo de una app, Pausey la cubre con una pantalla de pausa tranquila y una salida.';

  @override
  String get cvHowLimitTitle => 'Un tiempo diario para cada app';

  @override
  String get cvHowLimitBody =>
      'Dale a cada app su propio tiempo diario y horarios de bloqueo. Cambiar una nunca cambia otra.';

  @override
  String get cvHowFocusTitle => 'Sesiones de enfoque';

  @override
  String get cvHowFocusBody =>
      'Inicia un temporizador para trabajar, estudiar o descansar. Tus apps elegidas quedan en pausa hasta que termine.';

  @override
  String get cvPreview => 'Vista previa';

  @override
  String get cvYourApp => 'Tu app';

  @override
  String get cvAnotherApp => 'Otra app';

  @override
  String cvMinOf(int used, int limit) {
    return '$used de $limit min';
  }

  @override
  String get cvBuildPlan => 'Crear mi plan';

  @override
  String get cvPlanTitle => 'Un punto de partida suave';

  @override
  String get cvPlanSub =>
      'Sugerido según tus respuestas. Cambia lo que quieras.';

  @override
  String get cvPlanFocus => 'Sesión de enfoque';

  @override
  String cvPlanFocusSub(String time) {
    return '$time por sesión';
  }

  @override
  String get cvPlanDaily => 'Meta diaria de enfoque';

  @override
  String cvPlanDailySub(String time) {
    return '$time de enfoque al día';
  }

  @override
  String get cvPlanLimit => 'Límite diario de app';

  @override
  String cvPlanLimitSub(String app, String time) {
    return '$app: $time al día';
  }

  @override
  String get cvPlanLimitNoPkg =>
      'Esta app no está en la lista del teléfono, así que el límite se puede poner luego en Bloqueo de apps.';

  @override
  String get cvPlanWind => 'Desconexión nocturna';

  @override
  String cvPlanWindSub(String start, String end) {
    return 'Tus apps elegidas se pausan de $start a $end';
  }

  @override
  String get cvPlanOff => 'Desactivado';

  @override
  String get cvStarts => 'Empieza';

  @override
  String get cvEnds => 'Termina';

  @override
  String get cvPlanNote =>
      'Aún no se activa nada. Empieza solo cuando termines la configuración, y puedes cambiarlo cuando quieras.';

  @override
  String get cvUsePlan => 'Usar este plan';

  @override
  String get cvPermTitle => 'Unos permisos hacen que esto funcione';

  @override
  String get cvPermSub =>
      'Ayudan a Pausey a hacer su magia y darte la mejor experiencia.';

  @override
  String get cvPermUnsupported =>
      'Los límites de apps y las pantallas de pausa funcionan en teléfonos Android. Todo lo demás también funciona aquí.';

  @override
  String get cvPermUsageTitle => 'Acceso al uso';

  @override
  String get cvPermUsageWhy =>
      'Permite a Pausey ver cuánto tiempo estuvo abierta cada app hoy y cuál está en pantalla.';

  @override
  String get cvPermUsageWithout =>
      'Sin esto, Pausey no puede medir el tiempo de pantalla ni saber cuándo se alcanza un límite.';

  @override
  String get cvPermOverlayTitle => 'Mostrar sobre otras apps';

  @override
  String get cvPermOverlayWhy =>
      'Permite a Pausey mostrar su pantalla de pausa sobre una app cuando se acaba su tiempo.';

  @override
  String get cvPermOverlayWithout =>
      'Sin esto, las apps no se pueden pausar. Tu plan se guarda para después.';

  @override
  String get cvPermBatteryTitle => 'Mantén Pausey activo';

  @override
  String get cvPermBatteryWhy =>
      'Algunos teléfonos detienen apps en segundo plano para ahorrar batería. Permitir Pausey mantiene tus límites funcionando.';

  @override
  String get cvPermBatteryWithout =>
      'Sin esto, los límites pueden dejar de funcionar hasta que vuelvas a abrir Pausey.';

  @override
  String get cvPermLater => 'Puedes cambiarlo luego en los ajustes de Android.';

  @override
  String get cvPermPrivacy =>
      'Pausey solo lee nombres de apps y tiempos. Nada sale de tu teléfono.';

  @override
  String get cvAllowInSettings => 'Permitir en ajustes';

  @override
  String get cvAllowed => 'Permitido';

  @override
  String get cvOptional => 'Opcional';

  @override
  String get cvContinueAnyway => 'Continuar por ahora';

  @override
  String get cvAccountTitle => 'Guarda tu progreso';

  @override
  String get cvAccountSub => 'Usa Pausey como invitado o inicia sesión.';

  @override
  String get cvNameLabel => 'Tu nombre (opcional)';

  @override
  String get cvNameHint => '¿Cómo te llamamos?';

  @override
  String get cvContinueGuest => 'Continuar como invitado';

  @override
  String get cvAccountNote =>
      'Iniciar sesión aún no respalda tus datos. En ambos casos, tus ajustes se quedan en este teléfono.';

  @override
  String get cvReadyTitle => 'Tu primer paso empieza aquí.';

  @override
  String cvReadyTitleNamed(String name) {
    return '$name, tu primer paso empieza aquí.';
  }

  @override
  String get cvReadyFocus =>
      'Hagamos un poco más de espacio para concentrarte.';

  @override
  String get cvReadySleep => 'Hagamos tus noches un poco más tranquilas.';

  @override
  String get cvReadyScrolling => 'Démosle al scroll un poco menos de tu día.';

  @override
  String get cvReadyMe => 'Hagamos un poco más de tiempo para ti.';

  @override
  String get cvReadyHabits => 'Creemos hábitos que se sientan bien.';

  @override
  String get cvReadyOther => 'Hagamos más espacio para lo que te importa.';

  @override
  String get cvYourPlan => 'Tu plan';

  @override
  String cvSumGoal(String goal) {
    return 'Meta: $goal';
  }

  @override
  String cvSumApps(String apps) {
    return 'Apps: $apps';
  }

  @override
  String cvSumFocus(String session, String daily) {
    return 'Sesiones de enfoque de $session, $daily al día';
  }

  @override
  String get cvReadyNeedsPerm =>
      'Los límites de apps están guardados, pero no funcionarán hasta que permitas los dos permisos.';

  @override
  String get cvReadyChange => 'Puedes cambiar todo esto después.';

  @override
  String get cvStartFirstFocus => 'Empezar mi primera sesión';

  @override
  String get cvFinishLimits => 'Terminar de configurar límites';

  @override
  String get cvJourneyTitle => 'Empieza tu viaje con Pausey';

  @override
  String get cvJourneySub =>
      'Crea una cuenta para sincronizar tu progreso o sigue como invitado.';

  @override
  String get cvUsageNone => 'Sin uso hoy';

  @override
  String get cvUsageUnder1 => 'Menos de 1 min hoy';

  @override
  String cvUsageToday(String time) {
    return '$time hoy';
  }

  @override
  String cvAppsSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count apps seleccionadas',
      one: '1 app seleccionada',
    );
    return '$_temp0';
  }

  @override
  String get cvAppsUsageNeeded =>
      'Permite el acceso al tiempo de pantalla para que Pausey muestre las apps que más usas.';

  @override
  String cvRemoveApp(String app) {
    return 'Quitar $app';
  }

  @override
  String get cvNotifAskTitle => '¿Un aviso antes de que se acabe el tiempo?';

  @override
  String get cvNotNow => 'Ahora no';

  @override
  String get cvA11yTitle => 'Una última cosa';

  @override
  String get cvA11ySub =>
      'Activa Accesibilidad para que Pausey sepa qué app está abierta y cuánto tiempo. Así podrá bloquear, desbloquear y programar tus apps.';

  @override
  String get cvA11yReads => 'Pausey solo lee:';

  @override
  String get cvA11yRead1 => 'Nombres de las apps';

  @override
  String get cvA11yRead2 => 'Tiempo en cada app';

  @override
  String get appName => 'Pausey';

  @override
  String get tagline => 'Recupera tu tiempo';

  @override
  String get versionLabel => 'Versión 2.0 · Edición App Store';

  @override
  String get skip => 'Omitir';

  @override
  String get continueLabel => 'Continuar';

  @override
  String get back => 'Atrás';

  @override
  String get freeToStart => 'Empieza gratis · Sin tarjeta de crédito';

  @override
  String get dataStaysOnDevice => 'Tus datos nunca salen de tu dispositivo.';

  @override
  String get switchToLight => 'Cambiar a modo claro';

  @override
  String get switchToDark => 'Cambiar a modo oscuro';

  @override
  String get language => 'Idioma';

  @override
  String get phoneLanguage => 'Idioma del teléfono';

  @override
  String get authTitle => 'Pausa el scroll.\nDomina tu día.';

  @override
  String get authSubtitle =>
      'Crea una cuenta para sincronizar tus metas y rachas, o prueba Pausey como invitado.';

  @override
  String get continueWithApple => 'Continuar con Apple';

  @override
  String get continueWithGoogle => 'Continuar con Google';

  @override
  String get signUpWithEmail => 'Registrarse con email';

  @override
  String get continueAsGuest => 'Continuar como invitado';

  @override
  String get guestNote =>
      'Los datos de invitado se guardan solo en este teléfono.';

  @override
  String get or => 'o';

  @override
  String get haveAccount => '¿Ya tienes una cuenta?';

  @override
  String get noAccount => '¿Nuevo en Pausey?';

  @override
  String get logIn => 'Iniciar sesión';

  @override
  String get signUp => 'Registrarse';

  @override
  String get createAccount => 'Crear cuenta';

  @override
  String get signUpTitle => 'Crea tu cuenta';

  @override
  String get signUpSubtitle => 'Empieza a crear hábitos de pantalla más sanos.';

  @override
  String get logInTitle => 'Inicia sesión en tu cuenta';

  @override
  String get logInSubtitle => 'Inicia sesión para seguir con tu racha.';

  @override
  String get fullName => 'Nombre completo';

  @override
  String get email => 'Correo electrónico';

  @override
  String get password => 'Contraseña';

  @override
  String get confirmPassword => 'Confirmar contraseña';

  @override
  String get showPassword => 'Mostrar contraseña';

  @override
  String get hidePassword => 'Ocultar contraseña';

  @override
  String get forgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get resetTitle => 'Restablecer contraseña';

  @override
  String get resetSubtitle => 'Escribe tu email y te enviaremos un enlace.';

  @override
  String get sendLink => 'Enviar enlace';

  @override
  String get resetSent => 'Revisa tu bandeja para ver el enlace.';

  @override
  String get agreeTerms => 'Acepto los Términos y la Política de privacidad';

  @override
  String get passwordStrength => 'Seguridad de la contraseña';

  @override
  String get strengthWeak => 'Débil';

  @override
  String get strengthOk => 'Aceptable';

  @override
  String get strengthStrong => 'Fuerte';

  @override
  String get errNameRequired => 'Escribe tu nombre';

  @override
  String get errEmailInvalid => 'Escribe un email válido';

  @override
  String get errPasswordShort => 'Usa al menos 8 caracteres';

  @override
  String get errPasswordMismatch => 'Las contraseñas no coinciden';

  @override
  String get errTerms => 'Acepta los términos para continuar';

  @override
  String get authErr_not_configured =>
      'El inicio de sesión aún no está configurado. Puedes continuar como invitado.';

  @override
  String get authErr_cancelled => 'Se canceló el inicio de sesión.';

  @override
  String get authErr_invalid_email => 'Ese email no parece correcto.';

  @override
  String get authErr_wrong_password =>
      'El email o la contraseña no son correctos.';

  @override
  String get authErr_user_not_found =>
      'No hay cuenta con este email. ¿Registrarte?';

  @override
  String get authErr_email_in_use =>
      'Ya existe una cuenta con este email. Inicia sesión.';

  @override
  String get authErr_weak_password => 'Elige una contraseña más segura.';

  @override
  String get authErr_network => 'Sin conexión. Inténtalo de nuevo.';

  @override
  String get authErr_too_many => 'Demasiados intentos. Espera un minuto.';

  @override
  String get authErr_unknown => 'Algo salió mal. Inténtalo de nuevo.';

  @override
  String homeHello(String name) {
    return 'Hola, $name';
  }

  @override
  String get homeHelloGuest => 'Hola';

  @override
  String get homeGuestBadge => 'Modo invitado · guardado en este teléfono';

  @override
  String get homeSubtitle => 'Tu plan está listo. Esto es lo que elegiste.';

  @override
  String get homeDailyGoal => 'Meta diaria';

  @override
  String get homeLockedApps => 'Apps bloqueadas';

  @override
  String get homeScreenTime => 'Tiempo de pantalla actual';

  @override
  String get homeNotSet => 'Sin definir';

  @override
  String get homeCreateAccount => 'Crea una cuenta para hacer copia';

  @override
  String get signOut => 'Cerrar sesión';

  @override
  String get signOutGuestWarn =>
      'Al cerrar sesión se borran los datos de invitado.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get ob6OtherHint => 'Escribe tu ocupación';

  @override
  String get timeSecondLabel => 'Segundo';

  @override
  String get focusModePomodoro => 'Pomodoro';

  @override
  String get focusModeDeep => 'Enfoque profundo';

  @override
  String get focusModeCustom => 'Personal';

  @override
  String get focusRemaining => 'RESTANTE';

  @override
  String get focusBreakLabel => 'DESCANSO';

  @override
  String get focusReadyLabel => 'LISTO';

  @override
  String get focusInSession => 'En sesión';

  @override
  String get focusPausedState => 'En pausa';

  @override
  String get focusOnBreak => 'En descanso';

  @override
  String get focusIdleState => 'Toca play para empezar';

  @override
  String get focusSessionsDone => 'Sesiones hechas';

  @override
  String get focusProgress => 'Progreso';

  @override
  String get focusBreakAfter => 'Descanso';

  @override
  String get focusFocusedToday => 'Hoy';

  @override
  String focusAppsBlocked(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count apps bloqueadas',
      one: '1 app bloqueada',
    );
    return '$_temp0';
  }

  @override
  String get focusAppsBlockedSub => 'Las distracciones quedan bloqueadas.';

  @override
  String get focusNoApps => 'Sin apps bloqueadas';

  @override
  String get focusNoAppsSub => 'Elige apps para bloquear al enfocarte.';

  @override
  String get focusEdit => 'Editar';

  @override
  String get focusAdd => 'Añadir';

  @override
  String get focusAmbient => 'Sonido ambiental';

  @override
  String get focusSoundOff => 'Apagado';

  @override
  String get focusSoundRain => 'Lluvia';

  @override
  String get focusSoundForest => 'Bosque';

  @override
  String get focusSoundWaves => 'Olas';

  @override
  String get focusSoundWhite => 'Ruido blanco';

  @override
  String get focusVolume => 'Volumen';

  @override
  String get focusStart => 'Empezar';

  @override
  String get focusPause => 'Pausar';

  @override
  String get focusResume => 'Reanudar';

  @override
  String get focusStop => 'Detener';

  @override
  String get focusRestart => 'Reiniciar';

  @override
  String get focusSkipBreak => 'Saltar descanso';

  @override
  String get focusDurations => 'Duración de sesiones';

  @override
  String focusMinutesN(int n) {
    return '$n min';
  }

  @override
  String get focusBreakLength => 'Descanso';

  @override
  String get focusCustomTitle => 'Duración personal';

  @override
  String get focusSet => 'Fijar';

  @override
  String get focusStopTitle => '¿Terminar antes?';

  @override
  String get focusStopBody => 'Se guardará el tiempo enfocado hasta ahora.';

  @override
  String get focusEndSession => 'Terminar';

  @override
  String get focusKeepGoing => 'Seguir';

  @override
  String get focusTooShort => 'Menos de un minuto: no se guardó.';

  @override
  String get focusBreakOver => 'Fin del descanso. ¿Otra?';

  @override
  String get focusBusy => 'Termina la sesión para cambiar de modo.';

  @override
  String get focusFirstHint => 'Tu primera sesión empieza aquí: pulsa play.';

  @override
  String get focusCompleteA => '¡Sesión';

  @override
  String get focusCompleteB => 'completada!';

  @override
  String get focusEndedTitle => 'Sesión terminada';

  @override
  String focusCompleteMsg(String mode) {
    return '¡Gran trabajo! Terminaste tu sesión $mode sin distracciones.';
  }

  @override
  String get focusEndedMsg =>
      'Cada minuto cuenta. La próxima, completa la sesión.';

  @override
  String get focusDurationLabel => 'DURACIÓN';

  @override
  String get focusMinUnit => 'min';

  @override
  String get focusDayStreak => 'Racha';

  @override
  String get focusAppsLabel => 'Apps bloqueadas';

  @override
  String get focusTodayGoal => 'Meta de hoy';

  @override
  String focusPctCompleted(int pct) {
    return '$pct% completado';
  }

  @override
  String focusPlusPct(int pct) {
    return '+$pct% con esta sesión';
  }

  @override
  String get focusMomentum => '¡Mantén el ritmo!';

  @override
  String get focusQuote1 =>
      'La constancia vence a la intensidad. Cada sesión suma.';

  @override
  String get focusQuote2 => 'Pequeños bloques de enfoque, grandes resultados.';

  @override
  String get focusQuote3 => 'No hiciste scroll: construiste. Repite.';

  @override
  String get focusStartNext => 'Iniciar otra sesión';

  @override
  String get focusBackHome => 'Volver al inicio';

  @override
  String get goalsTitle => 'Mis metas';

  @override
  String goalsSubtitle(int active, int done) {
    return '$active activas · $done completadas';
  }

  @override
  String get goalsAdd => 'Añadir meta';

  @override
  String get goalsCompleted => 'Completadas';

  @override
  String get goalsActive => 'Activas';

  @override
  String get goalsStreak => 'Racha';

  @override
  String get goalsOverall => 'Progreso total';

  @override
  String goalsWeeklyHit(int hit, int total) {
    return '$hit de $total objetivos semanales';
  }

  @override
  String goalsVsLastWeek(String delta) {
    return '$delta vs semana pasada';
  }

  @override
  String get goalsFilterAll => 'Todas';

  @override
  String get goalsDone => 'Hecho';

  @override
  String get goalsCatFocus => 'Enfoque';

  @override
  String get goalsCatDiscipline => 'Disciplina';

  @override
  String get goalsCatWellness => 'Bienestar';

  @override
  String goalsTitleFocusHours(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Enfoque diario: $n horas',
      one: 'Enfoque diario: 1 hora',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleFocusDur(String duration) {
    return 'Enfoque diario: $duration';
  }

  @override
  String get goalsTitleBlock => 'Bloquear redes sociales';

  @override
  String goalsTitleSessions(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Pomodoros al día',
      one: '1 Pomodoro al día',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleScreen(String duration) {
    return 'Menos de $duration de pantalla';
  }

  @override
  String get goalsTitlePhoneFree => 'Tiempo sin móvil';

  @override
  String goalsDescFocus(String duration) {
    return 'Logra $duration de enfoque profundo cada día';
  }

  @override
  String goalsDescBlock(int n) {
    return 'Mantén tus apps bloqueadas $n días a la semana';
  }

  @override
  String goalsDescSessions(int n) {
    return 'Completa al menos $n sesiones al día';
  }

  @override
  String goalsDescScreen(String duration) {
    return 'Usa el móvil menos de $duration al día';
  }

  @override
  String goalsDescPhoneFree(int n) {
    return '$n días sin móvil a la semana: márcalos';
  }

  @override
  String goalsProgressDays(int done, int total) {
    return '$done / $total días';
  }

  @override
  String goalsProgressSessions(int done, int total) {
    return '$done / $total sesiones';
  }

  @override
  String goalsStreakShort(int n) {
    return '$n d';
  }

  @override
  String goalsStreakN(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Racha de $n días',
      one: 'Racha de 1 día',
    );
    return '$_temp0';
  }

  @override
  String get goalsCheckIn => 'Marcar hoy como hecho';

  @override
  String get goalsCheckedIn => 'Hecho hoy';

  @override
  String get goalsCheckedSnack => '¡Bien! Hoy está marcado como hecho.';

  @override
  String get goalsUncheckedSnack => 'Hoy ya no está marcado.';

  @override
  String get goalsCreateNew => 'Crear nueva meta';

  @override
  String get goalsEmptyBadge => 'Empieza';

  @override
  String get goalsEmptyTitle => 'Aún no hay metas';

  @override
  String get goalsEmptyMsg =>
      'Fija una meta diaria pequeña y Pausey la seguirá por ti.';

  @override
  String get goalsFilterEmpty => 'Ninguna meta coincide con este filtro.';

  @override
  String get goalsNewGoal => 'Nueva meta';

  @override
  String get goalsEditGoal => 'Editar meta';

  @override
  String get goalsType => 'Tipo de meta';

  @override
  String get goalsTypeFocus => 'Tiempo de enfoque';

  @override
  String get goalsTypeSessions => 'Sesiones';

  @override
  String get goalsTypeBlock => 'Bloquear apps';

  @override
  String get goalsTypePhoneFree => 'Días sin móvil';

  @override
  String get goalsTypeScreen => 'Límite de pantalla';

  @override
  String get goalsCategory => 'Categoría';

  @override
  String get goalsTarget => 'Objetivo';

  @override
  String get goalsPerDay => 'al día';

  @override
  String get goalsPerWeek => 'días por semana';

  @override
  String get goalsMaxPerDay => 'máximo al día';

  @override
  String get goalsTitleOptional => 'Título (opcional)';

  @override
  String get goalsSave => 'Guardar meta';

  @override
  String get goalsCreate => 'Crear meta';

  @override
  String get goalsSavedSnack => 'Meta guardada';

  @override
  String get goalsCreatedSnack => 'Meta creada';

  @override
  String get goalsEdit => 'Editar';

  @override
  String get goalsDelete => 'Eliminar meta';

  @override
  String get goalsDeleteQ => '¿Eliminar esta meta?';

  @override
  String get goalsDeleteMsg =>
      'Se borrarán sus registros. No se puede deshacer.';

  @override
  String get goalsDeletedSnack => 'Meta eliminada';

  @override
  String get goalsComplete => 'completado';

  @override
  String get goalsDaysActive => 'Días activos';

  @override
  String get goalsTotalTime => 'Tiempo total';

  @override
  String get goalsSessionsLabel => 'Sesiones';

  @override
  String get goals7Day => 'Progreso de 7 días';

  @override
  String get goals7DaysAgo => 'Hace 7 días';

  @override
  String get goalsToday => 'Hoy';

  @override
  String goalsTodayDate(String date) {
    return 'Hoy, $date';
  }

  @override
  String goalsYesterdayDate(String date) {
    return 'Ayer, $date';
  }

  @override
  String get goalsMilestones => 'Hitos';

  @override
  String get goalsMsFirst => 'Primer día completado';

  @override
  String get goalsMs3 => 'Racha de 3 días';

  @override
  String get goalsMsHalf => '50% de la meta semanal';

  @override
  String get goalsMs5 => 'Racha de 5 días';

  @override
  String get goalsMsWeek => 'Semana completa';

  @override
  String get goalsMsLocked => 'Aún no';

  @override
  String get goalsHistory => 'Historial';

  @override
  String get goalsShowLess => 'Ver menos';

  @override
  String get goalsStartSession => 'Iniciar sesión de enfoque';

  @override
  String get goalsManageApps => 'Gestionar apps bloqueadas';

  @override
  String get goalsBlockHint =>
      'Cuenta solo mientras tu horario de bloqueo esté activo.';

  @override
  String goalsScreenToday(String used) {
    return 'Pantalla hoy: $used';
  }

  @override
  String get goalsNotFound => 'Esta meta ya no existe.';

  @override
  String get goalsMore => 'Más opciones';

  @override
  String goalsFreeLimit(int n) {
    return 'Plan gratis: hasta $n metas';
  }

  @override
  String get homeGoodMorning => 'Buenos días';

  @override
  String get homeGoodAfternoon => 'Buenas tardes';

  @override
  String get homeGoodEvening => 'Buenas noches';

  @override
  String get homeFriend => 'Amigo';

  @override
  String get homeTodayFocus => 'Enfoque de hoy';

  @override
  String homeVsYesterday(String pct) {
    return '$pct% vs. ayer';
  }

  @override
  String get homeStartToday => 'Aún sin enfoque hoy';

  @override
  String get homeDayStreak => 'Días seguidos';

  @override
  String get homeTodayGoal => 'Meta de hoy';

  @override
  String homePctCompleted(int pct) {
    return '$pct% completado';
  }

  @override
  String get homeOnTrack => '¡Vas bien!';

  @override
  String get homeKeepGoing => 'Sigue así';

  @override
  String get homeGoalMet => '¡Meta cumplida!';

  @override
  String get homeScreenTimeTitle => 'Tiempo de pantalla';

  @override
  String get homeToday => 'Hoy';

  @override
  String homeVsAvg(String pct) {
    return '$pct% vs. media';
  }

  @override
  String get homeQuickStart => 'Iniciar sesión de enfoque';

  @override
  String get homeManage => 'Gestionar';

  @override
  String get homeNoApps =>
      'Elige las apps que más te distraen y bloquéalas aquí.';

  @override
  String get homeAddApps => 'Añadir apps';

  @override
  String homeAppLocked(String app) {
    return '$app bloqueada';
  }

  @override
  String homeAppUnlocked(String app) {
    return '$app desbloqueada';
  }

  @override
  String homeLockApp(String app) {
    return 'Bloquear o desbloquear $app';
  }

  @override
  String get homeUpgradeTitle => 'Hazte Premium';

  @override
  String get homeUpgradeBody => 'Bloqueos, metas y análisis ilimitados.';

  @override
  String get homeTryFree => 'Probar gratis';

  @override
  String get homePro => 'PRO';

  @override
  String get homeProActive => 'Pausey Pro está activo';

  @override
  String get homeProActiveBody => 'Todo desbloqueado. ¡Gracias por tu apoyo!';

  @override
  String get homeNotifications => 'Notificaciones';

  @override
  String get homeNoNotifications => 'Estás al día.';

  @override
  String get homePushLabel => 'Notificaciones push';

  @override
  String get homeFocusReminder => 'Recordatorio diario';

  @override
  String get homeStreakAlerts => 'Alertas de racha';

  @override
  String get homePwTitle => 'Desbloquea Pausey Pro';

  @override
  String get homePwSubtitle =>
      'Recupera tu enfoque y vence la adicción al móvil.';

  @override
  String get homePwMonthly => 'Mensual';

  @override
  String get homePwBilledMonthly => 'Facturado mensualmente';

  @override
  String get homePwYearly => 'Anual';

  @override
  String get homePwPopular => 'Más popular';

  @override
  String homePwSave(int pct) {
    return 'Ahorra $pct%';
  }

  @override
  String homePwBilledYearly(String price) {
    return '$price al año';
  }

  @override
  String get homePwLifetime => 'De por vida';

  @override
  String get homePwBestValue => 'Mejor valor';

  @override
  String get homePwPayOnce => 'Paga una vez, para siempre';

  @override
  String get homePwPerMonth => '/ mes';

  @override
  String get homePwOnce => 'único';

  @override
  String get homePwStartTrial => 'Prueba gratis 7 días';

  @override
  String get homePwBuyLifetime => 'Obtener acceso de por vida';

  @override
  String get homePwNoCharge => 'Sin cargo hoy · Cancela cuando quieras';

  @override
  String get homePwOneTime => 'Pago único · Sin suscripción';

  @override
  String get homePwFree => 'Gratis';

  @override
  String get homePwProCol => 'Pro';

  @override
  String get homePwFeatBlocking => 'Bloqueo ilimitado de apps';

  @override
  String get homePwFeatSessions => 'Todos los modos de enfoque';

  @override
  String get homePwFeatGoals => 'Metas ilimitadas';

  @override
  String get homePwFeatAnalytics => 'Análisis avanzado';

  @override
  String get homePwFeatStreak => 'Protección de racha';

  @override
  String get homePwFeatSchedule => 'Programación de enfoque';

  @override
  String get homePwFeatFaceId => 'Bloqueo con Face ID';

  @override
  String get homePwFeatNotif => 'Notificaciones inteligentes';

  @override
  String homePwMax(int n) {
    return 'máx. $n';
  }

  @override
  String get homePwSecure => 'Pago seguro';

  @override
  String get homePwCancelAnytime => 'Cancela cuando quieras';

  @override
  String get homePwPrivacyFirst => 'Privacidad primero';

  @override
  String get homePwRestore => 'Restaurar compras';

  @override
  String get homePwTerms => 'Términos del servicio';

  @override
  String get homePwPrivacyPolicy => 'Política de privacidad';

  @override
  String get homePwWelcome => '¡Bienvenido a Pausey Pro!';

  @override
  String get homePwNothingToRestore => 'No se encontraron compras anteriores.';

  @override
  String get homePwRestored => 'Tu acceso Pro está activo.';

  @override
  String get homePwLinkSoon => 'Esta página se abrirá pronto en nuestra web.';

  @override
  String get homePwYouArePro => 'Eres Pro, ¡disfruta!';

  @override
  String get homePwClose => 'Cerrar';

  @override
  String get homeAvgLegend => 'Media de 7 días';

  @override
  String homeGoalOf(String done, String goal) {
    return '$done de $goal';
  }

  @override
  String get homeBest => 'Mejor:';

  @override
  String get homeMyApps => 'Mis apps';

  @override
  String get homeManageApps => 'Gestionar apps';

  @override
  String get homeUnblockApps => 'Desbloquear apps';

  @override
  String homeAppsLocked(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count apps bloqueadas',
      one: '1 app bloqueada',
    );
    return '$_temp0';
  }

  @override
  String homeAppNamesMore(String names, int count) {
    return '$names +$count';
  }

  @override
  String get homeNoLockedApps => 'Aún no hay apps bloqueadas';

  @override
  String get homeNoLockedAppsSub => 'Elige las apps que te atrapan';

  @override
  String get insightsAnalytics => 'Análisis';

  @override
  String get insightsScreenTime => 'Tiempo de pantalla';

  @override
  String get insightsToday => 'Hoy';

  @override
  String get insightsWeek => 'Semana';

  @override
  String get insightsMonth => 'Mes';

  @override
  String get insightsProductivity => 'Puntuación de productividad';

  @override
  String insightsPts(String delta) {
    return '$delta pts';
  }

  @override
  String get insightsVsLastWeek => 'vs. semana pasada';

  @override
  String get insightsVsLastMonth => 'vs. mes pasado';

  @override
  String insightsScoreDays(int n) {
    return 'Puntuación de $n días';
  }

  @override
  String get insightsFocusHours => 'Horas de enfoque';

  @override
  String get insightsThisWeek => 'esta semana';

  @override
  String get insightsThisMonth => 'este mes';

  @override
  String insightsGoalOf(String done, String goal) {
    return '$done / $goal meta';
  }

  @override
  String get insightsFocusScore => 'Enfoque';

  @override
  String get insightsGoals => 'Metas';

  @override
  String get insightsConsistency => 'Constancia';

  @override
  String get insightsWeeklyFocus => 'Horas de enfoque semanales';

  @override
  String insightsDailyFocus(int n) {
    return 'Enfoque diario, últimos $n días';
  }

  @override
  String insightsBestDay(String day, String time) {
    return 'Mejor día: $day · $time';
  }

  @override
  String insightsAvgDay(String time) {
    return 'Media $time / día';
  }

  @override
  String get insightsMonthlyTrends => 'Tendencias del mes';

  @override
  String get insightsActual => 'Real';

  @override
  String get insightsGoal => 'Meta';

  @override
  String insightsWk(int n) {
    return 'Sem $n';
  }

  @override
  String insightsWeekBeat(int n, String time) {
    return 'La semana $n superó la meta por $time';
  }

  @override
  String insightsWeekShort(int n, String time) {
    return 'La mejor fue la semana $n, a $time de la meta';
  }

  @override
  String get insightsGoalCompletion => 'Metas cumplidas';

  @override
  String insightsDaysOf(int done, int total) {
    return '$done/$total días';
  }

  @override
  String get insightsNoGoals =>
      'Aún no hay metas. Añade una para ver tu progreso aquí.';

  @override
  String get insightsManageGoals => 'Gestionar';

  @override
  String insightsGoalFocus(String hours) {
    return 'Enfoque diario: $hours horas';
  }

  @override
  String get insightsGoalBlock => 'Bloquear redes sociales';

  @override
  String insightsGoalPomo(int n) {
    return '$n pomodoros al día';
  }

  @override
  String insightsGoalScreen(String time) {
    return 'Menos de $time de pantalla';
  }

  @override
  String get insightsGoalPhoneFree => 'Tiempo sin móvil';

  @override
  String get insightsEmptyBadge => 'Aún sin sesiones';

  @override
  String get insightsEmptyTitle => 'Tus estadísticas empiezan con una sesión';

  @override
  String get insightsEmptyBody =>
      'Termina una sesión de enfoque y aquí verás tus puntuaciones, gráficos y metas.';

  @override
  String get insightsEmptyCta => 'Empezar a enfocarme';

  @override
  String get insightsDailyUsage => 'Uso diario';

  @override
  String get insightsFocusTime => 'Tiempo de enfoque';

  @override
  String get insightsVsAvg => 'vs. media';

  @override
  String get insightsUsageByDay => 'Uso por día';

  @override
  String get insightsUsageByWeek => 'Uso por semana';

  @override
  String get insightsUsage => 'Uso';

  @override
  String insightsTrend(int n) {
    return 'Tendencia de $n días';
  }

  @override
  String get insightsImproving => 'Mejorando';

  @override
  String get insightsRising => 'En aumento';

  @override
  String insightsDaysAgo(int n) {
    return 'Hace $n días';
  }

  @override
  String get insightsMostUsed => 'Apps más usadas';

  @override
  String get insightsAllApps => 'Todas las apps';

  @override
  String get insightsBreakdown => 'Desglose de uso';

  @override
  String get insightsTotal => 'total';

  @override
  String get insightsNoUsage => 'No hay tiempo de pantalla en este periodo.';

  @override
  String get insightsLockApp => 'Bloquear esta app';

  @override
  String insightsLocked(String app) {
    return '$app está bloqueada';
  }

  @override
  String get insightsCatSocial => 'Social';

  @override
  String get insightsCatVideo => 'Vídeo';

  @override
  String get insightsCatGames => 'Juegos';

  @override
  String get insightsCatShopping => 'Compras';

  @override
  String get insightsCatCommunity => 'Comunidad';

  @override
  String get insightsCatOther => 'Otros';

  @override
  String nativeBlockTitle(String app) {
    return '$app está en pausa';
  }

  @override
  String get nativeReasonLimit => 'Ya usaste el tiempo de hoy para esta app.';

  @override
  String get nativeReasonSchedule => 'Hay un horario de bloqueo activo ahora.';

  @override
  String get nativeReasonGlobal => 'Esta app está bloqueada en Pausey.';

  @override
  String get nativeReasonFocus => 'Estás en una sesión de enfoque.';

  @override
  String get nativeClose => 'Cerrar app';

  @override
  String get nativeNotifTitle => 'Pausey mantiene tus límites';

  @override
  String get nativeNotifText => 'Límites y horarios de bloqueo activos';

  @override
  String get profileSettings => 'Ajustes';

  @override
  String get profileGuestName => 'Invitado';

  @override
  String get profileGuestBadge => 'Invitado · guardado en este teléfono';

  @override
  String get profileEditName => 'Editar nombre';

  @override
  String get profileNameHint => 'Tu nombre';

  @override
  String get profileSave => 'Guardar';

  @override
  String profileMemberSince(String date) {
    return 'Miembro desde $date';
  }

  @override
  String get profileProActive => 'Pro · Activo';

  @override
  String get profileFree => 'Plan gratuito';

  @override
  String get profileUpgrade => 'Mejorar';

  @override
  String get profileBadges => 'Insignias';

  @override
  String get profileNoBadges => 'Completa sesiones para ganar insignias';

  @override
  String get profileFocusTime => 'Tiempo de enfoque';

  @override
  String get profileGoalsDone => 'Metas cumplidas';

  @override
  String get profileDayStreak => 'Días seguidos';

  @override
  String get profileAppsBlocked => 'Apps bloqueadas';

  @override
  String get profileFocusActivity => 'Actividad de enfoque';

  @override
  String get profileLast4Weeks => 'Últimas 4 semanas';

  @override
  String get profileRecentActivity => 'Actividad reciente';

  @override
  String get profileSessionDone => 'Sesión completada';

  @override
  String get profileSessionStopped => 'Sesión terminada antes';

  @override
  String get profileModePomodoro => 'Pomodoro';

  @override
  String get profileModeDeep => 'Trabajo profundo';

  @override
  String get profileModeCustom => 'Personalizado';

  @override
  String get profileJustNow => 'Ahora';

  @override
  String profileAgoMinutes(int n) {
    return 'hace $n min';
  }

  @override
  String profileAgoHours(int n) {
    return 'hace $n h';
  }

  @override
  String get profileYesterday => 'Ayer';

  @override
  String get profileEmptyTitle => 'Aún no hay sesiones';

  @override
  String get profileEmptyBody =>
      'Empieza tu primera sesión: aquí verás tu actividad, racha e insignias.';

  @override
  String get profileStartFocus => 'Empezar';

  @override
  String get profileMyGoals => 'Mis metas';

  @override
  String get profileStreaks => 'Rachas e insignias';

  @override
  String get profileSubscription => 'Suscripción';

  @override
  String get profileSignOutTitle => '¿Cerrar sesión?';

  @override
  String get profileSignOutBody => 'Puedes volver a entrar cuando quieras.';

  @override
  String get profileSecNotifications => 'Notificaciones';

  @override
  String get profileSecAppearance => 'Apariencia';

  @override
  String get profileSecFocus => 'Enfoque y bloqueo';

  @override
  String get profileSecPrivacy => 'Privacidad y seguridad';

  @override
  String get profileSecAccount => 'Cuenta';

  @override
  String get profilePush => 'Notificaciones push';

  @override
  String get profilePushSub => 'Recordatorios y avisos';

  @override
  String get profileReminder => 'Recordatorio para empezar';

  @override
  String profileReminderSub(String time) {
    return 'Cada día a las $time';
  }

  @override
  String get profileStreakAlerts => 'Avisos de racha';

  @override
  String get profileStreakAlertsSub => 'Antes de perder la racha';

  @override
  String get profileGoalMilestones => 'Hitos de metas';

  @override
  String get profileGoalMilestonesSub => 'Al cumplir una meta';

  @override
  String get profileDarkMode => 'Modo oscuro';

  @override
  String get profileOn => 'Activado';

  @override
  String get profileOff => 'Desactivado';

  @override
  String get profileTextSize => 'Tamaño del texto';

  @override
  String get profileTextSmall => 'Pequeño';

  @override
  String get profileTextMedium => 'Mediano';

  @override
  String get profileTextLarge => 'Grande';

  @override
  String get profileTextHuge => 'Muy grande';

  @override
  String get profilePomodoroLen => 'Duración del pomodoro';

  @override
  String get profileBreakLen => 'Duración del descanso';

  @override
  String profileMinutes(int n) {
    return '$n min';
  }

  @override
  String get profileFaceIdUnlock => 'Face ID para desbloquear';

  @override
  String get profileFaceIdUnlockSub => 'Confirmar antes de desbloquear';

  @override
  String get profileBypass => 'Desbloqueo de emergencia';

  @override
  String profileBypassSub(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n desbloqueos al día',
      one: '1 desbloqueo al día',
    );
    return '$_temp0';
  }

  @override
  String get profileAppLock => 'Bloquear Pausey con Face ID';

  @override
  String get profileAppLockSub => 'Pedir al abrir la app';

  @override
  String get profileHideUsage => 'Ocultar datos de uso';

  @override
  String get profileHideUsageSub => 'Ocultar el tiempo de pantalla';

  @override
  String get profileClearData => 'Borrar actividad';

  @override
  String get profileClearDataSub => 'Elimina sesiones e historial';

  @override
  String get profileClearTitle => '¿Borrar la actividad?';

  @override
  String get profileClearBody =>
      'Se borrarán todas las sesiones y registros de metas de este teléfono. No se puede deshacer.';

  @override
  String get profileClear => 'Borrar';

  @override
  String get profileCleared => 'Actividad borrada';

  @override
  String get profileExport => 'Exportar mis datos';

  @override
  String get profileExportSub => 'Copiar como JSON';

  @override
  String get profileExported => 'Tus datos se copiaron al portapapeles';

  @override
  String get profileStreaksTitle => 'Rachas';

  @override
  String get profileShare => 'Compartir';

  @override
  String profileShareText(int n) {
    return '¡Llevo $n días seguidos de enfoque con Pausey!';
  }

  @override
  String get profileCopied => 'Copiado al portapapeles';

  @override
  String profileNextMilestone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n días',
      one: '1 día',
    );
    return '¡Sigue así: $_temp0 para el próximo hito!';
  }

  @override
  String get profileAllMilestones => 'Todos los hitos logrados. ¡Legendario!';

  @override
  String get profileStartStreak =>
      'Completa una sesión hoy para empezar una racha.';

  @override
  String get profileBest => 'Mejor';

  @override
  String get profileThisWeek => 'Esta semana';

  @override
  String profileDaysCompleted(int n) {
    return '$n/7 días completados';
  }

  @override
  String get profileCompleted => 'Completado';

  @override
  String get profilePartial => 'Parcial';

  @override
  String get profileMissed => 'Perdido';

  @override
  String get profilePrevMonth => 'Mes anterior';

  @override
  String get profileNextMonth => 'Mes siguiente';

  @override
  String get profileMilestones => 'Hitos de racha';

  @override
  String get profileAchievements => 'Logros';

  @override
  String get profileAchOnFire => 'En racha';

  @override
  String get profileAchIronWill => 'Voluntad de hierro';

  @override
  String get profileAchFocusMaster => 'Maestro del enfoque';

  @override
  String get profileAchMonk => 'Monje digital';

  @override
  String get profileAchLegend => 'Legendario';

  @override
  String get profileAchSpeed => 'Imparable';

  @override
  String profileAchStreakDesc(int n) {
    return 'Racha de $n días';
  }

  @override
  String profileAchSessionsDesc(int n) {
    return '$n sesiones completadas';
  }

  @override
  String profileAchHoursDesc(int n) {
    return '$n h de enfoque';
  }

  @override
  String profileAchDayDesc(int n) {
    return '$n sesiones en un día';
  }

  @override
  String get navHome => 'Inicio';

  @override
  String get navBlock => 'Bloquear';

  @override
  String get navFocus => 'Enfoque';

  @override
  String get navInsights => 'Estadísticas';

  @override
  String get navProfile => 'Perfil';

  @override
  String get unitH => 'h';

  @override
  String get unitM => 'min';

  @override
  String get sampleData => 'Datos de ejemplo';

  @override
  String get seeAll => 'Ver todo';

  @override
  String days(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count días',
      one: '1 día',
    );
    return '$_temp0';
  }

  @override
  String get statesTitle => 'Estados';

  @override
  String get statesSubtitle => 'Pantallas de error, vacías y de carga';

  @override
  String get statesNoInternet => 'Sin internet';

  @override
  String get statesConnectionLost => 'Conexión perdida';

  @override
  String get statesOfflineTitle => 'Sin conexión';

  @override
  String get statesOfflineMsg =>
      'Pausey no puede conectar con el servidor. Revisa tu Wi-Fi o datos móviles e inténtalo de nuevo: tus datos locales están a salvo.';

  @override
  String get statesTryAgain => 'Reintentar';

  @override
  String get statesOpenSettings => 'Abrir ajustes';

  @override
  String get statesOfflineMode => 'Modo sin conexión activo';

  @override
  String get statesLimited => 'Limitado';

  @override
  String get statesAvailable => 'Disponible';

  @override
  String get statesUnavailable => 'No disponible';

  @override
  String get statesCapSessions => 'Ver sesiones anteriores';

  @override
  String get statesCapApps => 'Lista de apps bloqueadas';

  @override
  String get statesCapTimer => 'Usar temporizador local';

  @override
  String get statesCapSync => 'Sincronizar racha y metas';

  @override
  String get statesCapAnalytics => 'Actualizar estadísticas';

  @override
  String get statesOfflineNote =>
      'Tus datos de enfoque se guardan en el dispositivo. No se pierde nada sin conexión.';

  @override
  String get statesBackOnline => 'Conectado de nuevo: todo sincronizado';

  @override
  String get statesShowAgain => 'Mostrar de nuevo';

  @override
  String get statesPermDenied => 'Permiso denegado';

  @override
  String get statesPermRequired => 'Permiso necesario';

  @override
  String get statesPermTitle => 'Acceso bloqueado';

  @override
  String get statesPermMsg =>
      'Pausey necesita acceso a Tiempo de uso para bloquear apps. Sin él, el bloqueo no funcionará.';

  @override
  String get statesGrant => 'Conceder acceso';

  @override
  String get statesLearnMore => 'Más información';

  @override
  String get statesLearnMoreMsg =>
      'Con Tiempo de uso, Pausey puede pausar las apps que distraen. Tus datos no salen del teléfono.';

  @override
  String get statesRequiredPerms => 'Permisos necesarios';

  @override
  String get statesPermNotif => 'Notificaciones';

  @override
  String get statesPermScreenTime => 'Acceso a Tiempo de uso';

  @override
  String get statesPermUsage => 'Estadísticas de uso';

  @override
  String get statesPermBio => 'Face ID / biometría';

  @override
  String get statesGranted => 'Concedido';

  @override
  String get statesDenied => 'Denegado';

  @override
  String get statesPermNote =>
      'Sin Tiempo de uso, el temporizador funciona, pero no se pueden bloquear apps.';

  @override
  String get statesAccessGranted => 'Acceso concedido: bloqueo listo';

  @override
  String get statesDataNA => 'Datos no disponibles';

  @override
  String get statesSyncFailed => 'Error de sincronización';

  @override
  String get statesLoadTitle => 'No se pudieron cargar los datos';

  @override
  String get statesLoadMsg =>
      'Algo falló al obtener tus estadísticas. Puede ser un fallo temporal del servidor: tus datos locales siguen intactos.';

  @override
  String get statesRetrySync => 'Reintentar';

  @override
  String get statesUseCached => 'Usar caché';

  @override
  String get statesErrorDetails => 'Detalles del error';

  @override
  String get statesErrorCode => 'Código';

  @override
  String get statesTimestamp => 'Hora';

  @override
  String get statesRetryCount => 'Intentos';

  @override
  String statesAttempts(int n) {
    return '$n / 3 intentos';
  }

  @override
  String get statesReport => 'Informar a soporte';

  @override
  String get statesReported => 'Gracias, informe enviado';

  @override
  String get statesCachedNote =>
      'Mientras tanto, tienes los datos de la última sincronización.';

  @override
  String get statesDataLoaded => 'Estadísticas cargadas';

  @override
  String get statesCachedShown => 'Mostrando datos en caché';

  @override
  String statesWeekFocus(String time) {
    return 'Enfoque esta semana: $time';
  }

  @override
  String get statesEmpty => 'Estado vacío';

  @override
  String get statesNothingYet => 'Aún nada';

  @override
  String get statesEmptyTitle => 'Aún no hay sesiones';

  @override
  String get statesEmptyMsg =>
      'Empieza tu primera sesión y verás tu progreso aquí.';

  @override
  String get statesStartFocus => 'Empezar';

  @override
  String get statesLoadingSection => 'Estados de carga';

  @override
  String get statesDashLoading => 'Panel';

  @override
  String get statesAnalyticsLoading => 'Estadísticas';

  @override
  String get statesGoalsLoading => 'Metas';

  @override
  String get statesProfileLoading => 'Perfil';

  @override
  String get statesCrunching => 'Procesando tus datos…';

  @override
  String get statesLoadingGoals => 'Cargando tus metas…';

  @override
  String get statesLoadingProfile => 'Cargando tu perfil…';

  @override
  String get statesReplay => 'Repetir';

  @override
  String get stHowCaption => 'Cómo funciona';

  @override
  String stHow1(String app) {
    return 'Vuelves a abrir $app';
  }

  @override
  String get stHow2 => 'Empiezas a deslizar, pero…';

  @override
  String get stHow3 => 'Pausey la bloquea con suavidad.';

  @override
  String stBlockedTitle(String app) {
    return '$app está bloqueada';
  }

  @override
  String get stHow4 => 'Y avisa antes del límite';

  @override
  String get stYourApp => 'tu app';

  @override
  String get stTapToContinue => 'Toca para continuar';

  @override
  String get stNudgeGeneric => 'Casi en tu límite diario';

  @override
  String get stPermTitle => 'Concede unos permisos';

  @override
  String get stPermUsageTitle => 'Tiempo de pantalla';

  @override
  String get stPermUsageWhy =>
      'Muestra tu tiempo de pantalla diario y cuándo llegas a un límite.';

  @override
  String get stPermOverlayTitle => 'Mostrar sobre otras apps';

  @override
  String get stPermOverlayWhy =>
      'Permite que Pausey muestre su pantalla de pausa sobre una app que te distrae.';

  @override
  String get stPermNotifTitle => 'Notificaciones';

  @override
  String get stPermNotifWhy =>
      'Avisos suaves antes de que se acabe un límite. Puedes desactivarlo después.';

  @override
  String get stPermMore => 'Una cosa más…';

  @override
  String get stPermA11yTitle => 'Accesibilidad';

  @override
  String get stPermA11yWhy =>
      'Detecta al instante qué app está abierta, para que la pausa llegue enseguida.';

  @override
  String get stPermA11yNote =>
      'Algunos teléfonos muestran después su propia pantalla de advertencia. Es normal: puedes desactivarlo cuando quieras en Ajustes.';

  @override
  String get stPermOnHint =>
      'Ya está activado. Para desactivarlo, abre Ajustes de Android › Apps › Pausey.';

  @override
  String get stA11yDialogTitle => '¿Por qué accesibilidad?';

  @override
  String get stA11yDialogBody =>
      'Pausey usa la accesibilidad solo para saber qué app está abierta, para que tus límites y horarios se apliquen al momento, y para que la protección funcione de forma fiable.';

  @override
  String get stA11yNot => 'Lo que Pausey NO hace:';

  @override
  String get stA11yNot1 => 'Leer ni recopilar lo que hay en tu pantalla';

  @override
  String get stA11yNot2 => 'Guardar información personal';

  @override
  String get stA11yNot3 => 'Enviar datos fuera de tu teléfono';

  @override
  String get stPw1 => 'Tu plan para un día más tranquilo';

  @override
  String get stPw2 => 'Bloqueos que no podrás saltarte con excusas';

  @override
  String get stPw3 => 'Mira tu progreso semana a semana';

  @override
  String get stPwToday => 'Hoy';

  @override
  String get stPwGoal => 'Tu meta';

  @override
  String stPwWeek(int n) {
    return 'S$n';
  }

  @override
  String get stPwFirstWeek => 'Tu primera semana empieza ahora';

  @override
  String get stPwFocusWeek => 'Tiempo de enfoque por semana';

  @override
  String nudgeTitle(String app) {
    return 'Casi en tu límite de $app';
  }

  @override
  String nudgeText(String used, String limit) {
    return 'Hoy llevas $used de $limit';
  }
}
