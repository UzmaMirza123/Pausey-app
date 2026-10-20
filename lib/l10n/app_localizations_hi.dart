// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get ob1Title => 'स्क्रीन की लत कम करें';

  @override
  String get ob1Body =>
      'अपनी डिजिटल आदतों पर काबू पाएं और ध्यान भटकाने वाले ऐप्स पर कम समय बिताएं।';

  @override
  String get ob1StatAvg => 'औसत दैनिक स्क्रीन टाइम';

  @override
  String get ob1StatSocial => 'सोशल मीडिया पर बीता';

  @override
  String get ob1ArtNote1 => 'कम स्क्रॉलिंग';

  @override
  String get ob1ArtNote2 => 'ज़्यादा आप';

  @override
  String get ob1BookFocus => 'फ़ोकस';

  @override
  String get ob1BookBalance => 'संतुलन';

  @override
  String get ob1BookHappier => 'ज़्यादा खुश आप';

  @override
  String get ob2SelectApps => 'ऐप्स चुनें';

  @override
  String get ob2Title => 'ध्यान भटकाने वाले ऐप्स लॉक करें';

  @override
  String get ob2Body =>
      'शक्तिशाली ऐप लॉक टूल्स से सोशल मीडिया, गेम्स और दूसरी रुकावटें ब्लॉक करें।';

  @override
  String get ob2Feature1 => 'एक टैप में फ़ोन का कोई भी ऐप ब्लॉक करें';

  @override
  String get ob2Feature2 => 'लॉक का समय और फ़ोकस विंडो तय करें';

  @override
  String get ob2Feature3 =>
      'ब्लॉक को पासवर्ड से सुरक्षित करें ताकि आप डटे रहें';

  @override
  String get sheetTitle => 'ऐप्स चुनें';

  @override
  String get sheetTotalLocked => 'कुल लॉक';

  @override
  String get sheetAppsSelected => 'ऐप्स चुने गए';

  @override
  String get sheetTimeSaved => 'बचाया समय';

  @override
  String get sheetPerDayAvg => 'प्रतिदिन औसत';

  @override
  String sheetHoursValue(String h) {
    return '$h घं';
  }

  @override
  String get sheetSearchHint => 'ऐप्स खोजें...';

  @override
  String get sheetCatAll => 'सभी';

  @override
  String get sheetCatSocial => 'सोशल';

  @override
  String get sheetCatEntertainment => 'मनोरंजन';

  @override
  String get sheetCatGames => 'गेम्स';

  @override
  String get sheetAppsHeader => 'ऐप्स';

  @override
  String sheetSelectedCount(int count) {
    return '$count चुने गए';
  }

  @override
  String get sheetNoApps => 'कोई ऐप नहीं मिला';

  @override
  String get sheetLockSchedule => 'लॉक शेड्यूल';

  @override
  String get sheetAddCustomSemantic => 'अपना लॉक शेड्यूल जोड़ें';

  @override
  String get sheetCustomBadge => '+ कस्टम';

  @override
  String get sheetSchedMorning => 'सुबह';

  @override
  String get sheetSchedWork => 'काम';

  @override
  String get sheetSchedEvening => 'शाम';

  @override
  String get sheetEveryDay => 'हर दिन';

  @override
  String get sheetWeekdays => 'कार्यदिवस';

  @override
  String get sheetWeekends => 'सप्ताहांत';

  @override
  String get sheetUnlockMethod => 'अनलॉक का तरीका';

  @override
  String get sheetPin => 'PIN कोड';

  @override
  String get sheetPinSub => '4 अंकों का PIN';

  @override
  String get sheetFaceId => 'Face ID';

  @override
  String get sheetFaceIdSub => 'बायोमेट्रिक';

  @override
  String get sheetTouchId => 'Touch ID';

  @override
  String get sheetTouchIdSub => 'फ़िंगरप्रिंट';

  @override
  String get sheetFooter => 'आप इसे बाद में कभी भी बदल सकते हैं';

  @override
  String get sheetConfirmLock => 'लॉक की पुष्टि करें';

  @override
  String sheetRemove(String name) {
    return '$name हटाएं';
  }

  @override
  String get sheetCustomTitle => 'कस्टम शेड्यूल';

  @override
  String get sheetCustomBody => 'इस दौरान आपके चुने ऐप्स लॉक रहेंगे।';

  @override
  String get sheetNameLabel => 'नाम';

  @override
  String get sheetNameHint => 'जैसे पढ़ाई का समय';

  @override
  String get sheetStarts => 'शुरू';

  @override
  String get sheetEnds => 'खत्म';

  @override
  String get sheetSameTime => 'शुरू और खत्म का समय एक ही है';

  @override
  String sheetLockedFor(String duration) {
    return '$duration के लिए लॉक';
  }

  @override
  String sheetLockedForOvernight(String duration) {
    return '$duration के लिए लॉक (रात भर)';
  }

  @override
  String sheetDurH(int h) {
    return '$h घं';
  }

  @override
  String sheetDurM(int m) {
    return '$m मि';
  }

  @override
  String sheetDurHM(int h, int m) {
    return '$h घं $m मि';
  }

  @override
  String get sheetLockStartsAt => 'लॉक शुरू होने का समय';

  @override
  String get sheetLockEndsAt => 'लॉक खत्म होने का समय';

  @override
  String get sheetRepeatOn => 'इन दिनों दोहराएं';

  @override
  String get sheetAddSchedule => 'शेड्यूल जोड़ें';

  @override
  String get sheetCustomDefaultName => 'कस्टम';

  @override
  String sheetChangeTime(String label, String time) {
    return '$label $time। समय बदलें';
  }

  @override
  String get ob3Title => 'हर दिन फ़ोकस बनाए रखें';

  @override
  String get ob3Body =>
      'उत्पादकता बढ़ाने और ज़्यादा हासिल करने के लिए पोमोडोरो और डीप फ़ोकस सेशन का उपयोग करें।';

  @override
  String get ob3Pomodoro => 'पोमोडोरो';

  @override
  String ob3PomodoroSub(int min) {
    return '$min मिनट के सेशन';
  }

  @override
  String get ob3DeepFocus => 'डीप फ़ोकस';

  @override
  String ob3DeepFocusSub(int min) {
    return '$min मिनट का फ़्लो';
  }

  @override
  String get ob3StatBoost => 'उत्पादकता वृद्धि';

  @override
  String ob3StatStreakValue(int days) {
    return '$days दिन';
  }

  @override
  String get ob3StatStreak => 'स्ट्रीक बनाएं';

  @override
  String get ob3StatGoal => 'लक्ष्य पूरे';

  @override
  String get ob3StartTimer => 'टाइमर शुरू करें';

  @override
  String get ob3PauseTimer => 'टाइमर रोकें';

  @override
  String get ob4Title => 'अपनी प्रगति ट्रैक करें';

  @override
  String get ob4Body =>
      'सुंदर एनालिटिक्स के साथ स्क्रीन टाइम, फ़ोकस घंटे, लक्ष्य और उत्पादकता पर नज़र रखें।';

  @override
  String get ob4Weekly => 'साप्ताहिक';

  @override
  String get ob4WeeklySub => 'रिपोर्ट';

  @override
  String get ob4Goals => 'लक्ष्य';

  @override
  String get ob4GoalsSub => 'ट्रैकर';

  @override
  String get ob4Insights => 'इनसाइट्स';

  @override
  String get ob4InsightsSub => 'AI कोच';

  @override
  String get ob4Streaks => 'स्ट्रीक्स';

  @override
  String get ob4StreaksSub => 'और बैज';

  @override
  String get ob3RingStreak => 'दिन की स्ट्रीक';

  @override
  String ob3RingSessions(int done, int total) {
    return '$total में से $done सेशन';
  }

  @override
  String get ob3RingTagline => 'फ़ोकस बनाता है\nएक बेहतर आप';

  @override
  String get ob4ArtScore => 'स्कोर';

  @override
  String get ob4ArtProductivity => 'उत्पादकता';

  @override
  String get ob5Title => 'आपका रोज़ का औसत स्क्रीन टाइम कितना है?';

  @override
  String get ob5Subtitle => 'सिर्फ़ आपके फ़ोन पर। अंदाज़ा भी ठीक है।';

  @override
  String get ob5More7 => '7 घंटे से ज़्यादा';

  @override
  String get ob5H5to7 => '5-7 घंटे';

  @override
  String get ob5H4to5 => '4-5 घंटे';

  @override
  String get ob5H3to4 => '3-4 घंटे';

  @override
  String get ob5H1to3 => '1-3 घंटे';

  @override
  String get ob5Under1 => '1 घंटे से कम';

  @override
  String get ob6Title => 'आपका पेशा क्या है?';

  @override
  String get ob6Subtitle =>
      'हम आपके काम के अंदाज़ के हिसाब से फ़ोकस प्लान बनाएंगे।';

  @override
  String get ob6Software => 'सॉफ़्टवेयर डेवलपमेंट';

  @override
  String get ob6Founder => 'सीईओ / संस्थापक';

  @override
  String get ob6Remote => 'रिमोट वर्कर';

  @override
  String get ob6Finance => 'फ़ाइनेंस / ऑप्स / कंसल्टिंग';

  @override
  String get ob6Art => 'कला / कंटेंट';

  @override
  String get ob6Education => 'शिक्षा';

  @override
  String get ob6Others => 'अन्य';

  @override
  String get ob7Title => 'आपका रोज़ का स्क्रीन लक्ष्य';

  @override
  String get ob7Subtitle =>
      'आप इसे कभी भी बदल सकते हैं। सीमा के करीब पहुँचने पर हम आपको याद दिलाएँगे।';

  @override
  String ob7Hours(String hours) {
    return '$hours घं';
  }

  @override
  String get ob7PerDay => 'प्रति दिन';

  @override
  String ob7HoursPerDay(String hours) {
    return 'प्रति दिन $hours';
  }

  @override
  String get ob7DialLabel => 'दैनिक स्क्रीन-टाइम लक्ष्य';

  @override
  String get ob7InfoNote =>
      'औसत व्यक्ति रोज़ 4+ घंटे फ़ोन पर बिताता है। लक्ष्य तय करना अपना समय वापस पाने का पहला कदम है।';

  @override
  String get ob8Title => 'ज़रूरी अनुमतियाँ चालू करें';

  @override
  String get ob8Subtitle => 'Pausey का पूरा अनुभव पाने के लिए अनुमति दें।';

  @override
  String get ob8UsageTitle => 'उपयोग एक्सेस';

  @override
  String get ob8UsageSub => 'ऐप उपयोग देखें और फ़ोकस सेशन लागू करें।';

  @override
  String get ob8NotifTitle => 'सूचनाएँ';

  @override
  String get ob8NotifSub => 'समय पर रिमाइंडर और प्रगति अलर्ट।';

  @override
  String get ob8TrackTitle => 'ऐप उपयोग ट्रैक करें';

  @override
  String get ob8TrackSub => 'रोज़ाना और साप्ताहिक विवरण।';

  @override
  String get ob9Title => 'आप पूरी तरह तैयार हैं!';

  @override
  String get ob9Subtitle => 'आपका फ़ोकस माहौल तैयार है।';

  @override
  String get ob9Enter => 'Pausey में जाएँ';

  @override
  String get ob9Replay => 'परिचय फिर से देखें';

  @override
  String get ob9ScreenTime => 'स्क्रीन टाइम';

  @override
  String get ob9AppsLocked => 'लॉक ऐप्स';

  @override
  String get ob9Permissions => 'अनुमतियाँ';

  @override
  String get ob9FocusMode => 'फ़ोकस मोड';

  @override
  String get ob9AllOk => 'सब ठीक';

  @override
  String get ob9On => 'चालू';

  @override
  String get ob9Done => 'पूर्ण';

  @override
  String get ob9StreakTitle => 'पहले दिन की स्ट्रीक अभी शुरू';

  @override
  String get ob9StreakSub => 'इसे जारी रखने के लिए एक सेशन पूरा करें';

  @override
  String alSummary(int locked, int total) {
    return 'अभी $locked प्रतिबंधित · $total प्रबंधित';
  }

  @override
  String alSummaryOff(int total) {
    return '$total प्रबंधित · ब्लॉकिंग बंद';
  }

  @override
  String get alFromInstalled => 'इंस्टॉल ऐप्स में से चुनें';

  @override
  String get alFromInstalledSub => 'इस फ़ोन का कोई भी ऐप चुनें';

  @override
  String get alPermTitle => 'ब्लॉकिंग अभी चालू नहीं है';

  @override
  String get alPermMsg =>
      'आपके नियम सेव हैं, पर इन दो अनुमतियों के बिना Pausey ऐप ब्लॉक नहीं कर सकता:';

  @override
  String get alPermUsage => 'उपयोग एक्सेस';

  @override
  String get alPermUsageSub => 'कौन-सा ऐप खुला है और आज का समय जानने के लिए';

  @override
  String get alPermOverlay => 'दूसरे ऐप्स के ऊपर दिखाएं';

  @override
  String get alPermOverlaySub => 'ब्लॉक ऐप पर लॉक स्क्रीन दिखाने के लिए';

  @override
  String get alAllow => 'अनुमति दें';

  @override
  String get alAllowed => 'अनुमति है';

  @override
  String get alPermReturn =>
      'अनुमति देकर Pausey पर लौटें — यह खुद फिर जांच लेगा।';

  @override
  String get alAndroidOnly =>
      'ब्लॉकिंग सिर्फ़ Android पर काम करती है। नियम यहां भी बना सकते हैं।';

  @override
  String get alSearchHint => 'ऐप खोजें';

  @override
  String get alFilterAll => 'सभी';

  @override
  String get alFilterLocked => 'अभी लॉक';

  @override
  String get alFilterScheduled => 'शेड्यूल';

  @override
  String get alFilterAvailable => 'उपलब्ध';

  @override
  String get alStateLocked => 'लॉक';

  @override
  String get alStateWillLock => 'लॉक होगा';

  @override
  String get alStateScheduled => 'शेड्यूल';

  @override
  String get alStateAvailable => 'उपलब्ध';

  @override
  String alUsedOf(String used, String limit) {
    return '$limit में से $used इस्तेमाल';
  }

  @override
  String alUsedToday(String used) {
    return 'आज $used इस्तेमाल';
  }

  @override
  String get alNoLimit => 'कोई दैनिक सीमा नहीं';

  @override
  String alLimitNoUsage(String limit) {
    return '$limit दैनिक सीमा · उपयोग उपलब्ध नहीं';
  }

  @override
  String get alRulesOff => 'प्रतिबंध बंद';

  @override
  String alNextLock(String time) {
    return 'अगला लॉक: $time';
  }

  @override
  String alUnlockedUntil(String time) {
    return '$time तक अनलॉक';
  }

  @override
  String get alReasonLimit => 'दैनिक सीमा पूरी';

  @override
  String get alReasonSchedule => 'लॉक शेड्यूल चालू';

  @override
  String get alReasonGeneral => 'सामान्य शेड्यूल चालू';

  @override
  String get alReasonAllDay => 'पूरे दिन लॉक';

  @override
  String get alReasonFocus => 'फ़ोकस सत्र चल रहा है';

  @override
  String get alNoMatches => 'कोई ऐप नहीं मिला';

  @override
  String get alGeneral => 'सामान्य';

  @override
  String get alGeneralScheduleSub =>
      'जिन ऐप्स में “सामान्य शेड्यूल अपनाएं” चालू है';

  @override
  String get alLockAllSub => 'हर ऐप पर प्रतिबंध चालू करें';

  @override
  String get alSaved => 'सेव हुआ';

  @override
  String get alChangesApply => 'बदलाव तुरंत लागू होते हैं';

  @override
  String get alDetailsTitle => 'ऐप सीमाएं';

  @override
  String get alBlockingOff => 'इस फ़ोन पर ब्लॉकिंग बंद है';

  @override
  String get alRestrictApp => 'इस ऐप को सीमित करें';

  @override
  String get alMasterOff => 'बंद — Pausey इस ऐप को सीमित नहीं करेगा';

  @override
  String get alMasterOnRules => 'नीचे की सीमा और शेड्यूल लागू हैं';

  @override
  String get alMasterOnAllDay => 'अभी कोई सीमा या शेड्यूल नहीं — पूरे दिन लॉक';

  @override
  String get alMasterOnGeneral => 'सामान्य शेड्यूल में लॉक';

  @override
  String get alFollowGeneral => 'सामान्य शेड्यूल अपनाएं';

  @override
  String alFollowGeneralSub(String start, String end) {
    return '$start – $end भी लॉक करें';
  }

  @override
  String get alGeneralOff => 'सामान्य शेड्यूल बंद है';

  @override
  String get alDailyLimit => 'दैनिक सीमा';

  @override
  String get alDailyLimitOffSub => 'हर दिन तय समय के बाद ऐप लॉक करें';

  @override
  String get alCustom => 'कस्टम';

  @override
  String get alUsedLabel => 'आज इस्तेमाल';

  @override
  String get alLeftLabel => 'बाकी';

  @override
  String get alLimitReached => 'आज की सीमा पूरी';

  @override
  String get alResets => 'आधी रात को रीसेट (फ़ोन का समय)';

  @override
  String get alUsageUnavailable => 'उपयोग उपलब्ध नहीं';

  @override
  String get alUsageNeedsAccess =>
      'Usage access की अनुमति दें ताकि Pausey आज का समय गिन सके।';

  @override
  String get alUsageAndroidOnly =>
      'उपयोग सिर्फ़ Android पर मापा जाता है। सीमा सेव रहती है और वहीं लागू होती है।';

  @override
  String get alGrantUsage => 'उपयोग एक्सेस दें';

  @override
  String get alCustomLimitTitle => 'कस्टम दैनिक सीमा';

  @override
  String get alHours => 'घंटे';

  @override
  String get alMinutes => 'मिनट';

  @override
  String get alErrZeroLimit => 'शून्य से ज़्यादा समय चुनें';

  @override
  String get alSave => 'सेव करें';

  @override
  String get alScheduledLocking => 'शेड्यूल लॉकिंग';

  @override
  String get alScheduledOffSub => 'तय समय पर यह ऐप लॉक करें';

  @override
  String get alNoSchedules => 'अभी कोई शेड्यूल नहीं';

  @override
  String get alAddSchedule => 'शेड्यूल जोड़ें';

  @override
  String get alActiveNow => 'अभी चालू';

  @override
  String get alScheduleDefault => 'लॉक समय';

  @override
  String get alEndsNextDay => 'अगले दिन खत्म';

  @override
  String get alEdit => 'बदलें';

  @override
  String get alDelete => 'हटाएं';

  @override
  String get alDeleteScheduleQ => 'यह शेड्यूल हटाएं?';

  @override
  String alDeleteScheduleMsg(String title) {
    return '“$title” अब यह ऐप लॉक नहीं करेगा।';
  }

  @override
  String get alNewSchedule => 'नया शेड्यूल';

  @override
  String get alEditSchedule => 'शेड्यूल बदलें';

  @override
  String get alTitleOptional => 'शीर्षक (वैकल्पिक)';

  @override
  String get alPresetStudy => 'पढ़ाई';

  @override
  String get alPresetEvening => 'शाम';

  @override
  String get alPresetSleep => 'नींद';

  @override
  String get alRepeatOn => 'इन दिनों दोहराएं';

  @override
  String get alErrSameTime => 'शुरू और अंत एक नहीं हो सकते';

  @override
  String get alErrNoDays => 'कम से कम एक दिन चुनें';

  @override
  String alTempUnlock(int minutes) {
    return '$minutes मिनट के लिए अनलॉक';
  }

  @override
  String alTempUnlockSub(int n) {
    return '1 इमरजेंसी ओवरराइड लगेगा · आज $n बाकी';
  }

  @override
  String get alTempUnlockFocus => 'फ़ोकस सत्र में अनलॉक नहीं हो सकता';

  @override
  String get alTempUnlockNotLocked => 'सिर्फ़ ऐप लॉक होने पर ज़रूरी';

  @override
  String alTempUnlockQ(String app, int minutes) {
    return '$app को $minutes मिनट के लिए अनलॉक करें?';
  }

  @override
  String get alUnlock => 'अनलॉक';

  @override
  String get alEndEarly => 'पहले खत्म करें';

  @override
  String get alResetRules => 'प्रतिबंध रीसेट करें';

  @override
  String get alResetRulesSub => 'इस ऐप की सीमा और शेड्यूल हटाएं';

  @override
  String alResetQ(String app) {
    return '$app के प्रतिबंध रीसेट करें?';
  }

  @override
  String get alResetMsg =>
      'इसकी दैनिक सीमा और सभी शेड्यूल हट जाएंगे। ऐप सूची में रहेगा।';

  @override
  String get alReset => 'रीसेट';

  @override
  String get alResetDone => 'प्रतिबंध रीसेट हुए';

  @override
  String get alRemoveApp => 'ऐप हटाएं';

  @override
  String get alRemoveAppSub => 'इस ऐप का प्रबंधन बंद करें';

  @override
  String alRemoveQ(String app) {
    return '$app हटाएं?';
  }

  @override
  String get alRemoveMsg =>
      'Pausey इसे सीमित करना बंद करेगा और इसकी सीमा व शेड्यूल भूल जाएगा।';

  @override
  String get alRemove => 'हटाएं';

  @override
  String get alNoPackage =>
      'हर-ऐप सीमा और शेड्यूल के लिए एक खास इंस्टॉल ऐप चाहिए। Android पर “इंस्टॉल ऐप्स में से चुनें” से जोड़ें।';

  @override
  String get alNotFound => 'यह ऐप अब प्रबंधित नहीं है';

  @override
  String get alPickerTitle => 'इंस्टॉल ऐप्स';

  @override
  String get alPickerAdded => 'पहले से जोड़ा';

  @override
  String alPickerAdd(int n) {
    return 'ऐप जोड़ें ($n)';
  }

  @override
  String get alPickerEmpty => 'कोई ऐप नहीं मिला';

  @override
  String get blockTitle => 'ऐप लॉक';

  @override
  String get blockAddApp => 'ऐप जोड़ें';

  @override
  String get blockFaceIdTitle => 'फ़ेस आईडी सुरक्षा';

  @override
  String get blockFaceIdSub => 'किसी भी ऐप को खोलने के लिए फ़ेस आईडी';

  @override
  String get blockFaceIdUnavailable => 'इस डिवाइस पर बायोमेट्रिक उपलब्ध नहीं';

  @override
  String get blockFaceIdReason => 'सुरक्षा चालू करने के लिए पुष्टि करें';

  @override
  String get blockFaceIdFailed => 'पुष्टि नहीं हुई — सुरक्षा बंद है';

  @override
  String get blockScheduleTitle => 'शेड्यूल लॉक';

  @override
  String get blockStart => 'शुरू';

  @override
  String get blockEnd => 'समाप्त';

  @override
  String get blockNeedOneDay => 'कम से कम एक दिन चुना रखें';

  @override
  String get blockManagedApps => 'प्रबंधित ऐप्स';

  @override
  String get blockLockAll => 'सभी लॉक';

  @override
  String get blockAllLocked => 'सभी ऐप लॉक हैं';

  @override
  String blockRemoved(String app) {
    return '$app हटाया गया';
  }

  @override
  String get blockAppsUpdated => 'ऐप्स अपडेट हुए';

  @override
  String get blockCatSocial => 'सोशल';

  @override
  String get blockCatVideo => 'वीडियो';

  @override
  String get blockCatGames => 'गेम्स';

  @override
  String get blockCatShopping => 'शॉपिंग';

  @override
  String get blockCatCommunity => 'कम्युनिटी';

  @override
  String get blockCatOther => 'अन्य';

  @override
  String get blockEmptyBadge => 'कुछ ब्लॉक नहीं';

  @override
  String get blockEmptyTitle => 'अभी कोई ऐप नहीं';

  @override
  String get blockEmptyMsg =>
      'सबसे ज़्यादा ध्यान भटकाने वाले ऐप जोड़ें, Pausey उन्हें लॉक करेगा।';

  @override
  String get blockEmergencyTitle => 'इमरजेंसी ओवरराइड';

  @override
  String blockEmergencySub(int n) {
    return 'सभी ऐप अस्थायी रूप से खोलें · आज $n बाकी';
  }

  @override
  String get blockEmergencyOff => 'सेटिंग्स में बंद';

  @override
  String get blockEmergencyUse => 'उपयोग';

  @override
  String get blockEmergencyConfirmTitle => 'इमरजेंसी ओवरराइड इस्तेमाल करें?';

  @override
  String blockEmergencyConfirmMsg(int n) {
    return 'यह आज के बचे $n में से एक इस्तेमाल करेगा। सिर्फ़ ज़रूरत पर इस्तेमाल करें।';
  }

  @override
  String get blockEmergencyUsed => 'ओवरराइड इस्तेमाल हुआ — ऐप अभी खुले हैं';

  @override
  String get blockEmergencyNone => 'आज कोई ओवरराइड बाकी नहीं';

  @override
  String get cvNoAccount => 'अकाउंट नहीं है?';

  @override
  String get cvYourName => 'आपका नाम';

  @override
  String get cvAppsLoadFailed => 'इस फ़ोन के ऐप्स नहीं पढ़े जा सके।';

  @override
  String get cvTryAgain => 'फिर से कोशिश करें';

  @override
  String get cvGetStarted => 'शुरू करें';

  @override
  String get cvHaveAccount => 'मेरा पहले से अकाउंट है';

  @override
  String get cvWelcomeTitle => 'आपका समय, आपका अपना।';

  @override
  String get cvWelcomeBody => 'चलिए, ज़रूरी चीज़ों के लिए ज़्यादा जगह बनाएं।';

  @override
  String get cvNext => 'आगे';

  @override
  String get cvSkipForNow => 'अभी छोड़ें';

  @override
  String get cvRelateTitle => 'समय का पता नहीं चलता?';

  @override
  String get cvRelateSub => 'सच बताइए, कोई जवाब गलत नहीं है।';

  @override
  String get cvRelateOften => 'हमेशा';

  @override
  String get cvRelateSometimes => 'कभी-कभी';

  @override
  String get cvRelateRarely => 'बहुत कम';

  @override
  String get cvRelateReplyOften =>
      'आप अकेले नहीं हैं। फ़ोन बनाए ही ऐसे जाते हैं कि हम उनमें लगे रहें।';

  @override
  String get cvRelateReplySometimes =>
      'ऐसा हम में से ज़्यादातर के साथ होता है, अक्सर पता भी नहीं चलता।';

  @override
  String get cvRelateReplyRarely => 'बढ़िया। चलिए इसे ऐसे ही बनाए रखें।';

  @override
  String get cvRelateCta => 'ये मैं हूँ';

  @override
  String get cvGoalTitle => 'किस चीज़ के लिए ज़्यादा समय?';

  @override
  String get cvGoalSub => 'अभी आपके लिए जो सबसे ज़रूरी है, वह चुनें।';

  @override
  String get cvGoalFocus => 'बेहतर फ़ोकस';

  @override
  String get cvGoalSleep => 'बेहतर नींद';

  @override
  String get cvGoalScrolling => 'कम स्क्रॉलिंग';

  @override
  String get cvGoalMe => 'अपने लिए ज़्यादा समय';

  @override
  String get cvGoalHabits => 'सेहतमंद रोज़ की आदतें';

  @override
  String get cvGoalOther => 'कुछ और';

  @override
  String get cvGoalOtherHint => 'आप किस चीज़ के लिए ज़्यादा समय चाहते हैं?';

  @override
  String get cvGoalReplyFocus => 'तो फ़ोकस ही सही। हम इसे बचाएँगे।';

  @override
  String get cvGoalReplySleep => 'अच्छी नींद शांत शाम से शुरू होती है।';

  @override
  String get cvGoalReplyScrolling =>
      'चलिए स्क्रॉलिंग को आदत नहीं, अपनी पसंद बनाएं।';

  @override
  String get cvGoalReplyMe => 'अपने लिए समय ज़रूरी है। चलिए थोड़ा निकालें।';

  @override
  String get cvGoalReplyHabits =>
      'छोटे कदम मिलकर बड़ा फ़र्क लाते हैं। हम इन्हें आसान रखेंगे।';

  @override
  String get cvGoalReplyOther =>
      'समझ गए। हम सब कुछ उसी के हिसाब से तैयार करेंगे।';

  @override
  String get cvAppsTitle => 'कौन-से ऐप्स ध्यान भटकाते हैं?';

  @override
  String get cvAppsSubReal =>
      'इस फ़ोन पर आपके सबसे ज़्यादा इस्तेमाल वाले ऐप्स। ये सब रोके जाएंगे; किसी को छोड़ने के लिए ✕ दबाएं।';

  @override
  String get cvAppsSubPopular =>
      'इस फ़ोन पर आपके सबसे ज़्यादा इस्तेमाल वाले ऐप्स। ये सब रोके जाएंगे; किसी को छोड़ने के लिए ✕ दबाएं।';

  @override
  String get cvAppsSearch => 'ऐप्स खोजें';

  @override
  String cvAppsReply(String apps) {
    return 'नोट कर लिया: $apps। हम इन्हीं से शुरू करेंगे।';
  }

  @override
  String cvAnd(String a, String b) {
    return '$a और $b';
  }

  @override
  String cvAndMore(String a, String b, int count) {
    return '$a, $b और $count अन्य';
  }

  @override
  String get cvStTitle => 'आपका रोज़ का स्क्रीन टाइम';

  @override
  String get cvStSub => 'अंदाज़ा काफ़ी है। यह आपके फ़ोन पर ही रहता है।';

  @override
  String cvStMeasured(String time) {
    return 'आज अब तक इस फ़ोन पर मापा गया: $time';
  }

  @override
  String get cvStUnder2 => '2 घंटे से कम';

  @override
  String get cvSt2to4 => '2 से 4 घंटे';

  @override
  String get cvSt4to6 => '4 से 6 घंटे';

  @override
  String get cvStOver6 => '6 घंटे से ज़्यादा';

  @override
  String get cvStNotSure => 'पक्का नहीं पता';

  @override
  String get cvStReplyUnder2 =>
      'यह अच्छा संतुलन है। हम इसे बनाए रखने में मदद करेंगे।';

  @override
  String get cvStReply2to4 => 'कुछ छोटे बदलाव सच में समय बचा सकते हैं।';

  @override
  String get cvStReply4to6 => 'यह काफ़ी है। चलिए कुछ वापस लें।';

  @override
  String get cvStReplyOver6 =>
      'यह दिन का बड़ा हिस्सा है, इसलिए हम छोटे कदम से शुरू करेंगे।';

  @override
  String get cvStReplyNotSure => 'कोई बात नहीं। Pausey इसे माप सकता है।';

  @override
  String get cvPhraseFocus => 'ज़्यादा फ़ोकस';

  @override
  String get cvPhraseSleep => 'बेहतर नींद';

  @override
  String get cvPhraseScrolling => 'कम स्क्रॉलिंग';

  @override
  String get cvPhraseMe => 'अपने लिए ज़्यादा समय';

  @override
  String get cvPhraseHabits => 'सेहतमंद आदतें';

  @override
  String get cvPhraseOther => 'ज़रूरी चीज़ों के लिए ज़्यादा जगह';

  @override
  String cvPhraseOtherNamed(String thing) {
    return '$thing के लिए ज़्यादा समय';
  }

  @override
  String cvReflectApps(String goal, String apps) {
    return 'आप $goal चाहते हैं, लेकिन बार-बार $apps में खो जाते हैं।';
  }

  @override
  String cvReflectNoApps(String goal) {
    return 'आप $goal चाहते हैं, और कभी-कभी फ़ोन बीच में आ जाता है।';
  }

  @override
  String cvReflectEstimate(String time) {
    return 'रोज़ लगभग $time (आपका अंदाज़ा)';
  }

  @override
  String cvReflectMeasured(String time) {
    return 'आज अब तक $time (मापा गया)';
  }

  @override
  String get cvReflectHelp =>
      'Pausey आपको ऐसी दिनचर्या बनाने में मदद कर सकता है जो आपके ध्यान को थोड़ी राहत दे।';

  @override
  String get cvShowMeHow => 'तरीका दिखाएं';

  @override
  String get cvHowTitle => 'Pausey ऐसे मदद करता है';

  @override
  String get cvHowPauseTab => 'विराम';

  @override
  String get cvHowLimitTab => 'सीमाएं';

  @override
  String get cvHowFocusTab => 'फ़ोकस';

  @override
  String get cvHowPauseTitle => 'शांत विराम, सज़ा नहीं';

  @override
  String get cvHowPauseBody =>
      'जब किसी ऐप का समय पूरा हो जाता है, तो Pausey उस पर एक शांत विराम स्क्रीन दिखाता है, और बाहर निकलने का रास्ता भी।';

  @override
  String get cvHowLimitTitle => 'हर ऐप के लिए रोज़ का समय';

  @override
  String get cvHowLimitBody =>
      'हर ऐप को उसका अपना रोज़ का समय और लॉक टाइम दें। एक को बदलने से दूसरा कभी नहीं बदलता।';

  @override
  String get cvHowFocusTitle => 'फ़ोकस सत्र';

  @override
  String get cvHowFocusBody =>
      'काम, पढ़ाई या आराम के लिए टाइमर शुरू करें। आपके चुने हुए ऐप्स उसके खत्म होने तक रुके रहेंगे।';

  @override
  String get cvPreview => 'प्रीव्यू';

  @override
  String get cvYourApp => 'आपका ऐप';

  @override
  String get cvAnotherApp => 'दूसरा ऐप';

  @override
  String cvMinOf(int used, int limit) {
    return '$limit में से $used मि.';
  }

  @override
  String get cvBuildPlan => 'मेरा प्लान बनाएं';

  @override
  String get cvPlanTitle => 'शुरुआत के लिए एक आसान रास्ता';

  @override
  String get cvPlanSub => 'आपके जवाबों के आधार पर सुझाव। जो चाहें बदलें।';

  @override
  String get cvPlanFocus => 'फ़ोकस सत्र';

  @override
  String cvPlanFocusSub(String time) {
    return 'हर सत्र $time';
  }

  @override
  String get cvPlanDaily => 'रोज़ का फ़ोकस लक्ष्य';

  @override
  String cvPlanDailySub(String time) {
    return 'रोज़ $time फ़ोकस';
  }

  @override
  String get cvPlanLimit => 'रोज़ की ऐप सीमा';

  @override
  String cvPlanLimitSub(String app, String time) {
    return '$app: रोज़ $time';
  }

  @override
  String get cvPlanLimitNoPkg =>
      'यह ऐप फ़ोन की सूची में नहीं है, इसलिए सीमा बाद में ऐप लॉक में सेट की जा सकती है।';

  @override
  String get cvPlanWind => 'शाम का सुकून';

  @override
  String cvPlanWindSub(String start, String end) {
    return 'आपके चुने हुए ऐप्स $start से $end तक रुके रहेंगे';
  }

  @override
  String get cvPlanOff => 'बंद';

  @override
  String get cvStarts => 'शुरू';

  @override
  String get cvEnds => 'समाप्त';

  @override
  String get cvPlanNote =>
      'अभी कुछ भी चालू नहीं हुआ है। यह सेटअप पूरा होने पर ही शुरू होगा, और आप इसे कभी भी बदल सकते हैं।';

  @override
  String get cvUsePlan => 'यह प्लान अपनाएं';

  @override
  String get cvPermTitle => 'इसके लिए कुछ अनुमतियां चाहिए';

  @override
  String get cvPermSub =>
      'इनसे Pausey अपना काम ठीक से कर पाता है और आपको बेहतरीन अनुभव मिलता है।';

  @override
  String get cvPermUnsupported =>
      'ऐप सीमाएं और विराम स्क्रीन Android फ़ोन पर काम करती हैं। बाकी सब यहां भी चलता है।';

  @override
  String get cvPermUsageTitle => 'उपयोग एक्सेस';

  @override
  String get cvPermUsageWhy =>
      'इससे Pausey देख सकता है कि आज हर ऐप कितनी देर खुला रहा और स्क्रीन पर कौन-सा ऐप है।';

  @override
  String get cvPermUsageWithout =>
      'इसके बिना Pausey स्क्रीन टाइम नहीं माप सकता, न ही जान सकता है कि सीमा कब पूरी हुई।';

  @override
  String get cvPermOverlayTitle => 'दूसरे ऐप्स के ऊपर दिखाएं';

  @override
  String get cvPermOverlayWhy =>
      'इससे Pausey समय पूरा होने पर ऐप के ऊपर अपनी विराम स्क्रीन दिखा सकता है।';

  @override
  String get cvPermOverlayWithout =>
      'इसके बिना ऐप्स रोके नहीं जा सकते। आपका प्लान बाद के लिए सहेजा रहेगा।';

  @override
  String get cvPermBatteryTitle => 'Pausey को चालू रखें';

  @override
  String get cvPermBatteryWhy =>
      'कुछ फ़ोन बैटरी बचाने के लिए बैकग्राउंड ऐप्स बंद कर देते हैं। Pausey को अनुमति देने से आपकी सीमाएं काम करती रहेंगी।';

  @override
  String get cvPermBatteryWithout =>
      'इसके बिना सीमाएं तब तक रुक सकती हैं जब तक आप Pausey दोबारा न खोलें।';

  @override
  String get cvPermLater => 'आप इसे बाद में Android सेटिंग्स में बदल सकते हैं।';

  @override
  String get cvPermPrivacy =>
      'Pausey सिर्फ़ ऐप्स के नाम और समय पढ़ता है। कुछ भी आपके फ़ोन से बाहर नहीं जाता।';

  @override
  String get cvAllowInSettings => 'सेटिंग्स में अनुमति दें';

  @override
  String get cvAllowed => 'अनुमति दी गई';

  @override
  String get cvOptional => 'वैकल्पिक';

  @override
  String get cvContinueAnyway => 'अभी के लिए जारी रखें';

  @override
  String get cvAccountTitle => 'अपनी प्रगति सहेजें';

  @override
  String get cvAccountSub =>
      'Pausey को मेहमान के रूप में इस्तेमाल करें, या साइन इन करें।';

  @override
  String get cvNameLabel => 'आपका नाम (वैकल्पिक)';

  @override
  String get cvNameHint => 'हम आपको किस नाम से बुलाएं?';

  @override
  String get cvContinueGuest => 'मेहमान के रूप में जारी रखें';

  @override
  String get cvAccountNote =>
      'साइन इन करने से अभी आपका डेटा बैकअप नहीं होता। दोनों ही तरह, आपकी सेटिंग्स इसी फ़ोन पर रहती हैं।';

  @override
  String get cvReadyTitle => 'आपका पहला कदम यहीं से शुरू होता है।';

  @override
  String cvReadyTitleNamed(String name) {
    return '$name, आपका पहला कदम यहीं से शुरू होता है।';
  }

  @override
  String get cvReadyFocus => 'चलिए फ़ोकस के लिए थोड़ी और जगह बनाएं।';

  @override
  String get cvReadySleep => 'चलिए आपकी शामों को थोड़ा और सुकून भरा बनाएं।';

  @override
  String get cvReadyScrolling =>
      'चलिए स्क्रॉलिंग को आपके दिन का थोड़ा कम हिस्सा दें।';

  @override
  String get cvReadyMe => 'चलिए आपके लिए थोड़ा और समय निकालें।';

  @override
  String get cvReadyHabits => 'चलिए ऐसी आदतें बनाएं जो अच्छी लगें।';

  @override
  String get cvReadyOther =>
      'चलिए आपके लिए ज़रूरी चीज़ों के लिए ज़्यादा जगह बनाएं।';

  @override
  String get cvYourPlan => 'आपका प्लान';

  @override
  String cvSumGoal(String goal) {
    return 'लक्ष्य: $goal';
  }

  @override
  String cvSumApps(String apps) {
    return 'ऐप्स: $apps';
  }

  @override
  String cvSumFocus(String session, String daily) {
    return '$session के फ़ोकस सत्र, रोज़ $daily';
  }

  @override
  String get cvReadyNeedsPerm =>
      'ऐप सीमाएं सेव हैं, लेकिन दोनों अनुमतियां मिलने तक काम नहीं करेंगी।';

  @override
  String get cvReadyChange => 'आप यह सब बाद में बदल सकते हैं।';

  @override
  String get cvStartFirstFocus => 'मेरा पहला फ़ोकस सत्र शुरू करें';

  @override
  String get cvFinishLimits => 'ऐप सीमाएं सेट करना पूरा करें';

  @override
  String get cvJourneyTitle => 'अपनी Pausey यात्रा शुरू करें';

  @override
  String get cvJourneySub =>
      'अपनी प्रगति सिंक करने के लिए अकाउंट बनाएं, या मेहमान के रूप में जारी रखें।';

  @override
  String get cvUsageNone => 'आज इस्तेमाल नहीं हुआ';

  @override
  String get cvUsageUnder1 => 'आज 1 मिनट से कम';

  @override
  String cvUsageToday(String time) {
    return 'आज $time';
  }

  @override
  String cvAppsSelected(int count) {
    return '$count ऐप्स चुने गए';
  }

  @override
  String get cvAppsUsageNeeded =>
      'स्क्रीन टाइम की अनुमति दें ताकि Pausey आपके सबसे ज़्यादा इस्तेमाल वाले ऐप्स दिखा सके।';

  @override
  String cvRemoveApp(String app) {
    return '$app हटाएं';
  }

  @override
  String get cvNotifAskTitle => 'समय खत्म होने से पहले याद दिलाएं?';

  @override
  String get cvNotNow => 'अभी नहीं';

  @override
  String get cvA11yTitle => 'बस एक आखिरी बात';

  @override
  String get cvA11ySub =>
      'एक्सेसिबिलिटी चालू करें ताकि Pausey देख सके कौन-सा ऐप खुला है और कितनी देर। फिर यह आपके ऐप्स को ब्लॉक, अनब्लॉक और शेड्यूल कर सकेगा।';

  @override
  String get cvA11yReads => 'Pausey सिर्फ़ यह पढ़ता है:';

  @override
  String get cvA11yRead1 => 'ऐप्स के नाम';

  @override
  String get cvA11yRead2 => 'हर ऐप में बिताया गया समय';

  @override
  String get appName => 'Pausey';

  @override
  String get tagline => 'अपना समय वापस पाएं';

  @override
  String get versionLabel => 'संस्करण 2.0 · ऐप स्टोर संस्करण';

  @override
  String get skip => 'छोड़ें';

  @override
  String get continueLabel => 'जारी रखें';

  @override
  String get back => 'वापस';

  @override
  String get freeToStart => 'मुफ़्त शुरुआत · क्रेडिट कार्ड की ज़रूरत नहीं';

  @override
  String get dataStaysOnDevice =>
      'आपका डेटा कभी आपके डिवाइस से बाहर नहीं जाता।';

  @override
  String get switchToLight => 'लाइट मोड पर जाएं';

  @override
  String get switchToDark => 'डार्क मोड पर जाएं';

  @override
  String get language => 'भाषा';

  @override
  String get phoneLanguage => 'फ़ोन की भाषा';

  @override
  String get authTitle => 'स्क्रॉल रोकें।\nअपने दिन के मालिक बनें।';

  @override
  String get authSubtitle =>
      'अपने लक्ष्य और स्ट्रीक सिंक करने के लिए खाता बनाएं, या मेहमान के रूप में आज़माएं।';

  @override
  String get continueWithApple => 'Apple के साथ जारी रखें';

  @override
  String get continueWithGoogle => 'Google के साथ जारी रखें';

  @override
  String get signUpWithEmail => 'ईमेल से साइन अप करें';

  @override
  String get continueAsGuest => 'मेहमान के रूप में जारी रखें';

  @override
  String get guestNote => 'मेहमान डेटा सिर्फ़ इसी फ़ोन पर सेव होता है।';

  @override
  String get or => 'या';

  @override
  String get haveAccount => 'पहले से खाता है?';

  @override
  String get noAccount => 'Pausey पर नए हैं?';

  @override
  String get logIn => 'लॉग इन';

  @override
  String get signUp => 'साइन अप';

  @override
  String get createAccount => 'खाता बनाएं';

  @override
  String get signUpTitle => 'अपना खाता बनाएं';

  @override
  String get signUpSubtitle => 'स्क्रीन की शांत आदतें बनाना शुरू करें।';

  @override
  String get logInTitle => 'अपने अकाउंट में लॉग इन करें';

  @override
  String get logInSubtitle => 'अपनी स्ट्रीक जारी रखने के लिए लॉग इन करें।';

  @override
  String get fullName => 'पूरा नाम';

  @override
  String get email => 'ईमेल';

  @override
  String get password => 'पासवर्ड';

  @override
  String get confirmPassword => 'पासवर्ड की पुष्टि';

  @override
  String get showPassword => 'पासवर्ड दिखाएं';

  @override
  String get hidePassword => 'पासवर्ड छिपाएं';

  @override
  String get forgotPassword => 'पासवर्ड भूल गए?';

  @override
  String get resetTitle => 'पासवर्ड रीसेट करें';

  @override
  String get resetSubtitle => 'अपना ईमेल डालें, हम रीसेट लिंक भेजेंगे।';

  @override
  String get sendLink => 'लिंक भेजें';

  @override
  String get resetSent => 'रीसेट लिंक के लिए अपना इनबॉक्स देखें।';

  @override
  String get agreeTerms => 'मैं शर्तों और गोपनीयता नीति से सहमत हूँ';

  @override
  String get passwordStrength => 'पासवर्ड की मज़बूती';

  @override
  String get strengthWeak => 'कमज़ोर';

  @override
  String get strengthOk => 'ठीक';

  @override
  String get strengthStrong => 'मज़बूत';

  @override
  String get errNameRequired => 'अपना नाम डालें';

  @override
  String get errEmailInvalid => 'सही ईमेल डालें';

  @override
  String get errPasswordShort => 'कम से कम 8 अक्षर रखें';

  @override
  String get errPasswordMismatch => 'पासवर्ड मेल नहीं खाते';

  @override
  String get errTerms => 'जारी रखने के लिए शर्तें स्वीकार करें';

  @override
  String get authErr_not_configured =>
      'साइन इन अभी सेट नहीं है। आप मेहमान के रूप में जारी रख सकते हैं।';

  @override
  String get authErr_cancelled => 'साइन इन रद्द हो गया।';

  @override
  String get authErr_invalid_email => 'यह ईमेल सही नहीं लगता।';

  @override
  String get authErr_wrong_password => 'ईमेल या पासवर्ड गलत है।';

  @override
  String get authErr_user_not_found =>
      'इस ईमेल से कोई खाता नहीं। साइन अप करें?';

  @override
  String get authErr_email_in_use => 'इस ईमेल से खाता पहले से है। लॉग इन करें।';

  @override
  String get authErr_weak_password => 'मज़बूत पासवर्ड चुनें।';

  @override
  String get authErr_network => 'इंटरनेट कनेक्शन नहीं। फिर कोशिश करें।';

  @override
  String get authErr_too_many =>
      'बहुत सारी कोशिशें। एक मिनट रुककर फिर कोशिश करें।';

  @override
  String get authErr_unknown => 'कुछ गलत हो गया। फिर कोशिश करें।';

  @override
  String homeHello(String name) {
    return 'नमस्ते, $name';
  }

  @override
  String get homeHelloGuest => 'नमस्ते';

  @override
  String get homeGuestBadge => 'मेहमान मोड · इसी फ़ोन पर सेव';

  @override
  String get homeSubtitle => 'आपका प्लान तैयार है। ये रहे आपके चुनाव।';

  @override
  String get homeDailyGoal => 'दैनिक लक्ष्य';

  @override
  String get homeLockedApps => 'लॉक ऐप्स';

  @override
  String get homeScreenTime => 'मौजूदा स्क्रीन टाइम';

  @override
  String get homeNotSet => 'सेट नहीं';

  @override
  String get homeCreateAccount => 'बैकअप के लिए खाता बनाएं';

  @override
  String get signOut => 'साइन आउट';

  @override
  String get signOutGuestWarn =>
      'साइन आउट करने से इस फ़ोन का मेहमान डेटा मिट जाएगा।';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get ob6OtherHint => 'अपना पेशा लिखें';

  @override
  String get timeSecondLabel => 'सेकंड';

  @override
  String get focusModePomodoro => 'पोमोडोरो';

  @override
  String get focusModeDeep => 'गहन फ़ोकस';

  @override
  String get focusModeCustom => 'कस्टम';

  @override
  String get focusRemaining => 'शेष';

  @override
  String get focusBreakLabel => 'ब्रेक';

  @override
  String get focusReadyLabel => 'तैयार';

  @override
  String get focusInSession => 'सत्र जारी';

  @override
  String get focusPausedState => 'रुका हुआ';

  @override
  String get focusOnBreak => 'ब्रेक पर';

  @override
  String get focusIdleState => 'शुरू करने के लिए प्ले दबाएँ';

  @override
  String get focusSessionsDone => 'पूरे सत्र';

  @override
  String get focusProgress => 'प्रगति';

  @override
  String get focusBreakAfter => 'बाद में ब्रेक';

  @override
  String get focusFocusedToday => 'आज फ़ोकस';

  @override
  String focusAppsBlocked(int count) {
    return '$count ऐप ब्लॉक';
  }

  @override
  String get focusAppsBlockedSub => 'इस सत्र में ध्यान भटकाने वाले ऐप बंद हैं।';

  @override
  String get focusNoApps => 'कोई ऐप ब्लॉक नहीं';

  @override
  String get focusNoAppsSub => 'फ़ोकस के समय लॉक करने के लिए ऐप चुनें।';

  @override
  String get focusEdit => 'बदलें';

  @override
  String get focusAdd => 'जोड़ें';

  @override
  String get focusAmbient => 'बैकग्राउंड साउंड';

  @override
  String get focusSoundOff => 'बंद';

  @override
  String get focusSoundRain => 'बारिश';

  @override
  String get focusSoundForest => 'जंगल';

  @override
  String get focusSoundWaves => 'समुद्री लहरें';

  @override
  String get focusSoundWhite => 'व्हाइट नॉइज़';

  @override
  String get focusVolume => 'वॉल्यूम';

  @override
  String get focusStart => 'शुरू';

  @override
  String get focusPause => 'रोकें';

  @override
  String get focusResume => 'जारी रखें';

  @override
  String get focusStop => 'रोकें';

  @override
  String get focusRestart => 'फिर से शुरू';

  @override
  String get focusSkipBreak => 'ब्रेक छोड़ें';

  @override
  String get focusDurations => 'सत्र की अवधि';

  @override
  String focusMinutesN(int n) {
    return '$n मिनट';
  }

  @override
  String get focusBreakLength => 'ब्रेक';

  @override
  String get focusCustomTitle => 'कस्टम अवधि';

  @override
  String get focusSet => 'सेट करें';

  @override
  String get focusStopTitle => 'सत्र जल्दी ख़त्म करें?';

  @override
  String get focusStopBody => 'अब तक का फ़ोकस समय सेव हो जाएगा।';

  @override
  String get focusEndSession => 'सत्र ख़त्म';

  @override
  String get focusKeepGoing => 'जारी रखें';

  @override
  String get focusTooShort => 'एक मिनट से कम — सेव नहीं हुआ।';

  @override
  String get focusBreakOver => 'ब्रेक ख़त्म — अगले के लिए तैयार?';

  @override
  String get focusBusy => 'मोड बदलने के लिए मौजूदा सत्र ख़त्म करें।';

  @override
  String get focusFirstHint => 'आपका पहला सत्र यहीं से — प्ले दबाएँ।';

  @override
  String get focusCompleteA => 'सत्र';

  @override
  String get focusCompleteB => 'पूरा!';

  @override
  String get focusEndedTitle => 'सत्र समाप्त';

  @override
  String focusCompleteMsg(String mode) {
    return 'शानदार! आपने अपना $mode सत्र बिना किसी रुकावट के पूरा किया।';
  }

  @override
  String get focusEndedMsg =>
      'हर मिनट मायने रखता है। अगली बार पूरा सत्र आज़माएँ।';

  @override
  String get focusDurationLabel => 'फ़ोकस अवधि';

  @override
  String get focusMinUnit => 'मिनट';

  @override
  String get focusDayStreak => 'दिन की स्ट्रीक';

  @override
  String get focusAppsLabel => 'ब्लॉक ऐप';

  @override
  String get focusTodayGoal => 'आज का लक्ष्य';

  @override
  String focusPctCompleted(int pct) {
    return '$pct% पूरा';
  }

  @override
  String focusPlusPct(int pct) {
    return '+$pct% इस सत्र से';
  }

  @override
  String get focusMomentum => 'रफ़्तार बनाए रखें!';

  @override
  String get focusQuote1 =>
      'निरंतरता तीव्रता से बेहतर है। हर सत्र महारत बढ़ाता है।';

  @override
  String get focusQuote2 => 'छोटे फ़ोकस ब्लॉक बड़े नतीजे देते हैं।';

  @override
  String get focusQuote3 => 'आपने स्क्रॉल नहीं किया — कुछ बनाया। फिर करें।';

  @override
  String get focusStartNext => 'अगला सत्र शुरू करें';

  @override
  String get focusBackHome => 'डैशबोर्ड पर वापस';

  @override
  String get goalsTitle => 'मेरे लक्ष्य';

  @override
  String goalsSubtitle(int active, int done) {
    return '$active सक्रिय · $done पूरे';
  }

  @override
  String get goalsAdd => 'लक्ष्य जोड़ें';

  @override
  String get goalsCompleted => 'पूरे';

  @override
  String get goalsActive => 'सक्रिय';

  @override
  String get goalsStreak => 'स्ट्रीक';

  @override
  String get goalsOverall => 'कुल प्रगति';

  @override
  String goalsWeeklyHit(int hit, int total) {
    return '$total में से $hit साप्ताहिक लक्ष्य पूरे';
  }

  @override
  String goalsVsLastWeek(String delta) {
    return '$delta पिछले हफ़्ते से';
  }

  @override
  String get goalsFilterAll => 'सभी';

  @override
  String get goalsDone => 'पूरा';

  @override
  String get goalsCatFocus => 'फ़ोकस';

  @override
  String get goalsCatDiscipline => 'अनुशासन';

  @override
  String get goalsCatWellness => 'सेहत';

  @override
  String goalsTitleFocusHours(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'रोज़ाना फ़ोकस: $n घंटे',
      one: 'रोज़ाना फ़ोकस: 1 घंटा',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleFocusDur(String duration) {
    return 'रोज़ाना फ़ोकस: $duration';
  }

  @override
  String get goalsTitleBlock => 'सोशल ऐप्स ब्लॉक करें';

  @override
  String goalsTitleSessions(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'रोज़ $n पोमोडोरो',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleScreen(String duration) {
    return '$duration से कम स्क्रीन टाइम';
  }

  @override
  String get goalsTitlePhoneFree => 'फ़ोन-मुक्त समय';

  @override
  String goalsDescFocus(String duration) {
    return 'हर दिन $duration गहरा फ़ोकस करें';
  }

  @override
  String goalsDescBlock(int n) {
    return 'लॉक ऐप्स को हफ़्ते में $n दिन लॉक रखें';
  }

  @override
  String goalsDescSessions(int n) {
    return 'रोज़ कम से कम $n फ़ोकस सेशन पूरे करें';
  }

  @override
  String goalsDescScreen(String duration) {
    return 'रोज़ाना फ़ोन का उपयोग $duration से कम रखें';
  }

  @override
  String goalsDescPhoneFree(int n) {
    return 'हफ़्ते में $n फ़ोन-मुक्त दिन — हर दिन टिक करें';
  }

  @override
  String goalsProgressDays(int done, int total) {
    return '$done / $total दिन';
  }

  @override
  String goalsProgressSessions(int done, int total) {
    return '$done / $total सेशन';
  }

  @override
  String goalsStreakShort(int n) {
    return '$n दि';
  }

  @override
  String goalsStreakN(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n दिन की स्ट्रीक',
    );
    return '$_temp0';
  }

  @override
  String get goalsCheckIn => 'आज पूरा मार्क करें';

  @override
  String get goalsCheckedIn => 'आज पूरा';

  @override
  String get goalsCheckedSnack => 'बढ़िया! आज पूरा मार्क हो गया।';

  @override
  String get goalsUncheckedSnack => 'आज का निशान हटा दिया गया।';

  @override
  String get goalsCreateNew => 'नया लक्ष्य बनाएं';

  @override
  String get goalsEmptyBadge => 'शुरू करें';

  @override
  String get goalsEmptyTitle => 'अभी कोई लक्ष्य नहीं';

  @override
  String get goalsEmptyMsg =>
      'एक छोटा रोज़ाना लक्ष्य बनाएं, Pausey उसे ट्रैक करेगा।';

  @override
  String get goalsFilterEmpty => 'इस फ़िल्टर में कोई लक्ष्य नहीं।';

  @override
  String get goalsNewGoal => 'नया लक्ष्य';

  @override
  String get goalsEditGoal => 'लक्ष्य बदलें';

  @override
  String get goalsType => 'लक्ष्य का प्रकार';

  @override
  String get goalsTypeFocus => 'फ़ोकस समय';

  @override
  String get goalsTypeSessions => 'फ़ोकस सेशन';

  @override
  String get goalsTypeBlock => 'ऐप्स ब्लॉक';

  @override
  String get goalsTypePhoneFree => 'फ़ोन-मुक्त दिन';

  @override
  String get goalsTypeScreen => 'स्क्रीन टाइम सीमा';

  @override
  String get goalsCategory => 'श्रेणी';

  @override
  String get goalsTarget => 'लक्ष्य';

  @override
  String get goalsPerDay => 'प्रति दिन';

  @override
  String get goalsPerWeek => 'दिन प्रति सप्ताह';

  @override
  String get goalsMaxPerDay => 'अधिकतम प्रति दिन';

  @override
  String get goalsTitleOptional => 'शीर्षक (वैकल्पिक)';

  @override
  String get goalsSave => 'लक्ष्य सेव करें';

  @override
  String get goalsCreate => 'लक्ष्य बनाएं';

  @override
  String get goalsSavedSnack => 'लक्ष्य सेव हो गया';

  @override
  String get goalsCreatedSnack => 'लक्ष्य बन गया';

  @override
  String get goalsEdit => 'बदलें';

  @override
  String get goalsDelete => 'लक्ष्य हटाएं';

  @override
  String get goalsDeleteQ => 'यह लक्ष्य हटाएं?';

  @override
  String get goalsDeleteMsg => 'इसके चेक-इन भी हट जाएंगे। यह वापस नहीं होगा।';

  @override
  String get goalsDeletedSnack => 'लक्ष्य हटा दिया गया';

  @override
  String get goalsComplete => 'पूरा';

  @override
  String get goalsDaysActive => 'सक्रिय दिन';

  @override
  String get goalsTotalTime => 'कुल समय';

  @override
  String get goalsSessionsLabel => 'सेशन';

  @override
  String get goals7Day => '7 दिन की प्रगति';

  @override
  String get goals7DaysAgo => '7 दिन पहले';

  @override
  String get goalsToday => 'आज';

  @override
  String goalsTodayDate(String date) {
    return 'आज, $date';
  }

  @override
  String goalsYesterdayDate(String date) {
    return 'कल, $date';
  }

  @override
  String get goalsMilestones => 'उपलब्धियां';

  @override
  String get goalsMsFirst => 'पहला दिन पूरा';

  @override
  String get goalsMs3 => '3 दिन की स्ट्रीक';

  @override
  String get goalsMsHalf => 'साप्ताहिक लक्ष्य का 50%';

  @override
  String get goalsMs5 => '5 दिन की स्ट्रीक';

  @override
  String get goalsMsWeek => 'पूरा हफ़्ता पूरा';

  @override
  String get goalsMsLocked => 'अभी नहीं';

  @override
  String get goalsHistory => 'गतिविधि इतिहास';

  @override
  String get goalsShowLess => 'कम दिखाएं';

  @override
  String get goalsStartSession => 'फ़ोकस सेशन शुरू करें';

  @override
  String get goalsManageApps => 'ब्लॉक ऐप्स संभालें';

  @override
  String get goalsBlockHint =>
      'लॉक शेड्यूल चालू और ऐप्स लॉक हों तो अपने आप गिना जाता है।';

  @override
  String goalsScreenToday(String used) {
    return 'आज स्क्रीन टाइम: $used';
  }

  @override
  String get goalsNotFound => 'यह लक्ष्य अब मौजूद नहीं है।';

  @override
  String get goalsMore => 'और विकल्प';

  @override
  String goalsFreeLimit(int n) {
    return 'मुफ़्त प्लान: अधिकतम $n लक्ष्य';
  }

  @override
  String get homeGoodMorning => 'सुप्रभात';

  @override
  String get homeGoodAfternoon => 'नमस्कार';

  @override
  String get homeGoodEvening => 'शुभ संध्या';

  @override
  String get homeFriend => 'दोस्त';

  @override
  String get homeTodayFocus => 'आज का फ़ोकस';

  @override
  String homeVsYesterday(String pct) {
    return 'कल की तुलना में $pct%';
  }

  @override
  String get homeStartToday => 'आज अभी फ़ोकस नहीं';

  @override
  String get homeDayStreak => 'दिन की स्ट्रीक';

  @override
  String get homeTodayGoal => 'आज का लक्ष्य';

  @override
  String homePctCompleted(int pct) {
    return '$pct% पूरा';
  }

  @override
  String get homeOnTrack => 'सही राह पर!';

  @override
  String get homeKeepGoing => 'जारी रखें';

  @override
  String get homeGoalMet => 'लक्ष्य पूरा!';

  @override
  String get homeScreenTimeTitle => 'स्क्रीन टाइम';

  @override
  String get homeToday => 'आज';

  @override
  String homeVsAvg(String pct) {
    return 'औसत से $pct%';
  }

  @override
  String get homeQuickStart => 'तुरंत फ़ोकस सेशन शुरू करें';

  @override
  String get homeManage => 'प्रबंधित करें';

  @override
  String get homeNoApps =>
      'सबसे ज़्यादा ध्यान भटकाने वाले ऐप चुनें और यहाँ लॉक करें।';

  @override
  String get homeAddApps => 'ऐप जोड़ें';

  @override
  String homeAppLocked(String app) {
    return '$app लॉक हुआ';
  }

  @override
  String homeAppUnlocked(String app) {
    return '$app अनलॉक हुआ';
  }

  @override
  String homeLockApp(String app) {
    return '$app लॉक या अनलॉक करें';
  }

  @override
  String get homeUpgradeTitle => 'प्रीमियम में अपग्रेड करें';

  @override
  String get homeUpgradeBody => 'असीमित ब्लॉक, लक्ष्य और गहरा विश्लेषण।';

  @override
  String get homeTryFree => 'मुफ़्त आज़माएँ';

  @override
  String get homePro => 'PRO';

  @override
  String get homeProActive => 'Pausey Pro सक्रिय है';

  @override
  String get homeProActiveBody => 'सभी फ़ीचर अनलॉक। साथ देने के लिए धन्यवाद!';

  @override
  String get homeNotifications => 'सूचनाएँ';

  @override
  String get homeNoNotifications => 'कोई नई सूचना नहीं।';

  @override
  String get homePushLabel => 'पुश सूचनाएँ';

  @override
  String get homeFocusReminder => 'दैनिक फ़ोकस रिमाइंडर';

  @override
  String get homeStreakAlerts => 'स्ट्रीक अलर्ट';

  @override
  String get homePwTitle => 'Pausey Pro अनलॉक करें';

  @override
  String get homePwSubtitle => 'अपना ध्यान वापस पाएँ और फ़ोन की लत छोड़ें।';

  @override
  String get homePwMonthly => 'मासिक';

  @override
  String get homePwBilledMonthly => 'हर महीने बिल';

  @override
  String get homePwYearly => 'वार्षिक';

  @override
  String get homePwPopular => 'सबसे लोकप्रिय';

  @override
  String homePwSave(int pct) {
    return '$pct% बचाएँ';
  }

  @override
  String homePwBilledYearly(String price) {
    return '$price सालाना बिल';
  }

  @override
  String get homePwLifetime => 'लाइफ़टाइम';

  @override
  String get homePwBestValue => 'सबसे किफ़ायती';

  @override
  String get homePwPayOnce => 'एक बार भुगतान, हमेशा के लिए';

  @override
  String get homePwPerMonth => '/ माह';

  @override
  String get homePwOnce => 'एक बार';

  @override
  String get homePwStartTrial => '7 दिन का मुफ़्त ट्रायल शुरू करें';

  @override
  String get homePwBuyLifetime => 'लाइफ़टाइम एक्सेस पाएँ';

  @override
  String get homePwNoCharge => 'आज कोई शुल्क नहीं · कभी भी रद्द करें';

  @override
  String get homePwOneTime => 'एक बार भुगतान · कोई सब्सक्रिप्शन नहीं';

  @override
  String get homePwFree => 'मुफ़्त';

  @override
  String get homePwProCol => 'Pro';

  @override
  String get homePwFeatBlocking => 'असीमित ऐप ब्लॉकिंग';

  @override
  String get homePwFeatSessions => 'सभी फ़ोकस मोड';

  @override
  String get homePwFeatGoals => 'असीमित लक्ष्य';

  @override
  String get homePwFeatAnalytics => 'एडवांस्ड एनालिटिक्स';

  @override
  String get homePwFeatStreak => 'स्ट्रीक सुरक्षा';

  @override
  String get homePwFeatSchedule => 'फ़ोकस शेड्यूलिंग';

  @override
  String get homePwFeatFaceId => 'फ़ेस आईडी ऐप लॉक';

  @override
  String get homePwFeatNotif => 'स्मार्ट सूचनाएँ';

  @override
  String homePwMax(int n) {
    return 'अधिकतम $n';
  }

  @override
  String get homePwSecure => 'सुरक्षित भुगतान';

  @override
  String get homePwCancelAnytime => 'कभी भी रद्द करें';

  @override
  String get homePwPrivacyFirst => 'निजता पहले';

  @override
  String get homePwRestore => 'खरीदारी बहाल करें';

  @override
  String get homePwTerms => 'सेवा की शर्तें';

  @override
  String get homePwPrivacyPolicy => 'गोपनीयता नीति';

  @override
  String get homePwWelcome => 'Pausey Pro में आपका स्वागत है!';

  @override
  String get homePwNothingToRestore => 'कोई पिछली खरीदारी नहीं मिली।';

  @override
  String get homePwRestored => 'आपका Pro एक्सेस सक्रिय है।';

  @override
  String get homePwLinkSoon => 'यह पेज जल्द हमारी वेबसाइट पर खुलेगा।';

  @override
  String get homePwYouArePro => 'आप Pro हैं — आनंद लें!';

  @override
  String get homePwClose => 'बंद करें';

  @override
  String get homeAvgLegend => '7 दिन का औसत';

  @override
  String homeGoalOf(String done, String goal) {
    return '$goal में से $done';
  }

  @override
  String get homeBest => 'सर्वश्रेष्ठ:';

  @override
  String get homeMyApps => 'मेरे ऐप्स';

  @override
  String get homeManageApps => 'ऐप्स मैनेज करें';

  @override
  String get homeUnblockApps => 'ऐप्स अनब्लॉक करें';

  @override
  String homeAppsLocked(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ऐप्स लॉक हैं',
      one: '1 ऐप लॉक है',
    );
    return '$_temp0';
  }

  @override
  String homeAppNamesMore(String names, int count) {
    return '$names +$count';
  }

  @override
  String get homeNoLockedApps => 'अभी कोई ऐप लॉक नहीं';

  @override
  String get homeNoLockedAppsSub => 'वे ऐप्स चुनें जो आपको खींचते हैं';

  @override
  String get insightsAnalytics => 'एनालिटिक्स';

  @override
  String get insightsScreenTime => 'स्क्रीन टाइम';

  @override
  String get insightsToday => 'आज';

  @override
  String get insightsWeek => 'सप्ताह';

  @override
  String get insightsMonth => 'महीना';

  @override
  String get insightsProductivity => 'उत्पादकता स्कोर';

  @override
  String insightsPts(String delta) {
    return '$delta अंक';
  }

  @override
  String get insightsVsLastWeek => 'पिछले सप्ताह से';

  @override
  String get insightsVsLastMonth => 'पिछले महीने से';

  @override
  String insightsScoreDays(int n) {
    return '$n दिन का स्कोर';
  }

  @override
  String get insightsFocusHours => 'फ़ोकस घंटे';

  @override
  String get insightsThisWeek => 'इस सप्ताह';

  @override
  String get insightsThisMonth => 'इस महीने';

  @override
  String insightsGoalOf(String done, String goal) {
    return '$done / $goal लक्ष्य';
  }

  @override
  String get insightsFocusScore => 'फ़ोकस स्कोर';

  @override
  String get insightsGoals => 'लक्ष्य';

  @override
  String get insightsConsistency => 'निरंतरता';

  @override
  String get insightsWeeklyFocus => 'साप्ताहिक फ़ोकस घंटे';

  @override
  String insightsDailyFocus(int n) {
    return 'दैनिक फ़ोकस, पिछले $n दिन';
  }

  @override
  String insightsBestDay(String day, String time) {
    return 'सबसे अच्छा दिन: $day · $time';
  }

  @override
  String insightsAvgDay(String time) {
    return 'औसत $time / दिन';
  }

  @override
  String get insightsMonthlyTrends => 'मासिक रुझान';

  @override
  String get insightsActual => 'वास्तविक';

  @override
  String get insightsGoal => 'लक्ष्य';

  @override
  String insightsWk(int n) {
    return 'स $n';
  }

  @override
  String insightsWeekBeat(int n, String time) {
    return 'सप्ताह $n ने लक्ष्य $time से पार किया';
  }

  @override
  String insightsWeekShort(int n, String time) {
    return 'सबसे अच्छा सप्ताह $n, लक्ष्य से $time कम';
  }

  @override
  String get insightsGoalCompletion => 'लक्ष्य पूर्ति';

  @override
  String insightsDaysOf(int done, int total) {
    return '$done/$total दिन';
  }

  @override
  String get insightsNoGoals =>
      'अभी कोई लक्ष्य नहीं। प्रगति देखने के लिए एक जोड़ें।';

  @override
  String get insightsManageGoals => 'प्रबंधित करें';

  @override
  String insightsGoalFocus(String hours) {
    return 'दैनिक फ़ोकस: $hours घंटे';
  }

  @override
  String get insightsGoalBlock => 'सोशल ऐप्स ब्लॉक करें';

  @override
  String insightsGoalPomo(int n) {
    return 'प्रति दिन $n पोमोडोरो';
  }

  @override
  String insightsGoalScreen(String time) {
    return '$time से कम स्क्रीन टाइम';
  }

  @override
  String get insightsGoalPhoneFree => 'फ़ोन-मुक्त समय';

  @override
  String get insightsEmptyBadge => 'अभी कोई सेशन नहीं';

  @override
  String get insightsEmptyTitle => 'आपकी इनसाइट्स एक सेशन से शुरू होती हैं';

  @override
  String get insightsEmptyBody =>
      'एक फ़ोकस सेशन पूरा करें, आपके स्कोर, चार्ट और लक्ष्य प्रगति यहाँ दिखेंगे।';

  @override
  String get insightsEmptyCta => 'फ़ोकस सेशन शुरू करें';

  @override
  String get insightsDailyUsage => 'दैनिक उपयोग';

  @override
  String get insightsFocusTime => 'फ़ोकस टाइम';

  @override
  String get insightsVsAvg => 'औसत से';

  @override
  String get insightsUsageByDay => 'दिन के अनुसार उपयोग';

  @override
  String get insightsUsageByWeek => 'सप्ताह के अनुसार उपयोग';

  @override
  String get insightsUsage => 'उपयोग';

  @override
  String insightsTrend(int n) {
    return '$n दिन का रुझान';
  }

  @override
  String get insightsImproving => 'सुधार';

  @override
  String get insightsRising => 'बढ़ रहा है';

  @override
  String insightsDaysAgo(int n) {
    return '$n दिन पहले';
  }

  @override
  String get insightsMostUsed => 'सबसे ज़्यादा उपयोग वाले ऐप्स';

  @override
  String get insightsAllApps => 'सभी ऐप्स';

  @override
  String get insightsBreakdown => 'उपयोग का विवरण';

  @override
  String get insightsTotal => 'कुल';

  @override
  String get insightsNoUsage => 'इस अवधि में कोई स्क्रीन टाइम दर्ज नहीं।';

  @override
  String get insightsLockApp => 'यह ऐप लॉक करें';

  @override
  String insightsLocked(String app) {
    return '$app अब लॉक है';
  }

  @override
  String get insightsCatSocial => 'सोशल';

  @override
  String get insightsCatVideo => 'वीडियो';

  @override
  String get insightsCatGames => 'गेम्स';

  @override
  String get insightsCatShopping => 'शॉपिंग';

  @override
  String get insightsCatCommunity => 'कम्युनिटी';

  @override
  String get insightsCatOther => 'अन्य';

  @override
  String nativeBlockTitle(String app) {
    return '$app रोका गया है';
  }

  @override
  String get nativeReasonLimit => 'आप आज इस ऐप का समय इस्तेमाल कर चुके हैं।';

  @override
  String get nativeReasonSchedule => 'अभी लॉक शेड्यूल चालू है।';

  @override
  String get nativeReasonGlobal => 'यह ऐप Pausey में लॉक है।';

  @override
  String get nativeReasonFocus => 'आप फ़ोकस सेशन में हैं।';

  @override
  String get nativeClose => 'ऐप बंद करें';

  @override
  String get nativeNotifTitle => 'Pausey आपकी सीमाएँ बनाए रख रहा है';

  @override
  String get nativeNotifText => 'ऐप सीमाएँ और लॉक शेड्यूल चालू हैं';

  @override
  String get profileSettings => 'सेटिंग्स';

  @override
  String get profileGuestName => 'अतिथि';

  @override
  String get profileGuestBadge => 'अतिथि · इसी फ़ोन पर सहेजा गया';

  @override
  String get profileEditName => 'नाम बदलें';

  @override
  String get profileNameHint => 'आपका नाम';

  @override
  String get profileSave => 'सहेजें';

  @override
  String profileMemberSince(String date) {
    return '$date से सदस्य';
  }

  @override
  String get profileProActive => 'Pro · सक्रिय';

  @override
  String get profileFree => 'मुफ़्त प्लान';

  @override
  String get profileUpgrade => 'अपग्रेड';

  @override
  String get profileBadges => 'बैज';

  @override
  String get profileNoBadges => 'बैज पाने के लिए फ़ोकस सेशन पूरे करें';

  @override
  String get profileFocusTime => 'फ़ोकस समय';

  @override
  String get profileGoalsDone => 'पूरे लक्ष्य';

  @override
  String get profileDayStreak => 'दिन की स्ट्रीक';

  @override
  String get profileAppsBlocked => 'ब्लॉक ऐप्स';

  @override
  String get profileFocusActivity => 'फ़ोकस गतिविधि';

  @override
  String get profileLast4Weeks => 'पिछले 4 हफ़्ते';

  @override
  String get profileRecentActivity => 'हाल की गतिविधि';

  @override
  String get profileSessionDone => 'फ़ोकस सेशन पूरा हुआ';

  @override
  String get profileSessionStopped => 'सेशन जल्दी खत्म हुआ';

  @override
  String get profileModePomodoro => 'पोमोडोरो';

  @override
  String get profileModeDeep => 'डीप वर्क';

  @override
  String get profileModeCustom => 'कस्टम';

  @override
  String get profileJustNow => 'अभी';

  @override
  String profileAgoMinutes(int n) {
    return '$n मि पहले';
  }

  @override
  String profileAgoHours(int n) {
    return '$n घं पहले';
  }

  @override
  String get profileYesterday => 'कल';

  @override
  String get profileEmptyTitle => 'अभी कोई फ़ोकस सेशन नहीं';

  @override
  String get profileEmptyBody =>
      'पहला सेशन शुरू करें — आपकी गतिविधि, स्ट्रीक और बैज यहाँ दिखेंगे।';

  @override
  String get profileStartFocus => 'फ़ोकस शुरू करें';

  @override
  String get profileMyGoals => 'मेरे लक्ष्य';

  @override
  String get profileStreaks => 'स्ट्रीक और बैज';

  @override
  String get profileSubscription => 'सदस्यता';

  @override
  String get profileSignOutTitle => 'साइन आउट करें?';

  @override
  String get profileSignOutBody => 'आप कभी भी फिर से लॉग इन कर सकते हैं।';

  @override
  String get profileSecNotifications => 'सूचनाएँ';

  @override
  String get profileSecAppearance => 'रूप';

  @override
  String get profileSecFocus => 'फ़ोकस और ब्लॉकिंग';

  @override
  String get profileSecPrivacy => 'गोपनीयता और सुरक्षा';

  @override
  String get profileSecAccount => 'खाता';

  @override
  String get profilePush => 'पुश सूचनाएँ';

  @override
  String get profilePushSub => 'फ़ोकस रिमाइंडर और अलर्ट';

  @override
  String get profileReminder => 'फ़ोकस शुरू करने का रिमाइंडर';

  @override
  String profileReminderSub(String time) {
    return 'रोज़ $time बजे';
  }

  @override
  String get profileStreakAlerts => 'स्ट्रीक अलर्ट';

  @override
  String get profileStreakAlertsSub => 'स्ट्रीक टूटने से पहले';

  @override
  String get profileGoalMilestones => 'लक्ष्य माइलस्टोन';

  @override
  String get profileGoalMilestonesSub => 'जब आप लक्ष्य पूरा करें';

  @override
  String get profileDarkMode => 'डार्क मोड';

  @override
  String get profileOn => 'चालू';

  @override
  String get profileOff => 'बंद';

  @override
  String get profileTextSize => 'टेक्स्ट का आकार';

  @override
  String get profileTextSmall => 'छोटा';

  @override
  String get profileTextMedium => 'मध्यम';

  @override
  String get profileTextLarge => 'बड़ा';

  @override
  String get profileTextHuge => 'बहुत बड़ा';

  @override
  String get profilePomodoroLen => 'पोमोडोरो अवधि';

  @override
  String get profileBreakLen => 'ब्रेक अवधि';

  @override
  String profileMinutes(int n) {
    return '$n मिनट';
  }

  @override
  String get profileFaceIdUnlock => 'अनलॉक के लिए Face ID';

  @override
  String get profileFaceIdUnlockSub => 'ऐप अनलॉक करने से पहले पुष्टि';

  @override
  String get profileBypass => 'आपातकालीन बायपास';

  @override
  String profileBypassSub(int n) {
    return 'रोज़ $n अनलॉक';
  }

  @override
  String get profileAppLock => 'Face ID से Pausey लॉक करें';

  @override
  String get profileAppLockSub => 'ऐप खोलते समय पूछें';

  @override
  String get profileHideUsage => 'उपयोग डेटा छिपाएँ';

  @override
  String get profileHideUsageSub => 'स्क्रीन टाइम के आँकड़े छिपाएँ';

  @override
  String get profileClearData => 'गतिविधि डेटा हटाएँ';

  @override
  String get profileClearDataSub => 'सेशन और लक्ष्य इतिहास हटाता है';

  @override
  String get profileClearTitle => 'गतिविधि डेटा हटाएँ?';

  @override
  String get profileClearBody =>
      'इससे इस फ़ोन के सभी फ़ोकस सेशन और लक्ष्य रिकॉर्ड हट जाएँगे। इसे वापस नहीं किया जा सकता।';

  @override
  String get profileClear => 'हटाएँ';

  @override
  String get profileCleared => 'गतिविधि डेटा हटा दिया गया';

  @override
  String get profileExport => 'मेरा डेटा एक्सपोर्ट करें';

  @override
  String get profileExportSub => 'JSON के रूप में कॉपी करें';

  @override
  String get profileExported => 'आपका डेटा क्लिपबोर्ड पर कॉपी हो गया';

  @override
  String get profileStreaksTitle => 'स्ट्रीक';

  @override
  String get profileShare => 'शेयर करें';

  @override
  String profileShareText(int n) {
    return 'मैं Pausey के साथ $n दिन की फ़ोकस स्ट्रीक पर हूँ!';
  }

  @override
  String get profileCopied => 'क्लिपबोर्ड पर कॉपी हुआ';

  @override
  String profileNextMilestone(int n) {
    return 'जारी रखें – अगले माइलस्टोन तक $n दिन!';
  }

  @override
  String get profileAllMilestones => 'सारे माइलस्टोन पूरे। शानदार!';

  @override
  String get profileStartStreak =>
      'स्ट्रीक शुरू करने के लिए आज एक फ़ोकस सेशन पूरा करें।';

  @override
  String get profileBest => 'सर्वश्रेष्ठ';

  @override
  String get profileThisWeek => 'इस हफ़्ते';

  @override
  String profileDaysCompleted(int n) {
    return '$n/7 दिन पूरे';
  }

  @override
  String get profileCompleted => 'पूरा';

  @override
  String get profilePartial => 'आंशिक';

  @override
  String get profileMissed => 'छूटा';

  @override
  String get profilePrevMonth => 'पिछला महीना';

  @override
  String get profileNextMonth => 'अगला महीना';

  @override
  String get profileMilestones => 'स्ट्रीक माइलस्टोन';

  @override
  String get profileAchievements => 'उपलब्धियाँ';

  @override
  String get profileAchOnFire => 'ऑन फ़ायर';

  @override
  String get profileAchIronWill => 'दृढ़ इच्छा';

  @override
  String get profileAchFocusMaster => 'फ़ोकस मास्टर';

  @override
  String get profileAchMonk => 'डिजिटल मॉन्क';

  @override
  String get profileAchLegend => 'लेजेंडरी';

  @override
  String get profileAchSpeed => 'स्पीड डेमन';

  @override
  String profileAchStreakDesc(int n) {
    return '$n दिन की स्ट्रीक';
  }

  @override
  String profileAchSessionsDesc(int n) {
    return '$n सेशन पूरे';
  }

  @override
  String profileAchHoursDesc(int n) {
    return 'कुल $n घंटे फ़ोकस';
  }

  @override
  String profileAchDayDesc(int n) {
    return 'एक दिन में $n सेशन';
  }

  @override
  String get navHome => 'होम';

  @override
  String get navBlock => 'ब्लॉक';

  @override
  String get navFocus => 'फ़ोकस';

  @override
  String get navInsights => 'इनसाइट्स';

  @override
  String get navProfile => 'प्रोफ़ाइल';

  @override
  String get unitH => 'घं';

  @override
  String get unitM => 'मि';

  @override
  String get sampleData => 'नमूना डेटा';

  @override
  String get seeAll => 'सभी देखें';

  @override
  String days(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count दिन',
      one: '1 दिन',
    );
    return '$_temp0';
  }

  @override
  String get statesTitle => 'स्थितियाँ';

  @override
  String get statesSubtitle => 'त्रुटि, खाली और लोडिंग स्क्रीन';

  @override
  String get statesNoInternet => 'इंटरनेट नहीं';

  @override
  String get statesConnectionLost => 'कनेक्शन टूटा';

  @override
  String get statesOfflineTitle => 'आप ऑफ़लाइन हैं';

  @override
  String get statesOfflineMsg =>
      'Pausey अभी सर्वर तक नहीं पहुँच पा रहा। अपना Wi-Fi या मोबाइल डेटा जाँचें और फिर कोशिश करें – आपका स्थानीय डेटा सुरक्षित है।';

  @override
  String get statesTryAgain => 'फिर कोशिश करें';

  @override
  String get statesOpenSettings => 'सेटिंग्स खोलें';

  @override
  String get statesOfflineMode => 'ऑफ़लाइन मोड चालू';

  @override
  String get statesLimited => 'सीमित';

  @override
  String get statesAvailable => 'उपलब्ध';

  @override
  String get statesUnavailable => 'अनुपलब्ध';

  @override
  String get statesCapSessions => 'पिछले सत्र देखें';

  @override
  String get statesCapApps => 'लॉक ऐप सूची देखें';

  @override
  String get statesCapTimer => 'स्थानीय फ़ोकस टाइमर चलाएँ';

  @override
  String get statesCapSync => 'स्ट्रीक और लक्ष्य सिंक';

  @override
  String get statesCapAnalytics => 'एनालिटिक्स डेटा ताज़ा करें';

  @override
  String get statesOfflineNote =>
      'आपका सारा फ़ोकस डेटा डिवाइस पर सहेजा है। ऑफ़लाइन होने पर कुछ नहीं खोता।';

  @override
  String get statesBackOnline => 'फिर ऑनलाइन – सब सिंक हो गया';

  @override
  String get statesShowAgain => 'स्थिति फिर दिखाएँ';

  @override
  String get statesPermDenied => 'अनुमति अस्वीकृत';

  @override
  String get statesPermRequired => 'अनुमति आवश्यक';

  @override
  String get statesPermTitle => 'पहुँच अवरुद्ध';

  @override
  String get statesPermMsg =>
      'ऐप ब्लॉक करने के लिए Pausey को स्क्रीन टाइम अनुमति चाहिए। इसके बिना ब्लॉकिंग काम नहीं करेगी।';

  @override
  String get statesGrant => 'अनुमति दें';

  @override
  String get statesLearnMore => 'और जानें';

  @override
  String get statesLearnMoreMsg =>
      'स्क्रीन टाइम अनुमति से Pausey ध्यान भटकाने वाले ऐप रोक सकता है। आपका डेटा फ़ोन से बाहर नहीं जाता।';

  @override
  String get statesRequiredPerms => 'आवश्यक अनुमतियाँ';

  @override
  String get statesPermNotif => 'सूचनाएँ';

  @override
  String get statesPermScreenTime => 'स्क्रीन टाइम अनुमति';

  @override
  String get statesPermUsage => 'ऐप उपयोग आँकड़े';

  @override
  String get statesPermBio => 'फ़ेस आईडी / बायोमेट्रिक';

  @override
  String get statesGranted => 'अनुमत';

  @override
  String get statesDenied => 'अस्वीकृत';

  @override
  String get statesPermNote =>
      'स्क्रीन टाइम के बिना फ़ोकस टाइमर चलेगा, पर ऐप ब्लॉक नहीं होंगे।';

  @override
  String get statesAccessGranted => 'अनुमति मिली – ऐप ब्लॉकिंग तैयार';

  @override
  String get statesDataNA => 'डेटा उपलब्ध नहीं';

  @override
  String get statesSyncFailed => 'सिंक विफल';

  @override
  String get statesLoadTitle => 'डेटा लोड नहीं हुआ';

  @override
  String get statesLoadMsg =>
      'आपके एनालिटिक्स लाते समय गड़बड़ हुई। शायद सर्वर की अस्थायी दिक्कत है – आपका स्थानीय डेटा सुरक्षित है।';

  @override
  String get statesRetrySync => 'फिर सिंक करें';

  @override
  String get statesUseCached => 'कैश उपयोग करें';

  @override
  String get statesErrorDetails => 'त्रुटि विवरण';

  @override
  String get statesErrorCode => 'त्रुटि कोड';

  @override
  String get statesTimestamp => 'समय';

  @override
  String get statesRetryCount => 'प्रयास';

  @override
  String statesAttempts(int n) {
    return '$n / 3 प्रयास';
  }

  @override
  String get statesReport => 'सहायता को रिपोर्ट करें';

  @override
  String get statesReported => 'धन्यवाद – रिपोर्ट भेज दी गई';

  @override
  String get statesCachedNote => 'इस बीच पिछले सफल सिंक का कैश डेटा उपलब्ध है।';

  @override
  String get statesDataLoaded => 'एनालिटिक्स लोड हुए';

  @override
  String get statesCachedShown => 'कैश डेटा दिखाया जा रहा है';

  @override
  String statesWeekFocus(String time) {
    return 'इस हफ़्ते फ़ोकस: $time';
  }

  @override
  String get statesEmpty => 'खाली स्थिति';

  @override
  String get statesNothingYet => 'अभी कुछ नहीं';

  @override
  String get statesEmptyTitle => 'अभी कोई सत्र नहीं';

  @override
  String get statesEmptyMsg =>
      'पहला फ़ोकस सत्र शुरू करें, आपकी प्रगति यहाँ दिखेगी।';

  @override
  String get statesStartFocus => 'फ़ोकस शुरू करें';

  @override
  String get statesLoadingSection => 'लोडिंग स्थितियाँ';

  @override
  String get statesDashLoading => 'डैशबोर्ड';

  @override
  String get statesAnalyticsLoading => 'एनालिटिक्स';

  @override
  String get statesGoalsLoading => 'लक्ष्य';

  @override
  String get statesProfileLoading => 'प्रोफ़ाइल';

  @override
  String get statesCrunching => 'आपका डेटा तैयार हो रहा है…';

  @override
  String get statesLoadingGoals => 'लक्ष्य लोड हो रहे हैं…';

  @override
  String get statesLoadingProfile => 'प्रोफ़ाइल लोड हो रही है…';

  @override
  String get statesReplay => 'फिर चलाएँ';

  @override
  String get stHowCaption => 'यह कैसे काम करता है';

  @override
  String stHow1(String app) {
    return 'आप फिर से $app खोलते हैं';
  }

  @override
  String get stHow2 => 'आप स्क्रॉल करने लगते हैं, पर…';

  @override
  String get stHow3 => 'Pausey उसे धीरे से ब्लॉक कर देता है।';

  @override
  String stBlockedTitle(String app) {
    return '$app ब्लॉक है';
  }

  @override
  String get stHow4 => 'लिमिट से पहले याद दिलाता है';

  @override
  String get stYourApp => 'अपना ऐप';

  @override
  String get stTapToContinue => 'आगे बढ़ने के लिए टैप करें';

  @override
  String get stNudgeGeneric => 'आपकी रोज़ की सीमा लगभग पूरी';

  @override
  String get stPermTitle => 'कुछ अनुमतियाँ दें';

  @override
  String get stPermUsageTitle => 'स्क्रीन टाइम';

  @override
  String get stPermUsageWhy =>
      'आपका रोज़ का स्क्रीन टाइम दिखाता है और बताता है कि सीमा कब पूरी हुई।';

  @override
  String get stPermOverlayTitle => 'दूसरे ऐप्स के ऊपर दिखाएँ';

  @override
  String get stPermOverlayWhy =>
      'Pausey को ध्यान भटकाने वाले ऐप के ऊपर पॉज़ स्क्रीन दिखाने देता है।';

  @override
  String get stPermNotifTitle => 'सूचनाएँ';

  @override
  String get stPermNotifWhy =>
      'सीमा खत्म होने से पहले हल्की याद दिलाहट। आप इसे बाद में बंद कर सकते हैं।';

  @override
  String get stPermMore => 'एक और बात…';

  @override
  String get stPermA11yTitle => 'सुलभता (Accessibility)';

  @override
  String get stPermA11yWhy =>
      'तुरंत पहचानता है कि कौन-सा ऐप खुला है, ताकि रुकावट तुरंत हो।';

  @override
  String get stPermA11yNote =>
      'कुछ फ़ोन इसके बाद अपनी चेतावनी स्क्रीन दिखाते हैं। यह सामान्य है — आप इसे कभी भी सेटिंग्स में बंद कर सकते हैं।';

  @override
  String get stPermOnHint =>
      'पहले से चालू है। बंद करने के लिए Android सेटिंग्स › ऐप्स › Pausey खोलें।';

  @override
  String get stA11yDialogTitle => 'सुलभता (Accessibility) क्यों?';

  @override
  String get stA11yDialogBody =>
      'Pausey सुलभता का उपयोग सिर्फ़ यह पहचानने के लिए करता है कि कौन-सा ऐप खुला है, ताकि आपकी सीमाएँ और शेड्यूल तुरंत लागू हों और सुरक्षा भरोसेमंद ढंग से चलती रहे।';

  @override
  String get stA11yNot => 'Pausey ये नहीं करता:';

  @override
  String get stA11yNot1 => 'आपकी स्क्रीन की सामग्री पढ़ना या इकट्ठा करना';

  @override
  String get stA11yNot2 => 'निजी जानकारी सहेजना';

  @override
  String get stA11yNot3 => 'आपके फ़ोन से कुछ भी बाहर भेजना';

  @override
  String get stPw1 => 'शांत दिन के लिए आपका प्लान';

  @override
  String get stPw2 => 'ऐसे लॉक जिन्हें आप बहाने से नहीं खोल पाएँगे';

  @override
  String get stPw3 => 'हफ़्ते-दर-हफ़्ते अपनी प्रगति देखें';

  @override
  String get stPwToday => 'आज';

  @override
  String get stPwGoal => 'आपका लक्ष्य';

  @override
  String stPwWeek(int n) {
    return 'स$n';
  }

  @override
  String get stPwFirstWeek => 'आपका पहला हफ़्ता अभी से शुरू';

  @override
  String get stPwFocusWeek => 'हर हफ़्ते फ़ोकस का समय';

  @override
  String nudgeTitle(String app) {
    return '$app की सीमा लगभग पूरी';
  }

  @override
  String nudgeText(String used, String limit) {
    return 'आज $limit में से $used इस्तेमाल हुए';
  }
}
