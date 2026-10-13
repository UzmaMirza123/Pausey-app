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
  String get blockTitle => 'Uygulama Kilidi';

  @override
  String blockSubtitle(int locked, int total) {
    return '$total uygulamadan $locked tanesi kilitli';
  }

  @override
  String get blockAddApp => 'Ekle';

  @override
  String blockLockedChip(int n) {
    return '$n kilitli';
  }

  @override
  String blockUnlockedChip(int n) {
    return '$n açık';
  }

  @override
  String blockScheduledChip(int n) {
    return '$n planlı';
  }

  @override
  String get blockFaceIdTitle => 'Face ID Koruması';

  @override
  String get blockFaceIdSub => 'Kilidi açmak için Face ID iste';

  @override
  String get blockFaceIdUnavailable => 'Bu cihazda biyometrik kullanılamıyor';

  @override
  String get blockFaceIdReason => 'Açmak için kimliğini doğrula';

  @override
  String get blockFaceIdFailed => 'Doğrulanamadı — koruma kapalı';

  @override
  String get blockScheduleTitle => 'Planlı Kilit';

  @override
  String get blockStart => 'Başlangıç';

  @override
  String get blockEnd => 'Bitiş';

  @override
  String get blockNeedOneDay => 'En az bir gün seçili olmalı';

  @override
  String get blockManagedApps => 'Yönetilen Uygulamalar';

  @override
  String get blockLockAll => 'Tümünü kilitle';

  @override
  String get blockAllLocked => 'Tüm uygulamalar kilitli';

  @override
  String get blockSched => 'Plan';

  @override
  String get blockOnlySchedule => 'Sadece planda kilitle';

  @override
  String get blockOnlyScheduleSub => 'Aksi halde gün boyu kilitli';

  @override
  String get blockLockedLabel => 'Kilitli';

  @override
  String get blockRemove => 'Listeden kaldır';

  @override
  String blockRemoved(String app) {
    return '$app kaldırıldı';
  }

  @override
  String get blockUndo => 'Geri al';

  @override
  String get blockAppsUpdated => 'Uygulamalar güncellendi';

  @override
  String get blockCatSocial => 'Sosyal';

  @override
  String get blockCatVideo => 'Video';

  @override
  String get blockCatGames => 'Oyunlar';

  @override
  String get blockCatShopping => 'Alışveriş';

  @override
  String get blockCatCommunity => 'Topluluk';

  @override
  String get blockCatOther => 'Diğer';

  @override
  String get blockEmptyBadge => 'Engel yok';

  @override
  String get blockEmptyTitle => 'Henüz uygulama yok';

  @override
  String get blockEmptyMsg =>
      'Seni en çok oyalayan uygulamaları ekle, Pausey kilitlesin.';

  @override
  String get blockEmergencyTitle => 'Acil Durum';

  @override
  String blockEmergencySub(int n) {
    return 'Tümünü geçici aç · bugün $n hak';
  }

  @override
  String get blockEmergencyOff => 'Ayarlarda kapalı';

  @override
  String get blockEmergencyUse => 'Kullan';

  @override
  String get blockEmergencyConfirmTitle => 'Acil durum hakkı kullanılsın mı?';

  @override
  String blockEmergencyConfirmMsg(int n) {
    return 'Bugün kalan $n haktan biri kullanılacak. Sadece gerçekten gerektiğinde kullan.';
  }

  @override
  String get blockEmergencyUsed => 'Kullanıldı — uygulamalar açık';

  @override
  String get blockEmergencyNone => 'Bugün hak kalmadı';

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

  @override
  String get focusModePomodoro => 'Pomodoro';

  @override
  String get focusModeDeep => 'Derin odak';

  @override
  String get focusModeCustom => 'Özel';

  @override
  String get focusRemaining => 'KALAN';

  @override
  String get focusBreakLabel => 'MOLA';

  @override
  String get focusReadyLabel => 'HAZIR';

  @override
  String get focusInSession => 'Seansta';

  @override
  String get focusPausedState => 'Duraklatıldı';

  @override
  String get focusOnBreak => 'Molada';

  @override
  String get focusIdleState => 'Başlamak için dokun';

  @override
  String get focusSessionsDone => 'Biten seans';

  @override
  String get focusProgress => 'İlerleme';

  @override
  String get focusBreakAfter => 'Sonra mola';

  @override
  String get focusFocusedToday => 'Bugün';

  @override
  String focusAppsBlocked(int count) {
    return '$count uygulama engellendi';
  }

  @override
  String get focusAppsBlockedSub => 'Bu seansta dikkat dağıtıcılar kilitli.';

  @override
  String get focusNoApps => 'Engelli uygulama yok';

  @override
  String get focusNoAppsSub => 'Odaklanırken kilitlenecek uygulamaları seç.';

  @override
  String get focusEdit => 'Düzenle';

  @override
  String get focusAdd => 'Ekle';

  @override
  String get focusAmbient => 'Ortam sesi';

  @override
  String get focusSoundOff => 'Kapalı';

  @override
  String get focusSoundRain => 'Yağmur';

  @override
  String get focusSoundForest => 'Orman';

  @override
  String get focusSoundWaves => 'Dalgalar';

  @override
  String get focusSoundWhite => 'Beyaz gürültü';

  @override
  String get focusVolume => 'Ses';

  @override
  String get focusStart => 'Başlat';

  @override
  String get focusPause => 'Duraklat';

  @override
  String get focusResume => 'Devam';

  @override
  String get focusStop => 'Durdur';

  @override
  String get focusRestart => 'Yeniden başlat';

  @override
  String get focusSkipBreak => 'Molayı atla';

  @override
  String get focusDurations => 'Seans süreleri';

  @override
  String focusMinutesN(int n) {
    return '$n dk';
  }

  @override
  String get focusBreakLength => 'Mola';

  @override
  String get focusCustomTitle => 'Özel süre';

  @override
  String get focusSet => 'Ayarla';

  @override
  String get focusStopTitle => 'Seans erken bitsin mi?';

  @override
  String get focusStopBody => 'Şimdiye kadarki süre kaydedilir.';

  @override
  String get focusEndSession => 'Bitir';

  @override
  String get focusKeepGoing => 'Devam et';

  @override
  String get focusTooShort => 'Bir dakikadan kısa — kaydedilmedi.';

  @override
  String get focusBreakOver => 'Mola bitti — sıradakine hazır mısın?';

  @override
  String get focusBusy => 'Mod değiştirmek için seansı bitir.';

  @override
  String get focusFirstHint => 'İlk seansın burada başlıyor — oynat\'a bas.';

  @override
  String get focusCompleteA => 'Seans';

  @override
  String get focusCompleteB => 'tamamlandı!';

  @override
  String get focusEndedTitle => 'Seans bitti';

  @override
  String focusCompleteMsg(String mode) {
    return 'Harika! $mode seansını dikkatin dağılmadan bitirdin.';
  }

  @override
  String get focusEndedMsg => 'Her dakika önemli. Bir dahakine tam seans dene.';

  @override
  String get focusDurationLabel => 'ODAK SÜRESİ';

  @override
  String get focusMinUnit => 'dk';

  @override
  String get focusDayStreak => 'Gün serisi';

  @override
  String get focusAppsLabel => 'Engelli uygulama';

  @override
  String get focusTodayGoal => 'Bugünkü hedef';

  @override
  String focusPctCompleted(int pct) {
    return '%$pct tamamlandı';
  }

  @override
  String focusPlusPct(int pct) {
    return 'Bu seanstan +%$pct';
  }

  @override
  String get focusMomentum => 'Ritmini koru!';

  @override
  String get focusQuote1 =>
      'Süreklilik yoğunluğu yener. Her seans ustalığa katkıdır.';

  @override
  String get focusQuote2 => 'Küçük odak blokları büyük sonuçlar doğurur.';

  @override
  String get focusQuote3 => 'Kaydırmadın — ürettin. Tekrar yap.';

  @override
  String get focusStartNext => 'Sonraki seansı başlat';

  @override
  String get focusBackHome => 'Panoya dön';

  @override
  String get goalsTitle => 'Hedeflerim';

  @override
  String goalsSubtitle(int active, int done) {
    return '$active aktif · $done tamamlandı';
  }

  @override
  String get goalsAdd => 'Hedef ekle';

  @override
  String get goalsCompleted => 'Tamamlanan';

  @override
  String get goalsActive => 'Aktif';

  @override
  String get goalsStreak => 'Seri';

  @override
  String get goalsOverall => 'Genel ilerleme';

  @override
  String goalsWeeklyHit(int hit, int total) {
    return '$total haftalık hedeften $hit tanesi';
  }

  @override
  String goalsVsLastWeek(String delta) {
    return 'geçen haftaya göre $delta';
  }

  @override
  String get goalsFilterAll => 'Tümü';

  @override
  String get goalsDone => 'Tamam';

  @override
  String get goalsCatFocus => 'Odak';

  @override
  String get goalsCatDiscipline => 'Disiplin';

  @override
  String get goalsCatWellness => 'Sağlık';

  @override
  String goalsTitleFocusHours(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Günlük odak: $n saat',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleFocusDur(String duration) {
    return 'Günlük odak: $duration';
  }

  @override
  String get goalsTitleBlock => 'Sosyal uygulamaları engelle';

  @override
  String goalsTitleSessions(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Günde $n Pomodoro',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleScreen(String duration) {
    return '$duration altı ekran süresi';
  }

  @override
  String get goalsTitlePhoneFree => 'Telefonsuz zaman';

  @override
  String goalsDescFocus(String duration) {
    return 'Her gün $duration derin odak';
  }

  @override
  String goalsDescBlock(int n) {
    return 'Kilitli uygulamaları haftada $n gün kilitli tut';
  }

  @override
  String goalsDescSessions(int n) {
    return 'Günde en az $n odak oturumu tamamla';
  }

  @override
  String goalsDescScreen(String duration) {
    return 'Günlük telefon kullanımını $duration altında tut';
  }

  @override
  String goalsDescPhoneFree(int n) {
    return 'Haftada $n telefonsuz gün — her birini işaretle';
  }

  @override
  String goalsProgressDays(int done, int total) {
    return '$done / $total gün';
  }

  @override
  String goalsProgressSessions(int done, int total) {
    return '$done / $total oturum';
  }

  @override
  String goalsStreakShort(int n) {
    return '$n g';
  }

  @override
  String goalsStreakN(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n günlük seri',
    );
    return '$_temp0';
  }

  @override
  String get goalsCheckIn => 'Bugünü tamamla';

  @override
  String get goalsCheckedIn => 'Bugün tamam';

  @override
  String get goalsCheckedSnack => 'Harika! Bugün tamamlandı.';

  @override
  String get goalsUncheckedSnack => 'Bugünün işareti kaldırıldı.';

  @override
  String get goalsCreateNew => 'Yeni hedef oluştur';

  @override
  String get goalsEmptyBadge => 'Başla';

  @override
  String get goalsEmptyTitle => 'Henüz hedef yok';

  @override
  String get goalsEmptyMsg => 'Küçük bir günlük hedef koy, Pausey takip etsin.';

  @override
  String get goalsFilterEmpty => 'Bu filtrede hedef yok.';

  @override
  String get goalsNewGoal => 'Yeni hedef';

  @override
  String get goalsEditGoal => 'Hedefi düzenle';

  @override
  String get goalsType => 'Hedef türü';

  @override
  String get goalsTypeFocus => 'Odak süresi';

  @override
  String get goalsTypeSessions => 'Odak oturumları';

  @override
  String get goalsTypeBlock => 'Uygulama engelle';

  @override
  String get goalsTypePhoneFree => 'Telefonsuz günler';

  @override
  String get goalsTypeScreen => 'Ekran süresi sınırı';

  @override
  String get goalsCategory => 'Kategori';

  @override
  String get goalsTarget => 'Hedef';

  @override
  String get goalsPerDay => 'günde';

  @override
  String get goalsPerWeek => 'haftada gün';

  @override
  String get goalsMaxPerDay => 'günde en fazla';

  @override
  String get goalsTitleOptional => 'Başlık (isteğe bağlı)';

  @override
  String get goalsSave => 'Hedefi kaydet';

  @override
  String get goalsCreate => 'Hedef oluştur';

  @override
  String get goalsSavedSnack => 'Hedef kaydedildi';

  @override
  String get goalsCreatedSnack => 'Hedef oluşturuldu';

  @override
  String get goalsEdit => 'Düzenle';

  @override
  String get goalsDelete => 'Hedefi sil';

  @override
  String get goalsDeleteQ => 'Bu hedef silinsin mi?';

  @override
  String get goalsDeleteMsg => 'Kayıtları silinecek. Geri alınamaz.';

  @override
  String get goalsDeletedSnack => 'Hedef silindi';

  @override
  String get goalsComplete => 'tamamlandı';

  @override
  String get goalsDaysActive => 'Aktif gün';

  @override
  String get goalsTotalTime => 'Toplam süre';

  @override
  String get goalsSessionsLabel => 'Oturumlar';

  @override
  String get goals7Day => '7 günlük ilerleme';

  @override
  String get goals7DaysAgo => '7 gün önce';

  @override
  String get goalsToday => 'Bugün';

  @override
  String goalsTodayDate(String date) {
    return 'Bugün, $date';
  }

  @override
  String goalsYesterdayDate(String date) {
    return 'Dün, $date';
  }

  @override
  String get goalsMilestones => 'Kilometre taşları';

  @override
  String get goalsMsFirst => 'İlk gün tamamlandı';

  @override
  String get goalsMs3 => '3 günlük seri';

  @override
  String get goalsMsHalf => 'Haftalık hedefin %50\'si';

  @override
  String get goalsMs5 => '5 günlük seri';

  @override
  String get goalsMsWeek => 'Tam hafta tamamlandı';

  @override
  String get goalsMsLocked => 'Henüz değil';

  @override
  String get goalsHistory => 'Etkinlik geçmişi';

  @override
  String get goalsShowLess => 'Daha az';

  @override
  String get goalsStartSession => 'Odak oturumu başlat';

  @override
  String get goalsManageApps => 'Engelli uygulamaları yönet';

  @override
  String get goalsBlockHint => 'Kilit programı açıkken otomatik sayılır.';

  @override
  String goalsScreenToday(String used) {
    return 'Bugün ekran süresi: $used';
  }

  @override
  String get goalsNotFound => 'Bu hedef artık yok.';

  @override
  String get goalsMore => 'Diğer seçenekler';

  @override
  String goalsFreeLimit(int n) {
    return 'Ücretsiz plan: en fazla $n hedef';
  }

  @override
  String get homeGoodMorning => 'Günaydın';

  @override
  String get homeGoodAfternoon => 'Tünaydın';

  @override
  String get homeGoodEvening => 'İyi akşamlar';

  @override
  String get homeFriend => 'Dostum';

  @override
  String get homeTodayFocus => 'Bugünkü odak';

  @override
  String homeVsYesterday(String pct) {
    return 'düne göre %$pct';
  }

  @override
  String get homeStartToday => 'Bugün henüz odak yok';

  @override
  String get homeDayStreak => 'Günlük seri';

  @override
  String get homeTodayGoal => 'Bugünkü hedef';

  @override
  String homePctCompleted(int pct) {
    return '%$pct tamamlandı';
  }

  @override
  String get homeOnTrack => 'Yolundasın!';

  @override
  String get homeKeepGoing => 'Devam et';

  @override
  String get homeGoalMet => 'Hedefe ulaşıldı!';

  @override
  String get homeScreenTimeTitle => 'Ekran süresi';

  @override
  String get homeToday => 'Bugün';

  @override
  String homeVsAvg(String pct) {
    return 'ortalamaya göre %$pct';
  }

  @override
  String get homeQuickStart => 'Hızlı odak oturumu başlat';

  @override
  String get homeManage => 'Yönet';

  @override
  String get homeNoApps =>
      'Seni en çok oyalayan uygulamaları seç ve burada kilitle.';

  @override
  String get homeAddApps => 'Uygulama ekle';

  @override
  String homeAppLocked(String app) {
    return '$app kilitlendi';
  }

  @override
  String homeAppUnlocked(String app) {
    return '$app kilidi açıldı';
  }

  @override
  String homeLockApp(String app) {
    return '$app kilitle veya aç';
  }

  @override
  String get homeUpgradeTitle => 'Premium\'a geç';

  @override
  String get homeUpgradeBody => 'Sınırsız engelleme, hedef ve analiz.';

  @override
  String get homeTryFree => 'Ücretsiz dene';

  @override
  String get homePro => 'PRO';

  @override
  String get homeProActive => 'Pausey Pro etkin';

  @override
  String get homeProActiveBody =>
      'Tüm özellikler açık. Desteğin için teşekkürler!';

  @override
  String get homeNotifications => 'Bildirimler';

  @override
  String get homeNoNotifications => 'Yeni bildirim yok.';

  @override
  String get homePushLabel => 'Anlık bildirimler';

  @override
  String get homeFocusReminder => 'Günlük odak hatırlatıcı';

  @override
  String get homeStreakAlerts => 'Seri uyarıları';

  @override
  String get homePwTitle => 'Pausey Pro\'yu aç';

  @override
  String get homePwSubtitle => 'Odağını geri kazan, telefon bağımlılığını yen.';

  @override
  String get homePwMonthly => 'Aylık';

  @override
  String get homePwBilledMonthly => 'Aylık faturalandırılır';

  @override
  String get homePwYearly => 'Yıllık';

  @override
  String get homePwPopular => 'En popüler';

  @override
  String homePwSave(int pct) {
    return '%$pct tasarruf';
  }

  @override
  String homePwBilledYearly(String price) {
    return 'Yıllık $price';
  }

  @override
  String get homePwLifetime => 'Ömür boyu';

  @override
  String get homePwBestValue => 'En avantajlı';

  @override
  String get homePwPayOnce => 'Bir kez öde, hep kullan';

  @override
  String get homePwPerMonth => '/ ay';

  @override
  String get homePwOnce => 'tek sefer';

  @override
  String get homePwStartTrial => '7 gün ücretsiz dene';

  @override
  String get homePwBuyLifetime => 'Ömür boyu erişim al';

  @override
  String get homePwNoCharge => 'Bugün ücret yok · İstediğin zaman iptal';

  @override
  String get homePwOneTime => 'Tek ödeme · Abonelik yok';

  @override
  String get homePwFree => 'Ücretsiz';

  @override
  String get homePwProCol => 'Pro';

  @override
  String get homePwFeatBlocking => 'Sınırsız uygulama engelleme';

  @override
  String get homePwFeatSessions => 'Tüm odak modları';

  @override
  String get homePwFeatGoals => 'Sınırsız hedef';

  @override
  String get homePwFeatAnalytics => 'Gelişmiş analiz';

  @override
  String get homePwFeatStreak => 'Seri koruma';

  @override
  String get homePwFeatSchedule => 'Odak planlama';

  @override
  String get homePwFeatFaceId => 'Face ID kilidi';

  @override
  String get homePwFeatNotif => 'Akıllı bildirimler';

  @override
  String homePwMax(int n) {
    return 'en fazla $n';
  }

  @override
  String get homePwSecure => 'Güvenli ödeme';

  @override
  String get homePwCancelAnytime => 'İstediğin an iptal';

  @override
  String get homePwPrivacyFirst => 'Önce gizlilik';

  @override
  String get homePwRestore => 'Satın alımları geri yükle';

  @override
  String get homePwTerms => 'Hizmet şartları';

  @override
  String get homePwPrivacyPolicy => 'Gizlilik politikası';

  @override
  String get homePwWelcome => 'Pausey Pro\'ya hoş geldin!';

  @override
  String get homePwNothingToRestore => 'Önceki satın alım bulunamadı.';

  @override
  String get homePwRestored => 'Pro erişimin etkin.';

  @override
  String get homePwLinkSoon => 'Bu sayfa yakında sitemizde açılacak.';

  @override
  String get homePwYouArePro => 'Pro\'sun — keyfini çıkar!';

  @override
  String get homePwClose => 'Kapat';

  @override
  String get insightsAnalytics => 'Analiz';

  @override
  String get insightsScreenTime => 'Ekran Süresi';

  @override
  String get insightsToday => 'Bugün';

  @override
  String get insightsWeek => 'Hafta';

  @override
  String get insightsMonth => 'Ay';

  @override
  String get insightsProductivity => 'Verimlilik puanı';

  @override
  String insightsPts(String delta) {
    return '$delta puan';
  }

  @override
  String get insightsVsLastWeek => 'geçen haftaya göre';

  @override
  String get insightsVsLastMonth => 'geçen aya göre';

  @override
  String insightsScoreDays(int n) {
    return '$n günlük puan';
  }

  @override
  String get insightsFocusHours => 'Odak saatleri';

  @override
  String get insightsThisWeek => 'bu hafta';

  @override
  String get insightsThisMonth => 'bu ay';

  @override
  String insightsGoalOf(String done, String goal) {
    return '$done / $goal hedef';
  }

  @override
  String get insightsFocusScore => 'Odak';

  @override
  String get insightsGoals => 'Hedefler';

  @override
  String get insightsConsistency => 'İstikrar';

  @override
  String get insightsWeeklyFocus => 'Haftalık odak saatleri';

  @override
  String insightsDailyFocus(int n) {
    return 'Günlük odak, son $n gün';
  }

  @override
  String insightsBestDay(String day, String time) {
    return 'En iyi gün: $day · $time';
  }

  @override
  String insightsAvgDay(String time) {
    return 'Ort. $time / gün';
  }

  @override
  String get insightsMonthlyTrends => 'Aylık eğilimler';

  @override
  String get insightsActual => 'Gerçek';

  @override
  String get insightsGoal => 'Hedef';

  @override
  String insightsWk(int n) {
    return 'Hf $n';
  }

  @override
  String insightsWeekBeat(int n, String time) {
    return '$n. hafta hedefi $time aştı';
  }

  @override
  String insightsWeekShort(int n, String time) {
    return 'En iyisi $n. hafta, hedefe $time kaldı';
  }

  @override
  String get insightsGoalCompletion => 'Hedef tamamlama';

  @override
  String insightsDaysOf(int done, int total) {
    return '$done/$total gün';
  }

  @override
  String get insightsNoGoals =>
      'Henüz hedef yok. İlerlemeni görmek için bir tane ekle.';

  @override
  String get insightsManageGoals => 'Yönet';

  @override
  String insightsGoalFocus(String hours) {
    return 'Günlük odak: $hours saat';
  }

  @override
  String get insightsGoalBlock => 'Sosyal uygulamaları engelle';

  @override
  String insightsGoalPomo(int n) {
    return 'Günde $n Pomodoro';
  }

  @override
  String insightsGoalScreen(String time) {
    return '$time altı ekran süresi';
  }

  @override
  String get insightsGoalPhoneFree => 'Telefonsuz zaman';

  @override
  String get insightsEmptyBadge => 'Henüz seans yok';

  @override
  String get insightsEmptyTitle => 'İstatistiklerin tek bir seansla başlar';

  @override
  String get insightsEmptyBody =>
      'Bir odak seansını bitir; puanların, grafiklerin ve hedeflerin burada görünsün.';

  @override
  String get insightsEmptyCta => 'Odak seansı başlat';

  @override
  String get insightsDailyUsage => 'Günlük kullanım';

  @override
  String get insightsFocusTime => 'Odak süresi';

  @override
  String get insightsVsAvg => 'ort. göre';

  @override
  String get insightsUsageByDay => 'Günlere göre';

  @override
  String get insightsUsageByWeek => 'Haftalara göre';

  @override
  String get insightsUsage => 'Kullanım';

  @override
  String insightsTrend(int n) {
    return '$n günlük eğilim';
  }

  @override
  String get insightsImproving => 'İyileşiyor';

  @override
  String get insightsRising => 'Artıyor';

  @override
  String insightsDaysAgo(int n) {
    return '$n gün önce';
  }

  @override
  String get insightsMostUsed => 'En çok kullanılanlar';

  @override
  String get insightsAllApps => 'Tüm uygulamalar';

  @override
  String get insightsBreakdown => 'Kullanım dağılımı';

  @override
  String get insightsTotal => 'toplam';

  @override
  String get insightsNoUsage => 'Bu dönemde ekran süresi yok.';

  @override
  String get insightsLockApp => 'Bu uygulamayı kilitle';

  @override
  String insightsLocked(String app) {
    return '$app kilitlendi';
  }

  @override
  String get insightsCatSocial => 'Sosyal';

  @override
  String get insightsCatVideo => 'Video';

  @override
  String get insightsCatGames => 'Oyunlar';

  @override
  String get insightsCatShopping => 'Alışveriş';

  @override
  String get insightsCatCommunity => 'Topluluk';

  @override
  String get insightsCatOther => 'Diğer';

  @override
  String get profileSettings => 'Ayarlar';

  @override
  String get profileGuestName => 'Misafir';

  @override
  String get profileGuestBadge => 'Misafir · bu telefonda kayıtlı';

  @override
  String get profileEditName => 'Adı düzenle';

  @override
  String get profileNameHint => 'Adınız';

  @override
  String get profileSave => 'Kaydet';

  @override
  String profileMemberSince(String date) {
    return '$date tarihinden beri üye';
  }

  @override
  String get profileProActive => 'Pro · Aktif';

  @override
  String get profileFree => 'Ücretsiz plan';

  @override
  String get profileUpgrade => 'Yükselt';

  @override
  String get profileBadges => 'Rozetler';

  @override
  String get profileNoBadges => 'Rozet için odak seansı tamamla';

  @override
  String get profileFocusTime => 'Odak süresi';

  @override
  String get profileGoalsDone => 'Tamamlanan hedefler';

  @override
  String get profileDayStreak => 'Günlük seri';

  @override
  String get profileAppsBlocked => 'Engelli uygulamalar';

  @override
  String get profileFocusActivity => 'Odak etkinliği';

  @override
  String get profileLast4Weeks => 'Son 4 hafta';

  @override
  String get profileRecentActivity => 'Son etkinlik';

  @override
  String get profileSessionDone => 'Odak seansı tamamlandı';

  @override
  String get profileSessionStopped => 'Seans erken bitti';

  @override
  String get profileModePomodoro => 'Pomodoro';

  @override
  String get profileModeDeep => 'Derin çalışma';

  @override
  String get profileModeCustom => 'Özel';

  @override
  String get profileJustNow => 'Az önce';

  @override
  String profileAgoMinutes(int n) {
    return '$n dk önce';
  }

  @override
  String profileAgoHours(int n) {
    return '$n sa önce';
  }

  @override
  String get profileYesterday => 'Dün';

  @override
  String get profileEmptyTitle => 'Henüz odak seansı yok';

  @override
  String get profileEmptyBody =>
      'İlk seansını başlat — etkinliğin, serin ve rozetlerin burada görünür.';

  @override
  String get profileStartFocus => 'Odaklanmaya başla';

  @override
  String get profileMyGoals => 'Hedeflerim';

  @override
  String get profileStreaks => 'Seriler ve rozetler';

  @override
  String get profileSubscription => 'Abonelik';

  @override
  String get profileSignOutTitle => 'Çıkış yapılsın mı?';

  @override
  String get profileSignOutBody => 'İstediğin zaman tekrar giriş yapabilirsin.';

  @override
  String get profileSecNotifications => 'Bildirimler';

  @override
  String get profileSecAppearance => 'Görünüm';

  @override
  String get profileSecFocus => 'Odak ve engelleme';

  @override
  String get profileSecPrivacy => 'Gizlilik ve güvenlik';

  @override
  String get profileSecAccount => 'Hesap';

  @override
  String get profilePush => 'Anlık bildirimler';

  @override
  String get profilePushSub => 'Hatırlatmalar ve uyarılar';

  @override
  String get profileReminder => 'Başlama hatırlatıcısı';

  @override
  String profileReminderSub(String time) {
    return 'Her gün $time';
  }

  @override
  String get profileStreakAlerts => 'Seri uyarıları';

  @override
  String get profileStreakAlertsSub => 'Serin bozulmadan önce';

  @override
  String get profileGoalMilestones => 'Hedef aşamaları';

  @override
  String get profileGoalMilestonesSub => 'Bir hedefe ulaştığında';

  @override
  String get profileDarkMode => 'Karanlık mod';

  @override
  String get profileOn => 'Açık';

  @override
  String get profileOff => 'Kapalı';

  @override
  String get profileTextSize => 'Yazı boyutu';

  @override
  String get profileTextSmall => 'Küçük';

  @override
  String get profileTextMedium => 'Orta';

  @override
  String get profileTextLarge => 'Büyük';

  @override
  String get profileTextHuge => 'Çok büyük';

  @override
  String get profilePomodoroLen => 'Pomodoro süresi';

  @override
  String get profileBreakLen => 'Mola süresi';

  @override
  String profileMinutes(int n) {
    return '$n dk';
  }

  @override
  String get profileFaceIdUnlock => 'Kilit açmada Face ID';

  @override
  String get profileFaceIdUnlockSub => 'Uygulama açmadan önce onayla';

  @override
  String get profileBypass => 'Acil durum geçişi';

  @override
  String profileBypassSub(int n) {
    return 'Günde $n kez';
  }

  @override
  String get profileAppLock => 'Pausey\'i Face ID ile kilitle';

  @override
  String get profileAppLockSub => 'Uygulama açılırken sor';

  @override
  String get profileHideUsage => 'Kullanım verilerini gizle';

  @override
  String get profileHideUsageSub => 'Ekran süresini gizle';

  @override
  String get profileClearData => 'Etkinlik verilerini sil';

  @override
  String get profileClearDataSub => 'Seansları ve hedef geçmişini siler';

  @override
  String get profileClearTitle => 'Etkinlik verileri silinsin mi?';

  @override
  String get profileClearBody =>
      'Bu telefondaki tüm odak seansları ve hedef kayıtları silinir. Geri alınamaz.';

  @override
  String get profileClear => 'Sil';

  @override
  String get profileCleared => 'Etkinlik verileri silindi';

  @override
  String get profileExport => 'Verilerimi dışa aktar';

  @override
  String get profileExportSub => 'JSON olarak kopyala';

  @override
  String get profileExported => 'Verilerin panoya kopyalandı';

  @override
  String get profileStreaksTitle => 'Seriler';

  @override
  String get profileShare => 'Paylaş';

  @override
  String profileShareText(int n) {
    return 'Pausey ile $n günlük odak serimdeyim!';
  }

  @override
  String get profileCopied => 'Panoya kopyalandı';

  @override
  String profileNextMilestone(int n) {
    return 'Devam et – sonraki aşamaya $n gün!';
  }

  @override
  String get profileAllMilestones => 'Tüm aşamalar tamam. Efsane!';

  @override
  String get profileStartStreak =>
      'Seri başlatmak için bugün bir seans tamamla.';

  @override
  String get profileBest => 'En iyi';

  @override
  String get profileThisWeek => 'Bu hafta';

  @override
  String profileDaysCompleted(int n) {
    return '$n/7 gün tamam';
  }

  @override
  String get profileCompleted => 'Tamamlandı';

  @override
  String get profilePartial => 'Kısmi';

  @override
  String get profileMissed => 'Kaçırıldı';

  @override
  String get profilePrevMonth => 'Önceki ay';

  @override
  String get profileNextMonth => 'Sonraki ay';

  @override
  String get profileMilestones => 'Seri aşamaları';

  @override
  String get profileAchievements => 'Başarılar';

  @override
  String get profileAchOnFire => 'Alev alev';

  @override
  String get profileAchIronWill => 'Demir irade';

  @override
  String get profileAchFocusMaster => 'Odak ustası';

  @override
  String get profileAchMonk => 'Dijital keşiş';

  @override
  String get profileAchLegend => 'Efsanevi';

  @override
  String get profileAchSpeed => 'Hız canavarı';

  @override
  String profileAchStreakDesc(int n) {
    return '$n günlük seri';
  }

  @override
  String profileAchSessionsDesc(int n) {
    return '$n seans tamamlandı';
  }

  @override
  String profileAchHoursDesc(int n) {
    return 'Toplam $n sa odak';
  }

  @override
  String profileAchDayDesc(int n) {
    return 'Bir günde $n seans';
  }

  @override
  String get navHome => 'Ana Sayfa';

  @override
  String get navBlock => 'Engelle';

  @override
  String get navFocus => 'Odak';

  @override
  String get navInsights => 'İstatistik';

  @override
  String get navProfile => 'Profil';

  @override
  String get unitH => 'sa';

  @override
  String get unitM => 'dk';

  @override
  String get sampleData => 'Örnek veri';

  @override
  String get seeAll => 'Tümünü gör';

  @override
  String days(int count) {
    return '$count gün';
  }

  @override
  String get statesTitle => 'Durumlar';

  @override
  String get statesSubtitle => 'Hata, boş ve yükleme ekranları';

  @override
  String get statesNoInternet => 'İnternet yok';

  @override
  String get statesConnectionLost => 'Bağlantı koptu';

  @override
  String get statesOfflineTitle => 'Çevrimdışısınız';

  @override
  String get statesOfflineMsg =>
      'Pausey şu anda sunucuya ulaşamıyor. Wi-Fi veya mobil veriyi kontrol edip tekrar deneyin – yerel verileriniz güvende.';

  @override
  String get statesTryAgain => 'Tekrar dene';

  @override
  String get statesOpenSettings => 'Ayarları aç';

  @override
  String get statesOfflineMode => 'Çevrimdışı mod etkin';

  @override
  String get statesLimited => 'Sınırlı';

  @override
  String get statesAvailable => 'Kullanılabilir';

  @override
  String get statesUnavailable => 'Kullanılamaz';

  @override
  String get statesCapSessions => 'Önceki oturumları gör';

  @override
  String get statesCapApps => 'Kilitli uygulama listesi';

  @override
  String get statesCapTimer => 'Yerel odak zamanlayıcısı';

  @override
  String get statesCapSync => 'Seri ve hedefleri eşitle';

  @override
  String get statesCapAnalytics => 'Analiz verisini yenile';

  @override
  String get statesOfflineNote =>
      'Tüm odak verileriniz cihazda saklanır. Çevrimdışıyken hiçbir şey kaybolmaz.';

  @override
  String get statesBackOnline => 'Tekrar çevrimiçi – her şey eşitlendi';

  @override
  String get statesShowAgain => 'Tekrar göster';

  @override
  String get statesPermDenied => 'İzin reddedildi';

  @override
  String get statesPermRequired => 'İzin gerekli';

  @override
  String get statesPermTitle => 'Erişim engellendi';

  @override
  String get statesPermMsg =>
      'Pausey\'nin uygulamaları engellemesi için Ekran Süresi erişimi gerekir. Aksi halde engelleme çalışmaz.';

  @override
  String get statesGrant => 'Erişim ver';

  @override
  String get statesLearnMore => 'Daha fazla';

  @override
  String get statesLearnMoreMsg =>
      'Ekran Süresi erişimiyle Pausey dikkat dağıtan uygulamaları durdurur. Verileriniz telefonda kalır.';

  @override
  String get statesRequiredPerms => 'Gerekli izinler';

  @override
  String get statesPermNotif => 'Bildirimler';

  @override
  String get statesPermScreenTime => 'Ekran Süresi erişimi';

  @override
  String get statesPermUsage => 'Kullanım istatistikleri';

  @override
  String get statesPermBio => 'Face ID / biyometri';

  @override
  String get statesGranted => 'Verildi';

  @override
  String get statesDenied => 'Reddedildi';

  @override
  String get statesPermNote =>
      'Ekran Süresi olmadan zamanlayıcı çalışır ama uygulamalar engellenemez.';

  @override
  String get statesAccessGranted => 'Erişim verildi – engelleme hazır';

  @override
  String get statesDataNA => 'Veri yok';

  @override
  String get statesSyncFailed => 'Eşitleme başarısız';

  @override
  String get statesLoadTitle => 'Veri yüklenemedi';

  @override
  String get statesLoadMsg =>
      'Analizler alınırken bir sorun oluştu. Geçici bir sunucu hatası olabilir – yerel verileriniz etkilenmedi.';

  @override
  String get statesRetrySync => 'Yeniden eşitle';

  @override
  String get statesUseCached => 'Önbelleği kullan';

  @override
  String get statesErrorDetails => 'Hata ayrıntıları';

  @override
  String get statesErrorCode => 'Hata kodu';

  @override
  String get statesTimestamp => 'Zaman';

  @override
  String get statesRetryCount => 'Deneme';

  @override
  String statesAttempts(int n) {
    return '$n / 3 deneme';
  }

  @override
  String get statesReport => 'Desteğe bildir';

  @override
  String get statesReported => 'Teşekkürler – rapor gönderildi';

  @override
  String get statesCachedNote =>
      'Bu arada son başarılı eşitlemenin verileri kullanılabilir.';

  @override
  String get statesDataLoaded => 'Analizler yüklendi';

  @override
  String get statesCachedShown => 'Önbellek verisi gösteriliyor';

  @override
  String statesWeekFocus(String time) {
    return 'Bu hafta odak: $time';
  }

  @override
  String get statesEmpty => 'Boş durum';

  @override
  String get statesNothingYet => 'Henüz yok';

  @override
  String get statesEmptyTitle => 'Henüz oturum yok';

  @override
  String get statesEmptyMsg =>
      'İlk odak oturumunu başlat, ilerlemen burada görünecek.';

  @override
  String get statesStartFocus => 'Odaklanmaya başla';

  @override
  String get statesLoadingSection => 'Yükleme durumları';

  @override
  String get statesDashLoading => 'Pano';

  @override
  String get statesAnalyticsLoading => 'Analiz';

  @override
  String get statesGoalsLoading => 'Hedefler';

  @override
  String get statesProfileLoading => 'Profil';

  @override
  String get statesCrunching => 'Veriler işleniyor…';

  @override
  String get statesLoadingGoals => 'Hedefler yükleniyor…';

  @override
  String get statesLoadingProfile => 'Profil yükleniyor…';

  @override
  String get statesReplay => 'Tekrarla';
}
