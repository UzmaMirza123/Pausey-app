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
}
