// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

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
