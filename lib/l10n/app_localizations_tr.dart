// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get ob1Title => 'Ekran Bağımlılığını Azalt';

  @override
  String get ob1Body =>
      'Dijital alışkanlıklarını kontrol altına al, dikkat dağıtan uygulamalarda daha az vakit geçir.';

  @override
  String get ob1StatAvg => 'Ortalama günlük ekran süresi';

  @override
  String get ob1StatSocial => 'Sosyal medyada geçen';

  @override
  String get ob2SelectApps => 'Uygulama Seç';

  @override
  String get ob2Title => 'Dikkat Dağıtan Uygulamaları Kilitle';

  @override
  String get ob2Body =>
      'Güçlü uygulama kilitleme araçlarıyla sosyal medyayı, oyunları ve diğer dikkat dağıtıcıları engelle.';

  @override
  String get ob2Feature1 => 'Tek dokunuşla istediğin uygulamayı engelle';

  @override
  String get ob2Feature2 => 'Kilit ve odak saatlerini planla';

  @override
  String get ob2Feature3 => 'Kararlı kalmak için engelleri şifreyle koru';

  @override
  String get sheetTitle => 'Uygulama Seç';

  @override
  String get sheetTotalLocked => 'Toplam Kilitli';

  @override
  String get sheetAppsSelected => 'uygulama seçildi';

  @override
  String get sheetTimeSaved => 'Kazanılan Süre';

  @override
  String get sheetPerDayAvg => 'günlük ort.';

  @override
  String sheetHoursValue(String h) {
    return '$h sa';
  }

  @override
  String get sheetSearchHint => 'Uygulama ara...';

  @override
  String get sheetCatAll => 'Tümü';

  @override
  String get sheetCatSocial => 'Sosyal';

  @override
  String get sheetCatEntertainment => 'Eğlence';

  @override
  String get sheetCatGames => 'Oyunlar';

  @override
  String get sheetAppsHeader => 'UYGULAMALAR';

  @override
  String sheetSelectedCount(int count) {
    return '$count seçildi';
  }

  @override
  String get sheetNoApps => 'Uygulama bulunamadı';

  @override
  String get sheetLockSchedule => 'KİLİT PLANI';

  @override
  String get sheetAddCustomSemantic => 'Özel kilit planı ekle';

  @override
  String get sheetCustomBadge => '+ Özel';

  @override
  String get sheetSchedMorning => 'Sabah';

  @override
  String get sheetSchedWork => 'İş';

  @override
  String get sheetSchedEvening => 'Akşam';

  @override
  String get sheetEveryDay => 'Her gün';

  @override
  String get sheetWeekdays => 'Hafta içi';

  @override
  String get sheetWeekends => 'Hafta sonu';

  @override
  String get sheetUnlockMethod => 'KİLİT AÇMA YÖNTEMİ';

  @override
  String get sheetPin => 'PIN Kodu';

  @override
  String get sheetPinSub => '4 haneli PIN';

  @override
  String get sheetFaceId => 'Face ID';

  @override
  String get sheetFaceIdSub => 'Biyometrik';

  @override
  String get sheetTouchId => 'Touch ID';

  @override
  String get sheetTouchIdSub => 'Parmak izi';

  @override
  String get sheetFooter => 'Bunu daha sonra istediğin zaman değiştirebilirsin';

  @override
  String get sheetConfirmLock => 'Kilidi Onayla';

  @override
  String sheetRemove(String name) {
    return '$name kaldır';
  }

  @override
  String get sheetCustomTitle => 'Özel plan';

  @override
  String get sheetCustomBody =>
      'Seçtiğin uygulamalar bu süre boyunca kilitli kalır.';

  @override
  String get sheetNameLabel => 'AD';

  @override
  String get sheetNameHint => 'örn. Ders saati';

  @override
  String get sheetStarts => 'Başlangıç';

  @override
  String get sheetEnds => 'Bitiş';

  @override
  String get sheetSameTime => 'Başlangıç ve bitiş aynı';

  @override
  String sheetLockedFor(String duration) {
    return '$duration boyunca kilitli';
  }

  @override
  String sheetLockedForOvernight(String duration) {
    return '$duration boyunca kilitli (gece boyu)';
  }

  @override
  String sheetDurH(int h) {
    return '$h sa';
  }

  @override
  String sheetDurM(int m) {
    return '$m dk';
  }

  @override
  String sheetDurHM(int h, int m) {
    return '$h sa $m dk';
  }

  @override
  String get sheetLockStartsAt => 'KİLİT BAŞLANGICI';

  @override
  String get sheetLockEndsAt => 'KİLİT BİTİŞİ';

  @override
  String get sheetRepeatOn => 'TEKRARLA';

  @override
  String get sheetAddSchedule => 'Plan ekle';

  @override
  String get sheetCustomDefaultName => 'Özel';

  @override
  String sheetChangeTime(String label, String time) {
    return '$label $time. Saati değiştir';
  }

  @override
  String get ob3Title => 'Her Gün Odaklı Kal';

  @override
  String get ob3Body =>
      'Verimliliğini artırmak ve daha fazlasını başarmak için Pomodoro ve Derin Odak seanslarını kullan.';

  @override
  String get ob3Pomodoro => 'Pomodoro';

  @override
  String ob3PomodoroSub(int min) {
    return '$min dk\'lık seanslar';
  }

  @override
  String get ob3DeepFocus => 'Derin Odak';

  @override
  String ob3DeepFocusSub(int min) {
    return '$min dk akış';
  }

  @override
  String get ob3StatBoost => 'verimlilik artışı';

  @override
  String ob3StatStreakValue(int days) {
    return '$days gün';
  }

  @override
  String get ob3StatStreak => 'seri oluşturma';

  @override
  String get ob3StatGoal => 'hedef tamamlama';

  @override
  String get ob3StartTimer => 'Zamanlayıcıyı başlat';

  @override
  String get ob3PauseTimer => 'Zamanlayıcıyı duraklat';

  @override
  String get ob4Title => 'İlerlemeni Takip Et';

  @override
  String get ob4Body =>
      'Ekran süresini, odak saatlerini, hedefleri ve verimliliği şık analizlerle izle.';

  @override
  String get ob4Weekly => 'Haftalık';

  @override
  String get ob4WeeklySub => 'raporlar';

  @override
  String get ob4Goals => 'Hedefler';

  @override
  String get ob4GoalsSub => 'takipçi';

  @override
  String get ob4Insights => 'İçgörüler';

  @override
  String get ob4InsightsSub => 'AI koç';

  @override
  String get ob4Streaks => 'Seriler';

  @override
  String get ob4StreaksSub => 've rozetler';

  @override
  String get ob5Title => 'Günlük ortalama ekran süren ne kadar?';

  @override
  String get ob5Subtitle => 'Sadece telefonunda. Tahmini olması yeterli.';

  @override
  String get ob5More7 => '7 saatten fazla';

  @override
  String get ob5H5to7 => '5-7 saat';

  @override
  String get ob5H4to5 => '4-5 saat';

  @override
  String get ob5H3to4 => '3-4 saat';

  @override
  String get ob5H1to3 => '1-3 saat';

  @override
  String get ob5Under1 => '1 saatten az';

  @override
  String get ob6Title => 'Mesleğin nedir?';

  @override
  String get ob6Subtitle =>
      'Odak planını çalışma tarzına göre kişiselleştireceğiz.';

  @override
  String get ob6Software => 'Yazılım Geliştirme';

  @override
  String get ob6Founder => 'CEO / Kurucu';

  @override
  String get ob6Remote => 'Uzaktan Çalışan';

  @override
  String get ob6Finance => 'Finans / Operasyon / Danışmanlık';

  @override
  String get ob6Art => 'Sanat / İçerik';

  @override
  String get ob6Education => 'Eğitim';

  @override
  String get ob6Others => 'Diğer';

  @override
  String get ob7Title => 'Günlük ekran süresi hedefini belirle';

  @override
  String get ob7Subtitle =>
      'Bunu istediğin zaman değiştirebilirsin. Sınıra yaklaştığında seni uyaracağız.';

  @override
  String ob7Hours(String hours) {
    return '$hours sa';
  }

  @override
  String get ob7PerDay => 'günlük';

  @override
  String ob7HoursPerDay(String hours) {
    return 'Günde $hours';
  }

  @override
  String get ob7DialLabel => 'Günlük ekran süresi hedefi';

  @override
  String get ob7InfoNote =>
      'Ortalama bir kişi telefonunda günde 4 saatten fazla geçiriyor. Hedef belirlemek zamanını geri kazanmanın ilk adımı.';

  @override
  String get ob8Title => 'Gerekli İzinleri Etkinleştir';

  @override
  String get ob8Subtitle => 'Pausey deneyiminin tamamı için erişim izni ver.';

  @override
  String get ob8UsageTitle => 'Kullanım Erişimi';

  @override
  String get ob8UsageSub =>
      'Uygulama kullanımını izle ve odak seanslarını uygula.';

  @override
  String get ob8NotifTitle => 'Bildirimler';

  @override
  String get ob8NotifSub => 'Zamanında hatırlatmalar ve ilerleme uyarıları.';

  @override
  String get ob8TrackTitle => 'Uygulama Kullanımını Takip Et';

  @override
  String get ob8TrackSub => 'Günlük ve haftalık dökümler.';

  @override
  String get ob9Title => 'Her şey hazır!';

  @override
  String get ob9Subtitle => 'Odak ortamın hazır.';

  @override
  String get ob9Enter => 'Pausey\'e Gir';

  @override
  String get ob9Replay => 'Tanıtımı Tekrar İzle';

  @override
  String get ob9ScreenTime => 'Ekran Süresi';

  @override
  String get ob9AppsLocked => 'Kilitli Uygulamalar';

  @override
  String get ob9Permissions => 'İzinler';

  @override
  String get ob9FocusMode => 'Odak Modu';

  @override
  String get ob9AllOk => 'Hepsi Tamam';

  @override
  String get ob9On => 'AÇIK';

  @override
  String get ob9Done => 'TAMAM';

  @override
  String get ob9StreakTitle => '1. gün serisi şimdi başlıyor';

  @override
  String get ob9StreakSub => 'Devam ettirmek için bir seans tamamla';

  @override
  String get appName => 'Pausey';

  @override
  String get tagline => 'Zamanını geri al';

  @override
  String get versionLabel => 'Sürüm 2.0 · App Store Sürümü';

  @override
  String get skip => 'Atla';

  @override
  String get continueLabel => 'Devam';

  @override
  String get back => 'Geri';

  @override
  String get freeToStart => 'Ücretsiz başla · Kredi kartı gerekmez';

  @override
  String get dataStaysOnDevice => 'Verilerin cihazından asla çıkmaz.';

  @override
  String get switchToLight => 'Açık moda geç';

  @override
  String get switchToDark => 'Koyu moda geç';

  @override
  String get language => 'Dil';

  @override
  String get phoneLanguage => 'Telefon dili';

  @override
  String get authTitle => 'Kaydırmayı durdur.\nGününe sahip çık.';

  @override
  String get authSubtitle =>
      'Hedeflerini ve serilerini senkronize etmek için hesap oluştur ya da Pausey\'i misafir olarak dene.';

  @override
  String get continueWithApple => 'Apple ile devam et';

  @override
  String get continueWithGoogle => 'Google ile devam et';

  @override
  String get signUpWithEmail => 'E-posta ile kaydol';

  @override
  String get continueAsGuest => 'Misafir olarak devam et';

  @override
  String get guestNote => 'Misafir verileri yalnızca bu telefonda saklanır.';

  @override
  String get or => 'veya';

  @override
  String get haveAccount => 'Zaten hesabın var mı?';

  @override
  String get noAccount => 'Pausey\'de yeni misin?';

  @override
  String get logIn => 'Giriş yap';

  @override
  String get signUp => 'Kaydol';

  @override
  String get createAccount => 'Hesap oluştur';

  @override
  String get signUpTitle => 'Hesabını oluştur';

  @override
  String get signUpSubtitle =>
      'Daha sakin ekran alışkanlıkları edinmeye başla.';

  @override
  String get logInTitle => 'Tekrar hoş geldin';

  @override
  String get logInSubtitle => 'Serine devam etmek için giriş yap.';

  @override
  String get fullName => 'Ad soyad';

  @override
  String get email => 'E-posta';

  @override
  String get password => 'Şifre';

  @override
  String get confirmPassword => 'Şifreyi onayla';

  @override
  String get showPassword => 'Şifreyi göster';

  @override
  String get hidePassword => 'Şifreyi gizle';

  @override
  String get forgotPassword => 'Şifreni mi unuttun?';

  @override
  String get resetTitle => 'Şifreyi sıfırla';

  @override
  String get resetSubtitle =>
      'E-postanı gir, sana sıfırlama bağlantısı gönderelim.';

  @override
  String get sendLink => 'Bağlantı gönder';

  @override
  String get resetSent => 'Sıfırlama bağlantısı için gelen kutunu kontrol et.';

  @override
  String get agreeTerms => 'Şartları ve Gizlilik Politikasını kabul ediyorum';

  @override
  String get passwordStrength => 'Şifre gücü';

  @override
  String get strengthWeak => 'Zayıf';

  @override
  String get strengthOk => 'İdare eder';

  @override
  String get strengthStrong => 'Güçlü';

  @override
  String get errNameRequired => 'Adını gir';

  @override
  String get errEmailInvalid => 'Geçerli bir e-posta gir';

  @override
  String get errPasswordShort => 'En az 8 karakter kullan';

  @override
  String get errPasswordMismatch => 'Şifreler eşleşmiyor';

  @override
  String get errTerms => 'Devam etmek için şartları kabul et';

  @override
  String get authErr_not_configured =>
      'Giriş henüz ayarlanmadı. Misafir olarak devam edebilirsin.';

  @override
  String get authErr_cancelled => 'Giriş iptal edildi.';

  @override
  String get authErr_invalid_email => 'Bu e-posta doğru görünmüyor.';

  @override
  String get authErr_wrong_password => 'E-posta veya şifre hatalı.';

  @override
  String get authErr_user_not_found =>
      'Bu e-postayla bir hesap yok. Kaydolmak ister misin?';

  @override
  String get authErr_email_in_use =>
      'Bu e-postayla bir hesap zaten var. Giriş yap.';

  @override
  String get authErr_weak_password => 'Daha güçlü bir şifre seç.';

  @override
  String get authErr_network => 'İnternet bağlantısı yok. Tekrar dene.';

  @override
  String get authErr_too_many =>
      'Çok fazla deneme. Bir dakika bekleyip tekrar dene.';

  @override
  String get authErr_unknown => 'Bir şeyler ters gitti. Tekrar dene.';

  @override
  String homeHello(String name) {
    return 'Merhaba, $name';
  }

  @override
  String get homeHelloGuest => 'Merhaba';

  @override
  String get homeGuestBadge => 'Misafir modu · bu telefonda kayıtlı';

  @override
  String get homeSubtitle => 'Planın hazır. İşte seçimlerin.';

  @override
  String get homeDailyGoal => 'Günlük hedef';

  @override
  String get homeLockedApps => 'Kilitli uygulamalar';

  @override
  String get homeScreenTime => 'Mevcut ekran süresi';

  @override
  String get homeNotSet => 'Ayarlanmadı';

  @override
  String get homeCreateAccount => 'Yedeklemek için hesap oluştur';

  @override
  String get signOut => 'Çıkış yap';

  @override
  String get signOutGuestWarn =>
      'Çıkış yapmak bu telefondaki misafir verilerini siler.';

  @override
  String get cancel => 'İptal';
}
