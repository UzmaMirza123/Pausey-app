// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get ob1Title => '화면 중독 줄이기';

  @override
  String get ob1Body => '디지털 습관을 관리하고 방해되는 앱에 쓰는 시간을 줄이세요.';

  @override
  String get ob1StatAvg => '일일 평균 스크린 타임';

  @override
  String get ob1StatSocial => '소셜 미디어에 쓰는 시간';

  @override
  String get ob2SelectApps => '앱 선택';

  @override
  String get ob2Title => '방해되는 앱 잠그기';

  @override
  String get ob2Body => '강력한 앱 잠금 도구로 소셜 미디어, 게임 등 방해 요소를 차단하세요.';

  @override
  String get ob2Feature1 => '탭 한 번으로 모든 앱 차단';

  @override
  String get ob2Feature2 => '잠금 시간과 집중 시간 예약';

  @override
  String get ob2Feature3 => '비밀번호로 차단을 보호해 결심을 지키세요';

  @override
  String get sheetTitle => '앱 선택';

  @override
  String get sheetTotalLocked => '총 잠금';

  @override
  String get sheetAppsSelected => '개 앱 선택됨';

  @override
  String get sheetTimeSaved => '절약한 시간';

  @override
  String get sheetPerDayAvg => '하루 평균';

  @override
  String sheetHoursValue(String h) {
    return '$h시간';
  }

  @override
  String get sheetSearchHint => '앱 검색...';

  @override
  String get sheetCatAll => '전체';

  @override
  String get sheetCatSocial => '소셜';

  @override
  String get sheetCatEntertainment => '엔터테인먼트';

  @override
  String get sheetCatGames => '게임';

  @override
  String get sheetAppsHeader => '앱';

  @override
  String sheetSelectedCount(int count) {
    return '$count개 선택됨';
  }

  @override
  String get sheetNoApps => '앱을 찾을 수 없음';

  @override
  String get sheetLockSchedule => '잠금 일정';

  @override
  String get sheetAddCustomSemantic => '사용자 지정 잠금 일정 추가';

  @override
  String get sheetCustomBadge => '+ 사용자 지정';

  @override
  String get sheetSchedMorning => '아침';

  @override
  String get sheetSchedWork => '업무';

  @override
  String get sheetSchedEvening => '저녁';

  @override
  String get sheetEveryDay => '매일';

  @override
  String get sheetWeekdays => '평일';

  @override
  String get sheetWeekends => '주말';

  @override
  String get sheetUnlockMethod => '잠금 해제 방법';

  @override
  String get sheetPin => 'PIN 코드';

  @override
  String get sheetPinSub => '4자리 PIN';

  @override
  String get sheetFaceId => 'Face ID';

  @override
  String get sheetFaceIdSub => '생체 인식';

  @override
  String get sheetTouchId => 'Touch ID';

  @override
  String get sheetTouchIdSub => '지문';

  @override
  String get sheetFooter => '나중에 언제든지 변경할 수 있어요';

  @override
  String get sheetConfirmLock => '잠금 확인';

  @override
  String sheetRemove(String name) {
    return '$name 제거';
  }

  @override
  String get sheetCustomTitle => '사용자 지정 일정';

  @override
  String get sheetCustomBody => '이 시간 동안 선택한 앱이 잠겨 있어요.';

  @override
  String get sheetNameLabel => '이름';

  @override
  String get sheetNameHint => '예: 공부 시간';

  @override
  String get sheetStarts => '시작';

  @override
  String get sheetEnds => '종료';

  @override
  String get sheetSameTime => '시작과 종료 시간이 같아요';

  @override
  String sheetLockedFor(String duration) {
    return '$duration 동안 잠금';
  }

  @override
  String sheetLockedForOvernight(String duration) {
    return '$duration 동안 잠금 (밤새)';
  }

  @override
  String sheetDurH(int h) {
    return '$h시간';
  }

  @override
  String sheetDurM(int m) {
    return '$m분';
  }

  @override
  String sheetDurHM(int h, int m) {
    return '$h시간 $m분';
  }

  @override
  String get sheetLockStartsAt => '잠금 시작 시간';

  @override
  String get sheetLockEndsAt => '잠금 종료 시간';

  @override
  String get sheetRepeatOn => '반복 요일';

  @override
  String get sheetAddSchedule => '일정 추가';

  @override
  String get sheetCustomDefaultName => '사용자 지정';

  @override
  String sheetChangeTime(String label, String time) {
    return '$label $time. 시간 변경';
  }

  @override
  String get ob3Title => '매일 집중을 유지하세요';

  @override
  String get ob3Body => '뽀모도로와 딥 포커스 세션으로 생산성을 높이고 더 많은 것을 이루세요.';

  @override
  String get ob3Pomodoro => '뽀모도로';

  @override
  String ob3PomodoroSub(int min) {
    return '$min분 세션';
  }

  @override
  String get ob3DeepFocus => '딥 포커스';

  @override
  String ob3DeepFocusSub(int min) {
    return '$min분 몰입';
  }

  @override
  String get ob3StatBoost => '생산성 향상';

  @override
  String ob3StatStreakValue(int days) {
    return '$days일';
  }

  @override
  String get ob3StatStreak => '연속 기록 쌓기';

  @override
  String get ob3StatGoal => '목표 달성';

  @override
  String get ob3StartTimer => '타이머 시작';

  @override
  String get ob3PauseTimer => '타이머 일시정지';

  @override
  String get ob4Title => '진행 상황을 추적하세요';

  @override
  String get ob4Body => '아름다운 분석으로 스크린 타임, 집중 시간, 목표, 생산성을 확인하세요.';

  @override
  String get ob4Weekly => '주간';

  @override
  String get ob4WeeklySub => '리포트';

  @override
  String get ob4Goals => '목표';

  @override
  String get ob4GoalsSub => '트래커';

  @override
  String get ob4Insights => '인사이트';

  @override
  String get ob4InsightsSub => 'AI 코치';

  @override
  String get ob4Streaks => '연속 기록';

  @override
  String get ob4StreaksSub => '& 배지';

  @override
  String get ob5Title => '하루 평균 스크린 타임은 얼마인가요?';

  @override
  String get ob5Subtitle => '휴대폰 기준이에요. 대략적인 추정도 괜찮아요.';

  @override
  String get ob5More7 => '7시간 이상';

  @override
  String get ob5H5to7 => '5-7시간';

  @override
  String get ob5H4to5 => '4-5시간';

  @override
  String get ob5H3to4 => '3-4시간';

  @override
  String get ob5H1to3 => '1-3시간';

  @override
  String get ob5Under1 => '1시간 미만';

  @override
  String get ob6Title => '직업이 무엇인가요?';

  @override
  String get ob6Subtitle => '업무 스타일에 맞춰 집중 플랜을 맞춤 설정해 드려요.';

  @override
  String get ob6Software => '소프트웨어 개발';

  @override
  String get ob6Founder => 'CEO / 창업자';

  @override
  String get ob6Remote => '원격 근무자';

  @override
  String get ob6Finance => '금융 / 운영 / 컨설팅';

  @override
  String get ob6Art => '아트 / 콘텐츠';

  @override
  String get ob6Education => '교육';

  @override
  String get ob6Others => '기타';

  @override
  String get ob7Title => '하루 스크린 타임 목표 설정';

  @override
  String get ob7Subtitle => '언제든지 변경할 수 있어요. 한도에 가까워지면 알려 드릴게요.';

  @override
  String ob7Hours(String hours) {
    return '$hours시간';
  }

  @override
  String get ob7PerDay => '하루';

  @override
  String ob7HoursPerDay(String hours) {
    return '하루 $hours';
  }

  @override
  String get ob7DialLabel => '하루 스크린 타임 목표';

  @override
  String get ob7InfoNote =>
      '보통 사람은 하루 4시간 이상 휴대폰을 사용해요. 목표 설정은 시간을 되찾는 첫걸음이에요.';

  @override
  String get ob8Title => '필수 권한 허용';

  @override
  String get ob8Subtitle => '접근을 허용하고 Pausey의 모든 기능을 이용하세요.';

  @override
  String get ob8UsageTitle => '사용 기록 접근';

  @override
  String get ob8UsageSub => '앱 사용을 확인하고 집중 세션을 적용해요.';

  @override
  String get ob8NotifTitle => '알림';

  @override
  String get ob8NotifSub => '제때 받는 알림과 진행 상황 안내.';

  @override
  String get ob8TrackTitle => '앱 사용 추적';

  @override
  String get ob8TrackSub => '일간 및 주간 분석.';

  @override
  String get ob9Title => '모든 준비 완료!';

  @override
  String get ob9Subtitle => '집중 환경이 준비되었어요.';

  @override
  String get ob9Enter => 'Pausey 시작하기';

  @override
  String get ob9Replay => '온보딩 다시 보기';

  @override
  String get ob9ScreenTime => '스크린 타임';

  @override
  String get ob9AppsLocked => '잠긴 앱';

  @override
  String get ob9Permissions => '권한';

  @override
  String get ob9FocusMode => '집중 모드';

  @override
  String get ob9AllOk => '모두 정상';

  @override
  String get ob9On => '켜짐';

  @override
  String get ob9Done => '완료';

  @override
  String get ob9StreakTitle => '1일 차 연속 기록이 지금 시작돼요';

  @override
  String get ob9StreakSub => '세션을 완료해 기록을 이어가세요';

  @override
  String alSummary(int locked, int total) {
    return '지금 제한 $locked · 관리 $total';
  }

  @override
  String alSummaryOff(int total) {
    return '관리 $total · 차단 꺼짐';
  }

  @override
  String get alFromInstalled => '설치된 앱에서 선택';

  @override
  String get alFromInstalledSub => '이 휴대폰의 모든 앱';

  @override
  String get alPermTitle => '아직 차단이 작동하지 않아요';

  @override
  String get alPermMsg => '규칙은 저장됐지만 아래 두 권한을 허용해야 Pausey가 앱을 차단할 수 있어요:';

  @override
  String get alPermUsage => '사용 정보 접근';

  @override
  String get alPermUsageSub => '열린 앱과 오늘 사용 시간 확인';

  @override
  String get alPermOverlay => '다른 앱 위에 표시';

  @override
  String get alPermOverlaySub => '차단된 앱 위에 잠금 화면 표시';

  @override
  String get alAllow => '허용';

  @override
  String get alAllowed => '허용됨';

  @override
  String get alPermReturn => '허용 후 Pausey로 돌아오면 자동으로 다시 확인해요.';

  @override
  String get alAndroidOnly => '차단은 Android에서만 작동해요. 규칙은 여기서 설정할 수 있어요.';

  @override
  String get alSearchHint => '앱 검색';

  @override
  String get alFilterAll => '전체';

  @override
  String get alFilterLocked => '잠김';

  @override
  String get alFilterScheduled => '예약됨';

  @override
  String get alFilterAvailable => '사용 가능';

  @override
  String get alStateLocked => '잠김';

  @override
  String get alStateWillLock => '잠길 예정';

  @override
  String get alStateScheduled => '예약됨';

  @override
  String get alStateAvailable => '사용 가능';

  @override
  String alUsedOf(String used, String limit) {
    return '$limit 중 $used 사용';
  }

  @override
  String alUsedToday(String used) {
    return '오늘 $used';
  }

  @override
  String get alNoLimit => '일일 한도 없음';

  @override
  String alLimitNoUsage(String limit) {
    return '한도 $limit · 사용량 없음';
  }

  @override
  String get alRulesOff => '제한 꺼짐';

  @override
  String alNextLock(String time) {
    return '다음 잠금: $time';
  }

  @override
  String alUnlockedUntil(String time) {
    return '$time까지 해제됨';
  }

  @override
  String get alReasonLimit => '일일 한도 도달';

  @override
  String get alReasonSchedule => '잠금 일정 진행 중';

  @override
  String get alReasonGeneral => '공통 일정 진행 중';

  @override
  String get alReasonAllDay => '하루 종일 잠김';

  @override
  String get alReasonFocus => '집중 세션 진행 중';

  @override
  String get alNoMatches => '일치하는 앱이 없어요';

  @override
  String get alGeneral => '일반';

  @override
  String get alGeneralScheduleSub => '‘공통 일정 따르기’가 켜진 앱에 적용';

  @override
  String get alLockAllSub => '모든 앱에 제한 켜기';

  @override
  String get alSaved => '저장됨';

  @override
  String get alChangesApply => '변경 사항은 즉시 적용돼요';

  @override
  String get alDetailsTitle => '앱 제한';

  @override
  String get alBlockingOff => '이 휴대폰에서는 차단이 꺼져 있어요';

  @override
  String get alRestrictApp => '이 앱 제한';

  @override
  String get alMasterOff => '꺼짐 — Pausey가 제한하지 않아요';

  @override
  String get alMasterOnRules => '아래 한도와 일정이 적용돼요';

  @override
  String get alMasterOnAllDay => '한도·일정 없음 — 하루 종일 잠김';

  @override
  String get alMasterOnGeneral => '공통 일정 동안 잠김';

  @override
  String get alFollowGeneral => '공통 일정 따르기';

  @override
  String alFollowGeneralSub(String start, String end) {
    return '$start–$end에도 잠금';
  }

  @override
  String get alGeneralOff => '공통 일정이 꺼져 있어요';

  @override
  String get alDailyLimit => '일일 한도';

  @override
  String get alDailyLimitOffSub => '매일 정한 시간을 넘으면 잠가요';

  @override
  String get alCustom => '직접 설정';

  @override
  String get alUsedLabel => '오늘 사용';

  @override
  String get alLeftLabel => '남은 시간';

  @override
  String get alLimitReached => '오늘 한도에 도달했어요';

  @override
  String get alResets => '자정에 초기화돼요(휴대폰 시간)';

  @override
  String get alUsageUnavailable => '사용량을 알 수 없어요';

  @override
  String get alUsageNeedsAccess => '사용 정보 접근을 허용하면 오늘 시간을 셀 수 있어요.';

  @override
  String get alUsageAndroidOnly =>
      '사용 시간은 Android에서만 측정돼요. 한도는 저장되어 그곳에서 적용돼요.';

  @override
  String get alGrantUsage => '접근 허용';

  @override
  String get alCustomLimitTitle => '일일 한도 직접 설정';

  @override
  String get alHours => '시간';

  @override
  String get alMinutes => '분';

  @override
  String get alErrZeroLimit => '0보다 큰 시간을 고르세요';

  @override
  String get alSave => '저장';

  @override
  String get alScheduledLocking => '예약 잠금';

  @override
  String get alScheduledOffSub => '정해진 시간에 이 앱을 잠가요';

  @override
  String get alNoSchedules => '아직 일정이 없어요';

  @override
  String get alAddSchedule => '일정 추가';

  @override
  String get alActiveNow => '진행 중';

  @override
  String get alScheduleDefault => '잠금 시간';

  @override
  String get alEndsNextDay => '다음 날 종료';

  @override
  String get alEdit => '편집';

  @override
  String get alDelete => '삭제';

  @override
  String get alDeleteScheduleQ => '이 일정을 삭제할까요?';

  @override
  String alDeleteScheduleMsg(String title) {
    return '‘$title’ 일정으로 더 이상 잠기지 않아요.';
  }

  @override
  String get alNewSchedule => '새 일정';

  @override
  String get alEditSchedule => '일정 편집';

  @override
  String get alTitleOptional => '제목(선택)';

  @override
  String get alPresetStudy => '공부';

  @override
  String get alPresetEvening => '저녁';

  @override
  String get alPresetSleep => '수면';

  @override
  String get alRepeatOn => '반복 요일';

  @override
  String get alErrSameTime => '시작과 종료가 같을 수 없어요';

  @override
  String get alErrNoDays => '하루 이상 선택하세요';

  @override
  String alTempUnlock(int minutes) {
    return '$minutes분 해제';
  }

  @override
  String alTempUnlockSub(int n) {
    return '긴급 해제 1회 사용 · 오늘 $n회 남음';
  }

  @override
  String get alTempUnlockFocus => '집중 세션 중에는 해제할 수 없어요';

  @override
  String get alTempUnlockNotLocked => '앱이 잠겨 있을 때만 필요해요';

  @override
  String alTempUnlockQ(String app, int minutes) {
    return '$app을(를) $minutes분 동안 해제할까요?';
  }

  @override
  String get alUnlock => '해제';

  @override
  String get alEndEarly => '일찍 끝내기';

  @override
  String get alResetRules => '제한 초기화';

  @override
  String get alResetRulesSub => '한도와 일정을 삭제해요';

  @override
  String alResetQ(String app) {
    return '$app의 제한을 초기화할까요?';
  }

  @override
  String get alResetMsg => '일일 한도와 모든 일정이 삭제돼요. 앱은 목록에 남아요.';

  @override
  String get alReset => '초기화';

  @override
  String get alResetDone => '제한을 초기화했어요';

  @override
  String get alRemoveApp => '앱 제거';

  @override
  String get alRemoveAppSub => '이 앱 관리 중지';

  @override
  String alRemoveQ(String app) {
    return '$app을(를) 제거할까요?';
  }

  @override
  String get alRemoveMsg => 'Pausey가 제한을 멈추고 한도와 일정도 지워요.';

  @override
  String get alRemove => '제거';

  @override
  String get alNoPackage =>
      '앱별 한도와 일정은 설치된 특정 앱에만 적용돼요. Android에서 ‘설치된 앱에서 선택’으로 추가하세요.';

  @override
  String get alNotFound => '더 이상 관리하지 않는 앱이에요';

  @override
  String get alPickerTitle => '설치된 앱';

  @override
  String get alPickerAdded => '이미 추가됨';

  @override
  String alPickerAdd(int n) {
    return '앱 추가 ($n)';
  }

  @override
  String get alPickerEmpty => '앱을 찾을 수 없어요';

  @override
  String get blockTitle => '앱 잠금';

  @override
  String get blockAddApp => '앱 추가';

  @override
  String get blockFaceIdTitle => 'Face ID 보호';

  @override
  String get blockFaceIdSub => '앱 잠금 해제 시 Face ID 필요';

  @override
  String get blockFaceIdUnavailable => '이 기기에서는 생체 인식을 사용할 수 없습니다';

  @override
  String get blockFaceIdReason => '보호를 켜려면 본인 확인하세요';

  @override
  String get blockFaceIdFailed => '확인 실패 — 보호가 꺼져 있습니다';

  @override
  String get blockScheduleTitle => '예약 잠금';

  @override
  String get blockStart => '시작';

  @override
  String get blockEnd => '종료';

  @override
  String get blockNeedOneDay => '최소 하루는 선택하세요';

  @override
  String get blockManagedApps => '관리 중인 앱';

  @override
  String get blockLockAll => '모두 잠금';

  @override
  String get blockAllLocked => '모든 앱이 잠겼습니다';

  @override
  String blockRemoved(String app) {
    return '$app 제거됨';
  }

  @override
  String get blockAppsUpdated => '앱이 업데이트되었습니다';

  @override
  String get blockCatSocial => '소셜';

  @override
  String get blockCatVideo => '동영상';

  @override
  String get blockCatGames => '게임';

  @override
  String get blockCatShopping => '쇼핑';

  @override
  String get blockCatCommunity => '커뮤니티';

  @override
  String get blockCatOther => '기타';

  @override
  String get blockEmptyBadge => '차단 없음';

  @override
  String get blockEmptyTitle => '아직 앱이 없습니다';

  @override
  String get blockEmptyMsg => '방해되는 앱을 추가하면 Pausey가 잠가 드려요.';

  @override
  String get blockEmergencyTitle => '긴급 해제';

  @override
  String blockEmergencySub(int n) {
    return '모든 앱 일시 해제 · 오늘 $n회 남음';
  }

  @override
  String get blockEmergencyOff => '설정에서 꺼짐';

  @override
  String get blockEmergencyUse => '사용';

  @override
  String get blockEmergencyConfirmTitle => '긴급 해제를 사용할까요?';

  @override
  String blockEmergencyConfirmMsg(int n) {
    return '오늘 남은 $n회 중 1회를 사용합니다. 꼭 필요할 때만 쓰세요.';
  }

  @override
  String get blockEmergencyUsed => '긴급 해제됨 — 지금 앱이 열려 있습니다';

  @override
  String get blockEmergencyNone => '오늘 남은 횟수가 없습니다';

  @override
  String get appName => 'Pausey';

  @override
  String get tagline => '나의 시간을 되찾으세요';

  @override
  String get versionLabel => '버전 2.0 · App Store 에디션';

  @override
  String get skip => '건너뛰기';

  @override
  String get continueLabel => '계속';

  @override
  String get back => '뒤로';

  @override
  String get freeToStart => '무료로 시작 · 신용카드 불필요';

  @override
  String get dataStaysOnDevice => '데이터는 기기 밖으로 나가지 않습니다.';

  @override
  String get switchToLight => '라이트 모드로 전환';

  @override
  String get switchToDark => '다크 모드로 전환';

  @override
  String get language => '언어';

  @override
  String get phoneLanguage => '휴대폰 언어';

  @override
  String get authTitle => '스크롤을 멈추고\n하루의 주인이 되세요.';

  @override
  String get authSubtitle => '계정을 만들어 목표와 연속 기록을 동기화하거나 게스트로 Pausey를 체험해 보세요.';

  @override
  String get continueWithApple => 'Apple로 계속';

  @override
  String get continueWithGoogle => 'Google로 계속';

  @override
  String get signUpWithEmail => '이메일로 가입';

  @override
  String get continueAsGuest => '게스트로 계속';

  @override
  String get guestNote => '게스트 데이터는 이 휴대폰에만 저장됩니다.';

  @override
  String get or => '또는';

  @override
  String get haveAccount => '이미 계정이 있나요?';

  @override
  String get noAccount => 'Pausey가 처음이신가요?';

  @override
  String get logIn => '로그인';

  @override
  String get signUp => '가입하기';

  @override
  String get createAccount => '계정 만들기';

  @override
  String get signUpTitle => '계정을 만드세요';

  @override
  String get signUpSubtitle => '더 차분한 화면 습관을 시작하세요.';

  @override
  String get logInTitle => '다시 오신 것을 환영합니다';

  @override
  String get logInSubtitle => '로그인하고 연속 기록을 이어가세요.';

  @override
  String get fullName => '이름';

  @override
  String get email => '이메일';

  @override
  String get password => '비밀번호';

  @override
  String get confirmPassword => '비밀번호 확인';

  @override
  String get showPassword => '비밀번호 표시';

  @override
  String get hidePassword => '비밀번호 숨기기';

  @override
  String get forgotPassword => '비밀번호를 잊으셨나요?';

  @override
  String get resetTitle => '비밀번호 재설정';

  @override
  String get resetSubtitle => '이메일을 입력하면 재설정 링크를 보내드립니다.';

  @override
  String get sendLink => '링크 보내기';

  @override
  String get resetSent => '받은편지함에서 재설정 링크를 확인하세요.';

  @override
  String get agreeTerms => '이용약관 및 개인정보 처리방침에 동의합니다';

  @override
  String get passwordStrength => '비밀번호 강도';

  @override
  String get strengthWeak => '약함';

  @override
  String get strengthOk => '보통';

  @override
  String get strengthStrong => '강함';

  @override
  String get errNameRequired => '이름을 입력하세요';

  @override
  String get errEmailInvalid => '올바른 이메일을 입력하세요';

  @override
  String get errPasswordShort => '8자 이상 입력하세요';

  @override
  String get errPasswordMismatch => '비밀번호가 일치하지 않습니다';

  @override
  String get errTerms => '계속하려면 약관에 동의하세요';

  @override
  String get authErr_not_configured => '로그인이 아직 설정되지 않았습니다. 게스트로 계속할 수 있어요.';

  @override
  String get authErr_cancelled => '로그인이 취소되었습니다.';

  @override
  String get authErr_invalid_email => '이메일이 올바르지 않은 것 같아요.';

  @override
  String get authErr_wrong_password => '이메일 또는 비밀번호가 올바르지 않습니다.';

  @override
  String get authErr_user_not_found => '이 이메일로 된 계정이 없습니다. 가입하시겠어요?';

  @override
  String get authErr_email_in_use => '이 이메일로 된 계정이 이미 있습니다. 로그인하세요.';

  @override
  String get authErr_weak_password => '더 강한 비밀번호를 선택하세요.';

  @override
  String get authErr_network => '인터넷에 연결되어 있지 않습니다. 다시 시도하세요.';

  @override
  String get authErr_too_many => '시도 횟수가 너무 많습니다. 1분 후 다시 시도하세요.';

  @override
  String get authErr_unknown => '문제가 발생했습니다. 다시 시도하세요.';

  @override
  String homeHello(String name) {
    return '안녕하세요, $name님';
  }

  @override
  String get homeHelloGuest => '안녕하세요';

  @override
  String get homeGuestBadge => '게스트 모드 · 이 휴대폰에 저장됨';

  @override
  String get homeSubtitle => '플랜이 준비되었습니다. 선택한 내용은 다음과 같아요.';

  @override
  String get homeDailyGoal => '일일 목표';

  @override
  String get homeLockedApps => '잠긴 앱';

  @override
  String get homeScreenTime => '현재 스크린 타임';

  @override
  String get homeNotSet => '설정 안 됨';

  @override
  String get homeCreateAccount => '백업하려면 계정을 만드세요';

  @override
  String get signOut => '로그아웃';

  @override
  String get signOutGuestWarn => '로그아웃하면 이 휴대폰의 게스트 데이터가 삭제됩니다.';

  @override
  String get cancel => '취소';

  @override
  String get ob6OtherHint => '직업을 입력하세요';

  @override
  String get timeSecondLabel => '초';

  @override
  String get focusModePomodoro => '뽀모도로';

  @override
  String get focusModeDeep => '딥 포커스';

  @override
  String get focusModeCustom => '사용자 지정';

  @override
  String get focusRemaining => '남은 시간';

  @override
  String get focusBreakLabel => '휴식';

  @override
  String get focusReadyLabel => '준비';

  @override
  String get focusInSession => '세션 중';

  @override
  String get focusPausedState => '일시정지';

  @override
  String get focusOnBreak => '휴식 중';

  @override
  String get focusIdleState => '재생을 눌러 시작';

  @override
  String get focusSessionsDone => '완료 세션';

  @override
  String get focusProgress => '진행률';

  @override
  String get focusBreakAfter => '이후 휴식';

  @override
  String get focusFocusedToday => '오늘 집중';

  @override
  String focusAppsBlocked(int count) {
    return '앱 $count개 차단됨';
  }

  @override
  String get focusAppsBlockedSub => '이 세션 동안 방해 요소가 잠깁니다.';

  @override
  String get focusNoApps => '차단된 앱 없음';

  @override
  String get focusNoAppsSub => '집중할 때 잠글 앱을 고르세요.';

  @override
  String get focusEdit => '편집';

  @override
  String get focusAdd => '추가';

  @override
  String get focusAmbient => '배경음';

  @override
  String get focusSoundOff => '끔';

  @override
  String get focusSoundRain => '빗소리';

  @override
  String get focusSoundForest => '숲';

  @override
  String get focusSoundWaves => '파도';

  @override
  String get focusSoundWhite => '백색소음';

  @override
  String get focusVolume => '볼륨';

  @override
  String get focusStart => '시작';

  @override
  String get focusPause => '일시정지';

  @override
  String get focusResume => '계속';

  @override
  String get focusStop => '중지';

  @override
  String get focusRestart => '다시 시작';

  @override
  String get focusSkipBreak => '휴식 건너뛰기';

  @override
  String get focusDurations => '세션 길이';

  @override
  String focusMinutesN(int n) {
    return '$n분';
  }

  @override
  String get focusBreakLength => '휴식';

  @override
  String get focusCustomTitle => '사용자 지정 시간';

  @override
  String get focusSet => '설정';

  @override
  String get focusStopTitle => '세션을 일찍 끝낼까요?';

  @override
  String get focusStopBody => '지금까지 집중한 시간은 저장돼요.';

  @override
  String get focusEndSession => '끝내기';

  @override
  String get focusKeepGoing => '계속하기';

  @override
  String get focusTooShort => '1분 미만이라 저장되지 않았어요.';

  @override
  String get focusBreakOver => '휴식 끝! 다음 세션 준비됐나요?';

  @override
  String get focusBusy => '모드를 바꾸려면 세션을 끝내세요.';

  @override
  String get focusFirstHint => '첫 세션은 여기서 시작돼요. 재생을 누르세요.';

  @override
  String get focusCompleteA => '세션';

  @override
  String get focusCompleteB => '완료!';

  @override
  String get focusEndedTitle => '세션 종료';

  @override
  String focusCompleteMsg(String mode) {
    return '훌륭해요! 방해 없이 $mode 세션을 끝냈어요.';
  }

  @override
  String get focusEndedMsg => '1분 1분이 소중해요. 다음엔 끝까지 해봐요.';

  @override
  String get focusDurationLabel => '집중 시간';

  @override
  String get focusMinUnit => '분';

  @override
  String get focusDayStreak => '연속 일수';

  @override
  String get focusAppsLabel => '차단된 앱';

  @override
  String get focusTodayGoal => '오늘의 목표';

  @override
  String focusPctCompleted(int pct) {
    return '$pct% 달성';
  }

  @override
  String focusPlusPct(int pct) {
    return '이번 세션 +$pct%';
  }

  @override
  String get focusMomentum => '기세를 이어가요!';

  @override
  String get focusQuote1 => '강도보다 꾸준함. 모든 세션이 실력이 돼요.';

  @override
  String get focusQuote2 => '작은 집중이 모여 큰 결과가 돼요.';

  @override
  String get focusQuote3 => '스크롤 대신 성장을 택했어요. 한 번 더!';

  @override
  String get focusStartNext => '다음 세션 시작';

  @override
  String get focusBackHome => '대시보드로 돌아가기';

  @override
  String get goalsTitle => '나의 목표';

  @override
  String goalsSubtitle(int active, int done) {
    return '진행 중 $active · 완료 $done';
  }

  @override
  String get goalsAdd => '목표 추가';

  @override
  String get goalsCompleted => '완료';

  @override
  String get goalsActive => '진행 중';

  @override
  String get goalsStreak => '연속';

  @override
  String get goalsOverall => '전체 달성률';

  @override
  String goalsWeeklyHit(int hit, int total) {
    return '주간 목표 $total개 중 $hit개 달성';
  }

  @override
  String goalsVsLastWeek(String delta) {
    return '지난주 대비 $delta';
  }

  @override
  String get goalsFilterAll => '전체';

  @override
  String get goalsDone => '완료';

  @override
  String get goalsCatFocus => '집중';

  @override
  String get goalsCatDiscipline => '절제';

  @override
  String get goalsCatWellness => '웰니스';

  @override
  String goalsTitleFocusHours(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '매일 집중: $n시간',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleFocusDur(String duration) {
    return '매일 집중: $duration';
  }

  @override
  String get goalsTitleBlock => 'SNS 앱 차단';

  @override
  String goalsTitleSessions(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '하루 $n뽀모도로',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleScreen(String duration) {
    return '화면 시간 $duration 미만';
  }

  @override
  String get goalsTitlePhoneFree => '폰 없는 시간';

  @override
  String goalsDescFocus(String duration) {
    return '매일 $duration 깊이 집중하기';
  }

  @override
  String goalsDescBlock(int n) {
    return '잠근 앱을 주 $n일 잠금 유지';
  }

  @override
  String goalsDescSessions(int n) {
    return '매일 최소 $n회 집중 세션 완료';
  }

  @override
  String goalsDescScreen(String duration) {
    return '하루 휴대폰 사용 $duration 미만 유지';
  }

  @override
  String goalsDescPhoneFree(int n) {
    return '주 $n일 폰 없이 지내고 체크하기';
  }

  @override
  String goalsProgressDays(int done, int total) {
    return '$done / $total일';
  }

  @override
  String goalsProgressSessions(int done, int total) {
    return '$done / $total 세션';
  }

  @override
  String goalsStreakShort(int n) {
    return '$n일';
  }

  @override
  String goalsStreakN(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n일 연속',
    );
    return '$_temp0';
  }

  @override
  String get goalsCheckIn => '오늘 완료 표시';

  @override
  String get goalsCheckedIn => '오늘 완료';

  @override
  String get goalsCheckedSnack => '좋아요! 오늘을 완료로 표시했어요.';

  @override
  String get goalsUncheckedSnack => '오늘 완료 표시를 취소했어요.';

  @override
  String get goalsCreateNew => '새 목표 만들기';

  @override
  String get goalsEmptyBadge => '시작하기';

  @override
  String get goalsEmptyTitle => '아직 목표가 없어요';

  @override
  String get goalsEmptyMsg => '작은 일일 목표를 정하면 Pausey가 기록해 드려요.';

  @override
  String get goalsFilterEmpty => '이 필터에 맞는 목표가 없어요.';

  @override
  String get goalsNewGoal => '새 목표';

  @override
  String get goalsEditGoal => '목표 편집';

  @override
  String get goalsType => '목표 유형';

  @override
  String get goalsTypeFocus => '집중 시간';

  @override
  String get goalsTypeSessions => '집중 세션';

  @override
  String get goalsTypeBlock => '앱 차단';

  @override
  String get goalsTypePhoneFree => '폰 없는 날';

  @override
  String get goalsTypeScreen => '화면 시간 제한';

  @override
  String get goalsCategory => '카테고리';

  @override
  String get goalsTarget => '목표치';

  @override
  String get goalsPerDay => '하루';

  @override
  String get goalsPerWeek => '주당 일수';

  @override
  String get goalsMaxPerDay => '하루 최대';

  @override
  String get goalsTitleOptional => '제목 (선택)';

  @override
  String get goalsSave => '목표 저장';

  @override
  String get goalsCreate => '목표 만들기';

  @override
  String get goalsSavedSnack => '목표를 저장했어요';

  @override
  String get goalsCreatedSnack => '목표를 만들었어요';

  @override
  String get goalsEdit => '편집';

  @override
  String get goalsDelete => '목표 삭제';

  @override
  String get goalsDeleteQ => '이 목표를 삭제할까요?';

  @override
  String get goalsDeleteMsg => '기록도 삭제되며 되돌릴 수 없어요.';

  @override
  String get goalsDeletedSnack => '목표를 삭제했어요';

  @override
  String get goalsComplete => '달성';

  @override
  String get goalsDaysActive => '활동일';

  @override
  String get goalsTotalTime => '총 시간';

  @override
  String get goalsSessionsLabel => '세션';

  @override
  String get goals7Day => '7일 달성률';

  @override
  String get goals7DaysAgo => '7일 전';

  @override
  String get goalsToday => '오늘';

  @override
  String goalsTodayDate(String date) {
    return '오늘, $date';
  }

  @override
  String goalsYesterdayDate(String date) {
    return '어제, $date';
  }

  @override
  String get goalsMilestones => '마일스톤';

  @override
  String get goalsMsFirst => '첫날 달성';

  @override
  String get goalsMs3 => '3일 연속 달성';

  @override
  String get goalsMsHalf => '주간 목표 50%';

  @override
  String get goalsMs5 => '5일 연속';

  @override
  String get goalsMsWeek => '일주일 완주';

  @override
  String get goalsMsLocked => '아직';

  @override
  String get goalsHistory => '활동 기록';

  @override
  String get goalsShowLess => '접기';

  @override
  String get goalsStartSession => '집중 세션 시작';

  @override
  String get goalsManageApps => '차단 앱 관리';

  @override
  String get goalsBlockHint => '잠금 일정이 켜져 있으면 자동으로 집계돼요.';

  @override
  String goalsScreenToday(String used) {
    return '오늘 화면 시간: $used';
  }

  @override
  String get goalsNotFound => '이 목표는 더 이상 없어요.';

  @override
  String get goalsMore => '더보기';

  @override
  String goalsFreeLimit(int n) {
    return '무료 플랜: 목표 $n개까지';
  }

  @override
  String get homeGoodMorning => '좋은 아침이에요';

  @override
  String get homeGoodAfternoon => '좋은 오후예요';

  @override
  String get homeGoodEvening => '좋은 저녁이에요';

  @override
  String get homeFriend => '친구';

  @override
  String get homeTodayFocus => '오늘의 집중';

  @override
  String homeVsYesterday(String pct) {
    return '어제 대비 $pct%';
  }

  @override
  String get homeStartToday => '아직 오늘 집중 없음';

  @override
  String get homeDayStreak => '연속 일수';

  @override
  String get homeTodayGoal => '오늘의 목표';

  @override
  String homePctCompleted(int pct) {
    return '$pct% 완료';
  }

  @override
  String get homeOnTrack => '순조로워요!';

  @override
  String get homeKeepGoing => '계속하세요';

  @override
  String get homeGoalMet => '목표 달성!';

  @override
  String get homeScreenTimeTitle => '스크린 타임';

  @override
  String get homeToday => '오늘';

  @override
  String homeVsAvg(String pct) {
    return '평균 대비 $pct%';
  }

  @override
  String get homeQuickStart => '집중 세션 빠른 시작';

  @override
  String get homeManage => '관리';

  @override
  String get homeNoApps => '가장 방해되는 앱을 골라 여기서 잠그세요.';

  @override
  String get homeAddApps => '앱 추가';

  @override
  String homeAppLocked(String app) {
    return '$app 잠김';
  }

  @override
  String homeAppUnlocked(String app) {
    return '$app 잠금 해제';
  }

  @override
  String homeLockApp(String app) {
    return '$app 잠금/해제';
  }

  @override
  String get homeUpgradeTitle => '프리미엄으로 업그레이드';

  @override
  String get homeUpgradeBody => '무제한 차단, 목표, 심층 분석.';

  @override
  String get homeTryFree => '무료 체험';

  @override
  String get homePro => 'PRO';

  @override
  String get homeProActive => 'Pausey Pro 사용 중';

  @override
  String get homeProActiveBody => '모든 기능이 열렸어요. 감사합니다!';

  @override
  String get homeNotifications => '알림';

  @override
  String get homeNoNotifications => '새 알림이 없어요.';

  @override
  String get homePushLabel => '푸시 알림';

  @override
  String get homeFocusReminder => '매일 집중 알림';

  @override
  String get homeStreakAlerts => '연속 기록 알림';

  @override
  String get homePwTitle => 'Pausey Pro 잠금 해제';

  @override
  String get homePwSubtitle => '집중력을 되찾고 휴대폰 중독을 이겨내세요.';

  @override
  String get homePwMonthly => '월간';

  @override
  String get homePwBilledMonthly => '매월 결제';

  @override
  String get homePwYearly => '연간';

  @override
  String get homePwPopular => '인기';

  @override
  String homePwSave(int pct) {
    return '$pct% 할인';
  }

  @override
  String homePwBilledYearly(String price) {
    return '연 $price 결제';
  }

  @override
  String get homePwLifetime => '평생';

  @override
  String get homePwBestValue => '최고 가치';

  @override
  String get homePwPayOnce => '한 번 결제로 평생';

  @override
  String get homePwPerMonth => '/ 월';

  @override
  String get homePwOnce => '1회';

  @override
  String get homePwStartTrial => '7일 무료 체험 시작';

  @override
  String get homePwBuyLifetime => '평생 이용권 구매';

  @override
  String get homePwNoCharge => '오늘 결제 없음 · 언제든 해지';

  @override
  String get homePwOneTime => '1회 결제 · 구독 없음';

  @override
  String get homePwFree => '무료';

  @override
  String get homePwProCol => 'Pro';

  @override
  String get homePwFeatBlocking => '무제한 앱 차단';

  @override
  String get homePwFeatSessions => '모든 집중 모드';

  @override
  String get homePwFeatGoals => '무제한 목표';

  @override
  String get homePwFeatAnalytics => '고급 분석';

  @override
  String get homePwFeatStreak => '연속 기록 보호';

  @override
  String get homePwFeatSchedule => '집중 예약';

  @override
  String get homePwFeatFaceId => 'Face ID 앱 잠금';

  @override
  String get homePwFeatNotif => '스마트 알림';

  @override
  String homePwMax(int n) {
    return '최대 $n';
  }

  @override
  String get homePwSecure => '안전한 결제';

  @override
  String get homePwCancelAnytime => '언제든 해지';

  @override
  String get homePwPrivacyFirst => '개인정보 우선';

  @override
  String get homePwRestore => '구매 복원';

  @override
  String get homePwTerms => '서비스 약관';

  @override
  String get homePwPrivacyPolicy => '개인정보처리방침';

  @override
  String get homePwWelcome => 'Pausey Pro에 오신 걸 환영해요!';

  @override
  String get homePwNothingToRestore => '이전 구매 내역이 없어요.';

  @override
  String get homePwRestored => 'Pro 이용 중이에요.';

  @override
  String get homePwLinkSoon => '이 페이지는 곧 웹사이트에서 열려요.';

  @override
  String get homePwYouArePro => 'Pro 회원이에요. 즐기세요!';

  @override
  String get homePwClose => '닫기';

  @override
  String get homeAvgLegend => '7일 평균';

  @override
  String homeGoalOf(String done, String goal) {
    return '$goal 중 $done';
  }

  @override
  String get homeBest => '최고:';

  @override
  String get insightsAnalytics => '분석';

  @override
  String get insightsScreenTime => '스크린 타임';

  @override
  String get insightsToday => '오늘';

  @override
  String get insightsWeek => '주';

  @override
  String get insightsMonth => '월';

  @override
  String get insightsProductivity => '생산성 점수';

  @override
  String insightsPts(String delta) {
    return '$delta점';
  }

  @override
  String get insightsVsLastWeek => '지난주 대비';

  @override
  String get insightsVsLastMonth => '지난달 대비';

  @override
  String insightsScoreDays(int n) {
    return '$n일 점수';
  }

  @override
  String get insightsFocusHours => '집중 시간';

  @override
  String get insightsThisWeek => '이번 주';

  @override
  String get insightsThisMonth => '이번 달';

  @override
  String insightsGoalOf(String done, String goal) {
    return '$done / 목표 $goal';
  }

  @override
  String get insightsFocusScore => '집중';

  @override
  String get insightsGoals => '목표';

  @override
  String get insightsConsistency => '꾸준함';

  @override
  String get insightsWeeklyFocus => '주간 집중 시간';

  @override
  String insightsDailyFocus(int n) {
    return '최근 $n일 집중';
  }

  @override
  String insightsBestDay(String day, String time) {
    return '최고의 날: $day · $time';
  }

  @override
  String insightsAvgDay(String time) {
    return '평균 $time / 일';
  }

  @override
  String get insightsMonthlyTrends => '월간 추세';

  @override
  String get insightsActual => '실제';

  @override
  String get insightsGoal => '목표';

  @override
  String insightsWk(int n) {
    return '$n주';
  }

  @override
  String insightsWeekBeat(int n, String time) {
    return '$n주차가 목표를 $time 초과했어요';
  }

  @override
  String insightsWeekShort(int n, String time) {
    return '최고는 $n주차, 목표까지 $time 부족';
  }

  @override
  String get insightsGoalCompletion => '목표 달성';

  @override
  String insightsDaysOf(int done, int total) {
    return '$done/$total일';
  }

  @override
  String get insightsNoGoals => '아직 목표가 없어요. 추가하면 진행 상황이 여기 표시돼요.';

  @override
  String get insightsManageGoals => '관리';

  @override
  String insightsGoalFocus(String hours) {
    return '매일 집중: $hours시간';
  }

  @override
  String get insightsGoalBlock => '소셜 앱 차단';

  @override
  String insightsGoalPomo(int n) {
    return '하루 $n 뽀모도로';
  }

  @override
  String insightsGoalScreen(String time) {
    return '스크린 타임 $time 미만';
  }

  @override
  String get insightsGoalPhoneFree => '폰 없는 시간';

  @override
  String get insightsEmptyBadge => '세션 없음';

  @override
  String get insightsEmptyTitle => '첫 세션부터 인사이트가 시작돼요';

  @override
  String get insightsEmptyBody => '집중 세션을 하나 마치면 점수, 차트, 목표 진행이 여기에 표시돼요.';

  @override
  String get insightsEmptyCta => '집중 시작하기';

  @override
  String get insightsDailyUsage => '일일 사용';

  @override
  String get insightsFocusTime => '집중 시간';

  @override
  String get insightsVsAvg => '평균 대비';

  @override
  String get insightsUsageByDay => '일별 사용';

  @override
  String get insightsUsageByWeek => '주별 사용';

  @override
  String get insightsUsage => '사용';

  @override
  String insightsTrend(int n) {
    return '$n일 추세';
  }

  @override
  String get insightsImproving => '개선 중';

  @override
  String get insightsRising => '증가 중';

  @override
  String insightsDaysAgo(int n) {
    return '$n일 전';
  }

  @override
  String get insightsMostUsed => '가장 많이 쓴 앱';

  @override
  String get insightsAllApps => '모든 앱';

  @override
  String get insightsBreakdown => '사용 분류';

  @override
  String get insightsTotal => '합계';

  @override
  String get insightsNoUsage => '이 기간에는 기록이 없어요.';

  @override
  String get insightsLockApp => '이 앱 잠그기';

  @override
  String insightsLocked(String app) {
    return '$app이(가) 잠겼어요';
  }

  @override
  String get insightsCatSocial => '소셜';

  @override
  String get insightsCatVideo => '동영상';

  @override
  String get insightsCatGames => '게임';

  @override
  String get insightsCatShopping => '쇼핑';

  @override
  String get insightsCatCommunity => '커뮤니티';

  @override
  String get insightsCatOther => '기타';

  @override
  String nativeBlockTitle(String app) {
    return '$app 일시 중지됨';
  }

  @override
  String get nativeReasonLimit => '오늘 이 앱의 사용 시간을 모두 썼어요.';

  @override
  String get nativeReasonSchedule => '지금 잠금 일정이 진행 중이에요.';

  @override
  String get nativeReasonGlobal => '이 앱은 Pausey에서 잠겨 있어요.';

  @override
  String get nativeReasonFocus => '집중 세션 중이에요.';

  @override
  String get nativeClose => '앱 닫기';

  @override
  String get nativeNotifTitle => 'Pausey가 제한을 지키고 있어요';

  @override
  String get nativeNotifText => '앱 제한과 잠금 일정이 켜져 있어요';

  @override
  String get profileSettings => '설정';

  @override
  String get profileGuestName => '게스트';

  @override
  String get profileGuestBadge => '게스트 · 이 휴대폰에 저장됨';

  @override
  String get profileEditName => '이름 편집';

  @override
  String get profileNameHint => '이름';

  @override
  String get profileSave => '저장';

  @override
  String profileMemberSince(String date) {
    return '$date부터 회원';
  }

  @override
  String get profileProActive => 'Pro · 활성';

  @override
  String get profileFree => '무료 플랜';

  @override
  String get profileUpgrade => '업그레이드';

  @override
  String get profileBadges => '배지';

  @override
  String get profileNoBadges => '집중 세션을 완료하고 배지를 받으세요';

  @override
  String get profileFocusTime => '집중 시간';

  @override
  String get profileGoalsDone => '달성한 목표';

  @override
  String get profileDayStreak => '연속 일수';

  @override
  String get profileAppsBlocked => '차단된 앱';

  @override
  String get profileFocusActivity => '집중 활동';

  @override
  String get profileLast4Weeks => '최근 4주';

  @override
  String get profileRecentActivity => '최근 활동';

  @override
  String get profileSessionDone => '집중 세션 완료';

  @override
  String get profileSessionStopped => '세션 조기 종료';

  @override
  String get profileModePomodoro => '뽀모도로';

  @override
  String get profileModeDeep => '딥 워크';

  @override
  String get profileModeCustom => '사용자 지정';

  @override
  String get profileJustNow => '방금';

  @override
  String profileAgoMinutes(int n) {
    return '$n분 전';
  }

  @override
  String profileAgoHours(int n) {
    return '$n시간 전';
  }

  @override
  String get profileYesterday => '어제';

  @override
  String get profileEmptyTitle => '아직 집중 세션이 없어요';

  @override
  String get profileEmptyBody => '첫 세션을 시작하면 활동, 연속 기록, 배지가 여기에 표시돼요.';

  @override
  String get profileStartFocus => '집중 시작';

  @override
  String get profileMyGoals => '내 목표';

  @override
  String get profileStreaks => '연속 기록 및 배지';

  @override
  String get profileSubscription => '구독';

  @override
  String get profileSignOutTitle => '로그아웃할까요?';

  @override
  String get profileSignOutBody => '언제든 다시 로그인할 수 있어요.';

  @override
  String get profileSecNotifications => '알림';

  @override
  String get profileSecAppearance => '화면';

  @override
  String get profileSecFocus => '집중 및 차단';

  @override
  String get profileSecPrivacy => '개인정보 및 보안';

  @override
  String get profileSecAccount => '계정';

  @override
  String get profilePush => '푸시 알림';

  @override
  String get profilePushSub => '집중 알림 및 경고';

  @override
  String get profileReminder => '집중 시작 알림';

  @override
  String profileReminderSub(String time) {
    return '매일 $time';
  }

  @override
  String get profileStreakAlerts => '연속 기록 알림';

  @override
  String get profileStreakAlertsSub => '기록이 끊기기 전에';

  @override
  String get profileGoalMilestones => '목표 달성 알림';

  @override
  String get profileGoalMilestonesSub => '목표를 달성하면';

  @override
  String get profileDarkMode => '다크 모드';

  @override
  String get profileOn => '켜짐';

  @override
  String get profileOff => '꺼짐';

  @override
  String get profileTextSize => '글자 크기';

  @override
  String get profileTextSmall => '작게';

  @override
  String get profileTextMedium => '보통';

  @override
  String get profileTextLarge => '크게';

  @override
  String get profileTextHuge => '아주 크게';

  @override
  String get profilePomodoroLen => '뽀모도로 길이';

  @override
  String get profileBreakLen => '휴식 길이';

  @override
  String profileMinutes(int n) {
    return '$n분';
  }

  @override
  String get profileFaceIdUnlock => '잠금 해제 시 Face ID';

  @override
  String get profileFaceIdUnlockSub => '앱 잠금 해제 전 확인';

  @override
  String get profileBypass => '긴급 해제';

  @override
  String profileBypassSub(int n) {
    return '하루 $n회';
  }

  @override
  String get profileAppLock => 'Face ID로 Pausey 잠금';

  @override
  String get profileAppLockSub => '앱을 열 때 확인';

  @override
  String get profileHideUsage => '사용 데이터 숨기기';

  @override
  String get profileHideUsageSub => '스크린 타임 숫자 숨기기';

  @override
  String get profileClearData => '활동 데이터 삭제';

  @override
  String get profileClearDataSub => '세션과 목표 기록 삭제';

  @override
  String get profileClearTitle => '활동 데이터를 삭제할까요?';

  @override
  String get profileClearBody => '이 휴대폰의 모든 집중 세션과 목표 기록이 삭제돼요. 되돌릴 수 없어요.';

  @override
  String get profileClear => '삭제';

  @override
  String get profileCleared => '활동 데이터가 삭제됐어요';

  @override
  String get profileExport => '내 데이터 내보내기';

  @override
  String get profileExportSub => 'JSON으로 복사';

  @override
  String get profileExported => '데이터를 클립보드에 복사했어요';

  @override
  String get profileStreaksTitle => '연속 기록';

  @override
  String get profileShare => '공유';

  @override
  String profileShareText(int n) {
    return 'Pausey로 $n일 연속 집중 중!';
  }

  @override
  String get profileCopied => '복사했어요';

  @override
  String profileNextMilestone(int n) {
    return '계속해요 – 다음 목표까지 $n일!';
  }

  @override
  String get profileAllMilestones => '모든 목표 달성. 전설이에요!';

  @override
  String get profileStartStreak => '오늘 집중 세션을 완료하고 연속 기록을 시작하세요.';

  @override
  String get profileBest => '최고';

  @override
  String get profileThisWeek => '이번 주';

  @override
  String profileDaysCompleted(int n) {
    return '$n/7일 완료';
  }

  @override
  String get profileCompleted => '완료';

  @override
  String get profilePartial => '일부';

  @override
  String get profileMissed => '놓침';

  @override
  String get profilePrevMonth => '이전 달';

  @override
  String get profileNextMonth => '다음 달';

  @override
  String get profileMilestones => '연속 기록 목표';

  @override
  String get profileAchievements => '업적';

  @override
  String get profileAchOnFire => '불타는 중';

  @override
  String get profileAchIronWill => '강철 의지';

  @override
  String get profileAchFocusMaster => '집중 마스터';

  @override
  String get profileAchMonk => '디지털 수도승';

  @override
  String get profileAchLegend => '전설';

  @override
  String get profileAchSpeed => '스피드 데몬';

  @override
  String profileAchStreakDesc(int n) {
    return '$n일 연속';
  }

  @override
  String profileAchSessionsDesc(int n) {
    return '세션 $n회 완료';
  }

  @override
  String profileAchHoursDesc(int n) {
    return '총 $n시간 집중';
  }

  @override
  String profileAchDayDesc(int n) {
    return '하루에 $n회';
  }

  @override
  String get navHome => '홈';

  @override
  String get navBlock => '차단';

  @override
  String get navFocus => '집중';

  @override
  String get navInsights => '인사이트';

  @override
  String get navProfile => '프로필';

  @override
  String get unitH => '시간';

  @override
  String get unitM => '분';

  @override
  String get sampleData => '샘플 데이터';

  @override
  String get seeAll => '모두 보기';

  @override
  String days(int count) {
    return '$count일';
  }

  @override
  String get statesTitle => '상태';

  @override
  String get statesSubtitle => '오류·빈 화면·로딩 화면';

  @override
  String get statesNoInternet => '인터넷 없음';

  @override
  String get statesConnectionLost => '연결 끊김';

  @override
  String get statesOfflineTitle => '오프라인 상태입니다';

  @override
  String get statesOfflineMsg =>
      'Pausey가 서버에 연결할 수 없습니다. Wi-Fi 또는 모바일 데이터를 확인하고 다시 시도하세요. 로컬 데이터는 안전합니다.';

  @override
  String get statesTryAgain => '다시 시도';

  @override
  String get statesOpenSettings => '설정 열기';

  @override
  String get statesOfflineMode => '오프라인 모드 활성';

  @override
  String get statesLimited => '제한됨';

  @override
  String get statesAvailable => '사용 가능';

  @override
  String get statesUnavailable => '사용 불가';

  @override
  String get statesCapSessions => '이전 세션 보기';

  @override
  String get statesCapApps => '잠긴 앱 목록';

  @override
  String get statesCapTimer => '로컬 집중 타이머';

  @override
  String get statesCapSync => '연속 기록·목표 동기화';

  @override
  String get statesCapAnalytics => '분석 데이터 새로고침';

  @override
  String get statesOfflineNote => '모든 집중 데이터는 기기에 저장됩니다. 오프라인이어도 사라지지 않아요.';

  @override
  String get statesBackOnline => '다시 온라인 – 모두 동기화됨';

  @override
  String get statesShowAgain => '다시 보기';

  @override
  String get statesPermDenied => '권한 거부됨';

  @override
  String get statesPermRequired => '권한 필요';

  @override
  String get statesPermTitle => '접근 차단됨';

  @override
  String get statesPermMsg => '앱을 차단하려면 스크린 타임 접근 권한이 필요합니다. 없으면 차단이 작동하지 않아요.';

  @override
  String get statesGrant => '접근 허용';

  @override
  String get statesLearnMore => '자세히 보기';

  @override
  String get statesLearnMoreMsg =>
      '스크린 타임 권한으로 방해되는 앱을 일시 정지합니다. 데이터는 휴대폰 밖으로 나가지 않아요.';

  @override
  String get statesRequiredPerms => '필요한 권한';

  @override
  String get statesPermNotif => '알림';

  @override
  String get statesPermScreenTime => '스크린 타임 접근';

  @override
  String get statesPermUsage => '앱 사용 통계';

  @override
  String get statesPermBio => 'Face ID / 생체 인증';

  @override
  String get statesGranted => '허용됨';

  @override
  String get statesDenied => '거부됨';

  @override
  String get statesPermNote => '스크린 타임 없이도 타이머는 되지만 앱 차단은 안 됩니다.';

  @override
  String get statesAccessGranted => '허용됨 – 앱 차단 준비 완료';

  @override
  String get statesDataNA => '데이터 없음';

  @override
  String get statesSyncFailed => '동기화 실패';

  @override
  String get statesLoadTitle => '데이터를 불러오지 못했어요';

  @override
  String get statesLoadMsg =>
      '분석 데이터를 가져오는 중 문제가 생겼어요. 일시적인 서버 오류일 수 있으며 로컬 데이터는 그대로입니다.';

  @override
  String get statesRetrySync => '다시 동기화';

  @override
  String get statesUseCached => '캐시 사용';

  @override
  String get statesErrorDetails => '오류 세부 정보';

  @override
  String get statesErrorCode => '오류 코드';

  @override
  String get statesTimestamp => '시간';

  @override
  String get statesRetryCount => '재시도 횟수';

  @override
  String statesAttempts(int n) {
    return '$n / 3회';
  }

  @override
  String get statesReport => '지원팀에 신고';

  @override
  String get statesReported => '감사합니다 – 신고가 전송됐어요';

  @override
  String get statesCachedNote => '그동안 마지막 동기화 데이터를 사용할 수 있어요.';

  @override
  String get statesDataLoaded => '분석 로드 완료';

  @override
  String get statesCachedShown => '캐시 데이터 표시 중';

  @override
  String statesWeekFocus(String time) {
    return '이번 주 집중: $time';
  }

  @override
  String get statesEmpty => '빈 상태';

  @override
  String get statesNothingYet => '아직 없음';

  @override
  String get statesEmptyTitle => '아직 세션이 없어요';

  @override
  String get statesEmptyMsg => '첫 집중 세션을 시작하면 여기에 진행 상황이 표시돼요.';

  @override
  String get statesStartFocus => '집중 시작';

  @override
  String get statesLoadingSection => '로딩 상태';

  @override
  String get statesDashLoading => '대시보드';

  @override
  String get statesAnalyticsLoading => '분석';

  @override
  String get statesGoalsLoading => '목표';

  @override
  String get statesProfileLoading => '프로필';

  @override
  String get statesCrunching => '데이터 분석 중…';

  @override
  String get statesLoadingGoals => '목표 불러오는 중…';

  @override
  String get statesLoadingProfile => '프로필 불러오는 중…';

  @override
  String get statesReplay => '다시 재생';
}
