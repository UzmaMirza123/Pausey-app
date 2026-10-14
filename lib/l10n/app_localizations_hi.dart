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
  String get ob7Title => 'अपना दैनिक स्क्रीन-टाइम लक्ष्य तय करें';

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
  String get blockTitle => 'ऐप लॉक';

  @override
  String blockSubtitle(int locked, int total) {
    return '$total में से $locked ऐप लॉक हैं';
  }

  @override
  String get blockAddApp => 'ऐप जोड़ें';

  @override
  String blockLockedChip(int n) {
    return '$n लॉक';
  }

  @override
  String blockUnlockedChip(int n) {
    return '$n अनलॉक';
  }

  @override
  String blockScheduledChip(int n) {
    return '$n शेड्यूल';
  }

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
  String get blockSched => 'शेड्यूल';

  @override
  String get blockOnlySchedule => 'सिर्फ़ शेड्यूल में लॉक';

  @override
  String get blockOnlyScheduleSub => 'वरना पूरे दिन लॉक रहेगा';

  @override
  String get blockLockedLabel => 'लॉक';

  @override
  String get blockRemove => 'सूची से हटाएं';

  @override
  String blockRemoved(String app) {
    return '$app हटाया गया';
  }

  @override
  String get blockUndo => 'पूर्ववत';

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
  String get logInTitle => 'वापसी पर स्वागत है';

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
}
