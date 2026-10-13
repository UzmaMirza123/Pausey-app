// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get ob1Title => 'قلّل إدمان الشاشة';

  @override
  String get ob1Body =>
      'تحكّم في عاداتك الرقمية وقلّل الوقت على التطبيقات المشتتة.';

  @override
  String get ob1StatAvg => 'متوسط وقت الشاشة اليومي';

  @override
  String get ob1StatSocial => 'يُقضى على وسائل التواصل';

  @override
  String get ob2SelectApps => 'اختر التطبيقات';

  @override
  String get ob2Title => 'اقفل التطبيقات المشتتة';

  @override
  String get ob2Body =>
      'احجب وسائل التواصل والألعاب والمشتتات الأخرى بأدوات قفل قوية.';

  @override
  String get ob2Feature1 => 'احجب أي تطبيق على هاتفك بلمسة واحدة';

  @override
  String get ob2Feature2 => 'جدولة أوقات القفل وفترات التركيز';

  @override
  String get ob2Feature3 => 'احمِ القفل بكلمة مرور لتبقى ملتزمًا';

  @override
  String get sheetTitle => 'اختر التطبيقات';

  @override
  String get sheetTotalLocked => 'إجمالي المقفل';

  @override
  String get sheetAppsSelected => 'تطبيقات مختارة';

  @override
  String get sheetTimeSaved => 'الوقت الموفَّر';

  @override
  String get sheetPerDayAvg => 'متوسط يومي';

  @override
  String sheetHoursValue(String h) {
    return '$h س';
  }

  @override
  String get sheetSearchHint => 'ابحث عن التطبيقات...';

  @override
  String get sheetCatAll => 'الكل';

  @override
  String get sheetCatSocial => 'تواصل';

  @override
  String get sheetCatEntertainment => 'ترفيه';

  @override
  String get sheetCatGames => 'ألعاب';

  @override
  String get sheetAppsHeader => 'التطبيقات';

  @override
  String sheetSelectedCount(int count) {
    return '$count مختار';
  }

  @override
  String get sheetNoApps => 'لم يتم العثور على تطبيقات';

  @override
  String get sheetLockSchedule => 'جدول القفل';

  @override
  String get sheetAddCustomSemantic => 'أضف جدول قفل مخصصًا';

  @override
  String get sheetCustomBadge => '+ مخصص';

  @override
  String get sheetSchedMorning => 'الصباح';

  @override
  String get sheetSchedWork => 'العمل';

  @override
  String get sheetSchedEvening => 'المساء';

  @override
  String get sheetEveryDay => 'كل يوم';

  @override
  String get sheetWeekdays => 'أيام الأسبوع';

  @override
  String get sheetWeekends => 'عطلة نهاية الأسبوع';

  @override
  String get sheetUnlockMethod => 'طريقة فتح القفل';

  @override
  String get sheetPin => 'رمز PIN';

  @override
  String get sheetPinSub => 'PIN من 4 أرقام';

  @override
  String get sheetFaceId => 'Face ID';

  @override
  String get sheetFaceIdSub => 'بيومتري';

  @override
  String get sheetTouchId => 'Touch ID';

  @override
  String get sheetTouchIdSub => 'بصمة الإصبع';

  @override
  String get sheetFooter => 'يمكنك تغيير ذلك لاحقًا في أي وقت';

  @override
  String get sheetConfirmLock => 'تأكيد القفل';

  @override
  String sheetRemove(String name) {
    return 'إزالة $name';
  }

  @override
  String get sheetCustomTitle => 'جدول مخصص';

  @override
  String get sheetCustomBody => 'تبقى تطبيقاتك المختارة مقفلة خلال هذا الوقت.';

  @override
  String get sheetNameLabel => 'الاسم';

  @override
  String get sheetNameHint => 'مثلًا وقت الدراسة';

  @override
  String get sheetStarts => 'يبدأ';

  @override
  String get sheetEnds => 'ينتهي';

  @override
  String get sheetSameTime => 'وقت البدء والانتهاء متطابقان';

  @override
  String sheetLockedFor(String duration) {
    return 'مقفل لمدة $duration';
  }

  @override
  String sheetLockedForOvernight(String duration) {
    return 'مقفل لمدة $duration (طوال الليل)';
  }

  @override
  String sheetDurH(int h) {
    return '$h س';
  }

  @override
  String sheetDurM(int m) {
    return '$m د';
  }

  @override
  String sheetDurHM(int h, int m) {
    return '$h س $m د';
  }

  @override
  String get sheetLockStartsAt => 'يبدأ القفل في';

  @override
  String get sheetLockEndsAt => 'ينتهي القفل في';

  @override
  String get sheetRepeatOn => 'التكرار في';

  @override
  String get sheetAddSchedule => 'إضافة الجدول';

  @override
  String get sheetCustomDefaultName => 'مخصص';

  @override
  String sheetChangeTime(String label, String time) {
    return '$label $time. تغيير الوقت';
  }

  @override
  String get ob3Title => 'حافظ على تركيزك كل يوم';

  @override
  String get ob3Body =>
      'استخدم جلسات بومودورو والتركيز العميق لتعزيز إنتاجيتك وتحقيق المزيد.';

  @override
  String get ob3Pomodoro => 'بومودورو';

  @override
  String ob3PomodoroSub(int min) {
    return 'جلسات $min دقيقة';
  }

  @override
  String get ob3DeepFocus => 'تركيز عميق';

  @override
  String ob3DeepFocusSub(int min) {
    return 'تدفق $min دقيقة';
  }

  @override
  String get ob3StatBoost => 'زيادة الإنتاجية';

  @override
  String ob3StatStreakValue(int days) {
    return '$days أيام';
  }

  @override
  String get ob3StatStreak => 'بناء السلسلة';

  @override
  String get ob3StatGoal => 'إنجاز الأهداف';

  @override
  String get ob3StartTimer => 'بدء المؤقت';

  @override
  String get ob3PauseTimer => 'إيقاف المؤقت مؤقتًا';

  @override
  String get ob4Title => 'تابع تقدمك';

  @override
  String get ob4Body =>
      'راقب وقت الشاشة وساعات التركيز والأهداف والإنتاجية بتحليلات جميلة.';

  @override
  String get ob4Weekly => 'أسبوعية';

  @override
  String get ob4WeeklySub => 'تقارير';

  @override
  String get ob4Goals => 'الأهداف';

  @override
  String get ob4GoalsSub => 'متتبع';

  @override
  String get ob4Insights => 'رؤى';

  @override
  String get ob4InsightsSub => 'مدرب ذكي';

  @override
  String get ob4Streaks => 'السلاسل';

  @override
  String get ob4StreaksSub => 'والشارات';

  @override
  String get ob5Title => 'ما متوسط وقت الشاشة اليومي لديك؟';

  @override
  String get ob5Subtitle => 'على هاتفك فقط. تقديرك التقريبي يكفي.';

  @override
  String get ob5More7 => 'أكثر من 7 ساعات';

  @override
  String get ob5H5to7 => '5-7 ساعات';

  @override
  String get ob5H4to5 => '4-5 ساعات';

  @override
  String get ob5H3to4 => '3-4 ساعات';

  @override
  String get ob5H1to3 => '1-3 ساعات';

  @override
  String get ob5Under1 => 'أقل من ساعة';

  @override
  String get ob6Title => 'ما هي مهنتك؟';

  @override
  String get ob6Subtitle => 'سنخصص خطة تركيزك حسب أسلوب عملك.';

  @override
  String get ob6Software => 'تطوير البرمجيات';

  @override
  String get ob6Founder => 'رئيس تنفيذي / مؤسس';

  @override
  String get ob6Remote => 'عامل عن بُعد';

  @override
  String get ob6Finance => 'مالية / عمليات / استشارات';

  @override
  String get ob6Art => 'فن / محتوى';

  @override
  String get ob6Education => 'التعليم';

  @override
  String get ob6Others => 'أخرى';

  @override
  String get ob7Title => 'حدّد هدف وقت الشاشة اليومي';

  @override
  String get ob7Subtitle => 'يمكنك تغييره في أي وقت. سننبّهك عندما تقترب منه.';

  @override
  String ob7Hours(String hours) {
    return '$hours س';
  }

  @override
  String get ob7PerDay => 'يوميًا';

  @override
  String ob7HoursPerDay(String hours) {
    return '$hours يوميًا';
  }

  @override
  String get ob7DialLabel => 'هدف وقت الشاشة اليومي';

  @override
  String get ob7InfoNote =>
      'يقضي الشخص العادي أكثر من 4 ساعات يوميًا على هاتفه. تحديد هدف هو الخطوة الأولى لاستعادة وقتك.';

  @override
  String get ob8Title => 'فعّل الأذونات الأساسية';

  @override
  String get ob8Subtitle => 'امنح الوصول للاستمتاع بتجربة Pausey الكاملة.';

  @override
  String get ob8UsageTitle => 'الوصول إلى الاستخدام';

  @override
  String get ob8UsageSub => 'راقب استخدام التطبيقات وطبّق جلسات التركيز.';

  @override
  String get ob8NotifTitle => 'الإشعارات';

  @override
  String get ob8NotifSub => 'تذكيرات في وقتها وتنبيهات بالتقدّم.';

  @override
  String get ob8TrackTitle => 'تتبّع استخدام التطبيقات';

  @override
  String get ob8TrackSub => 'تفاصيل يومية وأسبوعية.';

  @override
  String get ob9Title => 'كل شيء جاهز!';

  @override
  String get ob9Subtitle => 'بيئة التركيز الخاصة بك جاهزة.';

  @override
  String get ob9Enter => 'ادخل إلى Pausey';

  @override
  String get ob9Replay => 'إعادة عرض التعريف';

  @override
  String get ob9ScreenTime => 'وقت الشاشة';

  @override
  String get ob9AppsLocked => 'تطبيقات مقفلة';

  @override
  String get ob9Permissions => 'الأذونات';

  @override
  String get ob9FocusMode => 'وضع التركيز';

  @override
  String get ob9AllOk => 'كل شيء سليم';

  @override
  String get ob9On => 'مفعّل';

  @override
  String get ob9Done => 'تم';

  @override
  String get ob9StreakTitle => 'سلسلة اليوم الأول تبدأ الآن';

  @override
  String get ob9StreakSub => 'أكمل جلسة للحفاظ عليها';

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

  @override
  String get navHome => 'الرئيسية';

  @override
  String get navBlock => 'الحظر';

  @override
  String get navFocus => 'التركيز';

  @override
  String get navInsights => 'الإحصاءات';

  @override
  String get navProfile => 'الملف';

  @override
  String get unitH => 'س';

  @override
  String get unitM => 'د';

  @override
  String get sampleData => 'بيانات تجريبية';

  @override
  String get seeAll => 'عرض الكل';

  @override
  String days(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count أيام',
      one: 'يوم واحد',
    );
    return '$_temp0';
  }
}
