// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'Pausey';

  @override
  String get tagline => 'استعد وقتك';

  @override
  String get versionLabel => 'الإصدار 2.0 · إصدار App Store';

  @override
  String get skip => 'تخطي';

  @override
  String get continueLabel => 'متابعة';

  @override
  String get back => 'رجوع';

  @override
  String get freeToStart => 'ابدأ مجانًا · لا حاجة لبطاقة ائتمان';

  @override
  String get dataStaysOnDevice => 'بياناتك لا تغادر جهازك أبدًا.';

  @override
  String get switchToLight => 'التبديل إلى الوضع الفاتح';

  @override
  String get switchToDark => 'التبديل إلى الوضع الداكن';

  @override
  String get language => 'اللغة';

  @override
  String get phoneLanguage => 'لغة الهاتف';

  @override
  String get authTitle => 'أوقف التمرير.\nامتلك يومك.';

  @override
  String get authSubtitle =>
      'أنشئ حسابًا لمزامنة أهدافك وسلاسلك، أو جرّب Pausey كضيف.';

  @override
  String get continueWithApple => 'المتابعة باستخدام Apple';

  @override
  String get continueWithGoogle => 'المتابعة باستخدام Google';

  @override
  String get signUpWithEmail => 'التسجيل بالبريد الإلكتروني';

  @override
  String get continueAsGuest => 'المتابعة كضيف';

  @override
  String get guestNote => 'تُحفظ بيانات الضيف على هذا الهاتف فقط.';

  @override
  String get or => 'أو';

  @override
  String get haveAccount => 'لديك حساب بالفعل؟';

  @override
  String get noAccount => 'جديد على Pausey؟';

  @override
  String get logIn => 'تسجيل الدخول';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get createAccount => 'إنشاء حساب';

  @override
  String get signUpTitle => 'أنشئ حسابك';

  @override
  String get signUpSubtitle => 'ابدأ ببناء عادات أهدأ أمام الشاشة.';

  @override
  String get logInTitle => 'مرحبًا بعودتك';

  @override
  String get logInSubtitle => 'سجّل الدخول لمتابعة سلسلتك.';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get showPassword => 'إظهار كلمة المرور';

  @override
  String get hidePassword => 'إخفاء كلمة المرور';

  @override
  String get forgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get resetTitle => 'إعادة تعيين كلمة المرور';

  @override
  String get resetSubtitle => 'أدخل بريدك وسنرسل لك رابط إعادة التعيين.';

  @override
  String get sendLink => 'إرسال الرابط';

  @override
  String get resetSent => 'تحقق من بريدك للحصول على رابط إعادة التعيين.';

  @override
  String get agreeTerms => 'أوافق على الشروط وسياسة الخصوصية';

  @override
  String get passwordStrength => 'قوة كلمة المرور';

  @override
  String get strengthWeak => 'ضعيفة';

  @override
  String get strengthOk => 'مقبولة';

  @override
  String get strengthStrong => 'قوية';

  @override
  String get errNameRequired => 'أدخل اسمك';

  @override
  String get errEmailInvalid => 'أدخل بريدًا صحيحًا';

  @override
  String get errPasswordShort => 'استخدم 8 أحرف على الأقل';

  @override
  String get errPasswordMismatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get errTerms => 'يرجى قبول الشروط للمتابعة';

  @override
  String get authErr_not_configured =>
      'لم يتم إعداد تسجيل الدخول بعد. يمكنك المتابعة كضيف.';

  @override
  String get authErr_cancelled => 'تم إلغاء تسجيل الدخول.';

  @override
  String get authErr_invalid_email => 'يبدو أن البريد غير صحيح.';

  @override
  String get authErr_wrong_password => 'البريد أو كلمة المرور غير صحيحة.';

  @override
  String get authErr_user_not_found =>
      'لا يوجد حساب بهذا البريد. هل تريد التسجيل؟';

  @override
  String get authErr_email_in_use =>
      'يوجد حساب بهذا البريد بالفعل. سجّل الدخول.';

  @override
  String get authErr_weak_password => 'اختر كلمة مرور أقوى.';

  @override
  String get authErr_network => 'لا يوجد اتصال بالإنترنت. حاول مجددًا.';

  @override
  String get authErr_too_many => 'محاولات كثيرة. انتظر دقيقة وحاول مجددًا.';

  @override
  String get authErr_unknown => 'حدث خطأ ما. حاول مجددًا.';

  @override
  String homeHello(String name) {
    return 'مرحبًا، $name';
  }

  @override
  String get homeHelloGuest => 'مرحبًا';

  @override
  String get homeGuestBadge => 'وضع الضيف · محفوظ على هذا الهاتف';

  @override
  String get homeSubtitle => 'خطتك جاهزة. إليك ما اخترته.';

  @override
  String get homeDailyGoal => 'الهدف اليومي';

  @override
  String get homeLockedApps => 'التطبيقات المقفلة';

  @override
  String get homeScreenTime => 'وقت الشاشة الحالي';

  @override
  String get homeNotSet => 'غير محدد';

  @override
  String get homeCreateAccount => 'أنشئ حسابًا للنسخ الاحتياطي';

  @override
  String get signOut => 'تسجيل الخروج';

  @override
  String get signOutGuestWarn =>
      'تسجيل الخروج يحذف بيانات الضيف من هذا الهاتف.';

  @override
  String get cancel => 'إلغاء';
}
