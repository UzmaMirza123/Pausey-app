// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

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
