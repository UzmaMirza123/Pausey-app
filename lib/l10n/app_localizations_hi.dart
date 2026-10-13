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
}
