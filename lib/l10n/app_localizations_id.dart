// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get ob1Title => 'Kurangi Kecanduan Layar';

  @override
  String get ob1Body =>
      'Kendalikan kebiasaan digital Anda dan habiskan lebih sedikit waktu di aplikasi yang mengganggu.';

  @override
  String get ob1StatAvg => 'Rata-rata waktu layar harian';

  @override
  String get ob1StatSocial => 'Dihabiskan di media sosial';

  @override
  String get ob2SelectApps => 'Pilih Aplikasi';

  @override
  String get ob2Title => 'Kunci Aplikasi Pengganggu';

  @override
  String get ob2Body =>
      'Blokir media sosial, game, dan gangguan lain dengan alat penguncian aplikasi yang andal.';

  @override
  String get ob2Feature1 => 'Blokir aplikasi apa pun dengan satu ketukan';

  @override
  String get ob2Feature2 => 'Jadwalkan waktu kunci dan sesi fokus';

  @override
  String get ob2Feature3 =>
      'Lindungi blokir dengan kata sandi agar tetap konsisten';

  @override
  String get sheetTitle => 'Pilih Aplikasi';

  @override
  String get sheetTotalLocked => 'Total Dikunci';

  @override
  String get sheetAppsSelected => 'aplikasi dipilih';

  @override
  String get sheetTimeSaved => 'Waktu Dihemat';

  @override
  String get sheetPerDayAvg => 'rata-rata per hari';

  @override
  String sheetHoursValue(String h) {
    return '$h jam';
  }

  @override
  String get sheetSearchHint => 'Cari aplikasi...';

  @override
  String get sheetCatAll => 'Semua';

  @override
  String get sheetCatSocial => 'Sosial';

  @override
  String get sheetCatEntertainment => 'Hiburan';

  @override
  String get sheetCatGames => 'Game';

  @override
  String get sheetAppsHeader => 'APLIKASI';

  @override
  String sheetSelectedCount(int count) {
    return '$count dipilih';
  }

  @override
  String get sheetNoApps => 'Aplikasi tidak ditemukan';

  @override
  String get sheetLockSchedule => 'JADWAL KUNCI';

  @override
  String get sheetAddCustomSemantic => 'Tambahkan jadwal kunci kustom';

  @override
  String get sheetCustomBadge => '+ Kustom';

  @override
  String get sheetSchedMorning => 'Pagi';

  @override
  String get sheetSchedWork => 'Kerja';

  @override
  String get sheetSchedEvening => 'Malam';

  @override
  String get sheetEveryDay => 'Setiap hari';

  @override
  String get sheetWeekdays => 'Hari kerja';

  @override
  String get sheetWeekends => 'Akhir pekan';

  @override
  String get sheetUnlockMethod => 'METODE BUKA KUNCI';

  @override
  String get sheetPin => 'Kode PIN';

  @override
  String get sheetPinSub => 'PIN 4 digit';

  @override
  String get sheetFaceId => 'Face ID';

  @override
  String get sheetFaceIdSub => 'Biometrik';

  @override
  String get sheetTouchId => 'Touch ID';

  @override
  String get sheetTouchIdSub => 'Sidik jari';

  @override
  String get sheetFooter => 'Anda bisa mengubahnya kapan saja nanti';

  @override
  String get sheetConfirmLock => 'Konfirmasi Kunci';

  @override
  String sheetRemove(String name) {
    return 'Hapus $name';
  }

  @override
  String get sheetCustomTitle => 'Jadwal kustom';

  @override
  String get sheetCustomBody =>
      'Aplikasi pilihan Anda tetap terkunci selama waktu ini.';

  @override
  String get sheetNameLabel => 'NAMA';

  @override
  String get sheetNameHint => 'mis. Waktu belajar';

  @override
  String get sheetStarts => 'Mulai';

  @override
  String get sheetEnds => 'Selesai';

  @override
  String get sheetSameTime => 'Waktu mulai dan selesai sama';

  @override
  String sheetLockedFor(String duration) {
    return 'Dikunci selama $duration';
  }

  @override
  String sheetLockedForOvernight(String duration) {
    return 'Dikunci selama $duration (semalam)';
  }

  @override
  String sheetDurH(int h) {
    return '$h j';
  }

  @override
  String sheetDurM(int m) {
    return '$m mnt';
  }

  @override
  String sheetDurHM(int h, int m) {
    return '$h j $m mnt';
  }

  @override
  String get sheetLockStartsAt => 'KUNCI MULAI PUKUL';

  @override
  String get sheetLockEndsAt => 'KUNCI BERAKHIR PUKUL';

  @override
  String get sheetRepeatOn => 'ULANGI PADA';

  @override
  String get sheetAddSchedule => 'Tambah jadwal';

  @override
  String get sheetCustomDefaultName => 'Kustom';

  @override
  String sheetChangeTime(String label, String time) {
    return '$label $time. Ubah waktu';
  }

  @override
  String get ob3Title => 'Tetap Fokus Setiap Hari';

  @override
  String get ob3Body =>
      'Gunakan sesi Pomodoro dan Fokus Mendalam untuk meningkatkan produktivitas dan meraih lebih banyak.';

  @override
  String get ob3Pomodoro => 'Pomodoro';

  @override
  String ob3PomodoroSub(int min) {
    return 'Sesi $min mnt';
  }

  @override
  String get ob3DeepFocus => 'Fokus Mendalam';

  @override
  String ob3DeepFocusSub(int min) {
    return 'Alur $min mnt';
  }

  @override
  String get ob3StatBoost => 'peningkatan produktivitas';

  @override
  String ob3StatStreakValue(int days) {
    return '$days hari';
  }

  @override
  String get ob3StatStreak => 'membangun streak';

  @override
  String get ob3StatGoal => 'target tercapai';

  @override
  String get ob3StartTimer => 'Mulai timer';

  @override
  String get ob3PauseTimer => 'Jeda timer';

  @override
  String get ob4Title => 'Pantau Kemajuanmu';

  @override
  String get ob4Body =>
      'Pantau waktu layar, jam fokus, target, dan produktivitas dengan analitik yang indah.';

  @override
  String get ob4Weekly => 'Mingguan';

  @override
  String get ob4WeeklySub => 'laporan';

  @override
  String get ob4Goals => 'Target';

  @override
  String get ob4GoalsSub => 'pelacak';

  @override
  String get ob4Insights => 'Wawasan';

  @override
  String get ob4InsightsSub => 'pelatih AI';

  @override
  String get ob4Streaks => 'Streak';

  @override
  String get ob4StreaksSub => '& lencana';

  @override
  String get ob5Title => 'Berapa rata-rata waktu layar harianmu?';

  @override
  String get ob5Subtitle => 'Hanya di ponselmu. Perkiraan saja sudah cukup.';

  @override
  String get ob5More7 => 'Lebih dari 7 jam';

  @override
  String get ob5H5to7 => '5-7 jam';

  @override
  String get ob5H4to5 => '4-5 jam';

  @override
  String get ob5H3to4 => '3-4 jam';

  @override
  String get ob5H1to3 => '1-3 jam';

  @override
  String get ob5Under1 => 'Kurang dari 1 jam';

  @override
  String get ob6Title => 'Apa pekerjaanmu?';

  @override
  String get ob6Subtitle =>
      'Kami akan menyesuaikan rencana fokusmu dengan gaya kerjamu.';

  @override
  String get ob6Software => 'Pengembangan Perangkat Lunak';

  @override
  String get ob6Founder => 'CEO / Pendiri';

  @override
  String get ob6Remote => 'Pekerja Jarak Jauh';

  @override
  String get ob6Finance => 'Keuangan / Operasional / Konsultasi';

  @override
  String get ob6Art => 'Seni / Konten';

  @override
  String get ob6Education => 'Pendidikan';

  @override
  String get ob6Others => 'Lainnya';

  @override
  String get ob7Title => 'Tetapkan target waktu layar harian';

  @override
  String get ob7Subtitle =>
      'Kamu bisa mengubahnya kapan saja. Kami akan mengingatkan saat hampir tercapai.';

  @override
  String ob7Hours(String hours) {
    return '$hours j';
  }

  @override
  String get ob7PerDay => 'per hari';

  @override
  String ob7HoursPerDay(String hours) {
    return '$hours per hari';
  }

  @override
  String get ob7DialLabel => 'Target waktu layar harian';

  @override
  String get ob7InfoNote =>
      'Rata-rata orang menghabiskan 4 jam+ sehari di ponsel. Menetapkan target adalah langkah pertama untuk merebut kembali waktumu.';

  @override
  String get ob8Title => 'Aktifkan Izin Penting';

  @override
  String get ob8Subtitle => 'Berikan akses untuk menikmati Pausey sepenuhnya.';

  @override
  String get ob8UsageTitle => 'Akses Penggunaan';

  @override
  String get ob8UsageSub =>
      'Pantau penggunaan aplikasi dan terapkan sesi fokus.';

  @override
  String get ob8NotifTitle => 'Notifikasi';

  @override
  String get ob8NotifSub => 'Pengingat tepat waktu & info kemajuan.';

  @override
  String get ob8TrackTitle => 'Lacak Penggunaan Aplikasi';

  @override
  String get ob8TrackSub => 'Rincian harian dan mingguan.';

  @override
  String get ob9Title => 'Semua siap!';

  @override
  String get ob9Subtitle => 'Lingkungan fokusmu sudah siap.';

  @override
  String get ob9Enter => 'Masuk ke Pausey';

  @override
  String get ob9Replay => 'Ulangi Pengenalan';

  @override
  String get ob9ScreenTime => 'Waktu Layar';

  @override
  String get ob9AppsLocked => 'Aplikasi Terkunci';

  @override
  String get ob9Permissions => 'Izin';

  @override
  String get ob9FocusMode => 'Mode Fokus';

  @override
  String get ob9AllOk => 'Semua OK';

  @override
  String get ob9On => 'AKTIF';

  @override
  String get ob9Done => 'SELESAI';

  @override
  String get ob9StreakTitle => 'Rentetan hari ke-1 dimulai sekarang';

  @override
  String get ob9StreakSub => 'Selesaikan satu sesi untuk melanjutkannya';

  @override
  String get appName => 'Pausey';

  @override
  String get tagline => 'Ambil kembali waktumu';

  @override
  String get versionLabel => 'Versi 2.0 · Edisi App Store';

  @override
  String get skip => 'Lewati';

  @override
  String get continueLabel => 'Lanjut';

  @override
  String get back => 'Kembali';

  @override
  String get freeToStart => 'Gratis untuk memulai · Tanpa kartu kredit';

  @override
  String get dataStaysOnDevice =>
      'Datamu tidak pernah keluar dari perangkatmu.';

  @override
  String get switchToLight => 'Beralih ke mode terang';

  @override
  String get switchToDark => 'Beralih ke mode gelap';

  @override
  String get language => 'Bahasa';

  @override
  String get phoneLanguage => 'Bahasa ponsel';

  @override
  String get authTitle => 'Hentikan scroll.\nKuasai harimu.';

  @override
  String get authSubtitle =>
      'Buat akun untuk menyinkronkan target dan streak-mu, atau coba Pausey sebagai tamu.';

  @override
  String get continueWithApple => 'Lanjut dengan Apple';

  @override
  String get continueWithGoogle => 'Lanjut dengan Google';

  @override
  String get signUpWithEmail => 'Daftar dengan email';

  @override
  String get continueAsGuest => 'Lanjut sebagai tamu';

  @override
  String get guestNote => 'Data tamu hanya disimpan di ponsel ini.';

  @override
  String get or => 'atau';

  @override
  String get haveAccount => 'Sudah punya akun?';

  @override
  String get noAccount => 'Baru di Pausey?';

  @override
  String get logIn => 'Masuk';

  @override
  String get signUp => 'Daftar';

  @override
  String get createAccount => 'Buat akun';

  @override
  String get signUpTitle => 'Buat akunmu';

  @override
  String get signUpSubtitle =>
      'Mulai bangun kebiasaan layar yang lebih tenang.';

  @override
  String get logInTitle => 'Selamat datang kembali';

  @override
  String get logInSubtitle => 'Masuk untuk melanjutkan streak-mu.';

  @override
  String get fullName => 'Nama lengkap';

  @override
  String get email => 'Email';

  @override
  String get password => 'Kata sandi';

  @override
  String get confirmPassword => 'Konfirmasi kata sandi';

  @override
  String get showPassword => 'Tampilkan kata sandi';

  @override
  String get hidePassword => 'Sembunyikan kata sandi';

  @override
  String get forgotPassword => 'Lupa kata sandi?';

  @override
  String get resetTitle => 'Atur ulang kata sandi';

  @override
  String get resetSubtitle =>
      'Masukkan email-mu dan kami akan mengirim tautan atur ulang.';

  @override
  String get sendLink => 'Kirim tautan';

  @override
  String get resetSent => 'Cek kotak masukmu untuk tautan atur ulang.';

  @override
  String get agreeTerms => 'Saya setuju dengan Ketentuan dan Kebijakan Privasi';

  @override
  String get passwordStrength => 'Kekuatan kata sandi';

  @override
  String get strengthWeak => 'Lemah';

  @override
  String get strengthOk => 'Cukup';

  @override
  String get strengthStrong => 'Kuat';

  @override
  String get errNameRequired => 'Masukkan namamu';

  @override
  String get errEmailInvalid => 'Masukkan email yang valid';

  @override
  String get errPasswordShort => 'Gunakan minimal 8 karakter';

  @override
  String get errPasswordMismatch => 'Kata sandi tidak cocok';

  @override
  String get errTerms => 'Setujui ketentuan untuk melanjutkan';

  @override
  String get authErr_not_configured =>
      'Masuk belum diatur. Kamu bisa lanjut sebagai tamu.';

  @override
  String get authErr_cancelled => 'Masuk dibatalkan.';

  @override
  String get authErr_invalid_email => 'Email itu sepertinya tidak benar.';

  @override
  String get authErr_wrong_password => 'Email atau kata sandi salah.';

  @override
  String get authErr_user_not_found =>
      'Tidak ada akun dengan email ini. Daftar saja?';

  @override
  String get authErr_email_in_use =>
      'Akun dengan email ini sudah ada. Silakan masuk.';

  @override
  String get authErr_weak_password => 'Pilih kata sandi yang lebih kuat.';

  @override
  String get authErr_network => 'Tidak ada koneksi internet. Coba lagi.';

  @override
  String get authErr_too_many =>
      'Terlalu banyak percobaan. Tunggu sebentar lalu coba lagi.';

  @override
  String get authErr_unknown => 'Terjadi kesalahan. Coba lagi.';

  @override
  String homeHello(String name) {
    return 'Hai, $name';
  }

  @override
  String get homeHelloGuest => 'Hai';

  @override
  String get homeGuestBadge => 'Mode tamu · disimpan di ponsel ini';

  @override
  String get homeSubtitle => 'Rencanamu sudah siap. Ini pilihanmu.';

  @override
  String get homeDailyGoal => 'Target harian';

  @override
  String get homeLockedApps => 'Aplikasi terkunci';

  @override
  String get homeScreenTime => 'Waktu layar saat ini';

  @override
  String get homeNotSet => 'Belum diatur';

  @override
  String get homeCreateAccount => 'Buat akun untuk mencadangkan';

  @override
  String get signOut => 'Keluar';

  @override
  String get signOutGuestWarn =>
      'Keluar akan menghapus data tamu di ponsel ini.';

  @override
  String get cancel => 'Batal';
}
