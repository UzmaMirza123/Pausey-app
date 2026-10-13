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
  String get ob7Title => 'Fija tu meta diaria de tiempo de pantalla';

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
  String get logInTitle => 'Bienvenido de nuevo';

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
}
