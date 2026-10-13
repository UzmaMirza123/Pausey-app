// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get ob1Title => '减少屏幕成瘾';

  @override
  String get ob1Body => '掌控你的数字习惯，减少在分心应用上的时间。';

  @override
  String get ob1StatAvg => '日均屏幕使用时间';

  @override
  String get ob1StatSocial => '花在社交媒体上';

  @override
  String get ob2SelectApps => '选择应用';

  @override
  String get ob2Title => '锁定分心应用';

  @override
  String get ob2Body => '使用强大的应用锁定工具，屏蔽社交媒体、游戏和其他干扰。';

  @override
  String get ob2Feature1 => '一键屏蔽手机上的任意应用';

  @override
  String get ob2Feature2 => '设定锁定时间和专注时段';

  @override
  String get ob2Feature3 => '用密码保护屏蔽，助你坚持到底';

  @override
  String get sheetTitle => '选择应用';

  @override
  String get sheetTotalLocked => '已锁定总数';

  @override
  String get sheetAppsSelected => '个应用已选';

  @override
  String get sheetTimeSaved => '节省时间';

  @override
  String get sheetPerDayAvg => '日均';

  @override
  String sheetHoursValue(String h) {
    return '$h 小时';
  }

  @override
  String get sheetSearchHint => '搜索应用...';

  @override
  String get sheetCatAll => '全部';

  @override
  String get sheetCatSocial => '社交';

  @override
  String get sheetCatEntertainment => '娱乐';

  @override
  String get sheetCatGames => '游戏';

  @override
  String get sheetAppsHeader => '应用';

  @override
  String sheetSelectedCount(int count) {
    return '已选 $count 个';
  }

  @override
  String get sheetNoApps => '未找到应用';

  @override
  String get sheetLockSchedule => '锁定计划';

  @override
  String get sheetAddCustomSemantic => '添加自定义锁定计划';

  @override
  String get sheetCustomBadge => '+ 自定义';

  @override
  String get sheetSchedMorning => '早晨';

  @override
  String get sheetSchedWork => '工作';

  @override
  String get sheetSchedEvening => '晚上';

  @override
  String get sheetEveryDay => '每天';

  @override
  String get sheetWeekdays => '工作日';

  @override
  String get sheetWeekends => '周末';

  @override
  String get sheetUnlockMethod => '解锁方式';

  @override
  String get sheetPin => 'PIN 码';

  @override
  String get sheetPinSub => '4 位 PIN';

  @override
  String get sheetFaceId => 'Face ID';

  @override
  String get sheetFaceIdSub => '生物识别';

  @override
  String get sheetTouchId => 'Touch ID';

  @override
  String get sheetTouchIdSub => '指纹';

  @override
  String get sheetFooter => '你随时可以稍后更改';

  @override
  String get sheetConfirmLock => '确认锁定';

  @override
  String sheetRemove(String name) {
    return '移除 $name';
  }

  @override
  String get sheetCustomTitle => '自定义计划';

  @override
  String get sheetCustomBody => '在此期间，你选择的应用将保持锁定。';

  @override
  String get sheetNameLabel => '名称';

  @override
  String get sheetNameHint => '例如：学习时间';

  @override
  String get sheetStarts => '开始';

  @override
  String get sheetEnds => '结束';

  @override
  String get sheetSameTime => '开始和结束时间相同';

  @override
  String sheetLockedFor(String duration) {
    return '锁定 $duration';
  }

  @override
  String sheetLockedForOvernight(String duration) {
    return '锁定 $duration（跨夜）';
  }

  @override
  String sheetDurH(int h) {
    return '$h 小时';
  }

  @override
  String sheetDurM(int m) {
    return '$m 分钟';
  }

  @override
  String sheetDurHM(int h, int m) {
    return '$h 小时 $m 分钟';
  }

  @override
  String get sheetLockStartsAt => '锁定开始时间';

  @override
  String get sheetLockEndsAt => '锁定结束时间';

  @override
  String get sheetRepeatOn => '重复于';

  @override
  String get sheetAddSchedule => '添加计划';

  @override
  String get sheetCustomDefaultName => '自定义';

  @override
  String sheetChangeTime(String label, String time) {
    return '$label $time。更改时间';
  }

  @override
  String get ob3Title => '每天保持专注';

  @override
  String get ob3Body => '使用番茄钟和深度专注时段，提升效率，成就更多。';

  @override
  String get ob3Pomodoro => '番茄钟';

  @override
  String ob3PomodoroSub(int min) {
    return '$min 分钟时段';
  }

  @override
  String get ob3DeepFocus => '深度专注';

  @override
  String ob3DeepFocusSub(int min) {
    return '$min 分钟心流';
  }

  @override
  String get ob3StatBoost => '效率提升';

  @override
  String ob3StatStreakValue(int days) {
    return '$days 天';
  }

  @override
  String get ob3StatStreak => '连续打卡';

  @override
  String get ob3StatGoal => '目标达成';

  @override
  String get ob3StartTimer => '开始计时';

  @override
  String get ob3PauseTimer => '暂停计时';

  @override
  String get ob4Title => '追踪你的进度';

  @override
  String get ob4Body => '通过精美的分析，掌握屏幕时间、专注时长、目标和效率。';

  @override
  String get ob4Weekly => '每周';

  @override
  String get ob4WeeklySub => '报告';

  @override
  String get ob4Goals => '目标';

  @override
  String get ob4GoalsSub => '追踪';

  @override
  String get ob4Insights => '洞察';

  @override
  String get ob4InsightsSub => 'AI 教练';

  @override
  String get ob4Streaks => '连续记录';

  @override
  String get ob4StreaksSub => '& 徽章';

  @override
  String get ob5Title => '你每天平均屏幕时间是多少？';

  @override
  String get ob5Subtitle => '仅限手机。大概估计即可。';

  @override
  String get ob5More7 => '超过 7 小时';

  @override
  String get ob5H5to7 => '5-7 小时';

  @override
  String get ob5H4to5 => '4-5 小时';

  @override
  String get ob5H3to4 => '3-4 小时';

  @override
  String get ob5H1to3 => '1-3 小时';

  @override
  String get ob5Under1 => '不到 1 小时';

  @override
  String get ob6Title => '你的职业是什么？';

  @override
  String get ob6Subtitle => '我们会根据你的工作方式定制专注计划。';

  @override
  String get ob6Software => '软件开发';

  @override
  String get ob6Founder => 'CEO / 创始人';

  @override
  String get ob6Remote => '远程办公';

  @override
  String get ob6Finance => '金融 / 运营 / 咨询';

  @override
  String get ob6Art => '艺术 / 内容';

  @override
  String get ob6Education => '教育';

  @override
  String get ob6Others => '其他';

  @override
  String get ob7Title => '设定每日屏幕使用时间目标';

  @override
  String get ob7Subtitle => '你可以随时更改。接近上限时我们会提醒你。';

  @override
  String ob7Hours(String hours) {
    return '$hours小时';
  }

  @override
  String get ob7PerDay => '每天';

  @override
  String ob7HoursPerDay(String hours) {
    return '每天 $hours';
  }

  @override
  String get ob7DialLabel => '每日屏幕使用时间目标';

  @override
  String get ob7InfoNote => '普通人每天在手机上花费 4 小时以上。设定目标是夺回时间的第一步。';

  @override
  String get ob8Title => '开启必要权限';

  @override
  String get ob8Subtitle => '授予访问权限，畅享完整的 Pausey 体验。';

  @override
  String get ob8UsageTitle => '使用情况访问权限';

  @override
  String get ob8UsageSub => '监控应用使用情况并执行专注时段。';

  @override
  String get ob8NotifTitle => '通知';

  @override
  String get ob8NotifSub => '及时提醒与进度通知。';

  @override
  String get ob8TrackTitle => '追踪应用使用情况';

  @override
  String get ob8TrackSub => '每日和每周明细。';

  @override
  String get ob9Title => '一切就绪！';

  @override
  String get ob9Subtitle => '你的专注环境已准备就绪。';

  @override
  String get ob9Enter => '进入 Pausey';

  @override
  String get ob9Replay => '重看引导';

  @override
  String get ob9ScreenTime => '屏幕使用时间';

  @override
  String get ob9AppsLocked => '已锁定应用';

  @override
  String get ob9Permissions => '权限';

  @override
  String get ob9FocusMode => '专注模式';

  @override
  String get ob9AllOk => '一切正常';

  @override
  String get ob9On => '已开启';

  @override
  String get ob9Done => '完成';

  @override
  String get ob9StreakTitle => '第 1 天连续打卡现在开始';

  @override
  String get ob9StreakSub => '完成一次专注以保持连续';

  @override
  String get appName => 'Pausey';

  @override
  String get tagline => '夺回你的时间';

  @override
  String get versionLabel => '版本 2.0 · App Store 版';

  @override
  String get skip => '跳过';

  @override
  String get continueLabel => '继续';

  @override
  String get back => '返回';

  @override
  String get freeToStart => '免费开始 · 无需信用卡';

  @override
  String get dataStaysOnDevice => '你的数据永远不会离开你的设备。';

  @override
  String get switchToLight => '切换到浅色模式';

  @override
  String get switchToDark => '切换到深色模式';

  @override
  String get language => '语言';

  @override
  String get phoneLanguage => '手机语言';

  @override
  String get authTitle => '停下滑动。\n掌控你的一天。';

  @override
  String get authSubtitle => '创建账户以同步目标和连续记录，或以访客身份试用 Pausey。';

  @override
  String get continueWithApple => '通过 Apple 继续';

  @override
  String get continueWithGoogle => '通过 Google 继续';

  @override
  String get signUpWithEmail => '使用邮箱注册';

  @override
  String get continueAsGuest => '以访客身份继续';

  @override
  String get guestNote => '访客数据仅保存在此手机上。';

  @override
  String get or => '或';

  @override
  String get haveAccount => '已有账户？';

  @override
  String get noAccount => '初次使用 Pausey？';

  @override
  String get logIn => '登录';

  @override
  String get signUp => '注册';

  @override
  String get createAccount => '创建账户';

  @override
  String get signUpTitle => '创建你的账户';

  @override
  String get signUpSubtitle => '开始养成更从容的屏幕习惯。';

  @override
  String get logInTitle => '欢迎回来';

  @override
  String get logInSubtitle => '登录以继续你的连续记录。';

  @override
  String get fullName => '全名';

  @override
  String get email => '邮箱';

  @override
  String get password => '密码';

  @override
  String get confirmPassword => '确认密码';

  @override
  String get showPassword => '显示密码';

  @override
  String get hidePassword => '隐藏密码';

  @override
  String get forgotPassword => '忘记密码？';

  @override
  String get resetTitle => '重置密码';

  @override
  String get resetSubtitle => '输入邮箱，我们会发送重置链接。';

  @override
  String get sendLink => '发送链接';

  @override
  String get resetSent => '请查收邮箱中的重置链接。';

  @override
  String get agreeTerms => '我同意条款和隐私政策';

  @override
  String get passwordStrength => '密码强度';

  @override
  String get strengthWeak => '弱';

  @override
  String get strengthOk => '中';

  @override
  String get strengthStrong => '强';

  @override
  String get errNameRequired => '请输入你的姓名';

  @override
  String get errEmailInvalid => '请输入有效的邮箱';

  @override
  String get errPasswordShort => '至少使用 8 个字符';

  @override
  String get errPasswordMismatch => '两次密码不一致';

  @override
  String get errTerms => '请接受条款以继续';

  @override
  String get authErr_not_configured => '登录尚未设置。你可以以访客身份继续。';

  @override
  String get authErr_cancelled => '登录已取消。';

  @override
  String get authErr_invalid_email => '该邮箱似乎不正确。';

  @override
  String get authErr_wrong_password => '邮箱或密码不正确。';

  @override
  String get authErr_user_not_found => '没有使用该邮箱的账户。要注册吗？';

  @override
  String get authErr_email_in_use => '该邮箱已有账户，请直接登录。';

  @override
  String get authErr_weak_password => '请选择更强的密码。';

  @override
  String get authErr_network => '无网络连接，请重试。';

  @override
  String get authErr_too_many => '尝试次数过多，请稍等一分钟后重试。';

  @override
  String get authErr_unknown => '出了点问题，请重试。';

  @override
  String homeHello(String name) {
    return '你好，$name';
  }

  @override
  String get homeHelloGuest => '你好';

  @override
  String get homeGuestBadge => '访客模式 · 保存在此手机上';

  @override
  String get homeSubtitle => '你的计划已就绪。以下是你的选择。';

  @override
  String get homeDailyGoal => '每日目标';

  @override
  String get homeLockedApps => '已锁定的应用';

  @override
  String get homeScreenTime => '当前屏幕使用时间';

  @override
  String get homeNotSet => '未设置';

  @override
  String get homeCreateAccount => '创建账户以备份';

  @override
  String get signOut => '退出登录';

  @override
  String get signOutGuestWarn => '退出登录将删除此手机上的访客数据。';

  @override
  String get cancel => '取消';

  @override
  String get navHome => '首页';

  @override
  String get navBlock => '屏蔽';

  @override
  String get navFocus => '专注';

  @override
  String get navInsights => '洞察';

  @override
  String get navProfile => '我的';

  @override
  String get unitH => '小时';

  @override
  String get unitM => '分钟';

  @override
  String get sampleData => '示例数据';

  @override
  String get seeAll => '查看全部';

  @override
  String days(int count) {
    return '$count天';
  }
}
