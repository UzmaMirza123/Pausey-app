// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get ob1Title => 'اسکرین کی لت کم کریں';

  @override
  String get ob1Body =>
      'اپنی ڈیجیٹل عادتوں پر قابو پائیں اور توجہ ہٹانے والی ایپس پر کم وقت گزاریں۔';

  @override
  String get ob1StatAvg => 'روزانہ اوسط اسکرین ٹائم';

  @override
  String get ob1StatSocial => 'سوشل میڈیا پر خرچ';

  @override
  String get ob2SelectApps => 'ایپس منتخب کریں';

  @override
  String get ob2Title => 'توجہ ہٹانے والی ایپس لاک کریں';

  @override
  String get ob2Body =>
      'طاقتور ایپ لاک ٹولز سے سوشل میڈیا، گیمز اور دیگر خلل کو روکیں۔';

  @override
  String get ob2Feature1 => 'ایک ٹیپ میں فون کی کوئی بھی ایپ بلاک کریں';

  @override
  String get ob2Feature2 => 'لاک کے اوقات اور فوکس ٹائم طے کریں';

  @override
  String get ob2Feature3 =>
      'بلاکس کو پاس ورڈ سے محفوظ کریں تاکہ آپ ثابت قدم رہیں';

  @override
  String get sheetTitle => 'ایپس منتخب کریں';

  @override
  String get sheetTotalLocked => 'کل لاک شدہ';

  @override
  String get sheetAppsSelected => 'ایپس منتخب';

  @override
  String get sheetTimeSaved => 'بچایا گیا وقت';

  @override
  String get sheetPerDayAvg => 'روزانہ اوسط';

  @override
  String sheetHoursValue(String h) {
    return '$h گھنٹے';
  }

  @override
  String get sheetSearchHint => 'ایپس تلاش کریں...';

  @override
  String get sheetCatAll => 'سب';

  @override
  String get sheetCatSocial => 'سوشل';

  @override
  String get sheetCatEntertainment => 'تفریح';

  @override
  String get sheetCatGames => 'گیمز';

  @override
  String get sheetAppsHeader => 'ایپس';

  @override
  String sheetSelectedCount(int count) {
    return '$count منتخب';
  }

  @override
  String get sheetNoApps => 'کوئی ایپ نہیں ملی';

  @override
  String get sheetLockSchedule => 'لاک شیڈول';

  @override
  String get sheetAddCustomSemantic => 'اپنا لاک شیڈول شامل کریں';

  @override
  String get sheetCustomBadge => '+ اپنا';

  @override
  String get sheetSchedMorning => 'صبح';

  @override
  String get sheetSchedWork => 'کام';

  @override
  String get sheetSchedEvening => 'شام';

  @override
  String get sheetEveryDay => 'ہر روز';

  @override
  String get sheetWeekdays => 'ہفتے کے دن';

  @override
  String get sheetWeekends => 'ویک اینڈ';

  @override
  String get sheetUnlockMethod => 'ان لاک کا طریقہ';

  @override
  String get sheetPin => 'PIN کوڈ';

  @override
  String get sheetPinSub => '4 ہندسوں کا PIN';

  @override
  String get sheetFaceId => 'Face ID';

  @override
  String get sheetFaceIdSub => 'بایومیٹرک';

  @override
  String get sheetTouchId => 'Touch ID';

  @override
  String get sheetTouchIdSub => 'فنگر پرنٹ';

  @override
  String get sheetFooter => 'آپ اسے بعد میں کبھی بھی بدل سکتے ہیں';

  @override
  String get sheetConfirmLock => 'لاک کی تصدیق کریں';

  @override
  String sheetRemove(String name) {
    return '$name ہٹائیں';
  }

  @override
  String get sheetCustomTitle => 'اپنا شیڈول';

  @override
  String get sheetCustomBody => 'اس دوران آپ کی منتخب ایپس لاک رہیں گی۔';

  @override
  String get sheetNameLabel => 'نام';

  @override
  String get sheetNameHint => 'مثلاً پڑھائی کا وقت';

  @override
  String get sheetStarts => 'شروع';

  @override
  String get sheetEnds => 'ختم';

  @override
  String get sheetSameTime => 'شروع اور ختم کا وقت ایک ہی ہے';

  @override
  String sheetLockedFor(String duration) {
    return '$duration کے لیے لاک';
  }

  @override
  String sheetLockedForOvernight(String duration) {
    return '$duration کے لیے لاک (رات بھر)';
  }

  @override
  String sheetDurH(int h) {
    return '$h گھنٹے';
  }

  @override
  String sheetDurM(int m) {
    return '$m منٹ';
  }

  @override
  String sheetDurHM(int h, int m) {
    return '$h گھنٹے $m منٹ';
  }

  @override
  String get sheetLockStartsAt => 'لاک شروع ہونے کا وقت';

  @override
  String get sheetLockEndsAt => 'لاک ختم ہونے کا وقت';

  @override
  String get sheetRepeatOn => 'ان دنوں دہرائیں';

  @override
  String get sheetAddSchedule => 'شیڈول شامل کریں';

  @override
  String get sheetCustomDefaultName => 'اپنا';

  @override
  String sheetChangeTime(String label, String time) {
    return '$label $time۔ وقت بدلیں';
  }

  @override
  String get ob3Title => 'ہر دن توجہ برقرار رکھیں';

  @override
  String get ob3Body =>
      'پیداواری صلاحیت بڑھانے اور زیادہ حاصل کرنے کے لیے پومودورو اور ڈیپ فوکس سیشنز استعمال کریں۔';

  @override
  String get ob3Pomodoro => 'پومودورو';

  @override
  String ob3PomodoroSub(int min) {
    return '$min منٹ کے سیشن';
  }

  @override
  String get ob3DeepFocus => 'ڈیپ فوکس';

  @override
  String ob3DeepFocusSub(int min) {
    return '$min منٹ کا فلو';
  }

  @override
  String get ob3StatBoost => 'پیداواری اضافہ';

  @override
  String ob3StatStreakValue(int days) {
    return '$days دن';
  }

  @override
  String get ob3StatStreak => 'اسٹریک بنائیں';

  @override
  String get ob3StatGoal => 'اہداف کی تکمیل';

  @override
  String get ob3StartTimer => 'ٹائمر شروع کریں';

  @override
  String get ob3PauseTimer => 'ٹائمر روکیں';

  @override
  String get ob4Title => 'اپنی پیش رفت دیکھیں';

  @override
  String get ob4Body =>
      'خوبصورت تجزیات کے ساتھ اسکرین ٹائم، فوکس کے گھنٹے، اہداف اور پیداواری صلاحیت پر نظر رکھیں۔';

  @override
  String get ob4Weekly => 'ہفتہ وار';

  @override
  String get ob4WeeklySub => 'رپورٹس';

  @override
  String get ob4Goals => 'اہداف';

  @override
  String get ob4GoalsSub => 'ٹریکر';

  @override
  String get ob4Insights => 'بصیرت';

  @override
  String get ob4InsightsSub => 'AI کوچ';

  @override
  String get ob4Streaks => 'اسٹریکس';

  @override
  String get ob4StreaksSub => 'اور بیجز';

  @override
  String get ob5Title => 'آپ کا روزانہ اوسط اسکرین ٹائم کتنا ہے؟';

  @override
  String get ob5Subtitle => 'صرف آپ کے فون پر۔ اندازہ بھی ٹھیک ہے۔';

  @override
  String get ob5More7 => '7 گھنٹے سے زیادہ';

  @override
  String get ob5H5to7 => '5-7 گھنٹے';

  @override
  String get ob5H4to5 => '4-5 گھنٹے';

  @override
  String get ob5H3to4 => '3-4 گھنٹے';

  @override
  String get ob5H1to3 => '1-3 گھنٹے';

  @override
  String get ob5Under1 => '1 گھنٹے سے کم';

  @override
  String get ob6Title => 'آپ کا پیشہ کیا ہے؟';

  @override
  String get ob6Subtitle =>
      'ہم آپ کے کام کے انداز کے مطابق فوکس پلان بنائیں گے۔';

  @override
  String get ob6Software => 'سافٹ ویئر ڈیولپمنٹ';

  @override
  String get ob6Founder => 'سی ای او / بانی';

  @override
  String get ob6Remote => 'ریموٹ ورکر';

  @override
  String get ob6Finance => 'فنانس / آپریشنز / کنسلٹنگ';

  @override
  String get ob6Art => 'آرٹ / کانٹینٹ';

  @override
  String get ob6Education => 'تعلیم';

  @override
  String get ob6Others => 'دیگر';

  @override
  String get ob7Title => 'روزانہ اسکرین ٹائم کا ہدف مقرر کریں';

  @override
  String get ob7Subtitle =>
      'آپ اسے کبھی بھی بدل سکتے ہیں۔ حد کے قریب پہنچنے پر ہم آپ کو یاد دلائیں گے۔';

  @override
  String ob7Hours(String hours) {
    return '$hours گھنٹے';
  }

  @override
  String get ob7PerDay => 'روزانہ';

  @override
  String ob7HoursPerDay(String hours) {
    return 'روزانہ $hours';
  }

  @override
  String get ob7DialLabel => 'روزانہ اسکرین ٹائم کا ہدف';

  @override
  String get ob7InfoNote =>
      'ایک عام شخص روزانہ 4 گھنٹے سے زیادہ فون پر گزارتا ہے۔ ہدف مقرر کرنا اپنا وقت واپس لینے کا پہلا قدم ہے۔';

  @override
  String get ob8Title => 'ضروری اجازتیں فعال کریں';

  @override
  String get ob8Subtitle => 'Pausey کا مکمل تجربہ پانے کے لیے رسائی دیں۔';

  @override
  String get ob8UsageTitle => 'استعمال تک رسائی';

  @override
  String get ob8UsageSub =>
      'ایپس کے استعمال پر نظر رکھیں اور فوکس سیشن نافذ کریں۔';

  @override
  String get ob8NotifTitle => 'اطلاعات';

  @override
  String get ob8NotifSub => 'بروقت یاددہانیاں اور پیش رفت کی اطلاعات۔';

  @override
  String get ob8TrackTitle => 'ایپ کے استعمال کا ریکارڈ';

  @override
  String get ob8TrackSub => 'روزانہ اور ہفتہ وار تفصیل۔';

  @override
  String get ob9Title => 'آپ بالکل تیار ہیں!';

  @override
  String get ob9Subtitle => 'آپ کا فوکس ماحول تیار ہے۔';

  @override
  String get ob9Enter => 'Pausey میں داخل ہوں';

  @override
  String get ob9Replay => 'تعارف دوبارہ دیکھیں';

  @override
  String get ob9ScreenTime => 'اسکرین ٹائم';

  @override
  String get ob9AppsLocked => 'لاک ایپس';

  @override
  String get ob9Permissions => 'اجازتیں';

  @override
  String get ob9FocusMode => 'فوکس موڈ';

  @override
  String get ob9AllOk => 'سب ٹھیک';

  @override
  String get ob9On => 'آن';

  @override
  String get ob9Done => 'مکمل';

  @override
  String get ob9StreakTitle => 'پہلے دن کی اسٹریک ابھی شروع';

  @override
  String get ob9StreakSub => 'اسے جاری رکھنے کے لیے ایک سیشن مکمل کریں';

  @override
  String get appName => 'Pausey';

  @override
  String get tagline => 'اپنا وقت واپس لیں';

  @override
  String get versionLabel => 'ورژن 2.0 · ایپ اسٹور ایڈیشن';

  @override
  String get skip => 'چھوڑیں';

  @override
  String get continueLabel => 'جاری رکھیں';

  @override
  String get back => 'واپس';

  @override
  String get freeToStart => 'مفت شروع کریں · کریڈٹ کارڈ کی ضرورت نہیں';

  @override
  String get dataStaysOnDevice =>
      'آپ کا ڈیٹا کبھی آپ کے فون سے باہر نہیں جاتا۔';

  @override
  String get switchToLight => 'لائٹ موڈ پر جائیں';

  @override
  String get switchToDark => 'ڈارک موڈ پر جائیں';

  @override
  String get language => 'زبان';

  @override
  String get phoneLanguage => 'فون کی زبان';

  @override
  String get authTitle => 'اسکرول روکیں۔\nاپنے دن کے مالک بنیں۔';

  @override
  String get authSubtitle =>
      'اپنے اہداف اور اسٹریکس محفوظ رکھنے کے لیے اکاؤنٹ بنائیں، یا بطور مہمان آزمائیں۔';

  @override
  String get continueWithApple => 'Apple کے ساتھ جاری رکھیں';

  @override
  String get continueWithGoogle => 'Google کے ساتھ جاری رکھیں';

  @override
  String get signUpWithEmail => 'ای میل سے سائن اپ کریں';

  @override
  String get continueAsGuest => 'بطور مہمان جاری رکھیں';

  @override
  String get guestNote => 'مہمان کا ڈیٹا صرف اسی فون پر محفوظ ہوتا ہے۔';

  @override
  String get or => 'یا';

  @override
  String get haveAccount => 'پہلے سے اکاؤنٹ ہے؟';

  @override
  String get noAccount => 'Pausey پر نئے ہیں؟';

  @override
  String get logIn => 'لاگ اِن';

  @override
  String get signUp => 'سائن اپ';

  @override
  String get createAccount => 'اکاؤنٹ بنائیں';

  @override
  String get signUpTitle => 'اپنا اکاؤنٹ بنائیں';

  @override
  String get signUpSubtitle => 'اسکرین کی بہتر عادتیں بنانا شروع کریں۔';

  @override
  String get logInTitle => 'خوش آمدید';

  @override
  String get logInSubtitle => 'اپنی اسٹریک جاری رکھنے کے لیے لاگ اِن کریں۔';

  @override
  String get fullName => 'پورا نام';

  @override
  String get email => 'ای میل';

  @override
  String get password => 'پاس ورڈ';

  @override
  String get confirmPassword => 'پاس ورڈ کی تصدیق';

  @override
  String get showPassword => 'پاس ورڈ دکھائیں';

  @override
  String get hidePassword => 'پاس ورڈ چھپائیں';

  @override
  String get forgotPassword => 'پاس ورڈ بھول گئے؟';

  @override
  String get resetTitle => 'پاس ورڈ ری سیٹ کریں';

  @override
  String get resetSubtitle =>
      'اپنا ای میل لکھیں، ہم آپ کو ری سیٹ لنک بھیجیں گے۔';

  @override
  String get sendLink => 'لنک بھیجیں';

  @override
  String get resetSent => 'ری سیٹ لنک کے لیے اپنا ان باکس دیکھیں۔';

  @override
  String get agreeTerms => 'میں شرائط اور پرائیویسی پالیسی سے متفق ہوں';

  @override
  String get passwordStrength => 'پاس ورڈ کی مضبوطی';

  @override
  String get strengthWeak => 'کمزور';

  @override
  String get strengthOk => 'ٹھیک';

  @override
  String get strengthStrong => 'مضبوط';

  @override
  String get errNameRequired => 'اپنا نام لکھیں';

  @override
  String get errEmailInvalid => 'درست ای میل لکھیں';

  @override
  String get errPasswordShort => 'کم از کم 8 حروف استعمال کریں';

  @override
  String get errPasswordMismatch => 'پاس ورڈ مماثل نہیں';

  @override
  String get errTerms => 'جاری رکھنے کے لیے شرائط قبول کریں';

  @override
  String get authErr_not_configured =>
      'سائن اِن ابھی سیٹ نہیں ہوا۔ آپ بطور مہمان جاری رکھ سکتے ہیں۔';

  @override
  String get authErr_cancelled => 'سائن اِن منسوخ ہو گیا۔';

  @override
  String get authErr_invalid_email => 'یہ ای میل درست نہیں لگتا۔';

  @override
  String get authErr_wrong_password => 'ای میل یا پاس ورڈ غلط ہے۔';

  @override
  String get authErr_user_not_found =>
      'اس ای میل سے کوئی اکاؤنٹ نہیں۔ سائن اپ کریں؟';

  @override
  String get authErr_email_in_use =>
      'اس ای میل سے اکاؤنٹ پہلے سے موجود ہے۔ لاگ اِن کریں۔';

  @override
  String get authErr_weak_password => 'مضبوط پاس ورڈ چنیں۔';

  @override
  String get authErr_network => 'انٹرنیٹ کنکشن نہیں۔ دوبارہ کوشش کریں۔';

  @override
  String get authErr_too_many =>
      'بہت زیادہ کوششیں۔ ایک منٹ رک کر دوبارہ کوشش کریں۔';

  @override
  String get authErr_unknown => 'کچھ غلط ہو گیا۔ دوبارہ کوشش کریں۔';

  @override
  String homeHello(String name) {
    return 'سلام، $name';
  }

  @override
  String get homeHelloGuest => 'سلام';

  @override
  String get homeGuestBadge => 'مہمان موڈ · اسی فون پر محفوظ';

  @override
  String get homeSubtitle => 'آپ کا پلان تیار ہے۔ یہ رہے آپ کے انتخاب۔';

  @override
  String get homeDailyGoal => 'روزانہ ہدف';

  @override
  String get homeLockedApps => 'لاک ایپس';

  @override
  String get homeScreenTime => 'موجودہ اسکرین ٹائم';

  @override
  String get homeNotSet => 'سیٹ نہیں';

  @override
  String get homeCreateAccount => 'بیک اپ کے لیے اکاؤنٹ بنائیں';

  @override
  String get signOut => 'سائن آؤٹ';

  @override
  String get signOutGuestWarn =>
      'سائن آؤٹ کرنے سے اس فون پر مہمان کا ڈیٹا مٹ جائے گا۔';

  @override
  String get cancel => 'منسوخ';
}
