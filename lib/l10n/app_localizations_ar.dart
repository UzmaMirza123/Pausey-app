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
  String get ob7Title => 'هدف شاشتك اليومي';

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
  String alSummary(int locked, int total) {
    return '$locked مقيّد الآن · $total مُدار';
  }

  @override
  String alSummaryOff(int total) {
    return '$total مُدار · الحظر متوقف';
  }

  @override
  String get alFromInstalled => 'اختر من التطبيقات المثبّتة';

  @override
  String get alFromInstalledSub => 'اختر أي تطبيق على هذا الهاتف';

  @override
  String get alPermTitle => 'الحظر غير مفعّل بعد';

  @override
  String get alPermMsg =>
      'قواعدك محفوظة، لكن Pausey لا يستطيع حظر التطبيقات قبل منح هذين الإذنين:';

  @override
  String get alPermUsage => 'الوصول إلى الاستخدام';

  @override
  String get alPermUsageSub => 'لمعرفة التطبيق المفتوح ووقت اليوم فيه';

  @override
  String get alPermOverlay => 'العرض فوق التطبيقات الأخرى';

  @override
  String get alPermOverlaySub => 'لعرض شاشة القفل فوق التطبيق المحظور';

  @override
  String get alAllow => 'سماح';

  @override
  String get alAllowed => 'مسموح';

  @override
  String get alPermReturn => 'عد إلى Pausey بعد السماح، وسيتحقق تلقائيًا.';

  @override
  String get alAndroidOnly =>
      'الحظر يعمل على أندرويد فقط. يمكنك ضبط قواعدك هنا.';

  @override
  String get alSearchHint => 'ابحث عن تطبيق';

  @override
  String get alFilterAll => 'الكل';

  @override
  String get alFilterLocked => 'مقفل الآن';

  @override
  String get alFilterScheduled => 'مجدول';

  @override
  String get alFilterAvailable => 'متاح';

  @override
  String get alStateLocked => 'مقفل';

  @override
  String get alStateWillLock => 'سيُقفل';

  @override
  String get alStateScheduled => 'مجدول';

  @override
  String get alStateAvailable => 'متاح';

  @override
  String alUsedOf(String used, String limit) {
    return 'استُخدم $used من $limit';
  }

  @override
  String alUsedToday(String used) {
    return 'استُخدم $used اليوم';
  }

  @override
  String get alNoLimit => 'بلا حد يومي';

  @override
  String alLimitNoUsage(String limit) {
    return 'حد $limit يوميًا · الاستخدام غير متاح';
  }

  @override
  String get alRulesOff => 'القيود متوقفة';

  @override
  String alNextLock(String time) {
    return 'القفل التالي: $time';
  }

  @override
  String alUnlockedUntil(String time) {
    return 'مفتوح حتى $time';
  }

  @override
  String get alReasonLimit => 'تم بلوغ الحد اليومي';

  @override
  String get alReasonSchedule => 'جدول القفل نشط';

  @override
  String get alReasonGeneral => 'الجدول العام نشط';

  @override
  String get alReasonAllDay => 'مقفل طوال اليوم';

  @override
  String get alReasonFocus => 'جلسة تركيز جارية';

  @override
  String get alNoMatches => 'لا توجد تطبيقات مطابقة';

  @override
  String get alGeneral => 'عام';

  @override
  String get alGeneralScheduleSub =>
      'للتطبيقات التي فُعّل فيها «اتباع الجدول العام»';

  @override
  String get alLockAllSub => 'تشغيل القيود لكل التطبيقات';

  @override
  String get alSaved => 'تم الحفظ';

  @override
  String get alChangesApply => 'تُطبَّق التغييرات فورًا';

  @override
  String get alDetailsTitle => 'حدود التطبيق';

  @override
  String get alBlockingOff => 'الحظر متوقف على هذا الهاتف';

  @override
  String get alRestrictApp => 'تقييد هذا التطبيق';

  @override
  String get alMasterOff => 'متوقف — لن يقيّد Pausey هذا التطبيق';

  @override
  String get alMasterOnRules => 'يُطبَّق الحد والجداول أدناه';

  @override
  String get alMasterOnAllDay => 'لا حد ولا جدول بعد — مقفل طوال اليوم';

  @override
  String get alMasterOnGeneral => 'مقفل أثناء الجدول العام';

  @override
  String get alFollowGeneral => 'اتباع الجدول العام';

  @override
  String alFollowGeneralSub(String start, String end) {
    return 'قفل أيضًا $start – $end';
  }

  @override
  String get alGeneralOff => 'الجدول العام متوقف';

  @override
  String get alDailyLimit => 'الحد اليومي';

  @override
  String get alDailyLimitOffSub => 'اقفل التطبيق بعد وقت محدد يوميًا';

  @override
  String get alCustom => 'مخصص';

  @override
  String get alUsedLabel => 'المستخدم اليوم';

  @override
  String get alLeftLabel => 'المتبقي';

  @override
  String get alLimitReached => 'بلغت حد اليوم';

  @override
  String get alResets => 'يُعاد ضبطه عند منتصف الليل (وقت هاتفك)';

  @override
  String get alUsageUnavailable => 'الاستخدام غير متاح';

  @override
  String get alUsageNeedsAccess =>
      'اسمح بالوصول إلى الاستخدام ليحسب Pausey وقت اليوم.';

  @override
  String get alUsageAndroidOnly =>
      'يُقاس الاستخدام على أندرويد فقط. يُحفظ الحد ويُطبَّق هناك.';

  @override
  String get alGrantUsage => 'منح الوصول إلى الاستخدام';

  @override
  String get alCustomLimitTitle => 'حد يومي مخصص';

  @override
  String get alHours => 'ساعات';

  @override
  String get alMinutes => 'دقائق';

  @override
  String get alErrZeroLimit => 'اختر وقتًا أكبر من صفر';

  @override
  String get alSave => 'حفظ';

  @override
  String get alScheduledLocking => 'القفل المجدول';

  @override
  String get alScheduledOffSub => 'اقفل هذا التطبيق في أوقات محددة';

  @override
  String get alNoSchedules => 'لا جداول بعد';

  @override
  String get alAddSchedule => 'إضافة جدول';

  @override
  String get alActiveNow => 'نشط الآن';

  @override
  String get alScheduleDefault => 'وقت القفل';

  @override
  String get alEndsNextDay => 'ينتهي في اليوم التالي';

  @override
  String get alEdit => 'تعديل';

  @override
  String get alDelete => 'حذف';

  @override
  String get alDeleteScheduleQ => 'حذف هذا الجدول؟';

  @override
  String alDeleteScheduleMsg(String title) {
    return 'سيتوقف «$title» عن قفل هذا التطبيق.';
  }

  @override
  String get alNewSchedule => 'جدول جديد';

  @override
  String get alEditSchedule => 'تعديل الجدول';

  @override
  String get alTitleOptional => 'العنوان (اختياري)';

  @override
  String get alPresetStudy => 'دراسة';

  @override
  String get alPresetEvening => 'المساء';

  @override
  String get alPresetSleep => 'النوم';

  @override
  String get alRepeatOn => 'التكرار في';

  @override
  String get alErrSameTime => 'لا يمكن أن يتساوى البدء والانتهاء';

  @override
  String get alErrNoDays => 'اختر يومًا واحدًا على الأقل';

  @override
  String alTempUnlock(int minutes) {
    return 'فتح لمدة $minutes د';
  }

  @override
  String alTempUnlockSub(int n) {
    return 'يستهلك تجاوز طوارئ واحدًا · المتبقي اليوم $n';
  }

  @override
  String get alTempUnlockFocus => 'لا يمكن الفتح أثناء جلسة التركيز';

  @override
  String get alTempUnlockNotLocked => 'يلزم فقط عندما يكون التطبيق مقفلًا';

  @override
  String alTempUnlockQ(String app, int minutes) {
    return 'فتح $app لمدة $minutes دقيقة؟';
  }

  @override
  String get alUnlock => 'فتح';

  @override
  String get alEndEarly => 'إنهاء مبكرًا';

  @override
  String get alResetRules => 'إعادة ضبط القيود';

  @override
  String get alResetRulesSub => 'إزالة حد هذا التطبيق وجداوله';

  @override
  String alResetQ(String app) {
    return 'إعادة ضبط قيود $app؟';
  }

  @override
  String get alResetMsg =>
      'ستُزال الحدود اليومية وكل الجداول، ويبقى التطبيق في قائمتك.';

  @override
  String get alReset => 'إعادة ضبط';

  @override
  String get alResetDone => 'تمت إعادة ضبط القيود';

  @override
  String get alRemoveApp => 'إزالة التطبيق';

  @override
  String get alRemoveAppSub => 'التوقف عن إدارة هذا التطبيق';

  @override
  String alRemoveQ(String app) {
    return 'إزالة $app؟';
  }

  @override
  String get alRemoveMsg => 'سيتوقف Pausey عن تقييده وينسى حده وجداوله.';

  @override
  String get alRemove => 'إزالة';

  @override
  String get alNoPackage =>
      'تحتاج الحدود والجداول لكل تطبيق إلى تطبيق مثبّت محدد. على أندرويد أضفه عبر «اختر من التطبيقات المثبّتة».';

  @override
  String get alNotFound => 'لم يعد هذا التطبيق مُدارًا';

  @override
  String get alPickerTitle => 'التطبيقات المثبّتة';

  @override
  String get alPickerAdded => 'مضاف مسبقًا';

  @override
  String alPickerAdd(int n) {
    return 'إضافة التطبيقات ($n)';
  }

  @override
  String get alPickerEmpty => 'لم يُعثر على تطبيقات';

  @override
  String get blockTitle => 'قفل التطبيقات';

  @override
  String get blockAddApp => 'إضافة تطبيق';

  @override
  String get blockFaceIdTitle => 'حماية بصمة الوجه';

  @override
  String get blockFaceIdSub => 'اطلب بصمة الوجه لفتح أي تطبيق';

  @override
  String get blockFaceIdUnavailable => 'الفتح الحيوي غير متاح على هذا الجهاز';

  @override
  String get blockFaceIdReason => 'أكّد هويتك لتفعيل الحماية';

  @override
  String get blockFaceIdFailed => 'تعذّر التحقق — تبقى الحماية متوقفة';

  @override
  String get blockScheduleTitle => 'قفل مجدول';

  @override
  String get blockStart => 'وقت البدء';

  @override
  String get blockEnd => 'وقت الانتهاء';

  @override
  String get blockNeedOneDay => 'اترك يومًا واحدًا على الأقل';

  @override
  String get blockManagedApps => 'التطبيقات المُدارة';

  @override
  String get blockLockAll => 'قفل الكل';

  @override
  String get blockAllLocked => 'كل التطبيقات مقفلة';

  @override
  String blockRemoved(String app) {
    return 'تمت إزالة $app';
  }

  @override
  String get blockAppsUpdated => 'تم تحديث التطبيقات';

  @override
  String get blockCatSocial => 'تواصل';

  @override
  String get blockCatVideo => 'فيديو';

  @override
  String get blockCatGames => 'ألعاب';

  @override
  String get blockCatShopping => 'تسوق';

  @override
  String get blockCatCommunity => 'مجتمع';

  @override
  String get blockCatOther => 'أخرى';

  @override
  String get blockEmptyBadge => 'لا شيء محظور';

  @override
  String get blockEmptyTitle => 'لا توجد تطبيقات بعد';

  @override
  String get blockEmptyMsg =>
      'أضف التطبيقات الأكثر تشتيتًا وسيقفلها Pausey لك.';

  @override
  String get blockEmergencyTitle => 'تجاوز الطوارئ';

  @override
  String blockEmergencySub(int n) {
    return 'فتح كل التطبيقات مؤقتًا · المتبقي اليوم $n';
  }

  @override
  String get blockEmergencyOff => 'متوقف في الإعدادات';

  @override
  String get blockEmergencyUse => 'استخدام';

  @override
  String get blockEmergencyConfirmTitle => 'استخدام تجاوز الطوارئ؟';

  @override
  String blockEmergencyConfirmMsg(int n) {
    return 'سيستهلك هذا واحدًا من $n متبقية اليوم. استخدمه عند الحاجة فقط.';
  }

  @override
  String get blockEmergencyUsed => 'تم الاستخدام — التطبيقات مفتوحة الآن';

  @override
  String get blockEmergencyNone => 'لا يوجد المزيد اليوم';

  @override
  String get cvNoAccount => 'ليس لديك حساب؟';

  @override
  String get cvYourName => 'اسمك';

  @override
  String get cvAppsLoadFailed => 'تعذّرت قراءة التطبيقات على هذا الهاتف.';

  @override
  String get cvTryAgain => 'حاول مرة أخرى';

  @override
  String get cvGetStarted => 'ابدأ الآن';

  @override
  String get cvHaveAccount => 'لدي حساب بالفعل';

  @override
  String get cvWelcomeTitle => 'وقتك ملكك.';

  @override
  String get cvWelcomeBody => 'لنفسح مجالًا أكبر لما يهمك.';

  @override
  String get cvNext => 'التالي';

  @override
  String get cvSkipForNow => 'تخطَّ الآن';

  @override
  String get cvRelateTitle => 'هل يضيع وقتك؟';

  @override
  String get cvRelateSub => 'كن صريحًا، لا توجد إجابة خاطئة.';

  @override
  String get cvRelateOften => 'طوال الوقت';

  @override
  String get cvRelateSometimes => 'أحيانًا';

  @override
  String get cvRelateRarely => 'نادرًا';

  @override
  String get cvRelateReplyOften => 'لست وحدك. الهواتف مصممة لتُبقينا عليها.';

  @override
  String get cvRelateReplySometimes => 'يحدث هذا لمعظمنا، غالبًا دون أن ننتبه.';

  @override
  String get cvRelateReplyRarely => 'رائع. لنحافظ على ذلك.';

  @override
  String get cvRelateCta => 'هذا أنا';

  @override
  String get cvGoalTitle => 'وقت أكثر لأي شيء؟';

  @override
  String get cvGoalSub => 'اختر الأهم بالنسبة لك الآن.';

  @override
  String get cvGoalFocus => 'تركيز أفضل';

  @override
  String get cvGoalSleep => 'نوم أفضل';

  @override
  String get cvGoalScrolling => 'تصفح أقل';

  @override
  String get cvGoalMe => 'وقت أكثر لنفسي';

  @override
  String get cvGoalHabits => 'عادات يومية أصح';

  @override
  String get cvGoalOther => 'شيء آخر';

  @override
  String get cvGoalOtherHint => 'لأي شيء تريد وقتًا أكثر؟';

  @override
  String get cvGoalReplyFocus =>
      'إذن التركيز. سنحمي الوقت الذي تحتاجه للعمل العميق.';

  @override
  String get cvGoalReplySleep =>
      'النوم الجيد يبدأ قبل الذهاب إلى الفراش. سنساعد أمسياتك على الهدوء.';

  @override
  String get cvGoalReplyScrolling => 'لنجعل التصفح اختيارًا، لا عادة.';

  @override
  String get cvGoalReplyMe => 'الوقت لنفسك مهم. لنجد بعضًا منه.';

  @override
  String get cvGoalReplyHabits => 'الخطوات الصغيرة تتراكم. سنجعلها سهلة.';

  @override
  String get cvGoalReplyOther => 'فهمت. سنرتب كل شيء حول ذلك.';

  @override
  String get cvAppsTitle => 'أي التطبيقات تشتتك؟';

  @override
  String get cvAppsSubReal => 'هذه تطبيقات على هذا الهاتف. اختر ما تشاء منها.';

  @override
  String get cvAppsSubPopular =>
      'تطبيقات شائعة تأخذ الكثير من الوقت غالبًا. اختر ما ينطبق عليك.';

  @override
  String get cvAppsSearch => 'ابحث عن التطبيقات';

  @override
  String cvAppsReply(String apps) {
    return 'سجّلنا: $apps. سنبدأ بهذه.';
  }

  @override
  String cvAnd(String a, String b) {
    return '$a و $b';
  }

  @override
  String cvAndMore(String a, String b, int count) {
    return '$a و $b و $count غيرها';
  }

  @override
  String get cvStTitle => 'وقت شاشتك اليومي';

  @override
  String get cvStSub => 'التخمين يكفي. يبقى هذا على هاتفك.';

  @override
  String cvStMeasured(String time) {
    return 'المُقاس على هذا الهاتف اليوم حتى الآن: $time';
  }

  @override
  String get cvStUnder2 => 'أقل من ساعتين';

  @override
  String get cvSt2to4 => 'من 2 إلى 4 ساعات';

  @override
  String get cvSt4to6 => 'من 4 إلى 6 ساعات';

  @override
  String get cvStOver6 => 'أكثر من 6 ساعات';

  @override
  String get cvStNotSure => 'لست متأكدًا';

  @override
  String get cvStReplyUnder2 => 'هذا توازن جيد. سنساعدك على الحفاظ عليه.';

  @override
  String get cvStReply2to4 => 'بعض التغييرات الصغيرة قد توفر لك وقتًا حقيقيًا.';

  @override
  String get cvStReply4to6 => 'هذا جزء كبير من يومك. لنستعد بعضًا منه لك.';

  @override
  String get cvStReplyOver6 => 'هذا جزء كبير من اليوم، لذا سنبدأ بخطوات صغيرة.';

  @override
  String get cvStReplyNotSure =>
      'لا مشكلة. يمكن لـ Pausey قياسه بعد السماح بالوصول إلى الاستخدام.';

  @override
  String get cvPhraseFocus => 'مزيد من التركيز';

  @override
  String get cvPhraseSleep => 'نوم أفضل';

  @override
  String get cvPhraseScrolling => 'تصفح أقل';

  @override
  String get cvPhraseMe => 'مزيد من الوقت لنفسك';

  @override
  String get cvPhraseHabits => 'عادات أصح';

  @override
  String get cvPhraseOther => 'مساحة أكبر لما يهمك';

  @override
  String cvPhraseOtherNamed(String thing) {
    return 'مزيد من الوقت لـ $thing';
  }

  @override
  String cvReflectApps(String goal, String apps) {
    return 'هدفك $goal، لكنك تنجذب دائمًا إلى $apps.';
  }

  @override
  String cvReflectNoApps(String goal) {
    return 'هدفك $goal، وأحيانًا يقف هاتفك في الطريق.';
  }

  @override
  String cvReflectEstimate(String time) {
    return 'نحو $time يوميًا (تقديرك)';
  }

  @override
  String cvReflectMeasured(String time) {
    return '$time اليوم حتى الآن (مُقاس)';
  }

  @override
  String get cvReflectHelp =>
      'يمكن لـ Pausey مساعدتك في بناء روتين يمنح انتباهك مساحة للتنفس.';

  @override
  String get cvShowMeHow => 'أرني كيف';

  @override
  String get cvHowTitle => 'هكذا يساعدك Pausey';

  @override
  String get cvHowPauseTab => 'توقف';

  @override
  String get cvHowLimitTab => 'الحدود';

  @override
  String get cvHowFocusTab => 'التركيز';

  @override
  String get cvHowPauseTitle => 'استراحة هادئة، لا عقاب';

  @override
  String get cvHowPauseBody =>
      'عندما ينتهي وقت تطبيق، يغطيه Pausey بشاشة توقف هادئة مع طريقة للخروج.';

  @override
  String get cvHowLimitTitle => 'حصة يومية لكل تطبيق';

  @override
  String get cvHowLimitBody =>
      'امنح كل تطبيق وقته اليومي وأوقات قفله الخاصة. تغيير أحدها لا يغيّر الآخر أبدًا.';

  @override
  String get cvHowFocusTitle => 'جلسات التركيز';

  @override
  String get cvHowFocusBody =>
      'ابدأ مؤقتًا للعمل أو الدراسة أو الراحة. تبقى تطبيقاتك المختارة متوقفة حتى ينتهي.';

  @override
  String get cvPreview => 'معاينة';

  @override
  String get cvYourApp => 'تطبيقك';

  @override
  String get cvAnotherApp => 'تطبيق آخر';

  @override
  String cvMinOf(int used, int limit) {
    return '$used من $limit د';
  }

  @override
  String get cvBuildPlan => 'أنشئ خطتي';

  @override
  String get cvPlanTitle => 'إليك بداية لطيفة';

  @override
  String get cvPlanSub => 'مقترح بناءً على إجاباتك. غيّر ما تشاء.';

  @override
  String get cvPlanFocus => 'جلسة تركيز';

  @override
  String cvPlanFocusSub(String time) {
    return '$time لكل جلسة';
  }

  @override
  String get cvPlanDaily => 'هدف التركيز اليومي';

  @override
  String cvPlanDailySub(String time) {
    return '$time من التركيز يوميًا';
  }

  @override
  String get cvPlanLimit => 'حد يومي للتطبيق';

  @override
  String cvPlanLimitSub(String app, String time) {
    return '$app: $time يوميًا';
  }

  @override
  String get cvPlanLimitNoPkg =>
      'هذا التطبيق ليس في قائمة الهاتف، لذا يمكن ضبط الحد لاحقًا في قفل التطبيقات.';

  @override
  String get cvPlanWind => 'تهدئة المساء';

  @override
  String cvPlanWindSub(String start, String end) {
    return 'تتوقف تطبيقاتك المختارة من $start إلى $end';
  }

  @override
  String get cvPlanOff => 'متوقف';

  @override
  String get cvStarts => 'يبدأ';

  @override
  String get cvEnds => 'ينتهي';

  @override
  String get cvPlanNote =>
      'لم يُفعَّل شيء بعد. يبدأ فقط عند إنهاء الإعداد، ويمكنك تغييره في أي وقت.';

  @override
  String get cvUsePlan => 'استخدم هذه الخطة';

  @override
  String get cvPermTitle => 'بعض الأذونات تجعل هذا يعمل';

  @override
  String get cvPermSub =>
      'كل واحد يفتح إعدادات Android. فعّله هناك ثم عد إلى هنا.';

  @override
  String get cvPermUnsupported =>
      'حدود التطبيقات وشاشات التوقف تعمل على هواتف Android. وكل ما عدا ذلك يعمل هنا أيضًا.';

  @override
  String get cvPermUsageTitle => 'الوصول إلى الاستخدام';

  @override
  String get cvPermUsageWhy =>
      'يتيح لـ Pausey معرفة مدة فتح كل تطبيق اليوم والتطبيق الظاهر على الشاشة.';

  @override
  String get cvPermUsageWithout =>
      'بدونه، لا يستطيع Pausey قياس وقت الشاشة أو معرفة متى يُبلغ الحد.';

  @override
  String get cvPermOverlayTitle => 'العرض فوق التطبيقات الأخرى';

  @override
  String get cvPermOverlayWhy =>
      'يتيح لـ Pausey عرض شاشة التوقف فوق التطبيق عند انتهاء وقته.';

  @override
  String get cvPermOverlayWithout =>
      'بدونه، لا يمكن إيقاف التطبيقات مؤقتًا. ستُحفظ خطتك لوقت لاحق.';

  @override
  String get cvPermBatteryTitle => 'أبقِ Pausey قيد التشغيل';

  @override
  String get cvPermBatteryWhy =>
      'توقف بعض الهواتف التطبيقات في الخلفية لتوفير البطارية. السماح لـ Pausey يُبقي حدودك فعّالة.';

  @override
  String get cvPermBatteryWithout =>
      'بدونه، قد تتوقف الحدود عن العمل حتى تفتح Pausey مجددًا.';

  @override
  String get cvPermLater => 'يمكنك تغيير هذا لاحقًا من إعدادات Android.';

  @override
  String get cvPermPrivacy =>
      'يقرأ Pausey أسماء التطبيقات وأوقاتها فقط. لا شيء يغادر هاتفك.';

  @override
  String get cvAllowInSettings => 'اسمح من الإعدادات';

  @override
  String get cvAllowed => 'مسموح';

  @override
  String get cvOptional => 'اختياري';

  @override
  String get cvContinueAnyway => 'تابع الآن';

  @override
  String get cvAccountTitle => 'احتفظ بتقدمك';

  @override
  String get cvAccountSub => 'استخدم Pausey كضيف، أو سجّل الدخول.';

  @override
  String get cvNameLabel => 'اسمك (اختياري)';

  @override
  String get cvNameHint => 'بماذا نناديك؟';

  @override
  String get cvContinueGuest => 'المتابعة كضيف';

  @override
  String get cvAccountNote =>
      'تسجيل الدخول لا ينسخ بياناتك احتياطيًا بعد. في الحالتين، تبقى إعداداتك على هذا الهاتف.';

  @override
  String get cvReadyTitle => 'خطوتك الأولى تبدأ من هنا.';

  @override
  String cvReadyTitleNamed(String name) {
    return '$name، خطوتك الأولى تبدأ من هنا.';
  }

  @override
  String get cvReadyFocus => 'لنفسح مجالًا أكبر قليلًا للتركيز.';

  @override
  String get cvReadySleep => 'لنجعل أمسياتك أهدأ قليلًا.';

  @override
  String get cvReadyScrolling => 'لنمنح التصفح جزءًا أقل قليلًا من يومك.';

  @override
  String get cvReadyMe => 'لنصنع وقتًا أكثر قليلًا لك.';

  @override
  String get cvReadyHabits => 'لنبنِ عادات تشعرك بالرضا.';

  @override
  String get cvReadyOther => 'لنفسح مجالًا أكبر لما يهمك.';

  @override
  String get cvYourPlan => 'خطتك';

  @override
  String cvSumGoal(String goal) {
    return 'الهدف: $goal';
  }

  @override
  String cvSumApps(String apps) {
    return 'التطبيقات: $apps';
  }

  @override
  String cvSumFocus(String session, String daily) {
    return 'جلسات تركيز مدتها $session، و $daily يوميًا';
  }

  @override
  String get cvReadyNeedsPerm =>
      'حُفظت حدود التطبيقات، لكنها لن تعمل حتى تسمح بالإذنين.';

  @override
  String get cvReadyChange => 'يمكنك تغيير كل هذا لاحقًا.';

  @override
  String get cvStartFirstFocus => 'ابدأ أول جلسة تركيز';

  @override
  String get cvFinishLimits => 'أكمل إعداد حدود التطبيقات';

  @override
  String cvPermCount(int done, int total) {
    return 'تم السماح بـ $done من $total';
  }

  @override
  String get cvAppsTrayEmpty => 'اضغط على التطبيقات التي تشدّك';

  @override
  String cvAppsTray(int count) {
    return 'تطبيقات للإيقاف: $count';
  }

  @override
  String cvLifeTitle(String years) {
    return '$years سنوات على هاتفك';
  }

  @override
  String cvLifeSub(String time) {
    return 'بمعدل $time يوميًا، خلال الخمسين عامًا القادمة. كل نقطة جزء من حياتك اليقظة.';
  }

  @override
  String get cvLifeHold => 'اضغط مطولًا لاستعادتها';

  @override
  String get cvLifeDone => 'استعدتها. لنحمِها معًا.';

  @override
  String get cvPermAllowed => 'مسموح';

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
  String get logInTitle => 'سجّل الدخول إلى حسابك';

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
  String get ob6OtherHint => 'اكتب مهنتك';

  @override
  String get timeSecondLabel => 'ثانية';

  @override
  String get focusModePomodoro => 'بومودورو';

  @override
  String get focusModeDeep => 'تركيز عميق';

  @override
  String get focusModeCustom => 'مخصص';

  @override
  String get focusRemaining => 'المتبقي';

  @override
  String get focusBreakLabel => 'استراحة';

  @override
  String get focusReadyLabel => 'جاهز';

  @override
  String get focusInSession => 'الجلسة جارية';

  @override
  String get focusPausedState => 'متوقف مؤقتًا';

  @override
  String get focusOnBreak => 'في استراحة';

  @override
  String get focusIdleState => 'اضغط تشغيل للبدء';

  @override
  String get focusSessionsDone => 'جلسات مكتملة';

  @override
  String get focusProgress => 'التقدم';

  @override
  String get focusBreakAfter => 'استراحة بعدها';

  @override
  String get focusFocusedToday => 'تركيز اليوم';

  @override
  String focusAppsBlocked(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تطبيقات محظورة',
      one: 'تطبيق واحد محظور',
    );
    return '$_temp0';
  }

  @override
  String get focusAppsBlockedSub => 'المشتتات مقفلة خلال هذه الجلسة.';

  @override
  String get focusNoApps => 'لا توجد تطبيقات محظورة';

  @override
  String get focusNoAppsSub => 'اختر تطبيقات لقفلها أثناء التركيز.';

  @override
  String get focusEdit => 'تعديل';

  @override
  String get focusAdd => 'إضافة';

  @override
  String get focusAmbient => 'صوت محيطي';

  @override
  String get focusSoundOff => 'إيقاف';

  @override
  String get focusSoundRain => 'مطر';

  @override
  String get focusSoundForest => 'غابة';

  @override
  String get focusSoundWaves => 'أمواج البحر';

  @override
  String get focusSoundWhite => 'ضوضاء بيضاء';

  @override
  String get focusVolume => 'مستوى الصوت';

  @override
  String get focusStart => 'ابدأ';

  @override
  String get focusPause => 'إيقاف مؤقت';

  @override
  String get focusResume => 'استئناف';

  @override
  String get focusStop => 'إيقاف';

  @override
  String get focusRestart => 'إعادة البدء';

  @override
  String get focusSkipBreak => 'تخطي الاستراحة';

  @override
  String get focusDurations => 'مدة الجلسات';

  @override
  String focusMinutesN(int n) {
    return '$n د';
  }

  @override
  String get focusBreakLength => 'استراحة';

  @override
  String get focusCustomTitle => 'مدة مخصصة';

  @override
  String get focusSet => 'تعيين';

  @override
  String get focusStopTitle => 'إنهاء الجلسة مبكرًا؟';

  @override
  String get focusStopBody => 'سيُحفظ الوقت الذي ركزت فيه حتى الآن.';

  @override
  String get focusEndSession => 'إنهاء الجلسة';

  @override
  String get focusKeepGoing => 'تابع';

  @override
  String get focusTooShort => 'أقل من دقيقة — لم يُحفظ.';

  @override
  String get focusBreakOver => 'انتهت الاستراحة — مستعد للجلسة التالية؟';

  @override
  String get focusBusy => 'أنهِ الجلسة الحالية لتغيير الوضع.';

  @override
  String get focusFirstHint => 'جلستك الأولى تبدأ هنا — اضغط تشغيل.';

  @override
  String get focusCompleteA => 'الجلسة';

  @override
  String get focusCompleteB => 'مكتملة!';

  @override
  String get focusEndedTitle => 'انتهت الجلسة';

  @override
  String focusCompleteMsg(String mode) {
    return 'عمل رائع! أنهيت جلسة $mode دون أي تشتيت.';
  }

  @override
  String get focusEndedMsg => 'كل دقيقة مهمة. جرّب جلسة كاملة المرة القادمة.';

  @override
  String get focusDurationLabel => 'مدة التركيز';

  @override
  String get focusMinUnit => 'دقيقة';

  @override
  String get focusDayStreak => 'أيام متتالية';

  @override
  String get focusAppsLabel => 'تطبيقات محظورة';

  @override
  String get focusTodayGoal => 'هدف اليوم';

  @override
  String focusPctCompleted(int pct) {
    return 'اكتمل $pct%';
  }

  @override
  String focusPlusPct(int pct) {
    return '+$pct% من هذه الجلسة';
  }

  @override
  String get focusMomentum => 'حافظ على الزخم!';

  @override
  String get focusQuote1 =>
      'الاستمرارية تتفوق على الشدة. كل جلسة تبني الإتقان.';

  @override
  String get focusQuote2 => 'فترات التركيز الصغيرة تصنع نتائج كبيرة.';

  @override
  String get focusQuote3 => 'لم تتصفح — بل أنجزت. كررها.';

  @override
  String get focusStartNext => 'ابدأ الجلسة التالية';

  @override
  String get focusBackHome => 'العودة للرئيسية';

  @override
  String get goalsTitle => 'أهدافي';

  @override
  String goalsSubtitle(int active, int done) {
    return '$active نشطة · $done مكتملة';
  }

  @override
  String get goalsAdd => 'إضافة هدف';

  @override
  String get goalsCompleted => 'مكتملة';

  @override
  String get goalsActive => 'نشطة';

  @override
  String get goalsStreak => 'السلسلة';

  @override
  String get goalsOverall => 'الإنجاز الإجمالي';

  @override
  String goalsWeeklyHit(int hit, int total) {
    return 'تحقق $hit من $total أهداف أسبوعية';
  }

  @override
  String goalsVsLastWeek(String delta) {
    return '$delta عن الأسبوع الماضي';
  }

  @override
  String get goalsFilterAll => 'الكل';

  @override
  String get goalsDone => 'تم';

  @override
  String get goalsCatFocus => 'تركيز';

  @override
  String get goalsCatDiscipline => 'انضباط';

  @override
  String get goalsCatWellness => 'عافية';

  @override
  String goalsTitleFocusHours(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'تركيز يومي: $n ساعات',
      one: 'تركيز يومي: ساعة واحدة',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleFocusDur(String duration) {
    return 'تركيز يومي: $duration';
  }

  @override
  String get goalsTitleBlock => 'حظر تطبيقات التواصل';

  @override
  String goalsTitleSessions(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n بومودورو يوميًا',
      one: 'بومودورو واحد يوميًا',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleScreen(String duration) {
    return 'وقت شاشة أقل من $duration';
  }

  @override
  String get goalsTitlePhoneFree => 'وقت بلا هاتف';

  @override
  String goalsDescFocus(String duration) {
    return 'حقق $duration من التركيز العميق يوميًا';
  }

  @override
  String goalsDescBlock(int n) {
    return 'أبقِ التطبيقات مقفلة $n أيام في الأسبوع';
  }

  @override
  String goalsDescSessions(int n) {
    return 'أكمل $n جلسات تركيز على الأقل يوميًا';
  }

  @override
  String goalsDescScreen(String duration) {
    return 'اجعل استخدام الهاتف اليومي أقل من $duration';
  }

  @override
  String goalsDescPhoneFree(int n) {
    return 'عِش $n أيام بلا هاتف أسبوعيًا — سجّل كل يوم';
  }

  @override
  String goalsProgressDays(int done, int total) {
    return '$done / $total أيام';
  }

  @override
  String goalsProgressSessions(int done, int total) {
    return '$done / $total جلسات';
  }

  @override
  String goalsStreakShort(int n) {
    return '$n ي';
  }

  @override
  String goalsStreakN(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'سلسلة $n أيام',
    );
    return '$_temp0';
  }

  @override
  String get goalsCheckIn => 'تحديد اليوم كمكتمل';

  @override
  String get goalsCheckedIn => 'تم اليوم';

  @override
  String get goalsCheckedSnack => 'رائع! تم تحديد اليوم كمكتمل.';

  @override
  String get goalsUncheckedSnack => 'تم إلغاء تحديد اليوم.';

  @override
  String get goalsCreateNew => 'إنشاء هدف جديد';

  @override
  String get goalsEmptyBadge => 'ابدأ';

  @override
  String get goalsEmptyTitle => 'لا أهداف بعد';

  @override
  String get goalsEmptyMsg => 'حدد هدفًا يوميًا صغيرًا وسيتابعه Pausey لك.';

  @override
  String get goalsFilterEmpty => 'لا أهداف تطابق هذا الفلتر.';

  @override
  String get goalsNewGoal => 'هدف جديد';

  @override
  String get goalsEditGoal => 'تعديل الهدف';

  @override
  String get goalsType => 'نوع الهدف';

  @override
  String get goalsTypeFocus => 'وقت التركيز';

  @override
  String get goalsTypeSessions => 'جلسات التركيز';

  @override
  String get goalsTypeBlock => 'حظر التطبيقات';

  @override
  String get goalsTypePhoneFree => 'أيام بلا هاتف';

  @override
  String get goalsTypeScreen => 'حد وقت الشاشة';

  @override
  String get goalsCategory => 'الفئة';

  @override
  String get goalsTarget => 'المستهدف';

  @override
  String get goalsPerDay => 'يوميًا';

  @override
  String get goalsPerWeek => 'أيام في الأسبوع';

  @override
  String get goalsMaxPerDay => 'الحد الأقصى يوميًا';

  @override
  String get goalsTitleOptional => 'العنوان (اختياري)';

  @override
  String get goalsSave => 'حفظ الهدف';

  @override
  String get goalsCreate => 'إنشاء الهدف';

  @override
  String get goalsSavedSnack => 'تم حفظ الهدف';

  @override
  String get goalsCreatedSnack => 'تم إنشاء الهدف';

  @override
  String get goalsEdit => 'تعديل';

  @override
  String get goalsDelete => 'حذف الهدف';

  @override
  String get goalsDeleteQ => 'حذف هذا الهدف؟';

  @override
  String get goalsDeleteMsg => 'ستُحذف تسجيلاته. لا يمكن التراجع.';

  @override
  String get goalsDeletedSnack => 'تم حذف الهدف';

  @override
  String get goalsComplete => 'مكتمل';

  @override
  String get goalsDaysActive => 'أيام النشاط';

  @override
  String get goalsTotalTime => 'الوقت الكلي';

  @override
  String get goalsSessionsLabel => 'الجلسات';

  @override
  String get goals7Day => 'إنجاز 7 أيام';

  @override
  String get goals7DaysAgo => 'قبل 7 أيام';

  @override
  String get goalsToday => 'اليوم';

  @override
  String goalsTodayDate(String date) {
    return 'اليوم، $date';
  }

  @override
  String goalsYesterdayDate(String date) {
    return 'أمس، $date';
  }

  @override
  String get goalsMilestones => 'المراحل';

  @override
  String get goalsMsFirst => 'إكمال أول يوم';

  @override
  String get goalsMs3 => 'سلسلة 3 أيام';

  @override
  String get goalsMsHalf => '50% من هدف الأسبوع';

  @override
  String get goalsMs5 => 'سلسلة 5 أيام';

  @override
  String get goalsMsWeek => 'إكمال أسبوع كامل';

  @override
  String get goalsMsLocked => 'ليس بعد';

  @override
  String get goalsHistory => 'سجل النشاط';

  @override
  String get goalsShowLess => 'عرض أقل';

  @override
  String get goalsStartSession => 'ابدأ جلسة تركيز';

  @override
  String get goalsManageApps => 'إدارة التطبيقات المحظورة';

  @override
  String get goalsBlockHint =>
      'يُحتسب تلقائيًا عند تفعيل جدول القفل وقفل التطبيقات.';

  @override
  String goalsScreenToday(String used) {
    return 'وقت الشاشة اليوم: $used';
  }

  @override
  String get goalsNotFound => 'هذا الهدف لم يعد موجودًا.';

  @override
  String get goalsMore => 'خيارات أخرى';

  @override
  String goalsFreeLimit(int n) {
    return 'الخطة المجانية: حتى $n أهداف';
  }

  @override
  String get homeGoodMorning => 'صباح الخير';

  @override
  String get homeGoodAfternoon => 'مساء الخير';

  @override
  String get homeGoodEvening => 'مساء الخير';

  @override
  String get homeFriend => 'صديقي';

  @override
  String get homeTodayFocus => 'تركيز اليوم';

  @override
  String homeVsYesterday(String pct) {
    return '$pct% مقارنة بالأمس';
  }

  @override
  String get homeStartToday => 'لا تركيز اليوم بعد';

  @override
  String get homeDayStreak => 'أيام متتالية';

  @override
  String get homeTodayGoal => 'هدف اليوم';

  @override
  String homePctCompleted(int pct) {
    return 'اكتمل $pct%';
  }

  @override
  String get homeOnTrack => 'على المسار!';

  @override
  String get homeKeepGoing => 'واصل';

  @override
  String get homeGoalMet => 'تحقق الهدف!';

  @override
  String get homeScreenTimeTitle => 'وقت الشاشة';

  @override
  String get homeToday => 'اليوم';

  @override
  String homeVsAvg(String pct) {
    return '$pct% مقارنة بالمتوسط';
  }

  @override
  String get homeQuickStart => 'ابدأ جلسة تركيز سريعة';

  @override
  String get homeManage => 'إدارة';

  @override
  String get homeNoApps => 'اختر التطبيقات الأكثر إلهاءً واقفلها هنا.';

  @override
  String get homeAddApps => 'أضف تطبيقات';

  @override
  String homeAppLocked(String app) {
    return 'تم قفل $app';
  }

  @override
  String homeAppUnlocked(String app) {
    return 'تم فتح $app';
  }

  @override
  String homeLockApp(String app) {
    return 'قفل أو فتح $app';
  }

  @override
  String get homeUpgradeTitle => 'الترقية إلى بريميوم';

  @override
  String get homeUpgradeBody => 'حظر وأهداف غير محدودة وتحليلات عميقة.';

  @override
  String get homeTryFree => 'جرّب مجانًا';

  @override
  String get homePro => 'PRO';

  @override
  String get homeProActive => 'Pausey Pro مفعّل';

  @override
  String get homeProActiveBody => 'كل الميزات مفتوحة. شكرًا لدعمك!';

  @override
  String get homeNotifications => 'الإشعارات';

  @override
  String get homeNoNotifications => 'لا توجد إشعارات جديدة.';

  @override
  String get homePushLabel => 'الإشعارات الفورية';

  @override
  String get homeFocusReminder => 'تذكير التركيز اليومي';

  @override
  String get homeStreakAlerts => 'تنبيهات السلسلة';

  @override
  String get homePwTitle => 'افتح Pausey Pro';

  @override
  String get homePwSubtitle => 'استعد تركيزك وتغلّب على إدمان الهاتف.';

  @override
  String get homePwMonthly => 'شهري';

  @override
  String get homePwBilledMonthly => 'يُدفع شهريًا';

  @override
  String get homePwYearly => 'سنوي';

  @override
  String get homePwPopular => 'الأكثر شيوعًا';

  @override
  String homePwSave(int pct) {
    return 'وفّر $pct%';
  }

  @override
  String homePwBilledYearly(String price) {
    return '$price تُدفع سنويًا';
  }

  @override
  String get homePwLifetime => 'مدى الحياة';

  @override
  String get homePwBestValue => 'أفضل قيمة';

  @override
  String get homePwPayOnce => 'ادفع مرة واحدة، للأبد';

  @override
  String get homePwPerMonth => '/ شهر';

  @override
  String get homePwOnce => 'مرة واحدة';

  @override
  String get homePwStartTrial => 'ابدأ تجربة مجانية 7 أيام';

  @override
  String get homePwBuyLifetime => 'احصل على وصول دائم';

  @override
  String get homePwNoCharge => 'لا رسوم اليوم · ألغِ في أي وقت';

  @override
  String get homePwOneTime => 'دفعة واحدة · بلا اشتراك';

  @override
  String get homePwFree => 'مجاني';

  @override
  String get homePwProCol => 'Pro';

  @override
  String get homePwFeatBlocking => 'حظر غير محدود للتطبيقات';

  @override
  String get homePwFeatSessions => 'كل أوضاع التركيز';

  @override
  String get homePwFeatGoals => 'أهداف غير محدودة';

  @override
  String get homePwFeatAnalytics => 'تحليلات متقدمة';

  @override
  String get homePwFeatStreak => 'حماية السلسلة';

  @override
  String get homePwFeatSchedule => 'جدولة التركيز';

  @override
  String get homePwFeatFaceId => 'قفل التطبيقات ببصمة الوجه';

  @override
  String get homePwFeatNotif => 'إشعارات ذكية';

  @override
  String homePwMax(int n) {
    return '$n كحد أقصى';
  }

  @override
  String get homePwSecure => 'دفع آمن';

  @override
  String get homePwCancelAnytime => 'ألغِ في أي وقت';

  @override
  String get homePwPrivacyFirst => 'الخصوصية أولًا';

  @override
  String get homePwRestore => 'استعادة المشتريات';

  @override
  String get homePwTerms => 'شروط الخدمة';

  @override
  String get homePwPrivacyPolicy => 'سياسة الخصوصية';

  @override
  String get homePwWelcome => 'مرحبًا بك في Pausey Pro!';

  @override
  String get homePwNothingToRestore => 'لم يتم العثور على مشتريات سابقة.';

  @override
  String get homePwRestored => 'وصول Pro مفعّل لديك.';

  @override
  String get homePwLinkSoon => 'ستُفتح هذه الصفحة على موقعنا قريبًا.';

  @override
  String get homePwYouArePro => 'أنت Pro — استمتع!';

  @override
  String get homePwClose => 'إغلاق';

  @override
  String get homeAvgLegend => 'متوسط 7 أيام';

  @override
  String homeGoalOf(String done, String goal) {
    return '$done من $goal';
  }

  @override
  String get homeBest => 'الأفضل:';

  @override
  String get homeMyApps => 'تطبيقاتي';

  @override
  String get homeManageApps => 'إدارة التطبيقات';

  @override
  String get homeUnblockApps => 'إلغاء حظر التطبيقات';

  @override
  String homeAppsLocked(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تطبيقًا مقفلًا',
      few: '$count تطبيقات مقفلة',
      two: 'تطبيقان مقفلان',
      one: 'تطبيق واحد مقفل',
    );
    return '$_temp0';
  }

  @override
  String homeAppNamesMore(String names, int count) {
    return '$names +$count';
  }

  @override
  String get homeNoLockedApps => 'لا توجد تطبيقات مقفلة بعد';

  @override
  String get homeNoLockedAppsSub => 'اختر التطبيقات التي تشدّك';

  @override
  String get insightsAnalytics => 'التحليلات';

  @override
  String get insightsScreenTime => 'وقت الشاشة';

  @override
  String get insightsToday => 'اليوم';

  @override
  String get insightsWeek => 'أسبوع';

  @override
  String get insightsMonth => 'شهر';

  @override
  String get insightsProductivity => 'نقاط الإنتاجية';

  @override
  String insightsPts(String delta) {
    return '$delta نقطة';
  }

  @override
  String get insightsVsLastWeek => 'مقارنة بالأسبوع الماضي';

  @override
  String get insightsVsLastMonth => 'مقارنة بالشهر الماضي';

  @override
  String insightsScoreDays(int n) {
    return 'نقاط $n يوم';
  }

  @override
  String get insightsFocusHours => 'ساعات التركيز';

  @override
  String get insightsThisWeek => 'هذا الأسبوع';

  @override
  String get insightsThisMonth => 'هذا الشهر';

  @override
  String insightsGoalOf(String done, String goal) {
    return '$done / $goal الهدف';
  }

  @override
  String get insightsFocusScore => 'نقاط التركيز';

  @override
  String get insightsGoals => 'الأهداف';

  @override
  String get insightsConsistency => 'الانتظام';

  @override
  String get insightsWeeklyFocus => 'ساعات التركيز الأسبوعية';

  @override
  String insightsDailyFocus(int n) {
    return 'التركيز اليومي، آخر $n يومًا';
  }

  @override
  String insightsBestDay(String day, String time) {
    return 'أفضل يوم: $day · $time';
  }

  @override
  String insightsAvgDay(String time) {
    return 'المتوسط $time / يوم';
  }

  @override
  String get insightsMonthlyTrends => 'الاتجاهات الشهرية';

  @override
  String get insightsActual => 'الفعلي';

  @override
  String get insightsGoal => 'الهدف';

  @override
  String insightsWk(int n) {
    return 'أ$n';
  }

  @override
  String insightsWeekBeat(int n, String time) {
    return 'الأسبوع $n تجاوز الهدف بـ $time';
  }

  @override
  String insightsWeekShort(int n, String time) {
    return 'أفضل أسبوع $n، أقل من الهدف بـ $time';
  }

  @override
  String get insightsGoalCompletion => 'إنجاز الأهداف';

  @override
  String insightsDaysOf(int done, int total) {
    return '$done/$total أيام';
  }

  @override
  String get insightsNoGoals => 'لا أهداف بعد. أضف هدفًا لترى تقدمك هنا.';

  @override
  String get insightsManageGoals => 'إدارة';

  @override
  String insightsGoalFocus(String hours) {
    return 'تركيز يومي: $hours ساعات';
  }

  @override
  String get insightsGoalBlock => 'حظر تطبيقات التواصل';

  @override
  String insightsGoalPomo(int n) {
    return '$n بومودورو يوميًا';
  }

  @override
  String insightsGoalScreen(String time) {
    return 'وقت شاشة أقل من $time';
  }

  @override
  String get insightsGoalPhoneFree => 'وقت بلا هاتف';

  @override
  String get insightsEmptyBadge => 'لا جلسات بعد';

  @override
  String get insightsEmptyTitle => 'تبدأ إحصاءاتك بجلسة واحدة';

  @override
  String get insightsEmptyBody =>
      'أكمل جلسة تركيز وستظهر هنا نقاطك ورسومك وتقدم أهدافك.';

  @override
  String get insightsEmptyCta => 'ابدأ جلسة تركيز';

  @override
  String get insightsDailyUsage => 'الاستخدام اليومي';

  @override
  String get insightsFocusTime => 'وقت التركيز';

  @override
  String get insightsVsAvg => 'مقارنة بالمتوسط';

  @override
  String get insightsUsageByDay => 'الاستخدام حسب اليوم';

  @override
  String get insightsUsageByWeek => 'الاستخدام حسب الأسبوع';

  @override
  String get insightsUsage => 'الاستخدام';

  @override
  String insightsTrend(int n) {
    return 'اتجاه $n يومًا';
  }

  @override
  String get insightsImproving => 'يتحسن';

  @override
  String get insightsRising => 'يرتفع';

  @override
  String insightsDaysAgo(int n) {
    return 'قبل $n يومًا';
  }

  @override
  String get insightsMostUsed => 'الأكثر استخدامًا';

  @override
  String get insightsAllApps => 'كل التطبيقات';

  @override
  String get insightsBreakdown => 'توزيع الاستخدام';

  @override
  String get insightsTotal => 'الإجمالي';

  @override
  String get insightsNoUsage => 'لا يوجد وقت شاشة مسجل لهذه الفترة.';

  @override
  String get insightsLockApp => 'قفل هذا التطبيق';

  @override
  String insightsLocked(String app) {
    return 'تم قفل $app';
  }

  @override
  String get insightsCatSocial => 'تواصل';

  @override
  String get insightsCatVideo => 'فيديو';

  @override
  String get insightsCatGames => 'ألعاب';

  @override
  String get insightsCatShopping => 'تسوق';

  @override
  String get insightsCatCommunity => 'مجتمعات';

  @override
  String get insightsCatOther => 'أخرى';

  @override
  String nativeBlockTitle(String app) {
    return 'تم إيقاف $app مؤقتًا';
  }

  @override
  String get nativeReasonLimit => 'لقد استخدمت وقت اليوم لهذا التطبيق.';

  @override
  String get nativeReasonSchedule => 'جدول القفل نشط الآن.';

  @override
  String get nativeReasonGlobal => 'هذا التطبيق مقفل في Pausey.';

  @override
  String get nativeReasonFocus => 'أنت في جلسة تركيز.';

  @override
  String get nativeClose => 'إغلاق التطبيق';

  @override
  String get nativeNotifTitle => 'Pausey يحافظ على حدودك';

  @override
  String get nativeNotifText => 'حدود التطبيقات وجداول القفل مفعّلة';

  @override
  String get profileSettings => 'الإعدادات';

  @override
  String get profileGuestName => 'ضيف';

  @override
  String get profileGuestBadge => 'ضيف · محفوظ على هذا الهاتف';

  @override
  String get profileEditName => 'تعديل الاسم';

  @override
  String get profileNameHint => 'اسمك';

  @override
  String get profileSave => 'حفظ';

  @override
  String profileMemberSince(String date) {
    return 'عضو منذ $date';
  }

  @override
  String get profileProActive => 'Pro · مفعّل';

  @override
  String get profileFree => 'الخطة المجانية';

  @override
  String get profileUpgrade => 'ترقية';

  @override
  String get profileBadges => 'الشارات';

  @override
  String get profileNoBadges => 'أكمل جلسات التركيز لتحصل على الشارات';

  @override
  String get profileFocusTime => 'وقت التركيز';

  @override
  String get profileGoalsDone => 'أهداف منجزة';

  @override
  String get profileDayStreak => 'أيام متتالية';

  @override
  String get profileAppsBlocked => 'تطبيقات محظورة';

  @override
  String get profileFocusActivity => 'نشاط التركيز';

  @override
  String get profileLast4Weeks => 'آخر 4 أسابيع';

  @override
  String get profileRecentActivity => 'النشاط الأخير';

  @override
  String get profileSessionDone => 'اكتملت جلسة التركيز';

  @override
  String get profileSessionStopped => 'انتهت الجلسة مبكرًا';

  @override
  String get profileModePomodoro => 'بومودورو';

  @override
  String get profileModeDeep => 'عمل عميق';

  @override
  String get profileModeCustom => 'مخصص';

  @override
  String get profileJustNow => 'الآن';

  @override
  String profileAgoMinutes(int n) {
    return 'قبل $n د';
  }

  @override
  String profileAgoHours(int n) {
    return 'قبل $n س';
  }

  @override
  String get profileYesterday => 'أمس';

  @override
  String get profileEmptyTitle => 'لا توجد جلسات تركيز بعد';

  @override
  String get profileEmptyBody =>
      'ابدأ جلستك الأولى — سيظهر نشاطك وسلسلتك وشاراتك هنا.';

  @override
  String get profileStartFocus => 'ابدأ التركيز';

  @override
  String get profileMyGoals => 'أهدافي';

  @override
  String get profileStreaks => 'السلاسل والشارات';

  @override
  String get profileSubscription => 'الاشتراك';

  @override
  String get profileSignOutTitle => 'تسجيل الخروج؟';

  @override
  String get profileSignOutBody => 'يمكنك تسجيل الدخول مجددًا في أي وقت.';

  @override
  String get profileSecNotifications => 'الإشعارات';

  @override
  String get profileSecAppearance => 'المظهر';

  @override
  String get profileSecFocus => 'التركيز والحظر';

  @override
  String get profileSecPrivacy => 'الخصوصية والأمان';

  @override
  String get profileSecAccount => 'الحساب';

  @override
  String get profilePush => 'الإشعارات الفورية';

  @override
  String get profilePushSub => 'تذكيرات وتنبيهات التركيز';

  @override
  String get profileReminder => 'تذكير بدء التركيز';

  @override
  String profileReminderSub(String time) {
    return 'يوميًا في $time';
  }

  @override
  String get profileStreakAlerts => 'تنبيهات السلسلة';

  @override
  String get profileStreakAlertsSub => 'قبل أن تنقطع سلسلتك';

  @override
  String get profileGoalMilestones => 'إنجازات الأهداف';

  @override
  String get profileGoalMilestonesSub => 'عند تحقيق هدف';

  @override
  String get profileDarkMode => 'الوضع الداكن';

  @override
  String get profileOn => 'مفعّل';

  @override
  String get profileOff => 'متوقف';

  @override
  String get profileTextSize => 'حجم النص';

  @override
  String get profileTextSmall => 'صغير';

  @override
  String get profileTextMedium => 'متوسط';

  @override
  String get profileTextLarge => 'كبير';

  @override
  String get profileTextHuge => 'كبير جدًا';

  @override
  String get profilePomodoroLen => 'مدة البومودورو';

  @override
  String get profileBreakLen => 'مدة الاستراحة';

  @override
  String profileMinutes(int n) {
    return '$n دقيقة';
  }

  @override
  String get profileFaceIdUnlock => 'Face ID لفتح القفل';

  @override
  String get profileFaceIdUnlockSub => 'التأكيد قبل فتح تطبيق';

  @override
  String get profileBypass => 'تجاوز الطوارئ';

  @override
  String profileBypassSub(int n) {
    return '$n مرات فتح يوميًا';
  }

  @override
  String get profileAppLock => 'قفل Pausey بـ Face ID';

  @override
  String get profileAppLockSub => 'اطلب عند فتح التطبيق';

  @override
  String get profileHideUsage => 'إخفاء بيانات الاستخدام';

  @override
  String get profileHideUsageSub => 'إخفاء أرقام وقت الشاشة';

  @override
  String get profileClearData => 'مسح بيانات النشاط';

  @override
  String get profileClearDataSub => 'يحذف الجلسات وسجل الأهداف';

  @override
  String get profileClearTitle => 'مسح بيانات النشاط؟';

  @override
  String get profileClearBody =>
      'سيحذف هذا كل جلسات التركيز وتسجيلات الأهداف على هذا الهاتف. لا يمكن التراجع.';

  @override
  String get profileClear => 'مسح';

  @override
  String get profileCleared => 'تم مسح بيانات النشاط';

  @override
  String get profileExport => 'تصدير بياناتي';

  @override
  String get profileExportSub => 'نسخ بصيغة JSON';

  @override
  String get profileExported => 'تم نسخ بياناتك إلى الحافظة';

  @override
  String get profileStreaksTitle => 'السلاسل';

  @override
  String get profileShare => 'مشاركة';

  @override
  String profileShareText(int n) {
    return 'أنا في سلسلة تركيز لمدة $n يومًا مع Pausey!';
  }

  @override
  String get profileCopied => 'تم النسخ إلى الحافظة';

  @override
  String profileNextMilestone(int n) {
    return 'واصل – $n يوم حتى الإنجاز التالي!';
  }

  @override
  String get profileAllMilestones => 'حققت كل الإنجازات. أسطوري!';

  @override
  String get profileStartStreak => 'أكمل جلسة تركيز اليوم لتبدأ سلسلة.';

  @override
  String get profileBest => 'الأفضل';

  @override
  String get profileThisWeek => 'هذا الأسبوع';

  @override
  String profileDaysCompleted(int n) {
    return '$n/7 أيام مكتملة';
  }

  @override
  String get profileCompleted => 'مكتمل';

  @override
  String get profilePartial => 'جزئي';

  @override
  String get profileMissed => 'فائت';

  @override
  String get profilePrevMonth => 'الشهر السابق';

  @override
  String get profileNextMonth => 'الشهر التالي';

  @override
  String get profileMilestones => 'إنجازات السلسلة';

  @override
  String get profileAchievements => 'الإنجازات';

  @override
  String get profileAchOnFire => 'مشتعل';

  @override
  String get profileAchIronWill => 'إرادة حديدية';

  @override
  String get profileAchFocusMaster => 'سيد التركيز';

  @override
  String get profileAchMonk => 'راهب رقمي';

  @override
  String get profileAchLegend => 'أسطوري';

  @override
  String get profileAchSpeed => 'سريع كالبرق';

  @override
  String profileAchStreakDesc(int n) {
    return 'سلسلة $n يومًا';
  }

  @override
  String profileAchSessionsDesc(int n) {
    return '$n جلسة مكتملة';
  }

  @override
  String profileAchHoursDesc(int n) {
    return '$n ساعة تركيز';
  }

  @override
  String profileAchDayDesc(int n) {
    return '$n جلسات في يوم';
  }

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

  @override
  String get statesTitle => 'الحالات';

  @override
  String get statesSubtitle => 'شاشات الخطأ والفراغ والتحميل';

  @override
  String get statesNoInternet => 'لا يوجد إنترنت';

  @override
  String get statesConnectionLost => 'انقطع الاتصال';

  @override
  String get statesOfflineTitle => 'أنت غير متصل';

  @override
  String get statesOfflineMsg =>
      'لا يستطيع Pausey الوصول إلى الخادم الآن. تحقق من Wi-Fi أو بيانات الجوال وحاول مجددًا – بياناتك المحلية آمنة.';

  @override
  String get statesTryAgain => 'حاول مجددًا';

  @override
  String get statesOpenSettings => 'فتح الإعدادات';

  @override
  String get statesOfflineMode => 'وضع عدم الاتصال نشط';

  @override
  String get statesLimited => 'محدود';

  @override
  String get statesAvailable => 'متاح';

  @override
  String get statesUnavailable => 'غير متاح';

  @override
  String get statesCapSessions => 'عرض الجلسات السابقة';

  @override
  String get statesCapApps => 'قائمة التطبيقات المقفلة';

  @override
  String get statesCapTimer => 'تشغيل مؤقت التركيز محليًا';

  @override
  String get statesCapSync => 'مزامنة السلسلة والأهداف';

  @override
  String get statesCapAnalytics => 'تحديث بيانات التحليلات';

  @override
  String get statesOfflineNote =>
      'كل بيانات تركيزك محفوظة محليًا. لا يضيع شيء عند انقطاع الاتصال.';

  @override
  String get statesBackOnline => 'عدت متصلًا – تمت المزامنة';

  @override
  String get statesShowAgain => 'اعرض الحالة مجددًا';

  @override
  String get statesPermDenied => 'تم رفض الإذن';

  @override
  String get statesPermRequired => 'الإذن مطلوب';

  @override
  String get statesPermTitle => 'الوصول محظور';

  @override
  String get statesPermMsg =>
      'يحتاج Pausey إلى إذن وقت الشاشة لحظر التطبيقات. بدونه لن يعمل الحظر.';

  @override
  String get statesGrant => 'منح الإذن';

  @override
  String get statesLearnMore => 'اعرف المزيد';

  @override
  String get statesLearnMoreMsg =>
      'يتيح إذن وقت الشاشة لـ Pausey إيقاف التطبيقات المشتتة. بياناتك لا تغادر هاتفك.';

  @override
  String get statesRequiredPerms => 'الأذونات المطلوبة';

  @override
  String get statesPermNotif => 'الإشعارات';

  @override
  String get statesPermScreenTime => 'إذن وقت الشاشة';

  @override
  String get statesPermUsage => 'إحصاءات الاستخدام';

  @override
  String get statesPermBio => 'Face ID / القياسات الحيوية';

  @override
  String get statesGranted => 'ممنوح';

  @override
  String get statesDenied => 'مرفوض';

  @override
  String get statesPermNote =>
      'بدون وقت الشاشة يعمل مؤقت التركيز لكن لا يمكن حظر التطبيقات.';

  @override
  String get statesAccessGranted => 'تم منح الإذن – الحظر جاهز';

  @override
  String get statesDataNA => 'البيانات غير متاحة';

  @override
  String get statesSyncFailed => 'فشلت المزامنة';

  @override
  String get statesLoadTitle => 'تعذّر تحميل البيانات';

  @override
  String get statesLoadMsg =>
      'حدث خطأ أثناء جلب التحليلات. قد يكون خللًا مؤقتًا في الخادم – بياناتك المحلية سليمة.';

  @override
  String get statesRetrySync => 'إعادة المزامنة';

  @override
  String get statesUseCached => 'استخدام المخزن';

  @override
  String get statesErrorDetails => 'تفاصيل الخطأ';

  @override
  String get statesErrorCode => 'رمز الخطأ';

  @override
  String get statesTimestamp => 'الوقت';

  @override
  String get statesRetryCount => 'المحاولات';

  @override
  String statesAttempts(int n) {
    return '$n / 3 محاولات';
  }

  @override
  String get statesReport => 'إبلاغ الدعم';

  @override
  String get statesReported => 'شكرًا – تم إرسال البلاغ';

  @override
  String get statesCachedNote => 'تتوفر بيانات آخر مزامنة ناجحة في الأثناء.';

  @override
  String get statesDataLoaded => 'تم تحميل التحليلات';

  @override
  String get statesCachedShown => 'عرض البيانات المخزنة';

  @override
  String statesWeekFocus(String time) {
    return 'تركيز هذا الأسبوع: $time';
  }

  @override
  String get statesEmpty => 'حالة فارغة';

  @override
  String get statesNothingYet => 'لا شيء بعد';

  @override
  String get statesEmptyTitle => 'لا جلسات بعد';

  @override
  String get statesEmptyMsg => 'ابدأ أول جلسة تركيز وسيظهر تقدمك هنا.';

  @override
  String get statesStartFocus => 'ابدأ التركيز';

  @override
  String get statesLoadingSection => 'حالات التحميل';

  @override
  String get statesDashLoading => 'لوحة التحكم';

  @override
  String get statesAnalyticsLoading => 'التحليلات';

  @override
  String get statesGoalsLoading => 'الأهداف';

  @override
  String get statesProfileLoading => 'الملف';

  @override
  String get statesCrunching => 'جارٍ تحليل بياناتك…';

  @override
  String get statesLoadingGoals => 'جارٍ تحميل أهدافك…';

  @override
  String get statesLoadingProfile => 'جارٍ تحميل ملفك…';

  @override
  String get statesReplay => 'إعادة';

  @override
  String get stHowCaption => 'كيف يعمل';

  @override
  String stHow1(String app) {
    return 'تفتح $app مجددًا';
  }

  @override
  String get stHow2 => 'تبدأ بالتمرير، لكن…';

  @override
  String get stHow3 => 'يوقفه Pausey مؤقتًا بلطف.';

  @override
  String get stHow4 => 'وتنبّهك قبل نفاد الوقت';

  @override
  String get stYourApp => 'تطبيقك';

  @override
  String get stTapToContinue => 'اضغط للمتابعة';

  @override
  String get stNudgeGeneric => 'اقتربت من حدّك اليومي';

  @override
  String get stPermTitle => 'اسمح ببعض الأذونات';

  @override
  String get stPermUsageTitle => 'وقت الشاشة';

  @override
  String get stPermUsageWhy => 'يعرض وقت الشاشة اليومي ومتى تصل إلى الحد.';

  @override
  String get stPermOverlayTitle => 'الظهور فوق التطبيقات الأخرى';

  @override
  String get stPermOverlayWhy =>
      'يتيح لـ Pausey عرض شاشة الإيقاف فوق التطبيق المشتّت.';

  @override
  String get stPermNotifTitle => 'الإشعارات';

  @override
  String get stPermNotifWhy =>
      'تنبيهات لطيفة قبل أن ينفد الحد. يمكنك إيقافها لاحقًا.';

  @override
  String get stPermMore => 'أمر أخير…';

  @override
  String get stPermA11yTitle => 'إمكانية الوصول';

  @override
  String get stPermA11yWhy =>
      'يكتشف التطبيق المفتوح فورًا، ليحدث الإيقاف في الحال.';

  @override
  String get stPermA11yNote =>
      'تعرض بعض الهواتف بعد ذلك شاشة تحذير خاصة بها. هذا طبيعي — يمكنك إيقافه في أي وقت من الإعدادات.';

  @override
  String get stPermOnHint =>
      'مفعّل بالفعل. لإيقافه، افتح إعدادات Android › التطبيقات › Pausey.';

  @override
  String get stA11yDialogTitle => 'لماذا إمكانية الوصول؟';

  @override
  String get stA11yDialogBody =>
      'يستخدم Pausey إمكانية الوصول فقط لمعرفة التطبيق المفتوح، لتُطبَّق حدودك وجداولك فورًا، ولتبقى الحماية تعمل بشكل موثوق.';

  @override
  String get stA11yNot => 'Pausey لا يقوم بما يلي:';

  @override
  String get stA11yNot1 => 'قراءة أو جمع ما يظهر على شاشتك';

  @override
  String get stA11yNot2 => 'تخزين المعلومات الشخصية';

  @override
  String get stA11yNot3 => 'مشاركة أي شيء خارج هاتفك';

  @override
  String get stPw1 => 'خطتك ليوم أكثر هدوءًا';

  @override
  String get stPw2 => 'أقفال لا يمكنك إقناع نفسك بتجاوزها';

  @override
  String get stPw3 => 'شاهد تقدّمك أسبوعًا بعد أسبوع';

  @override
  String get stPwToday => 'اليوم';

  @override
  String get stPwGoal => 'هدفك';

  @override
  String stPwWeek(int n) {
    return 'أ$n';
  }

  @override
  String get stPwFirstWeek => 'أسبوعك الأول يبدأ الآن';

  @override
  String get stPwFocusWeek => 'وقت التركيز أسبوعيًا';

  @override
  String nudgeTitle(String app) {
    return 'اقتربت من حدّ $app';
  }

  @override
  String nudgeText(String used, String limit) {
    return 'استُخدم $used من $limit اليوم';
  }
}
