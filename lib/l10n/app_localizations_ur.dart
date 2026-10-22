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
  String get ob1ArtNote1 => 'کم اسکرولنگ';

  @override
  String get ob1ArtNote2 => 'زیادہ اپنا آپ';

  @override
  String get ob1BookFocus => 'توجہ';

  @override
  String get ob1BookBalance => 'توازن';

  @override
  String get ob1BookHappier => 'خوش تر آپ';

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
  String get ob3RingStreak => 'دن کا اسٹریک';

  @override
  String ob3RingSessions(int done, int total) {
    return '$total میں سے $done سیشن';
  }

  @override
  String get ob3RingTagline => 'فوکس سے بنتا ہے\nایک بہتر آپ';

  @override
  String get ob4ArtScore => 'اسکور';

  @override
  String get ob4ArtProductivity => 'پیداواری';

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
  String get ob7Title => 'آپ کا روزانہ اسکرین ہدف';

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
  String alSummary(int locked, int total) {
    return 'ابھی $locked محدود · $total زیرِ انتظام';
  }

  @override
  String alSummaryOff(int total) {
    return '$total زیرِ انتظام · بلاکنگ بند';
  }

  @override
  String get alFromInstalled => 'انسٹال شدہ ایپس سے چنیں';

  @override
  String get alFromInstalledSub => 'اس فون کی کوئی بھی ایپ چنیں';

  @override
  String get alPermTitle => 'بلاکنگ ابھی فعال نہیں';

  @override
  String get alPermMsg =>
      'آپ کے اصول محفوظ ہیں، مگر یہ دو اجازتیں دیے بغیر Pausey ایپس بلاک نہیں کر سکتا:';

  @override
  String get alPermUsage => 'استعمال تک رسائی';

  @override
  String get alPermUsageSub => 'کون سی ایپ کھلی ہے اور آج کا وقت دیکھنے کے لیے';

  @override
  String get alPermOverlay => 'دوسری ایپس کے اوپر دکھائیں';

  @override
  String get alPermOverlaySub => 'بلاک ایپ پر لاک اسکرین دکھانے کے لیے';

  @override
  String get alAllow => 'اجازت دیں';

  @override
  String get alAllowed => 'اجازت ہے';

  @override
  String get alPermReturn =>
      'اجازت دینے کے بعد Pausey پر واپس آئیں — یہ خود دوبارہ چیک کرے گا۔';

  @override
  String get alAndroidOnly =>
      'بلاکنگ صرف اینڈرائیڈ پر کام کرتی ہے۔ اصول یہاں بھی بنا سکتے ہیں۔';

  @override
  String get alSearchHint => 'ایپس تلاش کریں';

  @override
  String get alFilterAll => 'سب';

  @override
  String get alFilterLocked => 'ابھی لاک';

  @override
  String get alFilterScheduled => 'شیڈول';

  @override
  String get alFilterAvailable => 'دستیاب';

  @override
  String get alStateLocked => 'لاک';

  @override
  String get alStateWillLock => 'لاک ہوگی';

  @override
  String get alStateScheduled => 'شیڈول';

  @override
  String get alStateAvailable => 'دستیاب';

  @override
  String alUsedOf(String used, String limit) {
    return '$limit میں سے $used استعمال';
  }

  @override
  String alUsedToday(String used) {
    return 'آج $used استعمال';
  }

  @override
  String get alNoLimit => 'روزانہ حد نہیں';

  @override
  String alLimitNoUsage(String limit) {
    return '$limit روزانہ حد · استعمال معلوم نہیں';
  }

  @override
  String get alRulesOff => 'پابندیاں بند';

  @override
  String alNextLock(String time) {
    return 'اگلا لاک: $time';
  }

  @override
  String alUnlockedUntil(String time) {
    return '$time تک اَن لاک';
  }

  @override
  String get alReasonLimit => 'روزانہ حد پوری';

  @override
  String get alReasonSchedule => 'لاک شیڈول جاری';

  @override
  String get alReasonGeneral => 'عام شیڈول جاری';

  @override
  String get alReasonAllDay => 'سارا دن لاک';

  @override
  String get alReasonFocus => 'فوکس سیشن جاری';

  @override
  String get alNoMatches => 'کوئی ایپ نہیں ملی';

  @override
  String get alGeneral => 'عمومی';

  @override
  String get alGeneralScheduleSub => 'جن ایپس میں “عام شیڈول پر چلیں” آن ہے';

  @override
  String get alLockAllSub => 'ہر ایپ پر پابندی آن کریں';

  @override
  String get alSaved => 'محفوظ';

  @override
  String get alChangesApply => 'تبدیلیاں فوراً لاگو ہوتی ہیں';

  @override
  String get alDetailsTitle => 'ایپ کی حدیں';

  @override
  String get alBlockingOff => 'اس فون پر بلاکنگ بند ہے';

  @override
  String get alRestrictApp => 'اس ایپ کو محدود کریں';

  @override
  String get alMasterOff => 'بند — Pausey اس ایپ کو محدود نہیں کرے گا';

  @override
  String get alMasterOnRules => 'نیچے دی گئی حد اور شیڈول لاگو ہیں';

  @override
  String get alMasterOnAllDay => 'ابھی حد یا شیڈول نہیں — سارا دن لاک';

  @override
  String get alMasterOnGeneral => 'عام شیڈول کے دوران لاک';

  @override
  String get alFollowGeneral => 'عام شیڈول پر چلیں';

  @override
  String alFollowGeneralSub(String start, String end) {
    return '$start – $end بھی لاک کریں';
  }

  @override
  String get alGeneralOff => 'عام شیڈول بند ہے';

  @override
  String get alDailyLimit => 'روزانہ حد';

  @override
  String get alDailyLimitOffSub => 'ہر دن طے شدہ وقت کے بعد ایپ لاک کریں';

  @override
  String get alCustom => 'اپنی مرضی';

  @override
  String get alUsedLabel => 'آج استعمال';

  @override
  String get alLeftLabel => 'باقی';

  @override
  String get alLimitReached => 'آج کی حد پوری ہو گئی';

  @override
  String get alResets => 'آدھی رات کو ری سیٹ (فون کا وقت)';

  @override
  String get alUsageUnavailable => 'استعمال معلوم نہیں';

  @override
  String get alUsageNeedsAccess =>
      'Usage access کی اجازت دیں تاکہ Pausey آج کا وقت گن سکے۔';

  @override
  String get alUsageAndroidOnly =>
      'استعمال صرف اینڈرائیڈ پر ناپا جاتا ہے۔ حد محفوظ رہتی ہے اور وہاں لاگو ہوتی ہے۔';

  @override
  String get alGrantUsage => 'استعمال تک رسائی دیں';

  @override
  String get alCustomLimitTitle => 'اپنی روزانہ حد';

  @override
  String get alHours => 'گھنٹے';

  @override
  String get alMinutes => 'منٹ';

  @override
  String get alErrZeroLimit => 'صفر سے زیادہ وقت چنیں';

  @override
  String get alSave => 'محفوظ کریں';

  @override
  String get alScheduledLocking => 'شیڈول لاکنگ';

  @override
  String get alScheduledOffSub => 'طے شدہ اوقات میں یہ ایپ لاک کریں';

  @override
  String get alNoSchedules => 'ابھی کوئی شیڈول نہیں';

  @override
  String get alAddSchedule => 'شیڈول شامل کریں';

  @override
  String get alActiveNow => 'ابھی جاری';

  @override
  String get alScheduleDefault => 'لاک کا وقت';

  @override
  String get alEndsNextDay => 'اگلے دن ختم';

  @override
  String get alEdit => 'ترمیم';

  @override
  String get alDelete => 'حذف کریں';

  @override
  String get alDeleteScheduleQ => 'یہ شیڈول حذف کریں؟';

  @override
  String alDeleteScheduleMsg(String title) {
    return '“$title” اب اس ایپ کو لاک نہیں کرے گا۔';
  }

  @override
  String get alNewSchedule => 'نیا شیڈول';

  @override
  String get alEditSchedule => 'شیڈول میں ترمیم';

  @override
  String get alTitleOptional => 'عنوان (اختیاری)';

  @override
  String get alPresetStudy => 'پڑھائی';

  @override
  String get alPresetEvening => 'شام';

  @override
  String get alPresetSleep => 'نیند';

  @override
  String get alRepeatOn => 'ان دنوں دہرائیں';

  @override
  String get alErrSameTime => 'شروع اور اختتام ایک نہیں ہو سکتے';

  @override
  String get alErrNoDays => 'کم از کم ایک دن چنیں';

  @override
  String alTempUnlock(int minutes) {
    return '$minutes منٹ کے لیے اَن لاک';
  }

  @override
  String alTempUnlockSub(int n) {
    return '1 ایمرجنسی اوور رائیڈ استعمال · آج $n باقی';
  }

  @override
  String get alTempUnlockFocus => 'فوکس سیشن کے دوران اَن لاک نہیں ہو سکتا';

  @override
  String get alTempUnlockNotLocked => 'صرف ایپ لاک ہونے پر ضرورت ہوتی ہے';

  @override
  String alTempUnlockQ(String app, int minutes) {
    return '$app کو $minutes منٹ کے لیے اَن لاک کریں؟';
  }

  @override
  String get alUnlock => 'اَن لاک';

  @override
  String get alEndEarly => 'پہلے ختم کریں';

  @override
  String get alResetRules => 'پابندیاں ری سیٹ کریں';

  @override
  String get alResetRulesSub => 'اس ایپ کی حد اور شیڈول ہٹائیں';

  @override
  String alResetQ(String app) {
    return '$app کی پابندیاں ری سیٹ کریں؟';
  }

  @override
  String get alResetMsg =>
      'اس کی روزانہ حد اور تمام شیڈول ہٹ جائیں گے۔ ایپ فہرست میں رہے گی۔';

  @override
  String get alReset => 'ری سیٹ';

  @override
  String get alResetDone => 'پابندیاں ری سیٹ ہو گئیں';

  @override
  String get alRemoveApp => 'ایپ ہٹائیں';

  @override
  String get alRemoveAppSub => 'اس ایپ کا انتظام بند کریں';

  @override
  String alRemoveQ(String app) {
    return '$app ہٹائیں؟';
  }

  @override
  String get alRemoveMsg =>
      'Pausey اسے محدود کرنا بند کر دے گا اور اس کی حد اور شیڈول بھول جائے گا۔';

  @override
  String get alRemove => 'ہٹائیں';

  @override
  String get alNoPackage =>
      'ہر ایپ کی حد اور شیڈول کے لیے کوئی ایک انسٹال شدہ ایپ چاہیے۔ اینڈرائیڈ پر “انسٹال شدہ ایپس سے چنیں” سے شامل کریں۔';

  @override
  String get alNotFound => 'اس ایپ کا اب انتظام نہیں';

  @override
  String get alPickerTitle => 'انسٹال شدہ ایپس';

  @override
  String get alPickerAdded => 'پہلے سے شامل';

  @override
  String alPickerAdd(int n) {
    return 'ایپس شامل کریں ($n)';
  }

  @override
  String get alPickerEmpty => 'کوئی ایپ نہیں ملی';

  @override
  String get blockTitle => 'ایپ لاک';

  @override
  String get blockAddApp => 'ایپ شامل کریں';

  @override
  String get blockFaceIdTitle => 'فیس آئی ڈی تحفظ';

  @override
  String get blockFaceIdSub => 'کسی بھی ایپ کو کھولنے کے لیے فیس آئی ڈی';

  @override
  String get blockFaceIdUnavailable => 'اس ڈیوائس پر بایومیٹرک دستیاب نہیں';

  @override
  String get blockFaceIdReason => 'تحفظ آن کرنے کے لیے تصدیق کریں';

  @override
  String get blockFaceIdFailed => 'تصدیق نہیں ہو سکی — تحفظ بند ہے';

  @override
  String get blockScheduleTitle => 'شیڈول لاک';

  @override
  String get blockStart => 'شروع';

  @override
  String get blockEnd => 'اختتام';

  @override
  String get blockNeedOneDay => 'کم از کم ایک دن منتخب رکھیں';

  @override
  String get blockManagedApps => 'منظم ایپس';

  @override
  String get blockLockAll => 'سب لاک کریں';

  @override
  String get blockAllLocked => 'تمام ایپس لاک ہیں';

  @override
  String blockRemoved(String app) {
    return '$app ہٹا دی گئی';
  }

  @override
  String get blockAppsUpdated => 'ایپس اپ ڈیٹ ہو گئیں';

  @override
  String get blockCatSocial => 'سوشل';

  @override
  String get blockCatVideo => 'ویڈیو';

  @override
  String get blockCatGames => 'گیمز';

  @override
  String get blockCatShopping => 'شاپنگ';

  @override
  String get blockCatCommunity => 'کمیونٹی';

  @override
  String get blockCatOther => 'دیگر';

  @override
  String get blockEmptyBadge => 'کچھ بلاک نہیں';

  @override
  String get blockEmptyTitle => 'ابھی کوئی ایپ شامل نہیں';

  @override
  String get blockEmptyMsg =>
      'وہ ایپس شامل کریں جو سب سے زیادہ توجہ ہٹاتی ہیں، Pausey انہیں لاک کر دے گا۔';

  @override
  String get blockEmergencyTitle => 'ایمرجنسی اوور رائیڈ';

  @override
  String blockEmergencySub(int n) {
    return 'تمام ایپس عارضی طور پر کھولیں · آج $n باقی';
  }

  @override
  String get blockEmergencyOff => 'سیٹنگز میں بند ہے';

  @override
  String get blockEmergencyUse => 'استعمال';

  @override
  String get blockEmergencyConfirmTitle => 'ایمرجنسی اوور رائیڈ استعمال کریں؟';

  @override
  String blockEmergencyConfirmMsg(int n) {
    return 'یہ آج کے باقی $n میں سے ایک استعمال کرے گا۔ صرف ضرورت پر استعمال کریں۔';
  }

  @override
  String get blockEmergencyUsed =>
      'اوور رائیڈ استعمال ہو گیا — ایپس ابھی کھلی ہیں';

  @override
  String get blockEmergencyNone => 'آج کوئی اوور رائیڈ باقی نہیں';

  @override
  String get blkTabLocked => 'لاک ایپس';

  @override
  String get blkToday => 'آج';

  @override
  String get blkUnblocks => 'ان بلاک';

  @override
  String get blkScreenTime => 'اسکرین ٹائم';

  @override
  String get blkOpens => 'کھولی گئی';

  @override
  String get blkBlock => 'بلاک کریں';

  @override
  String get blkUnblock => 'ان بلاک کریں';

  @override
  String get blkBlocked => 'بلاک ہے';

  @override
  String get blkNotBlocked => 'بلاک نہیں';

  @override
  String get blkNoLocked => 'ابھی کوئی ایپ لاک نہیں';

  @override
  String get blkNoScheduled => 'ابھی کوئی ایپ شیڈول نہیں';

  @override
  String blkBlockedSnack(String app) {
    return '$app بلاک ہو گئی';
  }

  @override
  String blkUnblockedSnack(String app) {
    return '$app ان بلاک ہو گئی';
  }

  @override
  String get cvNoAccount => 'اکاؤنٹ نہیں ہے؟';

  @override
  String get cvYourName => 'آپ کا نام';

  @override
  String get cvAppsLoadFailed => 'اس فون کی ایپس نہیں پڑھی جا سکیں۔';

  @override
  String get cvTryAgain => 'دوبارہ کوشش کریں';

  @override
  String get cvGetStarted => 'شروع کریں';

  @override
  String get cvHaveAccount => 'میرا پہلے سے اکاؤنٹ ہے';

  @override
  String get cvWelcomeTitle => 'آپ کا وقت، آپ کا اپنا۔';

  @override
  String get cvWelcomeBody => 'آئیں، اہم چیزوں کے لیے زیادہ وقت نکالیں۔';

  @override
  String get cvNext => 'اگلا';

  @override
  String get cvSkipForNow => 'ابھی چھوڑیں';

  @override
  String get cvRelateTitle => 'وقت کا پتا نہیں چلتا؟';

  @override
  String get cvRelateSub => 'سچ بتائیں، کوئی جواب غلط نہیں۔';

  @override
  String get cvRelateOften => 'ہر وقت';

  @override
  String get cvRelateSometimes => 'کبھی کبھی';

  @override
  String get cvRelateRarely => 'کم ہی';

  @override
  String get cvRelateReplyOften =>
      'آپ اکیلے نہیں ہیں۔ فون بنائے ہی اس طرح جاتے ہیں کہ ہم ان میں لگے رہیں۔';

  @override
  String get cvRelateReplySometimes =>
      'یہ ہم میں سے اکثر کے ساتھ ہوتا ہے، عموماً پتا بھی نہیں چلتا۔';

  @override
  String get cvRelateReplyRarely => 'بہت خوب۔ آئیں اسے ایسے ہی رکھیں۔';

  @override
  String get cvRelateCta => 'یہ تو میں ہوں';

  @override
  String get cvGoalTitle => 'کس چیز کے لیے مزید وقت؟';

  @override
  String get cvGoalSub => 'ابھی آپ کے لیے جو سب سے اہم ہے، وہ چنیں۔';

  @override
  String get cvGoalFocus => 'بہتر توجہ';

  @override
  String get cvGoalSleep => 'بہتر نیند';

  @override
  String get cvGoalScrolling => 'کم اسکرولنگ';

  @override
  String get cvGoalMe => 'اپنے لیے زیادہ وقت';

  @override
  String get cvGoalHabits => 'صحت مند روزمرہ عادتیں';

  @override
  String get cvGoalOther => 'کچھ اور';

  @override
  String get cvGoalOtherHint => 'آپ کس چیز کے لیے زیادہ وقت چاہتے ہیں؟';

  @override
  String get cvGoalReplyFocus => 'توجہ ہی سہی۔ ہم آپ کا فوکس بچائیں گے۔';

  @override
  String get cvGoalReplySleep => 'اچھی نیند پرسکون شاموں سے شروع ہوتی ہے۔';

  @override
  String get cvGoalReplyScrolling =>
      'آئیں اسکرولنگ کو عادت نہیں، اپنی مرضی بنائیں۔';

  @override
  String get cvGoalReplyMe => 'اپنے لیے وقت اہم ہے۔ آئیں کچھ نکالیں۔';

  @override
  String get cvGoalReplyHabits =>
      'چھوٹے قدم مل کر بڑا فرق لاتے ہیں۔ ہم انہیں آسان رکھیں گے۔';

  @override
  String get cvGoalReplyOther =>
      'سمجھ گئے۔ ہم سب کچھ اسی کے مطابق ترتیب دیں گے۔';

  @override
  String get cvAppsTitle => 'کون سی ایپس توجہ بٹاتی ہیں؟';

  @override
  String get cvAppsSubReal =>
      'اس فون پر آپ کی سب سے زیادہ استعمال ہونے والی ایپس۔ یہ سب روکی جائیں گی؛ کسی کو آزاد رکھنے کے لیے ✕ دبائیں۔';

  @override
  String get cvAppsSubPopular =>
      'اس فون پر آپ کی سب سے زیادہ استعمال ہونے والی ایپس۔ یہ سب روکی جائیں گی؛ کسی کو آزاد رکھنے کے لیے ✕ دبائیں۔';

  @override
  String get cvAppsSearch => 'ایپس تلاش کریں';

  @override
  String cvAppsReply(String apps) {
    return 'نوٹ کر لیا: $apps۔ ہم انہی سے شروع کریں گے۔';
  }

  @override
  String cvAnd(String a, String b) {
    return '$a اور $b';
  }

  @override
  String cvAndMore(String a, String b, int count) {
    return '$a، $b اور $count مزید';
  }

  @override
  String get cvStTitle => 'آپ کا روزانہ اسکرین ٹائم';

  @override
  String get cvStSub => 'اندازہ کافی ہے۔ یہ معلومات آپ کے فون پر ہی رہتی ہے۔';

  @override
  String cvStMeasured(String time) {
    return 'آج اب تک اس فون پر ناپا گیا وقت: $time';
  }

  @override
  String get cvStUnder2 => '2 گھنٹے سے کم';

  @override
  String get cvSt2to4 => '2 سے 4 گھنٹے';

  @override
  String get cvSt4to6 => '4 سے 6 گھنٹے';

  @override
  String get cvStOver6 => '6 گھنٹے سے زیادہ';

  @override
  String get cvStNotSure => 'یقین نہیں';

  @override
  String get cvStReplyUnder2 =>
      'یہ اچھا توازن ہے۔ ہم اسے برقرار رکھنے میں مدد کریں گے۔';

  @override
  String get cvStReply2to4 => 'چند چھوٹی تبدیلیاں واقعی وقت بچا سکتی ہیں۔';

  @override
  String get cvStReply4to6 => 'یہ کافی ہے۔ آئیں کچھ وقت واپس لیں۔';

  @override
  String get cvStReplyOver6 =>
      'یہ دن کا بڑا حصہ ہے، اس لیے ہم چھوٹے قدم سے شروع کریں گے۔';

  @override
  String get cvStReplyNotSure => 'کوئی بات نہیں۔ Pausey اسے ناپ سکتا ہے۔';

  @override
  String get cvPhraseFocus => 'زیادہ توجہ';

  @override
  String get cvPhraseSleep => 'بہتر نیند';

  @override
  String get cvPhraseScrolling => 'کم اسکرولنگ';

  @override
  String get cvPhraseMe => 'اپنے لیے زیادہ وقت';

  @override
  String get cvPhraseHabits => 'صحت مند عادتیں';

  @override
  String get cvPhraseOther => 'اہم چیزوں کے لیے زیادہ وقت';

  @override
  String cvPhraseOtherNamed(String thing) {
    return '$thing کے لیے زیادہ وقت';
  }

  @override
  String cvReflectApps(String goal, String apps) {
    return 'آپ کو $goal چاہیے، لیکن آپ بار بار $apps میں کھو جاتے ہیں۔';
  }

  @override
  String cvReflectNoApps(String goal) {
    return 'آپ کو $goal چاہیے، اور کبھی کبھی فون راستے میں آ جاتا ہے۔';
  }

  @override
  String cvReflectEstimate(String time) {
    return 'روزانہ تقریباً $time (آپ کا اندازہ)';
  }

  @override
  String cvReflectMeasured(String time) {
    return 'آج اب تک $time (ناپا گیا)';
  }

  @override
  String get cvReflectHelp =>
      'Pausey آپ کو ایسا معمول بنانے میں مدد کر سکتا ہے جو آپ کی توجہ کو تھوڑا سکون دے۔';

  @override
  String get cvShowMeHow => 'طریقہ دکھائیں';

  @override
  String get cvHowTitle => 'Pausey ایسے مدد کرتا ہے';

  @override
  String get cvHowPauseTab => 'وقفہ';

  @override
  String get cvHowLimitTab => 'حدیں';

  @override
  String get cvHowFocusTab => 'فوکس';

  @override
  String get cvHowPauseTitle => 'پرسکون وقفہ، سزا نہیں';

  @override
  String get cvHowPauseBody =>
      'جب کسی ایپ کا وقت پورا ہو جائے تو Pausey اس پر ایک پرسکون وقفہ اسکرین دکھاتا ہے، اور باہر نکلنے کا راستہ بھی۔';

  @override
  String get cvHowLimitTitle => 'ہر ایپ کے لیے روزانہ کا وقت';

  @override
  String get cvHowLimitBody =>
      'ہر ایپ کو اس کا اپنا روزانہ وقت اور لاک اوقات دیں۔ ایک کو بدلنے سے دوسری نہیں بدلتی۔';

  @override
  String get cvHowFocusTitle => 'فوکس سیشن';

  @override
  String get cvHowFocusBody =>
      'کام، پڑھائی یا آرام کے لیے ٹائمر شروع کریں۔ آپ کی منتخب ایپس اس کے ختم ہونے تک رکی رہیں گی۔';

  @override
  String get cvPreview => 'پیش منظر';

  @override
  String get cvYourApp => 'آپ کی ایپ';

  @override
  String get cvAnotherApp => 'دوسری ایپ';

  @override
  String cvMinOf(int used, int limit) {
    return '$used / $limit منٹ';
  }

  @override
  String get cvBuildPlan => 'میرا پلان بنائیں';

  @override
  String get cvPlanTitle => 'شروعات کے لیے ایک آسان راستہ';

  @override
  String get cvPlanSub => 'آپ کے جوابات کی بنیاد پر تجویز۔ جو چاہیں بدل لیں۔';

  @override
  String get cvPlanFocus => 'فوکس سیشن';

  @override
  String cvPlanFocusSub(String time) {
    return 'ہر سیشن $time';
  }

  @override
  String get cvPlanDaily => 'روزانہ فوکس کا ہدف';

  @override
  String cvPlanDailySub(String time) {
    return 'روزانہ $time فوکس';
  }

  @override
  String get cvPlanLimit => 'روزانہ ایپ کی حد';

  @override
  String cvPlanLimitSub(String app, String time) {
    return '$app: روزانہ $time';
  }

  @override
  String get cvPlanLimitNoPkg =>
      'یہ ایپ فون کی فہرست میں نہیں ہے، اس لیے حد بعد میں ایپ لاک میں لگائی جا سکتی ہے۔';

  @override
  String get cvPlanWind => 'شام کا سکون';

  @override
  String cvPlanWindSub(String start, String end) {
    return 'آپ کی منتخب ایپس $start سے $end تک رکی رہیں گی';
  }

  @override
  String get cvPlanOff => 'بند';

  @override
  String get cvStarts => 'شروع';

  @override
  String get cvEnds => 'ختم';

  @override
  String get cvPlanNote =>
      'ابھی کچھ بھی آن نہیں ہوا۔ یہ سیٹ اپ مکمل ہونے پر ہی شروع ہوگا، اور آپ اسے کبھی بھی بدل سکتے ہیں۔';

  @override
  String get cvUsePlan => 'یہ پلان اپنائیں';

  @override
  String get cvPermTitle => 'اس کے لیے چند اجازتیں درکار ہیں';

  @override
  String get cvPermSub =>
      'ان سے Pausey اپنا کام اچھی طرح کر پاتا ہے اور آپ کو بہترین تجربہ ملتا ہے۔';

  @override
  String get cvPermUnsupported =>
      'ایپ کی حدیں اور وقفہ اسکرینز Android فونز پر کام کرتی ہیں۔ باقی سب کچھ یہاں بھی چلتا ہے۔';

  @override
  String get cvPermUsageTitle => 'استعمال تک رسائی';

  @override
  String get cvPermUsageWhy =>
      'اس سے Pausey دیکھ سکتا ہے کہ آج ہر ایپ کتنی دیر کھلی رہی اور اسکرین پر کون سی ایپ ہے۔';

  @override
  String get cvPermUsageWithout =>
      'اس کے بغیر Pausey اسکرین ٹائم نہیں ناپ سکتا اور نہ ہی جان سکتا ہے کہ حد کب پوری ہوئی۔';

  @override
  String get cvPermOverlayTitle => 'دوسری ایپس کے اوپر دکھائیں';

  @override
  String get cvPermOverlayWhy =>
      'اس سے Pausey وقت پورا ہونے پر ایپ کے اوپر اپنی وقفہ اسکرین دکھا سکتا ہے۔';

  @override
  String get cvPermOverlayWithout =>
      'اس کے بغیر ایپس روکی نہیں جا سکتیں۔ آپ کا پلان بعد کے لیے محفوظ رہے گا۔';

  @override
  String get cvPermBatteryTitle => 'Pausey کو چلتا رکھیں';

  @override
  String get cvPermBatteryWhy =>
      'کچھ فون بیٹری بچانے کے لیے بیک گراؤنڈ ایپس بند کر دیتے ہیں۔ Pausey کو اجازت دینے سے آپ کی حدیں کام کرتی رہیں گی۔';

  @override
  String get cvPermBatteryWithout =>
      'اس کے بغیر حدیں تب تک رک سکتی ہیں جب تک آپ Pausey دوبارہ نہ کھولیں۔';

  @override
  String get cvPermLater =>
      'آپ اسے بعد میں Android کی سیٹنگز میں بدل سکتے ہیں۔';

  @override
  String get cvPermPrivacy =>
      'Pausey صرف ایپس کے نام اور اوقات پڑھتا ہے۔ کچھ بھی آپ کے فون سے باہر نہیں جاتا۔';

  @override
  String get cvAllowInSettings => 'سیٹنگز میں اجازت دیں';

  @override
  String get cvAllowed => 'اجازت دی گئی';

  @override
  String get cvOptional => 'اختیاری';

  @override
  String get cvContinueAnyway => 'فی الحال جاری رکھیں';

  @override
  String get cvAccountTitle => 'اپنی پیش رفت محفوظ رکھیں';

  @override
  String get cvAccountSub => 'Pausey بطور مہمان استعمال کریں، یا سائن ان کریں۔';

  @override
  String get cvNameLabel => 'آپ کا نام (اختیاری)';

  @override
  String get cvNameHint => 'ہم آپ کو کس نام سے پکاریں؟';

  @override
  String get cvContinueGuest => 'بطور مہمان جاری رکھیں';

  @override
  String get cvAccountNote =>
      'سائن ان کرنے سے ابھی آپ کا ڈیٹا بیک اپ نہیں ہوتا۔ دونوں صورتوں میں آپ کی سیٹنگز اسی فون پر رہتی ہیں۔';

  @override
  String get cvReadyTitle => 'آپ کا پہلا قدم یہیں سے شروع ہوتا ہے۔';

  @override
  String cvReadyTitleNamed(String name) {
    return '$name، آپ کا پہلا قدم یہیں سے شروع ہوتا ہے۔';
  }

  @override
  String get cvReadyFocus => 'آئیں توجہ کے لیے تھوڑی اور جگہ بنائیں۔';

  @override
  String get cvReadySleep => 'آئیں آپ کی شامیں تھوڑی پرسکون بنائیں۔';

  @override
  String get cvReadyScrolling =>
      'آئیں اسکرولنگ کو آپ کے دن کا تھوڑا کم حصہ دیں۔';

  @override
  String get cvReadyMe => 'آئیں آپ کے لیے تھوڑا اور وقت نکالیں۔';

  @override
  String get cvReadyHabits => 'آئیں ایسی عادتیں بنائیں جو اچھی لگیں۔';

  @override
  String get cvReadyOther =>
      'آئیں آپ کے لیے اہم چیزوں کے لیے زیادہ جگہ بنائیں۔';

  @override
  String get cvYourPlan => 'آپ کا پلان';

  @override
  String cvSumGoal(String goal) {
    return 'مقصد: $goal';
  }

  @override
  String cvSumApps(String apps) {
    return 'ایپس: $apps';
  }

  @override
  String cvSumFocus(String session, String daily) {
    return '$session کے فوکس سیشن، روزانہ $daily';
  }

  @override
  String get cvReadyNeedsPerm =>
      'ایپ کی حدیں محفوظ ہیں، لیکن دونوں اجازتیں ملنے تک کام نہیں کریں گی۔';

  @override
  String get cvReadyChange => 'آپ یہ سب بعد میں بدل سکتے ہیں۔';

  @override
  String get cvStartFirstFocus => 'میرا پہلا فوکس سیشن شروع کریں';

  @override
  String get cvFinishLimits => 'ایپ کی حدیں سیٹ کرنا مکمل کریں';

  @override
  String get cvJourneyTitle => 'اپنا Pausey سفر شروع کریں';

  @override
  String get cvJourneySub =>
      'اپنی پیش رفت محفوظ رکھنے کے لیے اکاؤنٹ بنائیں، یا بطور مہمان جاری رکھیں۔';

  @override
  String get cvUsageNone => 'آج استعمال نہیں ہوئی';

  @override
  String get cvUsageUnder1 => 'آج 1 منٹ سے کم';

  @override
  String cvUsageToday(String time) {
    return 'آج $time';
  }

  @override
  String cvAppsSelected(int count) {
    return '$count ایپس منتخب';
  }

  @override
  String get cvAppsUsageNeeded =>
      'اسکرین ٹائم کی اجازت دیں تاکہ Pausey آپ کی سب سے زیادہ استعمال ہونے والی ایپس دکھا سکے۔';

  @override
  String cvRemoveApp(String app) {
    return '$app ہٹائیں';
  }

  @override
  String get cvNotifAskTitle => 'وقت ختم ہونے سے پہلے یاد دہانی چاہیے؟';

  @override
  String get cvNotNow => 'ابھی نہیں';

  @override
  String get cvA11yTitle => 'بس ایک آخری بات';

  @override
  String get cvA11ySub =>
      'ایکسیسبلٹی آن کریں تاکہ Pausey دیکھ سکے کون سی ایپ کھلی ہے اور کتنی دیر۔ پھر یہ آپ کی ایپس کو بلاک، ان بلاک اور شیڈول کر سکے گا۔';

  @override
  String get cvA11yReads => 'Pausey صرف یہ پڑھتا ہے:';

  @override
  String get cvA11yRead1 => 'ایپس کے نام';

  @override
  String get cvA11yRead2 => 'ہر ایپ میں گزارا گیا وقت';

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
  String get logInTitle => 'اپنے اکاؤنٹ میں لاگ اِن کریں';

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

  @override
  String get ob6OtherHint => 'اپنا پیشہ لکھیں';

  @override
  String get timeSecondLabel => 'سیکنڈ';

  @override
  String get focusModePomodoro => 'پومودورو';

  @override
  String get focusModeDeep => 'گہری توجہ';

  @override
  String get focusModeCustom => 'اپنی مرضی';

  @override
  String get focusRemaining => 'باقی';

  @override
  String get focusBreakLabel => 'وقفہ';

  @override
  String get focusReadyLabel => 'تیار';

  @override
  String get focusInSession => 'سیشن جاری';

  @override
  String get focusPausedState => 'رکا ہوا';

  @override
  String get focusOnBreak => 'وقفے پر';

  @override
  String get focusIdleState => 'شروع کرنے کے لیے پلے دبائیں';

  @override
  String get focusSessionsDone => 'مکمل سیشن';

  @override
  String get focusProgress => 'پیش رفت';

  @override
  String get focusBreakAfter => 'بعد میں وقفہ';

  @override
  String get focusFocusedToday => 'آج کی توجہ';

  @override
  String focusAppsBlocked(int count) {
    return '$count ایپس بلاک';
  }

  @override
  String get focusAppsBlockedSub =>
      'اس سیشن کے لیے توجہ ہٹانے والی چیزیں بند ہیں۔';

  @override
  String get focusNoApps => 'کوئی ایپ بلاک نہیں';

  @override
  String get focusNoAppsSub => 'توجہ کے دوران بند کرنے کے لیے ایپس چنیں۔';

  @override
  String get focusEdit => 'ترمیم';

  @override
  String get focusAdd => 'شامل کریں';

  @override
  String get focusAmbient => 'پس منظر کی آواز';

  @override
  String get focusSoundOff => 'بند';

  @override
  String get focusSoundRain => 'بارش';

  @override
  String get focusSoundForest => 'جنگل';

  @override
  String get focusSoundWaves => 'سمندری لہریں';

  @override
  String get focusSoundWhite => 'وائٹ نوائز';

  @override
  String get focusVolume => 'آواز';

  @override
  String get focusStart => 'شروع';

  @override
  String get focusPause => 'روکیں';

  @override
  String get focusResume => 'جاری رکھیں';

  @override
  String get focusStop => 'ختم کریں';

  @override
  String get focusRestart => 'دوبارہ شروع';

  @override
  String get focusSkipBreak => 'وقفہ چھوڑیں';

  @override
  String get focusDurations => 'سیشن کا دورانیہ';

  @override
  String focusMinutesN(int n) {
    return '$n منٹ';
  }

  @override
  String get focusBreakLength => 'وقفہ';

  @override
  String get focusCustomTitle => 'اپنی مرضی کا دورانیہ';

  @override
  String get focusSet => 'سیٹ کریں';

  @override
  String get focusStopTitle => 'سیشن جلد ختم کریں؟';

  @override
  String get focusStopBody => 'اب تک کا وقت محفوظ ہو جائے گا۔';

  @override
  String get focusEndSession => 'سیشن ختم';

  @override
  String get focusKeepGoing => 'جاری رکھیں';

  @override
  String get focusTooShort => 'ایک منٹ سے کم — محفوظ نہیں ہوا۔';

  @override
  String get focusBreakOver => 'وقفہ ختم — اگلے کے لیے تیار؟';

  @override
  String get focusBusy => 'موڈ بدلنے کے لیے موجودہ سیشن ختم کریں۔';

  @override
  String get focusFirstHint => 'آپ کا پہلا سیشن یہیں سے — پلے دبائیں۔';

  @override
  String get focusCompleteA => 'سیشن';

  @override
  String get focusCompleteB => 'مکمل!';

  @override
  String get focusEndedTitle => 'سیشن ختم';

  @override
  String focusCompleteMsg(String mode) {
    return 'زبردست! آپ نے اپنا $mode سیشن بغیر کسی خلل کے مکمل کیا۔';
  }

  @override
  String get focusEndedMsg => 'ہر منٹ اہم ہے۔ اگلی بار پورا سیشن آزمائیں۔';

  @override
  String get focusDurationLabel => 'توجہ کا دورانیہ';

  @override
  String get focusMinUnit => 'منٹ';

  @override
  String get focusDayStreak => 'دن کا سلسلہ';

  @override
  String get focusAppsLabel => 'بلاک ایپس';

  @override
  String get focusTodayGoal => 'آج کا ہدف';

  @override
  String focusPctCompleted(int pct) {
    return '$pct% مکمل';
  }

  @override
  String focusPlusPct(int pct) {
    return '+$pct% اس سیشن سے';
  }

  @override
  String get focusMomentum => 'رفتار برقرار رکھیں!';

  @override
  String get focusQuote1 =>
      'مستقل مزاجی شدت سے بہتر ہے۔ ہر سیشن مہارت میں اضافہ کرتا ہے۔';

  @override
  String get focusQuote2 => 'چھوٹے مرکوز وقفے بڑے نتائج دیتے ہیں۔';

  @override
  String get focusQuote3 => 'آپ نے اسکرول نہیں کیا — کچھ بنایا۔ پھر کریں۔';

  @override
  String get focusStartNext => 'اگلا سیشن شروع کریں';

  @override
  String get focusBackHome => 'ڈیش بورڈ پر واپس';

  @override
  String get goalsTitle => 'میرے اہداف';

  @override
  String goalsSubtitle(int active, int done) {
    return '$active فعال · $done مکمل';
  }

  @override
  String get goalsAdd => 'ہدف شامل کریں';

  @override
  String get goalsCompleted => 'مکمل';

  @override
  String get goalsActive => 'فعال';

  @override
  String get goalsStreak => 'اسٹریک';

  @override
  String get goalsOverall => 'مجموعی تکمیل';

  @override
  String goalsWeeklyHit(int hit, int total) {
    return '$total میں سے $hit ہفتہ وار اہداف پورے';
  }

  @override
  String goalsVsLastWeek(String delta) {
    return '$delta پچھلے ہفتے سے';
  }

  @override
  String get goalsFilterAll => 'سب';

  @override
  String get goalsDone => 'مکمل';

  @override
  String get goalsCatFocus => 'فوکس';

  @override
  String get goalsCatDiscipline => 'نظم و ضبط';

  @override
  String get goalsCatWellness => 'صحت';

  @override
  String goalsTitleFocusHours(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'روزانہ فوکس: $n گھنٹے',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleFocusDur(String duration) {
    return 'روزانہ فوکس: $duration';
  }

  @override
  String get goalsTitleBlock => 'سوشل ایپس بلاک کریں';

  @override
  String goalsTitleSessions(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'روزانہ $n پومودورو',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleScreen(String duration) {
    return '$duration سے کم اسکرین ٹائم';
  }

  @override
  String get goalsTitlePhoneFree => 'فون سے آزاد وقت';

  @override
  String goalsDescFocus(String duration) {
    return 'ہر روز $duration گہرا فوکس حاصل کریں';
  }

  @override
  String goalsDescBlock(int n) {
    return 'لاک کی گئی ایپس ہفتے میں $n دن بند رکھیں';
  }

  @override
  String goalsDescSessions(int n) {
    return 'روزانہ کم از کم $n فوکس سیشن مکمل کریں';
  }

  @override
  String goalsDescScreen(String duration) {
    return 'روزانہ فون کا استعمال $duration سے کم رکھیں';
  }

  @override
  String goalsDescPhoneFree(int n) {
    return 'ہفتے میں $n دن فون سے دور رہیں — ہر دن نشان لگائیں';
  }

  @override
  String goalsProgressDays(int done, int total) {
    return '$done / $total دن';
  }

  @override
  String goalsProgressSessions(int done, int total) {
    return '$done / $total سیشن';
  }

  @override
  String goalsStreakShort(int n) {
    return '$n دن';
  }

  @override
  String goalsStreakN(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n دن کی اسٹریک',
    );
    return '$_temp0';
  }

  @override
  String get goalsCheckIn => 'آج مکمل نشان لگائیں';

  @override
  String get goalsCheckedIn => 'آج مکمل';

  @override
  String get goalsCheckedSnack => 'زبردست! آج مکمل نشان زد ہو گیا۔';

  @override
  String get goalsUncheckedSnack => 'آج کا نشان ہٹا دیا گیا۔';

  @override
  String get goalsCreateNew => 'نیا ہدف بنائیں';

  @override
  String get goalsEmptyBadge => 'شروع کریں';

  @override
  String get goalsEmptyTitle => 'ابھی کوئی ہدف نہیں';

  @override
  String get goalsEmptyMsg =>
      'ایک چھوٹا روزانہ ہدف بنائیں، Pausey اسے آپ کے لیے ٹریک کرے گا۔';

  @override
  String get goalsFilterEmpty => 'اس فلٹر میں کوئی ہدف نہیں۔';

  @override
  String get goalsNewGoal => 'نیا ہدف';

  @override
  String get goalsEditGoal => 'ہدف میں ترمیم';

  @override
  String get goalsType => 'ہدف کی قسم';

  @override
  String get goalsTypeFocus => 'فوکس ٹائم';

  @override
  String get goalsTypeSessions => 'فوکس سیشن';

  @override
  String get goalsTypeBlock => 'ایپس بلاک';

  @override
  String get goalsTypePhoneFree => 'فون سے آزاد دن';

  @override
  String get goalsTypeScreen => 'اسکرین ٹائم حد';

  @override
  String get goalsCategory => 'زمرہ';

  @override
  String get goalsTarget => 'ہدف';

  @override
  String get goalsPerDay => 'روزانہ';

  @override
  String get goalsPerWeek => 'دن فی ہفتہ';

  @override
  String get goalsMaxPerDay => 'زیادہ سے زیادہ روزانہ';

  @override
  String get goalsTitleOptional => 'عنوان (اختیاری)';

  @override
  String get goalsSave => 'ہدف محفوظ کریں';

  @override
  String get goalsCreate => 'ہدف بنائیں';

  @override
  String get goalsSavedSnack => 'ہدف محفوظ ہو گیا';

  @override
  String get goalsCreatedSnack => 'ہدف بن گیا';

  @override
  String get goalsEdit => 'ترمیم';

  @override
  String get goalsDelete => 'ہدف حذف کریں';

  @override
  String get goalsDeleteQ => 'یہ ہدف حذف کریں؟';

  @override
  String get goalsDeleteMsg =>
      'اس کے نشانات بھی ہٹ جائیں گے۔ یہ واپس نہیں ہو سکتا۔';

  @override
  String get goalsDeletedSnack => 'ہدف حذف ہو گیا';

  @override
  String get goalsComplete => 'مکمل';

  @override
  String get goalsDaysActive => 'فعال دن';

  @override
  String get goalsTotalTime => 'کل وقت';

  @override
  String get goalsSessionsLabel => 'سیشن';

  @override
  String get goals7Day => '7 دن کی تکمیل';

  @override
  String get goals7DaysAgo => '7 دن پہلے';

  @override
  String get goalsToday => 'آج';

  @override
  String goalsTodayDate(String date) {
    return 'آج، $date';
  }

  @override
  String goalsYesterdayDate(String date) {
    return 'کل، $date';
  }

  @override
  String get goalsMilestones => 'سنگ میل';

  @override
  String get goalsMsFirst => 'پہلا دن مکمل';

  @override
  String get goalsMs3 => '3 دن کی اسٹریک';

  @override
  String get goalsMsHalf => 'ہفتہ وار ہدف کا 50%';

  @override
  String get goalsMs5 => '5 دن کی اسٹریک';

  @override
  String get goalsMsWeek => 'پورا ہفتہ مکمل';

  @override
  String get goalsMsLocked => 'ابھی نہیں';

  @override
  String get goalsHistory => 'سرگرمی کی تاریخ';

  @override
  String get goalsShowLess => 'کم دکھائیں';

  @override
  String get goalsStartSession => 'فوکس سیشن شروع کریں';

  @override
  String get goalsManageApps => 'بلاک ایپس منظم کریں';

  @override
  String get goalsBlockHint =>
      'جب لاک شیڈول آن ہو اور ایپس بند ہوں تو خود بخود گنتی ہوتی ہے۔';

  @override
  String goalsScreenToday(String used) {
    return 'آج اسکرین ٹائم: $used';
  }

  @override
  String get goalsNotFound => 'یہ ہدف اب موجود نہیں۔';

  @override
  String get goalsMore => 'مزید اختیارات';

  @override
  String goalsFreeLimit(int n) {
    return 'مفت پلان: زیادہ سے زیادہ $n اہداف';
  }

  @override
  String get homeGoodMorning => 'صبح بخیر';

  @override
  String get homeGoodAfternoon => 'سہ پہر بخیر';

  @override
  String get homeGoodEvening => 'شام بخیر';

  @override
  String get homeFriend => 'دوست';

  @override
  String get homeTodayFocus => 'آج کا فوکس';

  @override
  String homeVsYesterday(String pct) {
    return 'کل کے مقابلے میں $pct%';
  }

  @override
  String get homeStartToday => 'آج ابھی فوکس نہیں';

  @override
  String get homeDayStreak => 'دن کا تسلسل';

  @override
  String get homeTodayGoal => 'آج کا ہدف';

  @override
  String homePctCompleted(int pct) {
    return '$pct% مکمل';
  }

  @override
  String get homeOnTrack => 'درست راہ پر!';

  @override
  String get homeKeepGoing => 'جاری رکھیں';

  @override
  String get homeGoalMet => 'ہدف پورا!';

  @override
  String get homeScreenTimeTitle => 'اسکرین ٹائم';

  @override
  String get homeToday => 'آج';

  @override
  String homeVsAvg(String pct) {
    return 'اوسط سے $pct%';
  }

  @override
  String get homeQuickStart => 'فوری فوکس سیشن شروع کریں';

  @override
  String get homeManage => 'منظم کریں';

  @override
  String get homeNoApps =>
      'وہ ایپس چنیں جو سب سے زیادہ توجہ ہٹاتی ہیں اور انہیں یہاں لاک کریں۔';

  @override
  String get homeAddApps => 'ایپس شامل کریں';

  @override
  String homeAppLocked(String app) {
    return '$app لاک ہو گئی';
  }

  @override
  String homeAppUnlocked(String app) {
    return '$app اَن لاک ہو گئی';
  }

  @override
  String homeLockApp(String app) {
    return '$app لاک یا اَن لاک کریں';
  }

  @override
  String get homeUpgradeTitle => 'پریمیم میں اپ گریڈ کریں';

  @override
  String get homeUpgradeBody => 'لامحدود بلاکس، اہداف اور تفصیلی تجزیہ۔';

  @override
  String get homeTryFree => 'مفت آزمائیں';

  @override
  String get homePro => 'PRO';

  @override
  String get homeProActive => 'Pausey Pro فعال ہے';

  @override
  String get homeProActiveBody => 'تمام فیچرز کھل گئے۔ تعاون کا شکریہ!';

  @override
  String get homeNotifications => 'اطلاعات';

  @override
  String get homeNoNotifications => 'کوئی نئی اطلاع نہیں۔';

  @override
  String get homePushLabel => 'پش اطلاعات';

  @override
  String get homeFocusReminder => 'روزانہ فوکس یاد دہانی';

  @override
  String get homeStreakAlerts => 'تسلسل کی یاد دہانی';

  @override
  String get homePwTitle => 'Pausey Pro کھولیں';

  @override
  String get homePwSubtitle =>
      'اپنی توجہ واپس پائیں اور فون کی لت پر قابو پائیں۔';

  @override
  String get homePwMonthly => 'ماہانہ';

  @override
  String get homePwBilledMonthly => 'ہر ماہ بل';

  @override
  String get homePwYearly => 'سالانہ';

  @override
  String get homePwPopular => 'سب سے مقبول';

  @override
  String homePwSave(int pct) {
    return '$pct% بچت';
  }

  @override
  String homePwBilledYearly(String price) {
    return '$price سالانہ بل';
  }

  @override
  String get homePwLifetime => 'تاحیات';

  @override
  String get homePwBestValue => 'بہترین قیمت';

  @override
  String get homePwPayOnce => 'ایک بار ادائیگی، ہمیشہ کے لیے';

  @override
  String get homePwPerMonth => '/ ماہ';

  @override
  String get homePwOnce => 'ایک بار';

  @override
  String get homePwStartTrial => '7 دن کی مفت آزمائش شروع کریں';

  @override
  String get homePwBuyLifetime => 'تاحیات رسائی حاصل کریں';

  @override
  String get homePwNoCharge => 'آج کوئی چارج نہیں · کبھی بھی منسوخ کریں';

  @override
  String get homePwOneTime => 'ایک بار ادائیگی · کوئی سبسکرپشن نہیں';

  @override
  String get homePwFree => 'مفت';

  @override
  String get homePwProCol => 'Pro';

  @override
  String get homePwFeatBlocking => 'لامحدود ایپ بلاکنگ';

  @override
  String get homePwFeatSessions => 'تمام فوکس موڈز';

  @override
  String get homePwFeatGoals => 'لامحدود اہداف';

  @override
  String get homePwFeatAnalytics => 'جدید تجزیہ';

  @override
  String get homePwFeatStreak => 'تسلسل کی حفاظت';

  @override
  String get homePwFeatSchedule => 'فوکس شیڈولنگ';

  @override
  String get homePwFeatFaceId => 'فیس آئی ڈی ایپ لاک';

  @override
  String get homePwFeatNotif => 'سمارٹ اطلاعات';

  @override
  String homePwMax(int n) {
    return 'زیادہ سے زیادہ $n';
  }

  @override
  String get homePwSecure => 'محفوظ ادائیگی';

  @override
  String get homePwCancelAnytime => 'کبھی بھی منسوخ کریں';

  @override
  String get homePwPrivacyFirst => 'پرائیویسی اوّل';

  @override
  String get homePwRestore => 'خریداری بحال کریں';

  @override
  String get homePwTerms => 'شرائطِ خدمت';

  @override
  String get homePwPrivacyPolicy => 'پرائیویسی پالیسی';

  @override
  String get homePwWelcome => 'Pausey Pro میں خوش آمدید!';

  @override
  String get homePwNothingToRestore => 'کوئی پچھلی خریداری نہیں ملی۔';

  @override
  String get homePwRestored => 'آپ کی Pro رسائی فعال ہے۔';

  @override
  String get homePwLinkSoon => 'یہ صفحہ جلد ہماری ویب سائٹ پر کھلے گا۔';

  @override
  String get homePwYouArePro => 'آپ Pro ہیں — لطف اٹھائیں!';

  @override
  String get homePwClose => 'بند کریں';

  @override
  String get homeAvgLegend => '7 دن کی اوسط';

  @override
  String homeGoalOf(String done, String goal) {
    return '$goal میں سے $done';
  }

  @override
  String get homeBest => 'بہترین:';

  @override
  String get homeMyApps => 'میری ایپس';

  @override
  String get homeManageApps => 'ایپس منظم کریں';

  @override
  String get homeUnblockApps => 'ایپس کھولیں';

  @override
  String homeAppsLocked(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ایپس لاک ہیں',
      one: '1 ایپ لاک ہے',
    );
    return '$_temp0';
  }

  @override
  String homeAppNamesMore(String names, int count) {
    return '$names +$count';
  }

  @override
  String get homeNoLockedApps => 'ابھی کوئی ایپ لاک نہیں';

  @override
  String get homeNoLockedAppsSub => 'وہ ایپس چنیں جو آپ کو کھینچتی ہیں';

  @override
  String get insightsAnalytics => 'تجزیات';

  @override
  String get insightsScreenTime => 'اسکرین ٹائم';

  @override
  String get insightsToday => 'آج';

  @override
  String get insightsWeek => 'ہفتہ';

  @override
  String get insightsMonth => 'مہینہ';

  @override
  String get insightsProductivity => 'پیداواری اسکور';

  @override
  String insightsPts(String delta) {
    return '$delta پوائنٹس';
  }

  @override
  String get insightsVsLastWeek => 'پچھلے ہفتے کے مقابلے';

  @override
  String get insightsVsLastMonth => 'پچھلے مہینے کے مقابلے';

  @override
  String insightsScoreDays(int n) {
    return '$n دن کا اسکور';
  }

  @override
  String get insightsFocusHours => 'فوکس کے گھنٹے';

  @override
  String get insightsThisWeek => 'اس ہفتے';

  @override
  String get insightsThisMonth => 'اس مہینے';

  @override
  String insightsGoalOf(String done, String goal) {
    return '$done / $goal ہدف';
  }

  @override
  String get insightsFocusScore => 'فوکس اسکور';

  @override
  String get insightsGoals => 'اہداف';

  @override
  String get insightsConsistency => 'تسلسل';

  @override
  String get insightsWeeklyFocus => 'ہفتہ وار فوکس گھنٹے';

  @override
  String insightsDailyFocus(int n) {
    return 'روزانہ فوکس، پچھلے $n دن';
  }

  @override
  String insightsBestDay(String day, String time) {
    return 'بہترین دن: $day · $time';
  }

  @override
  String insightsAvgDay(String time) {
    return 'اوسط $time / دن';
  }

  @override
  String get insightsMonthlyTrends => 'ماہانہ رجحانات';

  @override
  String get insightsActual => 'اصل';

  @override
  String get insightsGoal => 'ہدف';

  @override
  String insightsWk(int n) {
    return 'ہفتہ $n';
  }

  @override
  String insightsWeekBeat(int n, String time) {
    return 'ہفتہ $n نے ہدف سے $time زیادہ کیا';
  }

  @override
  String insightsWeekShort(int n, String time) {
    return 'بہترین ہفتہ $n تھا، ہدف سے $time کم';
  }

  @override
  String get insightsGoalCompletion => 'اہداف کی تکمیل';

  @override
  String insightsDaysOf(int done, int total) {
    return '$done/$total دن';
  }

  @override
  String get insightsNoGoals =>
      'ابھی کوئی ہدف نہیں۔ یہاں پیش رفت دیکھنے کے لیے ایک شامل کریں۔';

  @override
  String get insightsManageGoals => 'منظم کریں';

  @override
  String insightsGoalFocus(String hours) {
    return 'روزانہ فوکس: $hours گھنٹے';
  }

  @override
  String get insightsGoalBlock => 'سوشل ایپس بلاک کریں';

  @override
  String insightsGoalPomo(int n) {
    return 'روزانہ $n پومودورو';
  }

  @override
  String insightsGoalScreen(String time) {
    return '$time سے کم اسکرین ٹائم';
  }

  @override
  String get insightsGoalPhoneFree => 'فون کے بغیر وقت';

  @override
  String get insightsEmptyBadge => 'ابھی کوئی سیشن نہیں';

  @override
  String get insightsEmptyTitle => 'آپ کا جائزہ ایک سیشن سے شروع ہوتا ہے';

  @override
  String get insightsEmptyBody =>
      'ایک فوکس سیشن مکمل کریں، آپ کے اسکور، چارٹ اور اہداف کی پیش رفت یہاں نظر آئے گی۔';

  @override
  String get insightsEmptyCta => 'فوکس سیشن شروع کریں';

  @override
  String get insightsDailyUsage => 'روزانہ استعمال';

  @override
  String get insightsFocusTime => 'فوکس ٹائم';

  @override
  String get insightsVsAvg => 'اوسط کے مقابلے';

  @override
  String get insightsUsageByDay => 'دن کے حساب سے استعمال';

  @override
  String get insightsUsageByWeek => 'ہفتے کے حساب سے استعمال';

  @override
  String get insightsUsage => 'استعمال';

  @override
  String insightsTrend(int n) {
    return '$n دن کا رجحان';
  }

  @override
  String get insightsImproving => 'بہتری';

  @override
  String get insightsRising => 'بڑھ رہا ہے';

  @override
  String insightsDaysAgo(int n) {
    return '$n دن پہلے';
  }

  @override
  String get insightsMostUsed => 'سب سے زیادہ استعمال ہونے والی ایپس';

  @override
  String get insightsAllApps => 'تمام ایپس';

  @override
  String get insightsBreakdown => 'استعمال کی تفصیل';

  @override
  String get insightsTotal => 'کل';

  @override
  String get insightsNoUsage => 'اس مدت میں کوئی اسکرین ٹائم ریکارڈ نہیں۔';

  @override
  String get insightsLockApp => 'یہ ایپ لاک کریں';

  @override
  String insightsLocked(String app) {
    return '$app اب لاک ہے';
  }

  @override
  String get insightsCatSocial => 'سوشل';

  @override
  String get insightsCatVideo => 'ویڈیو';

  @override
  String get insightsCatGames => 'گیمز';

  @override
  String get insightsCatShopping => 'شاپنگ';

  @override
  String get insightsCatCommunity => 'کمیونٹی';

  @override
  String get insightsCatOther => 'دیگر';

  @override
  String nativeBlockTitle(String app) {
    return '$app روک دی گئی ہے';
  }

  @override
  String get nativeReasonLimit => 'آپ آج کا اس ایپ کا وقت استعمال کر چکے ہیں۔';

  @override
  String get nativeReasonSchedule => 'ابھی لاک شیڈول فعال ہے۔';

  @override
  String get nativeReasonGlobal => 'یہ ایپ Pausey میں لاک ہے۔';

  @override
  String get nativeReasonFocus => 'آپ فوکس سیشن میں ہیں۔';

  @override
  String get nativeClose => 'ایپ بند کریں';

  @override
  String get nativeNotifTitle => 'Pausey آپ کی حدیں برقرار رکھ رہا ہے';

  @override
  String get nativeNotifText => 'ایپ کی حدیں اور لاک شیڈول فعال ہیں';

  @override
  String get profileSettings => 'ترتیبات';

  @override
  String get profileGuestName => 'مہمان';

  @override
  String get profileGuestBadge => 'مہمان · اسی فون پر محفوظ';

  @override
  String get profileEditName => 'نام تبدیل کریں';

  @override
  String get profileNameHint => 'آپ کا نام';

  @override
  String get profileSave => 'محفوظ کریں';

  @override
  String profileMemberSince(String date) {
    return '$date سے ممبر';
  }

  @override
  String get profileProActive => 'پرو · فعال';

  @override
  String get profileFree => 'مفت پلان';

  @override
  String get profileUpgrade => 'اپ گریڈ';

  @override
  String get profileBadges => 'بیجز';

  @override
  String get profileNoBadges => 'بیجز کے لیے فوکس سیشن مکمل کریں';

  @override
  String get profileFocusTime => 'فوکس وقت';

  @override
  String get profileGoalsDone => 'مکمل اہداف';

  @override
  String get profileDayStreak => 'دن کا تسلسل';

  @override
  String get profileAppsBlocked => 'بلاک ایپس';

  @override
  String get profileFocusActivity => 'فوکس سرگرمی';

  @override
  String get profileLast4Weeks => 'پچھلے 4 ہفتے';

  @override
  String get profileRecentActivity => 'حالیہ سرگرمی';

  @override
  String get profileSessionDone => 'فوکس سیشن مکمل';

  @override
  String get profileSessionStopped => 'سیشن جلدی ختم ہوا';

  @override
  String get profileModePomodoro => 'پومودورو';

  @override
  String get profileModeDeep => 'گہرا کام';

  @override
  String get profileModeCustom => 'اپنی مرضی';

  @override
  String get profileJustNow => 'ابھی';

  @override
  String profileAgoMinutes(int n) {
    return '$n منٹ پہلے';
  }

  @override
  String profileAgoHours(int n) {
    return '$n گھنٹے پہلے';
  }

  @override
  String get profileYesterday => 'کل';

  @override
  String get profileEmptyTitle => 'ابھی کوئی فوکس سیشن نہیں';

  @override
  String get profileEmptyBody =>
      'اپنا پہلا سیشن شروع کریں — آپ کی سرگرمی، تسلسل اور بیجز یہاں نظر آئیں گے۔';

  @override
  String get profileStartFocus => 'فوکس شروع کریں';

  @override
  String get profileMyGoals => 'میرے اہداف';

  @override
  String get profileStreaks => 'تسلسل اور بیجز';

  @override
  String get profileSubscription => 'سبسکرپشن';

  @override
  String get profileSignOutTitle => 'سائن آؤٹ کریں؟';

  @override
  String get profileSignOutBody => 'آپ کسی بھی وقت دوبارہ لاگ اِن کر سکتے ہیں۔';

  @override
  String get profileSecNotifications => 'اطلاعات';

  @override
  String get profileSecAppearance => 'ظاہری شکل';

  @override
  String get profileSecFocus => 'فوکس اور بلاکنگ';

  @override
  String get profileSecPrivacy => 'رازداری اور سیکیورٹی';

  @override
  String get profileSecAccount => 'اکاؤنٹ';

  @override
  String get profilePush => 'پش اطلاعات';

  @override
  String get profilePushSub => 'فوکس یاد دہانیاں اور الرٹس';

  @override
  String get profileReminder => 'فوکس شروع کرنے کی یاد دہانی';

  @override
  String profileReminderSub(String time) {
    return 'روزانہ $time بجے';
  }

  @override
  String get profileStreakAlerts => 'تسلسل الرٹس';

  @override
  String get profileStreakAlertsSub => 'تسلسل ٹوٹنے سے پہلے';

  @override
  String get profileGoalMilestones => 'اہداف کے سنگ میل';

  @override
  String get profileGoalMilestonesSub => 'جب آپ ہدف پورا کریں';

  @override
  String get profileDarkMode => 'ڈارک موڈ';

  @override
  String get profileOn => 'آن';

  @override
  String get profileOff => 'آف';

  @override
  String get profileTextSize => 'متن کا سائز';

  @override
  String get profileTextSmall => 'چھوٹا';

  @override
  String get profileTextMedium => 'درمیانہ';

  @override
  String get profileTextLarge => 'بڑا';

  @override
  String get profileTextHuge => 'بہت بڑا';

  @override
  String get profilePomodoroLen => 'پومودورو کا دورانیہ';

  @override
  String get profileBreakLen => 'وقفے کا دورانیہ';

  @override
  String profileMinutes(int n) {
    return '$n منٹ';
  }

  @override
  String get profileFaceIdUnlock => 'اَن لاک کے لیے فیس آئی ڈی';

  @override
  String get profileFaceIdUnlockSub => 'ایپ اَن لاک سے پہلے تصدیق';

  @override
  String get profileBypass => 'ہنگامی رسائی';

  @override
  String profileBypassSub(int n) {
    return 'روزانہ $n اَن لاک';
  }

  @override
  String get profileAppLock => 'فیس آئی ڈی سے Pausey لاک کریں';

  @override
  String get profileAppLockSub => 'ایپ کھولتے وقت پوچھیں';

  @override
  String get profileHideUsage => 'استعمال کا ڈیٹا چھپائیں';

  @override
  String get profileHideUsageSub => 'اسکرین ٹائم نمبر چھپائیں';

  @override
  String get profileClearData => 'سرگرمی کا ڈیٹا صاف کریں';

  @override
  String get profileClearDataSub => 'سیشنز اور اہداف کی تاریخ ہٹاتا ہے';

  @override
  String get profileClearTitle => 'سرگرمی کا ڈیٹا صاف کریں؟';

  @override
  String get profileClearBody =>
      'اس فون سے تمام فوکس سیشنز اور اہداف کے ریکارڈ حذف ہو جائیں گے۔ یہ واپس نہیں ہو سکتا۔';

  @override
  String get profileClear => 'صاف کریں';

  @override
  String get profileCleared => 'سرگرمی کا ڈیٹا صاف ہو گیا';

  @override
  String get profileExport => 'میرا ڈیٹا ایکسپورٹ کریں';

  @override
  String get profileExportSub => 'JSON کے طور پر کاپی کریں';

  @override
  String get profileExported => 'آپ کا ڈیٹا کلپ بورڈ پر کاپی ہو گیا';

  @override
  String get profileStreaksTitle => 'تسلسل';

  @override
  String get profileShare => 'شیئر کریں';

  @override
  String profileShareText(int n) {
    return 'میں Pausey کے ساتھ $n دن سے مسلسل فوکس کر رہا ہوں!';
  }

  @override
  String get profileCopied => 'کلپ بورڈ پر کاپی ہو گیا';

  @override
  String profileNextMilestone(int n) {
    return 'جاری رکھیں – اگلے سنگ میل تک $n دن!';
  }

  @override
  String get profileAllMilestones => 'تمام سنگ میل مکمل۔ زبردست!';

  @override
  String get profileStartStreak =>
      'تسلسل شروع کرنے کے لیے آج ایک فوکس سیشن مکمل کریں۔';

  @override
  String get profileBest => 'بہترین';

  @override
  String get profileThisWeek => 'اس ہفتے';

  @override
  String profileDaysCompleted(int n) {
    return '$n/7 دن مکمل';
  }

  @override
  String get profileCompleted => 'مکمل';

  @override
  String get profilePartial => 'جزوی';

  @override
  String get profileMissed => 'چھوٹ گیا';

  @override
  String get profilePrevMonth => 'پچھلا مہینہ';

  @override
  String get profileNextMonth => 'اگلا مہینہ';

  @override
  String get profileMilestones => 'تسلسل کے سنگ میل';

  @override
  String get profileAchievements => 'کامیابیاں';

  @override
  String get profileAchOnFire => 'جوش میں';

  @override
  String get profileAchIronWill => 'فولادی عزم';

  @override
  String get profileAchFocusMaster => 'فوکس ماسٹر';

  @override
  String get profileAchMonk => 'ڈیجیٹل راہب';

  @override
  String get profileAchLegend => 'لیجنڈری';

  @override
  String get profileAchSpeed => 'تیز رفتار';

  @override
  String profileAchStreakDesc(int n) {
    return '$n دن کا تسلسل';
  }

  @override
  String profileAchSessionsDesc(int n) {
    return '$n سیشن مکمل';
  }

  @override
  String profileAchHoursDesc(int n) {
    return 'کل $n گھنٹے فوکس';
  }

  @override
  String profileAchDayDesc(int n) {
    return 'ایک دن میں $n سیشن';
  }

  @override
  String get navHome => 'ہوم';

  @override
  String get navBlock => 'بلاک';

  @override
  String get navFocus => 'فوکس';

  @override
  String get navInsights => 'جائزہ';

  @override
  String get navProfile => 'پروفائل';

  @override
  String get unitH => 'گھ';

  @override
  String get unitM => 'م';

  @override
  String get sampleData => 'نمونہ ڈیٹا';

  @override
  String get seeAll => 'سب دیکھیں';

  @override
  String days(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count دن',
      one: '1 دن',
    );
    return '$_temp0';
  }

  @override
  String get statesTitle => 'حالتیں';

  @override
  String get statesSubtitle => 'دوستانہ خرابی، خالی اور لوڈنگ اسکرینز';

  @override
  String get statesNoInternet => 'انٹرنیٹ نہیں';

  @override
  String get statesConnectionLost => 'رابطہ منقطع';

  @override
  String get statesOfflineTitle => 'آپ آف لائن ہیں';

  @override
  String get statesOfflineMsg =>
      'Pausey ابھی سرور تک نہیں پہنچ پا رہا۔ اپنا Wi-Fi یا موبائل ڈیٹا چیک کریں اور دوبارہ کوشش کریں – آپ کا مقامی ڈیٹا محفوظ ہے۔';

  @override
  String get statesTryAgain => 'دوبارہ کوشش کریں';

  @override
  String get statesOpenSettings => 'سیٹنگز کھولیں';

  @override
  String get statesOfflineMode => 'آف لائن موڈ فعال';

  @override
  String get statesLimited => 'محدود';

  @override
  String get statesAvailable => 'دستیاب';

  @override
  String get statesUnavailable => 'دستیاب نہیں';

  @override
  String get statesCapSessions => 'پچھلے سیشن دیکھیں';

  @override
  String get statesCapApps => 'لاک ایپس کی فہرست';

  @override
  String get statesCapTimer => 'مقامی فوکس ٹائمر چلائیں';

  @override
  String get statesCapSync => 'اسٹریک اور اہداف سنک';

  @override
  String get statesCapAnalytics => 'تجزیاتی ڈیٹا تازہ کریں';

  @override
  String get statesOfflineNote =>
      'آپ کا سارا فوکس ڈیٹا مقامی طور پر محفوظ ہے۔ آف لائن ہونے پر کچھ ضائع نہیں ہوتا۔';

  @override
  String get statesBackOnline => 'دوبارہ آن لائن – سب کچھ سنک ہو گیا';

  @override
  String get statesShowAgain => 'حالت دوبارہ دکھائیں';

  @override
  String get statesPermDenied => 'اجازت مسترد';

  @override
  String get statesPermRequired => 'اجازت درکار';

  @override
  String get statesPermTitle => 'رسائی بند';

  @override
  String get statesPermMsg =>
      'ایپس بلاک کرنے کے لیے Pausey کو اسکرین ٹائم تک رسائی چاہیے۔ اس کے بغیر بلاکنگ کام نہیں کرے گی۔';

  @override
  String get statesGrant => 'رسائی دیں';

  @override
  String get statesLearnMore => 'مزید جانیں';

  @override
  String get statesLearnMoreMsg =>
      'اسکرین ٹائم رسائی سے Pausey توجہ ہٹانے والی ایپس روک سکتا ہے۔ آپ کا ڈیٹا فون سے باہر نہیں جاتا۔';

  @override
  String get statesRequiredPerms => 'ضروری اجازتیں';

  @override
  String get statesPermNotif => 'اطلاعات';

  @override
  String get statesPermScreenTime => 'اسکرین ٹائم رسائی';

  @override
  String get statesPermUsage => 'ایپ استعمال کے اعداد';

  @override
  String get statesPermBio => 'فیس آئی ڈی / بائیومیٹرکس';

  @override
  String get statesGranted => 'منظور';

  @override
  String get statesDenied => 'مسترد';

  @override
  String get statesPermNote =>
      'اسکرین ٹائم کے بغیر بھی فوکس ٹائمر چلتا ہے، مگر ایپس بلاک نہیں ہوتیں۔';

  @override
  String get statesAccessGranted => 'رسائی مل گئی – ایپ بلاکنگ تیار ہے';

  @override
  String get statesDataNA => 'ڈیٹا دستیاب نہیں';

  @override
  String get statesSyncFailed => 'سنک ناکام';

  @override
  String get statesLoadTitle => 'ڈیٹا لوڈ نہیں ہو سکا';

  @override
  String get statesLoadMsg =>
      'آپ کے تجزیات لاتے وقت مسئلہ ہوا۔ شاید سرور میں عارضی خرابی ہے – آپ کا مقامی ڈیٹا محفوظ ہے۔';

  @override
  String get statesRetrySync => 'دوبارہ سنک';

  @override
  String get statesUseCached => 'محفوظ ڈیٹا';

  @override
  String get statesErrorDetails => 'خرابی کی تفصیل';

  @override
  String get statesErrorCode => 'خرابی کوڈ';

  @override
  String get statesTimestamp => 'وقت';

  @override
  String get statesRetryCount => 'کوششیں';

  @override
  String statesAttempts(int n) {
    return '$n / 3 کوششیں';
  }

  @override
  String get statesReport => 'سپورٹ کو رپورٹ کریں';

  @override
  String get statesReported => 'شکریہ – رپورٹ بھیج دی گئی';

  @override
  String get statesCachedNote =>
      'اس دوران آخری کامیاب سنک کا محفوظ ڈیٹا دستیاب ہے۔';

  @override
  String get statesDataLoaded => 'تجزیات لوڈ ہو گئے';

  @override
  String get statesCachedShown => 'محفوظ ڈیٹا دکھایا جا رہا ہے';

  @override
  String statesWeekFocus(String time) {
    return 'اس ہفتے فوکس: $time';
  }

  @override
  String get statesEmpty => 'خالی حالت';

  @override
  String get statesNothingYet => 'ابھی کچھ نہیں';

  @override
  String get statesEmptyTitle => 'ابھی کوئی سیشن نہیں';

  @override
  String get statesEmptyMsg =>
      'اپنا پہلا فوکس سیشن شروع کریں، آپ کی پیش رفت یہاں نظر آئے گی۔';

  @override
  String get statesStartFocus => 'فوکس شروع کریں';

  @override
  String get statesLoadingSection => 'لوڈنگ حالتیں';

  @override
  String get statesDashLoading => 'ڈیش بورڈ';

  @override
  String get statesAnalyticsLoading => 'تجزیات';

  @override
  String get statesGoalsLoading => 'اہداف';

  @override
  String get statesProfileLoading => 'پروفائل';

  @override
  String get statesCrunching => 'آپ کا ڈیٹا تیار ہو رہا ہے…';

  @override
  String get statesLoadingGoals => 'اہداف لوڈ ہو رہے ہیں…';

  @override
  String get statesLoadingProfile => 'پروفائل لوڈ ہو رہی ہے…';

  @override
  String get statesReplay => 'دوبارہ چلائیں';

  @override
  String get stHowCaption => 'یہ کیسے کام کرتا ہے';

  @override
  String stHow1(String app) {
    return 'آپ پھر سے $app کھولتے ہیں';
  }

  @override
  String get stHow2 => 'آپ اسکرول شروع کرتے ہیں، مگر…';

  @override
  String get stHow3 => 'Pausey نرمی سے اسے بلاک کر دیتا ہے۔';

  @override
  String stBlockedTitle(String app) {
    return '$app بلاک ہے';
  }

  @override
  String get stHow4 => 'حد سے پہلے یاد دہانی';

  @override
  String get stYourApp => 'اپنی ایپ';

  @override
  String get stTapToContinue => 'جاری رکھنے کے لیے ٹیپ کریں';

  @override
  String get stNudgeGeneric => 'آپ کی روزانہ حد تقریباً پوری';

  @override
  String get stPermTitle => 'چند اجازتیں دیں';

  @override
  String get stPermUsageTitle => 'اسکرین ٹائم';

  @override
  String get stPermUsageWhy =>
      'آپ کا روزانہ اسکرین ٹائم دکھاتا ہے اور بتاتا ہے کہ حد کب پوری ہوئی۔';

  @override
  String get stPermOverlayTitle => 'دوسری ایپس کے اوپر دکھائیں';

  @override
  String get stPermOverlayWhy =>
      'Pausey کو کسی توجہ ہٹانے والی ایپ پر وقفے کی اسکرین دکھانے دیتا ہے۔';

  @override
  String get stPermNotifTitle => 'اطلاعات';

  @override
  String get stPermNotifWhy =>
      'حد ختم ہونے سے پہلے نرم یاد دہانیاں۔ آپ اسے بعد میں بند کر سکتے ہیں۔';

  @override
  String get stPermMore => 'ایک اور بات…';

  @override
  String get stPermA11yTitle => 'رسائی (Accessibility)';

  @override
  String get stPermA11yWhy =>
      'فوراً پہچانتا ہے کہ کون سی ایپ کھلی ہے، تاکہ وقفہ فوراً ہو۔';

  @override
  String get stPermA11yNote =>
      'کچھ فونز اس کے بعد اپنی انتباہی اسکرین دکھاتے ہیں۔ یہ معمول کی بات ہے — آپ اسے کسی بھی وقت سیٹنگز میں بند کر سکتے ہیں۔';

  @override
  String get stPermOnHint =>
      'پہلے سے آن ہے۔ بند کرنے کے لیے Android سیٹنگز › ایپس › Pausey کھولیں۔';

  @override
  String get stA11yDialogTitle => 'رسائی (Accessibility) کیوں؟';

  @override
  String get stA11yDialogBody =>
      'Pausey رسائی کو صرف یہ جاننے کے لیے استعمال کرتا ہے کہ کون سی ایپ کھلی ہے، تاکہ آپ کی حدیں اور شیڈول فوراً لاگو ہوں، اور حفاظت قابلِ اعتماد طریقے سے چلتی رہے۔';

  @override
  String get stA11yNot => 'Pausey یہ نہیں کرتا:';

  @override
  String get stA11yNot1 => 'آپ کی اسکرین پر موجود چیزیں پڑھنا یا جمع کرنا';

  @override
  String get stA11yNot2 => 'ذاتی معلومات محفوظ کرنا';

  @override
  String get stA11yNot3 => 'آپ کے فون سے کچھ بھی باہر بھیجنا';

  @override
  String get stPw1 => 'پُرسکون دن کے لیے آپ کا پلان';

  @override
  String get stPw2 => 'ایسے لاک جنہیں آپ بہانے سے نہیں کھول سکتے';

  @override
  String get stPw3 => 'ہر ہفتے اپنی پیش رفت دیکھیں';

  @override
  String get stPwToday => 'آج';

  @override
  String get stPwGoal => 'آپ کا ہدف';

  @override
  String stPwWeek(int n) {
    return 'ہفتہ $n';
  }

  @override
  String get stPwFirstWeek => 'آپ کا پہلا ہفتہ ابھی سے شروع';

  @override
  String get stPwFocusWeek => 'ہر ہفتے فوکس کا وقت';

  @override
  String nudgeTitle(String app) {
    return '$app کی حد تقریباً پوری';
  }

  @override
  String nudgeText(String used, String limit) {
    return 'آج $limit میں سے $used استعمال ہو گئے';
  }

  @override
  String get homeUnblockAllFor => 'تمام ایپس کتنی دیر کے لیے کھولیں…';

  @override
  String homeMinutesN(int n) {
    return '$n منٹ';
  }

  @override
  String homeUnblockedLeft(String time) {
    return 'کھلی ہیں · $time باقی';
  }
}
