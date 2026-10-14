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
  String alSummary(int locked, int total) {
    return '$locked dibatasi kini · $total dikelola';
  }

  @override
  String alSummaryOff(int total) {
    return '$total dikelola · pemblokiran mati';
  }

  @override
  String get alFromInstalled => 'Pilih dari aplikasi terpasang';

  @override
  String get alFromInstalledSub => 'Aplikasi apa pun di ponsel ini';

  @override
  String get alPermTitle => 'Pemblokiran belum aktif';

  @override
  String get alPermMsg =>
      'Aturan tersimpan, tetapi Pausey baru bisa memblokir setelah dua izin ini diberikan:';

  @override
  String get alPermUsage => 'Akses penggunaan';

  @override
  String get alPermUsageSub =>
      'Melihat aplikasi yang terbuka dan waktunya hari ini';

  @override
  String get alPermOverlay => 'Tampilkan di atas aplikasi lain';

  @override
  String get alPermOverlaySub => 'Menampilkan layar kunci';

  @override
  String get alAllow => 'Izinkan';

  @override
  String get alAllowed => 'Diizinkan';

  @override
  String get alPermReturn =>
      'Kembali ke Pausey setelahnya — dicek ulang otomatis.';

  @override
  String get alAndroidOnly =>
      'Pemblokiran hanya di Android. Aturan tetap bisa diatur di sini.';

  @override
  String get alSearchHint => 'Cari aplikasi';

  @override
  String get alFilterAll => 'Semua';

  @override
  String get alFilterLocked => 'Terkunci';

  @override
  String get alFilterScheduled => 'Terjadwal';

  @override
  String get alFilterAvailable => 'Tersedia';

  @override
  String get alStateLocked => 'Terkunci';

  @override
  String get alStateWillLock => 'Akan dikunci';

  @override
  String get alStateScheduled => 'Terjadwal';

  @override
  String get alStateAvailable => 'Tersedia';

  @override
  String alUsedOf(String used, String limit) {
    return 'Terpakai $used dari $limit';
  }

  @override
  String alUsedToday(String used) {
    return 'Hari ini $used';
  }

  @override
  String get alNoLimit => 'Tanpa batas harian';

  @override
  String alLimitNoUsage(String limit) {
    return 'Batas $limit · data tak tersedia';
  }

  @override
  String get alRulesOff => 'Pembatasan mati';

  @override
  String alNextLock(String time) {
    return 'Kunci berikutnya: $time';
  }

  @override
  String alUnlockedUntil(String time) {
    return 'Terbuka hingga $time';
  }

  @override
  String get alReasonLimit => 'Batas harian tercapai';

  @override
  String get alReasonSchedule => 'Jadwal kunci aktif';

  @override
  String get alReasonGeneral => 'Jadwal umum aktif';

  @override
  String get alReasonAllDay => 'Terkunci seharian';

  @override
  String get alReasonFocus => 'Sesi fokus berjalan';

  @override
  String get alNoMatches => 'Tidak ada yang cocok';

  @override
  String get alGeneral => 'Umum';

  @override
  String get alGeneralScheduleSub =>
      'Untuk aplikasi dengan “Ikuti jadwal umum”';

  @override
  String get alLockAllSub => 'Aktifkan pembatasan semua aplikasi';

  @override
  String get alSaved => 'Tersimpan';

  @override
  String get alChangesApply => 'Perubahan langsung berlaku';

  @override
  String get alDetailsTitle => 'Batas Aplikasi';

  @override
  String get alBlockingOff => 'Pemblokiran mati di ponsel ini';

  @override
  String get alRestrictApp => 'Batasi aplikasi ini';

  @override
  String get alMasterOff => 'Mati — Pausey tidak membatasinya';

  @override
  String get alMasterOnRules => 'Batas dan jadwal di bawah berlaku';

  @override
  String get alMasterOnAllDay => 'Belum ada batas/jadwal — terkunci seharian';

  @override
  String get alMasterOnGeneral => 'Terkunci selama jadwal umum';

  @override
  String get alFollowGeneral => 'Ikuti jadwal umum';

  @override
  String alFollowGeneralSub(String start, String end) {
    return 'Juga kunci $start – $end';
  }

  @override
  String get alGeneralOff => 'Jadwal umum sedang mati';

  @override
  String get alDailyLimit => 'Batas harian';

  @override
  String get alDailyLimitOffSub =>
      'Kunci aplikasi setelah waktu tertentu tiap hari';

  @override
  String get alCustom => 'Kustom';

  @override
  String get alUsedLabel => 'Terpakai hari ini';

  @override
  String get alLeftLabel => 'Sisa';

  @override
  String get alLimitReached => 'Batas hari ini tercapai';

  @override
  String get alResets => 'Reset tengah malam (waktu ponsel)';

  @override
  String get alUsageUnavailable => 'Data penggunaan tak tersedia';

  @override
  String get alUsageNeedsAccess =>
      'Izinkan akses penggunaan agar Pausey bisa menghitung waktu hari ini.';

  @override
  String get alUsageAndroidOnly =>
      'Penggunaan hanya diukur di Android. Batas tetap tersimpan dan berlaku di sana.';

  @override
  String get alGrantUsage => 'Beri akses penggunaan';

  @override
  String get alCustomLimitTitle => 'Batas harian kustom';

  @override
  String get alHours => 'Jam';

  @override
  String get alMinutes => 'Menit';

  @override
  String get alErrZeroLimit => 'Pilih lebih dari nol';

  @override
  String get alSave => 'Simpan';

  @override
  String get alScheduledLocking => 'Kunci terjadwal';

  @override
  String get alScheduledOffSub => 'Kunci aplikasi ini di jam tertentu';

  @override
  String get alNoSchedules => 'Belum ada jadwal';

  @override
  String get alAddSchedule => 'Tambah jadwal';

  @override
  String get alActiveNow => 'Aktif sekarang';

  @override
  String get alScheduleDefault => 'Waktu kunci';

  @override
  String get alEndsNextDay => 'Berakhir besok';

  @override
  String get alEdit => 'Ubah';

  @override
  String get alDelete => 'Hapus';

  @override
  String get alDeleteScheduleQ => 'Hapus jadwal ini?';

  @override
  String alDeleteScheduleMsg(String title) {
    return '“$title” tidak akan mengunci aplikasi ini lagi.';
  }

  @override
  String get alNewSchedule => 'Jadwal baru';

  @override
  String get alEditSchedule => 'Ubah jadwal';

  @override
  String get alTitleOptional => 'Judul (opsional)';

  @override
  String get alPresetStudy => 'Belajar';

  @override
  String get alPresetEvening => 'Malam';

  @override
  String get alPresetSleep => 'Tidur';

  @override
  String get alRepeatOn => 'Ulangi pada';

  @override
  String get alErrSameTime => 'Mulai dan selesai tidak boleh sama';

  @override
  String get alErrNoDays => 'Pilih minimal satu hari';

  @override
  String alTempUnlock(int minutes) {
    return 'Buka $minutes menit';
  }

  @override
  String alTempUnlockSub(int n) {
    return 'Pakai 1 akses darurat · sisa $n';
  }

  @override
  String get alTempUnlockFocus => 'Tidak bisa saat sesi fokus';

  @override
  String get alTempUnlockNotLocked => 'Hanya perlu saat aplikasi terkunci';

  @override
  String alTempUnlockQ(String app, int minutes) {
    return 'Buka $app selama $minutes menit?';
  }

  @override
  String get alUnlock => 'Buka';

  @override
  String get alEndEarly => 'Akhiri';

  @override
  String get alResetRules => 'Atur ulang pembatasan';

  @override
  String get alResetRulesSub => 'Hapus batas dan jadwal aplikasi';

  @override
  String alResetQ(String app) {
    return 'Atur ulang pembatasan $app?';
  }

  @override
  String get alResetMsg =>
      'Batas harian dan semua jadwal dihapus. Aplikasi tetap di daftar.';

  @override
  String get alReset => 'Atur ulang';

  @override
  String get alResetDone => 'Pembatasan diatur ulang';

  @override
  String get alRemoveApp => 'Hapus aplikasi';

  @override
  String get alRemoveAppSub => 'Berhenti mengelola aplikasi ini';

  @override
  String alRemoveQ(String app) {
    return 'Hapus $app?';
  }

  @override
  String get alRemoveMsg =>
      'Pausey berhenti membatasinya dan menghapus batas serta jadwalnya.';

  @override
  String get alRemove => 'Hapus';

  @override
  String get alNoPackage =>
      'Batas dan jadwal per aplikasi butuh satu aplikasi terpasang. Di Android, tambahkan lewat “Pilih dari aplikasi terpasang”.';

  @override
  String get alNotFound => 'Aplikasi ini tidak lagi dikelola';

  @override
  String get alPickerTitle => 'Aplikasi terpasang';

  @override
  String get alPickerAdded => 'Sudah ditambahkan';

  @override
  String alPickerAdd(int n) {
    return 'Tambah aplikasi ($n)';
  }

  @override
  String get alPickerEmpty => 'Tidak ada aplikasi';

  @override
  String get blockTitle => 'Kunci Aplikasi';

  @override
  String get blockAddApp => 'Tambah';

  @override
  String get blockFaceIdTitle => 'Perlindungan Face ID';

  @override
  String get blockFaceIdSub => 'Wajib Face ID untuk membuka aplikasi';

  @override
  String get blockFaceIdUnavailable =>
      'Biometrik tidak tersedia di perangkat ini';

  @override
  String get blockFaceIdReason => 'Konfirmasi identitas untuk mengaktifkan';

  @override
  String get blockFaceIdFailed => 'Gagal verifikasi — perlindungan tetap mati';

  @override
  String get blockScheduleTitle => 'Kunci Terjadwal';

  @override
  String get blockStart => 'Mulai';

  @override
  String get blockEnd => 'Selesai';

  @override
  String get blockNeedOneDay => 'Pilih minimal satu hari';

  @override
  String get blockManagedApps => 'Aplikasi dikelola';

  @override
  String get blockLockAll => 'Kunci semua';

  @override
  String get blockAllLocked => 'Semua aplikasi terkunci';

  @override
  String blockRemoved(String app) {
    return '$app dihapus';
  }

  @override
  String get blockAppsUpdated => 'Aplikasi diperbarui';

  @override
  String get blockCatSocial => 'Sosial';

  @override
  String get blockCatVideo => 'Video';

  @override
  String get blockCatGames => 'Game';

  @override
  String get blockCatShopping => 'Belanja';

  @override
  String get blockCatCommunity => 'Komunitas';

  @override
  String get blockCatOther => 'Lainnya';

  @override
  String get blockEmptyBadge => 'Belum ada';

  @override
  String get blockEmptyTitle => 'Belum ada aplikasi';

  @override
  String get blockEmptyMsg =>
      'Tambahkan aplikasi paling mengganggu, Pausey akan menguncinya.';

  @override
  String get blockEmergencyTitle => 'Darurat';

  @override
  String blockEmergencySub(int n) {
    return 'Buka semua sementara · sisa $n hari ini';
  }

  @override
  String get blockEmergencyOff => 'Dimatikan di Pengaturan';

  @override
  String get blockEmergencyUse => 'Pakai';

  @override
  String get blockEmergencyConfirmTitle => 'Gunakan akses darurat?';

  @override
  String blockEmergencyConfirmMsg(int n) {
    return 'Ini memakai satu dari $n sisa hari ini. Pakai hanya saat benar-benar perlu.';
  }

  @override
  String get blockEmergencyUsed => 'Akses darurat dipakai — aplikasi terbuka';

  @override
  String get blockEmergencyNone => 'Tidak ada sisa hari ini';

  @override
  String get cvAppsLoadFailed => 'Tidak bisa membaca aplikasi di ponsel ini.';

  @override
  String get cvTryAgain => 'Coba lagi';

  @override
  String get cvGetStarted => 'Mulai';

  @override
  String get cvHaveAccount => 'Saya sudah punya akun';

  @override
  String get cvWelcomeTitle => 'Waktumu milikmu.';

  @override
  String get cvWelcomeBody =>
      'Yuk, beri lebih banyak ruang untuk hal yang penting.';

  @override
  String get cvNext => 'Lanjut';

  @override
  String get cvSkipForNow => 'Lewati dulu';

  @override
  String get cvRelateTitle =>
      'Pernah buka ponsel sebentar, tapi malah lama sekali?';

  @override
  String get cvRelateOften => 'Sering sekali';

  @override
  String get cvRelateSometimes => 'Kadang-kadang';

  @override
  String get cvRelateRarely => 'Jarang';

  @override
  String get cvRelateReplyOften =>
      'Kamu tidak sendirian. Ponsel memang dirancang agar kita betah.';

  @override
  String get cvRelateReplySometimes =>
      'Ini terjadi pada kebanyakan dari kita, biasanya tanpa disadari.';

  @override
  String get cvRelateReplyRarely => 'Bagus. Yuk, pertahankan.';

  @override
  String get cvRelateCta => 'Itu saya';

  @override
  String get cvGoalTitle => 'Kamu ingin punya lebih banyak waktu untuk apa?';

  @override
  String get cvGoalFocus => 'Fokus lebih baik';

  @override
  String get cvGoalSleep => 'Tidur lebih nyenyak';

  @override
  String get cvGoalScrolling => 'Kurangi scroll';

  @override
  String get cvGoalMe => 'Waktu untuk diri sendiri';

  @override
  String get cvGoalHabits => 'Kebiasaan harian lebih sehat';

  @override
  String get cvGoalOther => 'Hal lain';

  @override
  String get cvGoalOtherHint =>
      'Kamu ingin punya lebih banyak waktu untuk apa?';

  @override
  String get cvGoalReplyFocus =>
      'Fokus, siap. Kami akan menjaga waktu yang kamu butuhkan untuk kerja mendalam.';

  @override
  String get cvGoalReplySleep =>
      'Tidur nyenyak dimulai sebelum ke tempat tidur. Kami bantu malammu jadi lebih tenang.';

  @override
  String get cvGoalReplyScrolling =>
      'Yuk, jadikan scroll sebagai pilihan, bukan kebiasaan.';

  @override
  String get cvGoalReplyMe =>
      'Waktu untuk diri sendiri itu penting. Yuk, kita cari.';

  @override
  String get cvGoalReplyHabits =>
      'Langkah kecil lama-lama berarti. Kami buat tetap mudah.';

  @override
  String get cvGoalReplyOther => 'Oke. Kami sesuaikan semuanya dengan itu.';

  @override
  String get cvAppsTitle => 'Aplikasi mana yang paling sering menyita waktumu?';

  @override
  String get cvAppsSubReal =>
      'Ini aplikasi di ponsel ini. Pilih sebanyak yang kamu mau.';

  @override
  String get cvAppsSubPopular =>
      'Aplikasi populer yang sering menyita waktu. Pilih yang sesuai.';

  @override
  String get cvAppsSearch => 'Cari aplikasi';

  @override
  String cvAppsReply(String apps) {
    return 'Dicatat: $apps. Kita mulai dari ini.';
  }

  @override
  String cvAnd(String a, String b) {
    return '$a dan $b';
  }

  @override
  String cvAndMore(String a, String b, int count) {
    return '$a, $b, dan $count lainnya';
  }

  @override
  String get cvStTitle => 'Kira-kira berapa lama kamu main ponsel setiap hari?';

  @override
  String get cvStSub => 'Perkiraan saja cukup. Ini tetap di ponselmu.';

  @override
  String cvStMeasured(String time) {
    return 'Terukur di ponsel ini hari ini: $time';
  }

  @override
  String get cvStUnder2 => 'Kurang dari 2 jam';

  @override
  String get cvSt2to4 => '2 sampai 4 jam';

  @override
  String get cvSt4to6 => '4 sampai 6 jam';

  @override
  String get cvStOver6 => 'Lebih dari 6 jam';

  @override
  String get cvStNotSure => 'Tidak yakin';

  @override
  String get cvStReplyUnder2 =>
      'Itu seimbang. Kami bantu kamu mempertahankannya.';

  @override
  String get cvStReply2to4 =>
      'Beberapa perubahan kecil bisa memberi waktu yang berarti.';

  @override
  String get cvStReply4to6 =>
      'Itu porsi yang cukup besar dari harimu. Yuk, ambil kembali sebagian.';

  @override
  String get cvStReplyOver6 =>
      'Itu bagian besar dari harimu, jadi kita mulai dari yang kecil.';

  @override
  String get cvStReplyNotSure =>
      'Tidak masalah. Pausey bisa mengukurnya setelah kamu mengizinkan akses penggunaan.';

  @override
  String get cvPhraseFocus => 'lebih fokus';

  @override
  String get cvPhraseSleep => 'tidur lebih nyenyak';

  @override
  String get cvPhraseScrolling => 'mengurangi scroll';

  @override
  String get cvPhraseMe => 'lebih banyak waktu untuk diri sendiri';

  @override
  String get cvPhraseHabits => 'kebiasaan yang lebih sehat';

  @override
  String get cvPhraseOther => 'lebih banyak ruang untuk hal penting';

  @override
  String cvPhraseOtherNamed(String thing) {
    return 'lebih banyak waktu untuk $thing';
  }

  @override
  String cvReflectApps(String goal, String apps) {
    return 'Kamu ingin $goal, tapi $apps terus menarikmu.';
  }

  @override
  String cvReflectNoApps(String goal) {
    return 'Kamu ingin $goal, dan kadang ponsel jadi penghalang.';
  }

  @override
  String cvReflectEstimate(String time) {
    return 'Sekitar $time sehari (perkiraanmu)';
  }

  @override
  String cvReflectMeasured(String time) {
    return '$time hari ini (terukur)';
  }

  @override
  String get cvReflectHelp =>
      'Pausey bisa membantumu membangun rutinitas yang memberi perhatianmu ruang bernapas.';

  @override
  String get cvShowMeHow => 'Tunjukkan caranya';

  @override
  String get cvHowTitle => 'Begini cara Pausey membantu';

  @override
  String get cvHowPauseTab => 'Jeda';

  @override
  String get cvHowLimitTab => 'Batas';

  @override
  String get cvHowFocusTab => 'Fokus';

  @override
  String get cvHowPauseTitle => 'Jeda yang tenang, bukan hukuman';

  @override
  String get cvHowPauseBody =>
      'Saat waktu aplikasi habis, Pausey menutupnya dengan layar jeda yang tenang dan jalan keluar.';

  @override
  String get cvHowLimitTitle => 'Jatah harian untuk setiap aplikasi';

  @override
  String get cvHowLimitBody =>
      'Beri setiap aplikasi waktu harian dan jam kuncinya sendiri. Mengubah satu tak akan mengubah yang lain.';

  @override
  String get cvHowFocusTitle => 'Sesi fokus';

  @override
  String get cvHowFocusBody =>
      'Mulai timer untuk kerja, belajar, atau istirahat. Aplikasi pilihanmu tetap dijeda sampai selesai.';

  @override
  String get cvPreview => 'Pratinjau';

  @override
  String get cvYourApp => 'Aplikasimu';

  @override
  String get cvAnotherApp => 'Aplikasi lain';

  @override
  String cvMinOf(int used, int limit) {
    return '$used dari $limit mnt';
  }

  @override
  String get cvBuildPlan => 'Buat rencanaku';

  @override
  String get cvPlanTitle => 'Ini awal yang ringan untukmu';

  @override
  String get cvPlanSub => 'Disarankan dari jawabanmu. Ubah sesukamu.';

  @override
  String get cvPlanFocus => 'Sesi fokus';

  @override
  String cvPlanFocusSub(String time) {
    return '$time per sesi';
  }

  @override
  String get cvPlanDaily => 'Target fokus harian';

  @override
  String cvPlanDailySub(String time) {
    return '$time fokus sehari';
  }

  @override
  String get cvPlanLimit => 'Batas harian aplikasi';

  @override
  String cvPlanLimitSub(String app, String time) {
    return '$app: $time sehari';
  }

  @override
  String get cvPlanLimitNoPkg =>
      'Aplikasi ini tidak ada di daftar ponsel, jadi batasnya bisa diatur nanti di Kunci Aplikasi.';

  @override
  String get cvPlanWind => 'Rileks malam';

  @override
  String cvPlanWindSub(String start, String end) {
    return 'Aplikasi pilihanmu dijeda dari $start hingga $end';
  }

  @override
  String get cvPlanOff => 'Mati';

  @override
  String get cvStarts => 'Mulai';

  @override
  String get cvEnds => 'Selesai';

  @override
  String get cvPlanNote =>
      'Belum ada yang aktif. Semua baru mulai setelah pengaturan selesai, dan bisa kamu ubah kapan saja.';

  @override
  String get cvUsePlan => 'Pakai rencana ini';

  @override
  String get cvPermTitle => 'Beberapa izin agar ini berfungsi';

  @override
  String get cvPermSub =>
      'Masing-masing membuka pengaturan Android. Aktifkan di sana, lalu kembali.';

  @override
  String get cvPermUnsupported =>
      'Batas aplikasi dan layar jeda berfungsi di ponsel Android. Fitur lainnya juga berfungsi di sini.';

  @override
  String get cvPermUsageTitle => 'Akses penggunaan';

  @override
  String get cvPermUsageWhy =>
      'Memungkinkan Pausey melihat berapa lama tiap aplikasi dibuka hari ini dan aplikasi mana yang tampil di layar.';

  @override
  String get cvPermUsageWithout =>
      'Tanpa ini, Pausey tak bisa mengukur waktu layar atau tahu kapan batas tercapai.';

  @override
  String get cvPermOverlayTitle => 'Tampilkan di atas aplikasi lain';

  @override
  String get cvPermOverlayWhy =>
      'Memungkinkan Pausey menampilkan layar jeda di atas aplikasi saat waktunya habis.';

  @override
  String get cvPermOverlayWithout =>
      'Tanpa ini, aplikasi tidak bisa dijeda. Rencanamu disimpan untuk nanti.';

  @override
  String get cvPermBatteryTitle => 'Biarkan Pausey tetap berjalan';

  @override
  String get cvPermBatteryWhy =>
      'Beberapa ponsel menghentikan aplikasi latar belakang untuk hemat baterai. Mengizinkan Pausey membuat batasmu tetap berjalan.';

  @override
  String get cvPermBatteryWithout =>
      'Tanpa ini, batas bisa berhenti bekerja sampai kamu membuka Pausey lagi.';

  @override
  String get cvPermLater =>
      'Kamu bisa mengubahnya nanti di pengaturan Android.';

  @override
  String get cvPermPrivacy =>
      'Pausey hanya membaca nama aplikasi dan waktu. Tak ada yang keluar dari ponselmu.';

  @override
  String get cvAllowInSettings => 'Izinkan di pengaturan';

  @override
  String get cvAllowed => 'Diizinkan';

  @override
  String get cvOptional => 'Opsional';

  @override
  String get cvContinueAnyway => 'Lanjut dulu';

  @override
  String get cvAccountTitle => 'Simpan progresmu';

  @override
  String get cvAccountSub => 'Pakai Pausey sebagai tamu, atau masuk.';

  @override
  String get cvNameLabel => 'Namamu (opsional)';

  @override
  String get cvNameHint => 'Kami panggil kamu siapa?';

  @override
  String get cvContinueGuest => 'Lanjut sebagai tamu';

  @override
  String get cvAccountNote =>
      'Masuk belum mencadangkan datamu. Bagaimanapun, pengaturanmu tetap di ponsel ini.';

  @override
  String get cvReadyTitle => 'Langkah pertamamu dimulai di sini.';

  @override
  String cvReadyTitleNamed(String name) {
    return '$name, langkah pertamamu dimulai di sini.';
  }

  @override
  String get cvReadyFocus =>
      'Yuk, beri sedikit lebih banyak ruang untuk fokus.';

  @override
  String get cvReadySleep => 'Yuk, buat malammu sedikit lebih tenang.';

  @override
  String get cvReadyScrolling =>
      'Yuk, kurangi sedikit waktu scroll dalam harimu.';

  @override
  String get cvReadyMe => 'Yuk, sisihkan sedikit lebih banyak waktu untukmu.';

  @override
  String get cvReadyHabits => 'Yuk, bangun kebiasaan yang terasa menyenangkan.';

  @override
  String get cvReadyOther =>
      'Yuk, beri lebih banyak ruang untuk hal yang penting bagimu.';

  @override
  String get cvYourPlan => 'Rencanamu';

  @override
  String cvSumGoal(String goal) {
    return 'Tujuan: $goal';
  }

  @override
  String cvSumApps(String apps) {
    return 'Aplikasi: $apps';
  }

  @override
  String cvSumFocus(String session, String daily) {
    return 'Sesi fokus $session, $daily sehari';
  }

  @override
  String get cvReadyNeedsPerm =>
      'Batas aplikasi sudah disimpan, tapi baru berjalan setelah kedua izin diberikan.';

  @override
  String get cvReadyChange => 'Kamu bisa mengubah semua ini nanti.';

  @override
  String get cvStartFirstFocus => 'Mulai sesi fokus pertamaku';

  @override
  String get cvFinishLimits => 'Selesaikan atur batas aplikasi';

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

  @override
  String get ob6OtherHint => 'Ketik pekerjaan Anda';

  @override
  String get timeSecondLabel => 'Detik';

  @override
  String get focusModePomodoro => 'Pomodoro';

  @override
  String get focusModeDeep => 'Fokus dalam';

  @override
  String get focusModeCustom => 'Kustom';

  @override
  String get focusRemaining => 'TERSISA';

  @override
  String get focusBreakLabel => 'ISTIRAHAT';

  @override
  String get focusReadyLabel => 'SIAP';

  @override
  String get focusInSession => 'Sedang sesi';

  @override
  String get focusPausedState => 'Dijeda';

  @override
  String get focusOnBreak => 'Sedang istirahat';

  @override
  String get focusIdleState => 'Ketuk putar untuk mulai';

  @override
  String get focusSessionsDone => 'Sesi selesai';

  @override
  String get focusProgress => 'Progres';

  @override
  String get focusBreakAfter => 'Istirahat';

  @override
  String get focusFocusedToday => 'Hari ini';

  @override
  String focusAppsBlocked(int count) {
    return '$count aplikasi diblokir';
  }

  @override
  String get focusAppsBlockedSub => 'Gangguan dikunci selama sesi ini.';

  @override
  String get focusNoApps => 'Tidak ada aplikasi diblokir';

  @override
  String get focusNoAppsSub => 'Pilih aplikasi untuk dikunci saat fokus.';

  @override
  String get focusEdit => 'Ubah';

  @override
  String get focusAdd => 'Tambah';

  @override
  String get focusAmbient => 'Suara latar';

  @override
  String get focusSoundOff => 'Mati';

  @override
  String get focusSoundRain => 'Hujan';

  @override
  String get focusSoundForest => 'Hutan';

  @override
  String get focusSoundWaves => 'Ombak laut';

  @override
  String get focusSoundWhite => 'Derau putih';

  @override
  String get focusVolume => 'Volume';

  @override
  String get focusStart => 'Mulai';

  @override
  String get focusPause => 'Jeda';

  @override
  String get focusResume => 'Lanjutkan';

  @override
  String get focusStop => 'Berhenti';

  @override
  String get focusRestart => 'Ulangi';

  @override
  String get focusSkipBreak => 'Lewati istirahat';

  @override
  String get focusDurations => 'Durasi sesi';

  @override
  String focusMinutesN(int n) {
    return '$n mnt';
  }

  @override
  String get focusBreakLength => 'Istirahat';

  @override
  String get focusCustomTitle => 'Durasi kustom';

  @override
  String get focusSet => 'Atur';

  @override
  String get focusStopTitle => 'Akhiri sesi lebih awal?';

  @override
  String get focusStopBody => 'Waktu fokus sejauh ini akan disimpan.';

  @override
  String get focusEndSession => 'Akhiri';

  @override
  String get focusKeepGoing => 'Lanjut';

  @override
  String get focusTooShort => 'Kurang dari semenit — tidak disimpan.';

  @override
  String get focusBreakOver => 'Istirahat selesai — siap lanjut?';

  @override
  String get focusBusy => 'Akhiri sesi untuk ganti mode.';

  @override
  String get focusFirstHint => 'Sesi pertamamu dimulai di sini — tekan putar.';

  @override
  String get focusCompleteA => 'Sesi';

  @override
  String get focusCompleteB => 'selesai!';

  @override
  String get focusEndedTitle => 'Sesi berakhir';

  @override
  String focusCompleteMsg(String mode) {
    return 'Luar biasa! Sesi $mode selesai tanpa gangguan.';
  }

  @override
  String get focusEndedMsg =>
      'Setiap menit berarti. Coba sesi penuh lain kali.';

  @override
  String get focusDurationLabel => 'DURASI FOKUS';

  @override
  String get focusMinUnit => 'mnt';

  @override
  String get focusDayStreak => 'Runtutan';

  @override
  String get focusAppsLabel => 'Aplikasi diblokir';

  @override
  String get focusTodayGoal => 'Target hari ini';

  @override
  String focusPctCompleted(int pct) {
    return '$pct% tercapai';
  }

  @override
  String focusPlusPct(int pct) {
    return '+$pct% dari sesi ini';
  }

  @override
  String get focusMomentum => 'Pertahankan momentum!';

  @override
  String get focusQuote1 =>
      'Konsistensi mengalahkan intensitas. Tiap sesi berarti.';

  @override
  String get focusQuote2 => 'Blok fokus kecil menghasilkan hasil besar.';

  @override
  String get focusQuote3 => 'Kamu tidak scroll — kamu berkarya. Ulangi.';

  @override
  String get focusStartNext => 'Mulai sesi berikutnya';

  @override
  String get focusBackHome => 'Kembali ke beranda';

  @override
  String get goalsTitle => 'Target saya';

  @override
  String goalsSubtitle(int active, int done) {
    return '$active aktif · $done selesai';
  }

  @override
  String get goalsAdd => 'Tambah target';

  @override
  String get goalsCompleted => 'Selesai';

  @override
  String get goalsActive => 'Aktif';

  @override
  String get goalsStreak => 'Streak';

  @override
  String get goalsOverall => 'Penyelesaian total';

  @override
  String goalsWeeklyHit(int hit, int total) {
    return '$hit dari $total target mingguan';
  }

  @override
  String goalsVsLastWeek(String delta) {
    return '$delta vs minggu lalu';
  }

  @override
  String get goalsFilterAll => 'Semua';

  @override
  String get goalsDone => 'Selesai';

  @override
  String get goalsCatFocus => 'Fokus';

  @override
  String get goalsCatDiscipline => 'Disiplin';

  @override
  String get goalsCatWellness => 'Kesehatan';

  @override
  String goalsTitleFocusHours(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Fokus harian: $n jam',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleFocusDur(String duration) {
    return 'Fokus harian: $duration';
  }

  @override
  String get goalsTitleBlock => 'Blokir aplikasi sosial';

  @override
  String goalsTitleSessions(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Pomodoro per hari',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleScreen(String duration) {
    return 'Waktu layar di bawah $duration';
  }

  @override
  String get goalsTitlePhoneFree => 'Waktu bebas ponsel';

  @override
  String goalsDescFocus(String duration) {
    return 'Capai $duration fokus mendalam setiap hari';
  }

  @override
  String goalsDescBlock(int n) {
    return 'Jaga aplikasi tetap terkunci $n hari seminggu';
  }

  @override
  String goalsDescSessions(int n) {
    return 'Selesaikan minimal $n sesi fokus setiap hari';
  }

  @override
  String goalsDescScreen(String duration) {
    return 'Batasi pemakaian ponsel di bawah $duration sehari';
  }

  @override
  String goalsDescPhoneFree(int n) {
    return '$n hari bebas ponsel seminggu — centang tiap hari';
  }

  @override
  String goalsProgressDays(int done, int total) {
    return '$done / $total hari';
  }

  @override
  String goalsProgressSessions(int done, int total) {
    return '$done / $total sesi';
  }

  @override
  String goalsStreakShort(int n) {
    return '$n h';
  }

  @override
  String goalsStreakN(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Streak $n hari',
    );
    return '$_temp0';
  }

  @override
  String get goalsCheckIn => 'Tandai hari ini selesai';

  @override
  String get goalsCheckedIn => 'Selesai hari ini';

  @override
  String get goalsCheckedSnack => 'Mantap! Hari ini ditandai selesai.';

  @override
  String get goalsUncheckedSnack => 'Tanda hari ini dihapus.';

  @override
  String get goalsCreateNew => 'Buat target baru';

  @override
  String get goalsEmptyBadge => 'Mulai';

  @override
  String get goalsEmptyTitle => 'Belum ada target';

  @override
  String get goalsEmptyMsg =>
      'Buat target harian kecil dan Pausey akan melacaknya.';

  @override
  String get goalsFilterEmpty => 'Tidak ada target untuk filter ini.';

  @override
  String get goalsNewGoal => 'Target baru';

  @override
  String get goalsEditGoal => 'Ubah target';

  @override
  String get goalsType => 'Jenis target';

  @override
  String get goalsTypeFocus => 'Waktu fokus';

  @override
  String get goalsTypeSessions => 'Sesi fokus';

  @override
  String get goalsTypeBlock => 'Blokir aplikasi';

  @override
  String get goalsTypePhoneFree => 'Hari bebas ponsel';

  @override
  String get goalsTypeScreen => 'Batas waktu layar';

  @override
  String get goalsCategory => 'Kategori';

  @override
  String get goalsTarget => 'Target';

  @override
  String get goalsPerDay => 'per hari';

  @override
  String get goalsPerWeek => 'hari per minggu';

  @override
  String get goalsMaxPerDay => 'maks. per hari';

  @override
  String get goalsTitleOptional => 'Judul (opsional)';

  @override
  String get goalsSave => 'Simpan target';

  @override
  String get goalsCreate => 'Buat target';

  @override
  String get goalsSavedSnack => 'Target disimpan';

  @override
  String get goalsCreatedSnack => 'Target dibuat';

  @override
  String get goalsEdit => 'Ubah';

  @override
  String get goalsDelete => 'Hapus target';

  @override
  String get goalsDeleteQ => 'Hapus target ini?';

  @override
  String get goalsDeleteMsg =>
      'Catatannya akan dihapus. Tidak bisa dibatalkan.';

  @override
  String get goalsDeletedSnack => 'Target dihapus';

  @override
  String get goalsComplete => 'selesai';

  @override
  String get goalsDaysActive => 'Hari aktif';

  @override
  String get goalsTotalTime => 'Total waktu';

  @override
  String get goalsSessionsLabel => 'Sesi';

  @override
  String get goals7Day => 'Penyelesaian 7 hari';

  @override
  String get goals7DaysAgo => '7 hari lalu';

  @override
  String get goalsToday => 'Hari ini';

  @override
  String goalsTodayDate(String date) {
    return 'Hari ini, $date';
  }

  @override
  String goalsYesterdayDate(String date) {
    return 'Kemarin, $date';
  }

  @override
  String get goalsMilestones => 'Pencapaian';

  @override
  String get goalsMsFirst => 'Hari pertama selesai';

  @override
  String get goalsMs3 => 'Streak 3 hari';

  @override
  String get goalsMsHalf => '50% target mingguan';

  @override
  String get goalsMs5 => 'Streak 5 hari';

  @override
  String get goalsMsWeek => 'Seminggu penuh selesai';

  @override
  String get goalsMsLocked => 'Belum';

  @override
  String get goalsHistory => 'Riwayat aktivitas';

  @override
  String get goalsShowLess => 'Lebih sedikit';

  @override
  String get goalsStartSession => 'Mulai sesi fokus';

  @override
  String get goalsManageApps => 'Kelola aplikasi diblokir';

  @override
  String get goalsBlockHint => 'Dihitung otomatis saat jadwal kunci aktif.';

  @override
  String goalsScreenToday(String used) {
    return 'Waktu layar hari ini: $used';
  }

  @override
  String get goalsNotFound => 'Target ini sudah tidak ada.';

  @override
  String get goalsMore => 'Opsi lainnya';

  @override
  String goalsFreeLimit(int n) {
    return 'Paket gratis: maks. $n target';
  }

  @override
  String get homeGoodMorning => 'Selamat pagi';

  @override
  String get homeGoodAfternoon => 'Selamat siang';

  @override
  String get homeGoodEvening => 'Selamat malam';

  @override
  String get homeFriend => 'Teman';

  @override
  String get homeTodayFocus => 'Fokus hari ini';

  @override
  String homeVsYesterday(String pct) {
    return '$pct% vs kemarin';
  }

  @override
  String get homeStartToday => 'Belum fokus hari ini';

  @override
  String get homeDayStreak => 'Hari beruntun';

  @override
  String get homeTodayGoal => 'Target hari ini';

  @override
  String homePctCompleted(int pct) {
    return '$pct% selesai';
  }

  @override
  String get homeOnTrack => 'Sesuai rencana!';

  @override
  String get homeKeepGoing => 'Terus semangat';

  @override
  String get homeGoalMet => 'Target tercapai!';

  @override
  String get homeScreenTimeTitle => 'Waktu layar';

  @override
  String get homeToday => 'Hari ini';

  @override
  String homeVsAvg(String pct) {
    return '$pct% vs rata-rata';
  }

  @override
  String get homeQuickStart => 'Mulai sesi fokus cepat';

  @override
  String get homeManage => 'Kelola';

  @override
  String get homeNoApps =>
      'Pilih aplikasi yang paling mengganggu dan kunci di sini.';

  @override
  String get homeAddApps => 'Tambah aplikasi';

  @override
  String homeAppLocked(String app) {
    return '$app dikunci';
  }

  @override
  String homeAppUnlocked(String app) {
    return '$app dibuka';
  }

  @override
  String homeLockApp(String app) {
    return 'Kunci atau buka $app';
  }

  @override
  String get homeUpgradeTitle => 'Upgrade ke Premium';

  @override
  String get homeUpgradeBody => 'Blokir, target & analitik tanpa batas.';

  @override
  String get homeTryFree => 'Coba gratis';

  @override
  String get homePro => 'PRO';

  @override
  String get homeProActive => 'Pausey Pro aktif';

  @override
  String get homeProActiveBody => 'Semua fitur terbuka. Terima kasih!';

  @override
  String get homeNotifications => 'Notifikasi';

  @override
  String get homeNoNotifications => 'Tidak ada notifikasi baru.';

  @override
  String get homePushLabel => 'Notifikasi push';

  @override
  String get homeFocusReminder => 'Pengingat fokus harian';

  @override
  String get homeStreakAlerts => 'Peringatan beruntun';

  @override
  String get homePwTitle => 'Buka Pausey Pro';

  @override
  String get homePwSubtitle =>
      'Rebut kembali fokusmu dan atasi kecanduan ponsel.';

  @override
  String get homePwMonthly => 'Bulanan';

  @override
  String get homePwBilledMonthly => 'Ditagih bulanan';

  @override
  String get homePwYearly => 'Tahunan';

  @override
  String get homePwPopular => 'Terpopuler';

  @override
  String homePwSave(int pct) {
    return 'Hemat $pct%';
  }

  @override
  String homePwBilledYearly(String price) {
    return '$price ditagih tahunan';
  }

  @override
  String get homePwLifetime => 'Seumur hidup';

  @override
  String get homePwBestValue => 'Paling hemat';

  @override
  String get homePwPayOnce => 'Bayar sekali, selamanya';

  @override
  String get homePwPerMonth => '/ bulan';

  @override
  String get homePwOnce => 'sekali';

  @override
  String get homePwStartTrial => 'Mulai uji coba 7 hari';

  @override
  String get homePwBuyLifetime => 'Dapatkan akses seumur hidup';

  @override
  String get homePwNoCharge => 'Tanpa biaya hari ini · Batal kapan saja';

  @override
  String get homePwOneTime => 'Bayar sekali · Tanpa langganan';

  @override
  String get homePwFree => 'Gratis';

  @override
  String get homePwProCol => 'Pro';

  @override
  String get homePwFeatBlocking => 'Blokir aplikasi tanpa batas';

  @override
  String get homePwFeatSessions => 'Semua mode fokus';

  @override
  String get homePwFeatGoals => 'Target tanpa batas';

  @override
  String get homePwFeatAnalytics => 'Analitik lanjutan';

  @override
  String get homePwFeatStreak => 'Perlindungan beruntun';

  @override
  String get homePwFeatSchedule => 'Jadwal fokus';

  @override
  String get homePwFeatFaceId => 'Kunci Face ID';

  @override
  String get homePwFeatNotif => 'Notifikasi pintar';

  @override
  String homePwMax(int n) {
    return 'maks. $n';
  }

  @override
  String get homePwSecure => 'Pembayaran aman';

  @override
  String get homePwCancelAnytime => 'Batal kapan saja';

  @override
  String get homePwPrivacyFirst => 'Privasi utama';

  @override
  String get homePwRestore => 'Pulihkan pembelian';

  @override
  String get homePwTerms => 'Ketentuan layanan';

  @override
  String get homePwPrivacyPolicy => 'Kebijakan privasi';

  @override
  String get homePwWelcome => 'Selamat datang di Pausey Pro!';

  @override
  String get homePwNothingToRestore => 'Tidak ada pembelian sebelumnya.';

  @override
  String get homePwRestored => 'Akses Pro kamu aktif.';

  @override
  String get homePwLinkSoon => 'Halaman ini segera tersedia di situs kami.';

  @override
  String get homePwYouArePro => 'Kamu Pro — selamat menikmati!';

  @override
  String get homePwClose => 'Tutup';

  @override
  String get homeAvgLegend => 'Rata-rata 7 hari';

  @override
  String homeGoalOf(String done, String goal) {
    return '$done dari $goal';
  }

  @override
  String get homeBest => 'Terbaik:';

  @override
  String get homeMyApps => 'Aplikasiku';

  @override
  String get homeManageApps => 'Kelola aplikasi';

  @override
  String get homeUnblockApps => 'Buka blokir aplikasi';

  @override
  String homeAppsLocked(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aplikasi dikunci',
    );
    return '$_temp0';
  }

  @override
  String homeAppNamesMore(String names, int count) {
    return '$names +$count';
  }

  @override
  String get homeNoLockedApps => 'Belum ada aplikasi dikunci';

  @override
  String get homeNoLockedAppsSub => 'Pilih aplikasi yang sering menarikmu';

  @override
  String get insightsAnalytics => 'Analitik';

  @override
  String get insightsScreenTime => 'Waktu Layar';

  @override
  String get insightsToday => 'Hari ini';

  @override
  String get insightsWeek => 'Minggu';

  @override
  String get insightsMonth => 'Bulan';

  @override
  String get insightsProductivity => 'Skor produktivitas';

  @override
  String insightsPts(String delta) {
    return '$delta poin';
  }

  @override
  String get insightsVsLastWeek => 'vs minggu lalu';

  @override
  String get insightsVsLastMonth => 'vs bulan lalu';

  @override
  String insightsScoreDays(int n) {
    return 'Skor $n hari';
  }

  @override
  String get insightsFocusHours => 'Jam fokus';

  @override
  String get insightsThisWeek => 'minggu ini';

  @override
  String get insightsThisMonth => 'bulan ini';

  @override
  String insightsGoalOf(String done, String goal) {
    return '$done / $goal target';
  }

  @override
  String get insightsFocusScore => 'Fokus';

  @override
  String get insightsGoals => 'Target';

  @override
  String get insightsConsistency => 'Konsistensi';

  @override
  String get insightsWeeklyFocus => 'Jam fokus mingguan';

  @override
  String insightsDailyFocus(int n) {
    return 'Fokus harian, $n hari terakhir';
  }

  @override
  String insightsBestDay(String day, String time) {
    return 'Hari terbaik: $day · $time';
  }

  @override
  String insightsAvgDay(String time) {
    return 'Rata-rata $time / hari';
  }

  @override
  String get insightsMonthlyTrends => 'Tren bulanan';

  @override
  String get insightsActual => 'Aktual';

  @override
  String get insightsGoal => 'Target';

  @override
  String insightsWk(int n) {
    return 'Mg $n';
  }

  @override
  String insightsWeekBeat(int n, String time) {
    return 'Minggu $n melampaui target $time';
  }

  @override
  String insightsWeekShort(int n, String time) {
    return 'Terbaik minggu $n, kurang $time dari target';
  }

  @override
  String get insightsGoalCompletion => 'Penyelesaian target';

  @override
  String insightsDaysOf(int done, int total) {
    return '$done/$total hari';
  }

  @override
  String get insightsNoGoals =>
      'Belum ada target. Tambahkan satu untuk melihat progres di sini.';

  @override
  String get insightsManageGoals => 'Kelola';

  @override
  String insightsGoalFocus(String hours) {
    return 'Fokus harian: $hours jam';
  }

  @override
  String get insightsGoalBlock => 'Blokir aplikasi sosial';

  @override
  String insightsGoalPomo(int n) {
    return '$n Pomodoro per hari';
  }

  @override
  String insightsGoalScreen(String time) {
    return 'Waktu layar di bawah $time';
  }

  @override
  String get insightsGoalPhoneFree => 'Waktu tanpa ponsel';

  @override
  String get insightsEmptyBadge => 'Belum ada sesi';

  @override
  String get insightsEmptyTitle => 'Wawasanmu dimulai dari satu sesi';

  @override
  String get insightsEmptyBody =>
      'Selesaikan satu sesi fokus dan skor, grafik, serta progres target akan muncul di sini.';

  @override
  String get insightsEmptyCta => 'Mulai sesi fokus';

  @override
  String get insightsDailyUsage => 'Penggunaan harian';

  @override
  String get insightsFocusTime => 'Waktu fokus';

  @override
  String get insightsVsAvg => 'vs rata-rata';

  @override
  String get insightsUsageByDay => 'Penggunaan per hari';

  @override
  String get insightsUsageByWeek => 'Penggunaan per minggu';

  @override
  String get insightsUsage => 'Pemakaian';

  @override
  String insightsTrend(int n) {
    return 'Tren $n hari';
  }

  @override
  String get insightsImproving => 'Membaik';

  @override
  String get insightsRising => 'Meningkat';

  @override
  String insightsDaysAgo(int n) {
    return '$n hari lalu';
  }

  @override
  String get insightsMostUsed => 'Aplikasi terbanyak';

  @override
  String get insightsAllApps => 'Semua aplikasi';

  @override
  String get insightsBreakdown => 'Rincian penggunaan';

  @override
  String get insightsTotal => 'total';

  @override
  String get insightsNoUsage => 'Tidak ada waktu layar di periode ini.';

  @override
  String get insightsLockApp => 'Kunci aplikasi ini';

  @override
  String insightsLocked(String app) {
    return '$app sekarang terkunci';
  }

  @override
  String get insightsCatSocial => 'Sosial';

  @override
  String get insightsCatVideo => 'Video';

  @override
  String get insightsCatGames => 'Game';

  @override
  String get insightsCatShopping => 'Belanja';

  @override
  String get insightsCatCommunity => 'Komunitas';

  @override
  String get insightsCatOther => 'Lainnya';

  @override
  String nativeBlockTitle(String app) {
    return '$app sedang dijeda';
  }

  @override
  String get nativeReasonLimit =>
      'Waktu hari ini untuk aplikasi ini sudah habis.';

  @override
  String get nativeReasonSchedule => 'Jadwal kunci sedang aktif.';

  @override
  String get nativeReasonGlobal => 'Aplikasi ini dikunci di Pausey.';

  @override
  String get nativeReasonFocus => 'Anda sedang dalam sesi fokus.';

  @override
  String get nativeClose => 'Tutup aplikasi';

  @override
  String get nativeNotifTitle => 'Pausey menjaga batas Anda';

  @override
  String get nativeNotifText => 'Batas aplikasi dan jadwal kunci aktif';

  @override
  String get profileSettings => 'Pengaturan';

  @override
  String get profileGuestName => 'Tamu';

  @override
  String get profileGuestBadge => 'Tamu · tersimpan di ponsel ini';

  @override
  String get profileEditName => 'Ubah nama';

  @override
  String get profileNameHint => 'Nama Anda';

  @override
  String get profileSave => 'Simpan';

  @override
  String profileMemberSince(String date) {
    return 'Anggota sejak $date';
  }

  @override
  String get profileProActive => 'Pro · Aktif';

  @override
  String get profileFree => 'Paket gratis';

  @override
  String get profileUpgrade => 'Tingkatkan';

  @override
  String get profileBadges => 'Lencana';

  @override
  String get profileNoBadges => 'Selesaikan sesi fokus untuk dapat lencana';

  @override
  String get profileFocusTime => 'Waktu fokus';

  @override
  String get profileGoalsDone => 'Target tercapai';

  @override
  String get profileDayStreak => 'Hari beruntun';

  @override
  String get profileAppsBlocked => 'Aplikasi diblokir';

  @override
  String get profileFocusActivity => 'Aktivitas fokus';

  @override
  String get profileLast4Weeks => '4 minggu terakhir';

  @override
  String get profileRecentActivity => 'Aktivitas terbaru';

  @override
  String get profileSessionDone => 'Sesi fokus selesai';

  @override
  String get profileSessionStopped => 'Sesi berakhir lebih awal';

  @override
  String get profileModePomodoro => 'Pomodoro';

  @override
  String get profileModeDeep => 'Kerja mendalam';

  @override
  String get profileModeCustom => 'Kustom';

  @override
  String get profileJustNow => 'Baru saja';

  @override
  String profileAgoMinutes(int n) {
    return '$n mnt lalu';
  }

  @override
  String profileAgoHours(int n) {
    return '$n jam lalu';
  }

  @override
  String get profileYesterday => 'Kemarin';

  @override
  String get profileEmptyTitle => 'Belum ada sesi fokus';

  @override
  String get profileEmptyBody =>
      'Mulai sesi pertama — aktivitas, runtunan, dan lencana akan muncul di sini.';

  @override
  String get profileStartFocus => 'Mulai fokus';

  @override
  String get profileMyGoals => 'Target saya';

  @override
  String get profileStreaks => 'Runtunan & lencana';

  @override
  String get profileSubscription => 'Langganan';

  @override
  String get profileSignOutTitle => 'Keluar?';

  @override
  String get profileSignOutBody => 'Anda bisa masuk lagi kapan saja.';

  @override
  String get profileSecNotifications => 'Notifikasi';

  @override
  String get profileSecAppearance => 'Tampilan';

  @override
  String get profileSecFocus => 'Fokus & blokir';

  @override
  String get profileSecPrivacy => 'Privasi & keamanan';

  @override
  String get profileSecAccount => 'Akun';

  @override
  String get profilePush => 'Notifikasi push';

  @override
  String get profilePushSub => 'Pengingat & peringatan';

  @override
  String get profileReminder => 'Pengingat mulai fokus';

  @override
  String profileReminderSub(String time) {
    return 'Setiap hari pukul $time';
  }

  @override
  String get profileStreakAlerts => 'Peringatan runtunan';

  @override
  String get profileStreakAlertsSub => 'Sebelum runtunan putus';

  @override
  String get profileGoalMilestones => 'Pencapaian target';

  @override
  String get profileGoalMilestonesSub => 'Saat target tercapai';

  @override
  String get profileDarkMode => 'Mode gelap';

  @override
  String get profileOn => 'Aktif';

  @override
  String get profileOff => 'Nonaktif';

  @override
  String get profileTextSize => 'Ukuran teks';

  @override
  String get profileTextSmall => 'Kecil';

  @override
  String get profileTextMedium => 'Sedang';

  @override
  String get profileTextLarge => 'Besar';

  @override
  String get profileTextHuge => 'Sangat besar';

  @override
  String get profilePomodoroLen => 'Durasi pomodoro';

  @override
  String get profileBreakLen => 'Durasi istirahat';

  @override
  String profileMinutes(int n) {
    return '$n mnt';
  }

  @override
  String get profileFaceIdUnlock => 'Face ID untuk membuka';

  @override
  String get profileFaceIdUnlockSub => 'Konfirmasi sebelum membuka aplikasi';

  @override
  String get profileBypass => 'Akses darurat';

  @override
  String profileBypassSub(int n) {
    return '$n kali per hari';
  }

  @override
  String get profileAppLock => 'Kunci Pausey dengan Face ID';

  @override
  String get profileAppLockSub => 'Minta saat membuka aplikasi';

  @override
  String get profileHideUsage => 'Sembunyikan data penggunaan';

  @override
  String get profileHideUsageSub => 'Sembunyikan angka waktu layar';

  @override
  String get profileClearData => 'Hapus data aktivitas';

  @override
  String get profileClearDataSub => 'Menghapus sesi dan riwayat target';

  @override
  String get profileClearTitle => 'Hapus data aktivitas?';

  @override
  String get profileClearBody =>
      'Semua sesi fokus dan catatan target di ponsel ini akan dihapus. Tidak bisa dibatalkan.';

  @override
  String get profileClear => 'Hapus';

  @override
  String get profileCleared => 'Data aktivitas dihapus';

  @override
  String get profileExport => 'Ekspor data saya';

  @override
  String get profileExportSub => 'Salin sebagai JSON';

  @override
  String get profileExported => 'Data Anda disalin ke papan klip';

  @override
  String get profileStreaksTitle => 'Runtunan';

  @override
  String get profileShare => 'Bagikan';

  @override
  String profileShareText(int n) {
    return 'Aku sudah fokus $n hari beruntun dengan Pausey!';
  }

  @override
  String get profileCopied => 'Disalin ke papan klip';

  @override
  String profileNextMilestone(int n) {
    return 'Lanjutkan – $n hari lagi ke pencapaian berikutnya!';
  }

  @override
  String get profileAllMilestones => 'Semua pencapaian tercapai. Legendaris!';

  @override
  String get profileStartStreak =>
      'Selesaikan satu sesi hari ini untuk memulai runtunan.';

  @override
  String get profileBest => 'Terbaik';

  @override
  String get profileThisWeek => 'Minggu ini';

  @override
  String profileDaysCompleted(int n) {
    return '$n/7 hari selesai';
  }

  @override
  String get profileCompleted => 'Selesai';

  @override
  String get profilePartial => 'Sebagian';

  @override
  String get profileMissed => 'Terlewat';

  @override
  String get profilePrevMonth => 'Bulan sebelumnya';

  @override
  String get profileNextMonth => 'Bulan berikutnya';

  @override
  String get profileMilestones => 'Pencapaian runtunan';

  @override
  String get profileAchievements => 'Pencapaian';

  @override
  String get profileAchOnFire => 'Membara';

  @override
  String get profileAchIronWill => 'Tekad baja';

  @override
  String get profileAchFocusMaster => 'Master fokus';

  @override
  String get profileAchMonk => 'Biksu digital';

  @override
  String get profileAchLegend => 'Legendaris';

  @override
  String get profileAchSpeed => 'Super cepat';

  @override
  String profileAchStreakDesc(int n) {
    return 'Runtunan $n hari';
  }

  @override
  String profileAchSessionsDesc(int n) {
    return '$n sesi selesai';
  }

  @override
  String profileAchHoursDesc(int n) {
    return 'Total fokus $n jam';
  }

  @override
  String profileAchDayDesc(int n) {
    return '$n sesi dalam sehari';
  }

  @override
  String get navHome => 'Beranda';

  @override
  String get navBlock => 'Blokir';

  @override
  String get navFocus => 'Fokus';

  @override
  String get navInsights => 'Wawasan';

  @override
  String get navProfile => 'Profil';

  @override
  String get unitH => 'j';

  @override
  String get unitM => 'm';

  @override
  String get sampleData => 'Data contoh';

  @override
  String get seeAll => 'Lihat semua';

  @override
  String days(int count) {
    return '$count hari';
  }

  @override
  String get statesTitle => 'Status';

  @override
  String get statesSubtitle => 'Layar galat, kosong & memuat';

  @override
  String get statesNoInternet => 'Tanpa internet';

  @override
  String get statesConnectionLost => 'Koneksi terputus';

  @override
  String get statesOfflineTitle => 'Anda sedang offline';

  @override
  String get statesOfflineMsg =>
      'Pausey tidak dapat menjangkau server. Periksa Wi-Fi atau data seluler lalu coba lagi – data lokal Anda aman.';

  @override
  String get statesTryAgain => 'Coba lagi';

  @override
  String get statesOpenSettings => 'Buka pengaturan';

  @override
  String get statesOfflineMode => 'Mode offline aktif';

  @override
  String get statesLimited => 'Terbatas';

  @override
  String get statesAvailable => 'Tersedia';

  @override
  String get statesUnavailable => 'Tidak tersedia';

  @override
  String get statesCapSessions => 'Lihat sesi sebelumnya';

  @override
  String get statesCapApps => 'Daftar aplikasi terkunci';

  @override
  String get statesCapTimer => 'Timer fokus lokal';

  @override
  String get statesCapSync => 'Sinkron runtutan & target';

  @override
  String get statesCapAnalytics => 'Segarkan data analitik';

  @override
  String get statesOfflineNote =>
      'Semua data fokus tersimpan lokal. Tidak ada yang hilang saat offline.';

  @override
  String get statesBackOnline => 'Kembali online – semua tersinkron';

  @override
  String get statesShowAgain => 'Tampilkan lagi';

  @override
  String get statesPermDenied => 'Izin ditolak';

  @override
  String get statesPermRequired => 'Izin diperlukan';

  @override
  String get statesPermTitle => 'Akses diblokir';

  @override
  String get statesPermMsg =>
      'Pausey memerlukan akses Waktu Layar untuk memblokir aplikasi. Tanpanya, pemblokiran tidak berfungsi.';

  @override
  String get statesGrant => 'Beri akses';

  @override
  String get statesLearnMore => 'Pelajari';

  @override
  String get statesLearnMoreMsg =>
      'Akses Waktu Layar memungkinkan Pausey menjeda aplikasi pengganggu. Data tidak keluar dari ponsel.';

  @override
  String get statesRequiredPerms => 'Izin yang diperlukan';

  @override
  String get statesPermNotif => 'Notifikasi';

  @override
  String get statesPermScreenTime => 'Akses Waktu Layar';

  @override
  String get statesPermUsage => 'Statistik penggunaan';

  @override
  String get statesPermBio => 'Face ID / biometrik';

  @override
  String get statesGranted => 'Diizinkan';

  @override
  String get statesDenied => 'Ditolak';

  @override
  String get statesPermNote =>
      'Tanpa Waktu Layar, timer fokus tetap berjalan tetapi aplikasi tidak bisa diblokir.';

  @override
  String get statesAccessGranted => 'Akses diberikan – pemblokiran siap';

  @override
  String get statesDataNA => 'Data tidak tersedia';

  @override
  String get statesSyncFailed => 'Sinkron gagal';

  @override
  String get statesLoadTitle => 'Data gagal dimuat';

  @override
  String get statesLoadMsg =>
      'Terjadi kesalahan saat mengambil analitik. Mungkin gangguan sementara – data lokal Anda aman.';

  @override
  String get statesRetrySync => 'Sinkron ulang';

  @override
  String get statesUseCached => 'Pakai cache';

  @override
  String get statesErrorDetails => 'Detail galat';

  @override
  String get statesErrorCode => 'Kode galat';

  @override
  String get statesTimestamp => 'Waktu';

  @override
  String get statesRetryCount => 'Percobaan';

  @override
  String statesAttempts(int n) {
    return '$n / 3 percobaan';
  }

  @override
  String get statesReport => 'Laporkan ke dukungan';

  @override
  String get statesReported => 'Terima kasih – laporan terkirim';

  @override
  String get statesCachedNote =>
      'Sementara itu, data dari sinkron terakhir tetap tersedia.';

  @override
  String get statesDataLoaded => 'Analitik dimuat';

  @override
  String get statesCachedShown => 'Menampilkan data cache';

  @override
  String statesWeekFocus(String time) {
    return 'Fokus minggu ini: $time';
  }

  @override
  String get statesEmpty => 'Status kosong';

  @override
  String get statesNothingYet => 'Belum ada';

  @override
  String get statesEmptyTitle => 'Belum ada sesi';

  @override
  String get statesEmptyMsg =>
      'Mulai sesi fokus pertama dan kemajuan Anda akan tampil di sini.';

  @override
  String get statesStartFocus => 'Mulai fokus';

  @override
  String get statesLoadingSection => 'Status memuat';

  @override
  String get statesDashLoading => 'Dasbor';

  @override
  String get statesAnalyticsLoading => 'Analitik';

  @override
  String get statesGoalsLoading => 'Target';

  @override
  String get statesProfileLoading => 'Profil';

  @override
  String get statesCrunching => 'Mengolah data Anda…';

  @override
  String get statesLoadingGoals => 'Memuat target…';

  @override
  String get statesLoadingProfile => 'Memuat profil…';

  @override
  String get statesReplay => 'Ulangi';
}
