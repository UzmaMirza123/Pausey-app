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
  String get ob7Title => '每日屏幕时间目标';

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
  String alSummary(int locked, int total) {
    return '当前限制 $locked 个 · 共管理 $total 个';
  }

  @override
  String alSummaryOff(int total) {
    return '管理 $total 个 · 拦截未开启';
  }

  @override
  String get alFromInstalled => '从已安装应用中选择';

  @override
  String get alFromInstalledSub => '选择本机上的任意应用';

  @override
  String get alPermTitle => '拦截尚未生效';

  @override
  String get alPermMsg => '规则已保存，但需开启以下两项权限，Pausey 才能拦截应用：';

  @override
  String get alPermUsage => '使用情况访问权限';

  @override
  String get alPermUsageSub => '识别正在打开的应用及今日用时';

  @override
  String get alPermOverlay => '显示在其他应用上层';

  @override
  String get alPermOverlaySub => '在被拦截的应用上显示锁定页';

  @override
  String get alAllow => '允许';

  @override
  String get alAllowed => '已允许';

  @override
  String get alPermReturn => '授权后返回 Pausey，会自动重新检查。';

  @override
  String get alAndroidOnly => '拦截仅支持 Android，你仍可在此设置规则。';

  @override
  String get alSearchHint => '搜索应用';

  @override
  String get alFilterAll => '全部';

  @override
  String get alFilterLocked => '已锁定';

  @override
  String get alFilterScheduled => '定时';

  @override
  String get alFilterAvailable => '可用';

  @override
  String get alStateLocked => '已锁定';

  @override
  String get alStateWillLock => '将锁定';

  @override
  String get alStateScheduled => '定时';

  @override
  String get alStateAvailable => '可用';

  @override
  String alUsedOf(String used, String limit) {
    return '已用 $used / $limit';
  }

  @override
  String alUsedToday(String used) {
    return '今日 $used';
  }

  @override
  String get alNoLimit => '无每日限额';

  @override
  String alLimitNoUsage(String limit) {
    return '限额 $limit · 无用时数据';
  }

  @override
  String get alRulesOff => '限制已关闭';

  @override
  String alNextLock(String time) {
    return '下次锁定：$time';
  }

  @override
  String alUnlockedUntil(String time) {
    return '解锁至 $time';
  }

  @override
  String get alReasonLimit => '已达每日限额';

  @override
  String get alReasonSchedule => '锁定时段进行中';

  @override
  String get alReasonGeneral => '通用时段进行中';

  @override
  String get alReasonAllDay => '全天锁定';

  @override
  String get alReasonFocus => '专注进行中';

  @override
  String get alNoMatches => '没有匹配的应用';

  @override
  String get alGeneral => '通用';

  @override
  String get alGeneralScheduleSub => '适用于开启“跟随通用时段”的应用';

  @override
  String get alLockAllSub => '为所有应用开启限制';

  @override
  String get alSaved => '已保存';

  @override
  String get alChangesApply => '更改立即生效';

  @override
  String get alDetailsTitle => '应用限制';

  @override
  String get alBlockingOff => '此手机上拦截未开启';

  @override
  String get alRestrictApp => '限制此应用';

  @override
  String get alMasterOff => '已关闭，Pausey 不会限制此应用';

  @override
  String get alMasterOnRules => '下方的限额和时段生效';

  @override
  String get alMasterOnAllDay => '尚无限额或时段，将全天锁定';

  @override
  String get alMasterOnGeneral => '在通用时段内锁定';

  @override
  String get alFollowGeneral => '跟随通用时段';

  @override
  String alFollowGeneralSub(String start, String end) {
    return '同时在 $start – $end 锁定';
  }

  @override
  String get alGeneralOff => '通用时段已关闭';

  @override
  String get alDailyLimit => '每日限额';

  @override
  String get alDailyLimitOffSub => '每天用满设定时长后锁定';

  @override
  String get alCustom => '自定义';

  @override
  String get alUsedLabel => '今日已用';

  @override
  String get alLeftLabel => '剩余';

  @override
  String get alLimitReached => '今日限额已用完';

  @override
  String get alResets => '每天午夜重置（手机时间）';

  @override
  String get alUsageUnavailable => '无法获取用时';

  @override
  String get alUsageNeedsAccess => '允许使用情况访问权限，Pausey 才能统计今日用时。';

  @override
  String get alUsageAndroidOnly => '仅 Android 可统计用时，限额已保存并会在那里生效。';

  @override
  String get alGrantUsage => '授予访问权限';

  @override
  String get alCustomLimitTitle => '自定义每日限额';

  @override
  String get alHours => '小时';

  @override
  String get alMinutes => '分钟';

  @override
  String get alErrZeroLimit => '请选择大于 0 的时长';

  @override
  String get alSave => '保存';

  @override
  String get alScheduledLocking => '定时锁定';

  @override
  String get alScheduledOffSub => '在设定时间锁定此应用';

  @override
  String get alNoSchedules => '还没有时段';

  @override
  String get alAddSchedule => '添加时段';

  @override
  String get alActiveNow => '进行中';

  @override
  String get alScheduleDefault => '锁定时段';

  @override
  String get alEndsNextDay => '次日结束';

  @override
  String get alEdit => '编辑';

  @override
  String get alDelete => '删除';

  @override
  String get alDeleteScheduleQ => '删除此时段？';

  @override
  String alDeleteScheduleMsg(String title) {
    return '“$title”将不再锁定此应用。';
  }

  @override
  String get alNewSchedule => '新时段';

  @override
  String get alEditSchedule => '编辑时段';

  @override
  String get alTitleOptional => '标题（可选）';

  @override
  String get alPresetStudy => '学习';

  @override
  String get alPresetEvening => '傍晚';

  @override
  String get alPresetSleep => '睡眠';

  @override
  String get alRepeatOn => '重复';

  @override
  String get alErrSameTime => '开始和结束不能相同';

  @override
  String get alErrNoDays => '请至少选择一天';

  @override
  String alTempUnlock(int minutes) {
    return '解锁 $minutes 分钟';
  }

  @override
  String alTempUnlockSub(int n) {
    return '消耗 1 次紧急解锁 · 今日剩 $n 次';
  }

  @override
  String get alTempUnlockFocus => '专注期间无法解锁';

  @override
  String get alTempUnlockNotLocked => '仅在应用锁定时需要';

  @override
  String alTempUnlockQ(String app, int minutes) {
    return '解锁 $app $minutes 分钟？';
  }

  @override
  String get alUnlock => '解锁';

  @override
  String get alEndEarly => '提前结束';

  @override
  String get alResetRules => '重置限制';

  @override
  String get alResetRulesSub => '移除此应用的限额和时段';

  @override
  String alResetQ(String app) {
    return '重置 $app 的限制？';
  }

  @override
  String get alResetMsg => '将移除其每日限额和所有时段，应用仍保留在列表中。';

  @override
  String get alReset => '重置';

  @override
  String get alResetDone => '已重置限制';

  @override
  String get alRemoveApp => '移除应用';

  @override
  String get alRemoveAppSub => '不再管理此应用';

  @override
  String alRemoveQ(String app) {
    return '移除 $app？';
  }

  @override
  String get alRemoveMsg => 'Pausey 将停止限制它，并删除其限额和时段。';

  @override
  String get alRemove => '移除';

  @override
  String get alNoPackage => '单独的限额和时段需要指定一个已安装应用。在 Android 上可通过“从已安装应用中选择”添加。';

  @override
  String get alNotFound => '此应用已不再管理';

  @override
  String get alPickerTitle => '已安装应用';

  @override
  String get alPickerAdded => '已添加';

  @override
  String alPickerAdd(int n) {
    return '添加应用（$n）';
  }

  @override
  String get alPickerEmpty => '未找到应用';

  @override
  String get blockTitle => '应用锁';

  @override
  String get blockAddApp => '添加应用';

  @override
  String get blockFaceIdTitle => '面容 ID 保护';

  @override
  String get blockFaceIdSub => '解锁任何应用都需面容 ID';

  @override
  String get blockFaceIdUnavailable => '此设备不支持生物识别';

  @override
  String get blockFaceIdReason => '请验证身份以开启保护';

  @override
  String get blockFaceIdFailed => '验证失败，保护保持关闭';

  @override
  String get blockScheduleTitle => '定时锁定';

  @override
  String get blockStart => '开始时间';

  @override
  String get blockEnd => '结束时间';

  @override
  String get blockNeedOneDay => '至少保留一天';

  @override
  String get blockManagedApps => '受管应用';

  @override
  String get blockLockAll => '全部锁定';

  @override
  String get blockAllLocked => '所有应用已锁定';

  @override
  String blockRemoved(String app) {
    return '已移除 $app';
  }

  @override
  String get blockAppsUpdated => '已更新应用';

  @override
  String get blockCatSocial => '社交';

  @override
  String get blockCatVideo => '视频';

  @override
  String get blockCatGames => '游戏';

  @override
  String get blockCatShopping => '购物';

  @override
  String get blockCatCommunity => '社区';

  @override
  String get blockCatOther => '其他';

  @override
  String get blockEmptyBadge => '未屏蔽';

  @override
  String get blockEmptyTitle => '还没有应用';

  @override
  String get blockEmptyMsg => '添加最让你分心的应用，Pausey 会帮你锁定。';

  @override
  String get blockEmergencyTitle => '紧急解锁';

  @override
  String blockEmergencySub(int n) {
    return '临时解锁全部 · 今天剩 $n 次';
  }

  @override
  String get blockEmergencyOff => '已在设置中关闭';

  @override
  String get blockEmergencyUse => '使用';

  @override
  String get blockEmergencyConfirmTitle => '使用紧急解锁？';

  @override
  String blockEmergencyConfirmMsg(int n) {
    return '这将消耗今天剩余 $n 次中的一次。请仅在确有需要时使用。';
  }

  @override
  String get blockEmergencyUsed => '已使用紧急解锁，应用暂时可用';

  @override
  String get blockEmergencyNone => '今天已用完';

  @override
  String get cvNoAccount => '还没有账号？';

  @override
  String get cvYourName => '你的名字';

  @override
  String get cvAppsLoadFailed => '无法读取这部手机上的应用。';

  @override
  String get cvTryAgain => '重试';

  @override
  String get cvGetStarted => '开始使用';

  @override
  String get cvHaveAccount => '我已有账号';

  @override
  String get cvWelcomeTitle => '你的时间，属于你。';

  @override
  String get cvWelcomeBody => '为重要的事腾出更多空间。';

  @override
  String get cvNext => '下一步';

  @override
  String get cvSkipForNow => '暂时跳过';

  @override
  String get cvRelateTitle => '常常忘了时间？';

  @override
  String get cvRelateOften => '经常这样';

  @override
  String get cvRelateSometimes => '有时候';

  @override
  String get cvRelateRarely => '很少';

  @override
  String get cvRelateReplyOften => '你并不孤单。手机本来就是为了留住我们而设计的。';

  @override
  String get cvRelateReplySometimes => '大多数人都会这样，而且常常没察觉。';

  @override
  String get cvRelateReplyRarely => '很好，继续保持。';

  @override
  String get cvRelateCta => '说的就是我';

  @override
  String get cvGoalTitle => '想把时间留给什么？';

  @override
  String get cvGoalFocus => '更专注';

  @override
  String get cvGoalSleep => '睡得更好';

  @override
  String get cvGoalScrolling => '少刷手机';

  @override
  String get cvGoalMe => '多留点时间给自己';

  @override
  String get cvGoalHabits => '更健康的日常习惯';

  @override
  String get cvGoalOther => '其他';

  @override
  String get cvGoalOtherHint => '你想把更多时间留给什么？';

  @override
  String get cvGoalReplyFocus => '那就专注吧。我们会为你守住深度工作的时间。';

  @override
  String get cvGoalReplySleep => '好睡眠从睡前开始。我们会帮你让夜晚慢慢放松下来。';

  @override
  String get cvGoalReplyScrolling => '让刷手机成为一种选择，而不是习惯。';

  @override
  String get cvGoalReplyMe => '留给自己的时间很重要。我们一起找出来。';

  @override
  String get cvGoalReplyHabits => '小步积累成大改变。我们会让它们轻松简单。';

  @override
  String get cvGoalReplyOther => '明白了。我们会围绕它来安排。';

  @override
  String get cvAppsTitle => '哪些应用让你分心？';

  @override
  String get cvAppsSubReal => '这些是本机上的应用，想选几个都可以。';

  @override
  String get cvAppsSubPopular => '这些是常让人花掉时间的热门应用，选出适合你的。';

  @override
  String get cvAppsSearch => '搜索应用';

  @override
  String cvAppsReply(String apps) {
    return '已记下：$apps。我们就从这些开始。';
  }

  @override
  String cvAnd(String a, String b) {
    return '$a和$b';
  }

  @override
  String cvAndMore(String a, String b, int count) {
    return '$a、$b及另外$count个';
  }

  @override
  String get cvStTitle => '你每天的屏幕时间';

  @override
  String get cvStSub => '大概估一下就好，这些只保存在你的手机上。';

  @override
  String cvStMeasured(String time) {
    return '本机今天到目前的测量值：$time';
  }

  @override
  String get cvStUnder2 => '少于 2 小时';

  @override
  String get cvSt2to4 => '2 到 4 小时';

  @override
  String get cvSt4to6 => '4 到 6 小时';

  @override
  String get cvStOver6 => '超过 6 小时';

  @override
  String get cvStNotSure => '不确定';

  @override
  String get cvStReplyUnder2 => '这是不错的平衡，我们会帮你保持。';

  @override
  String get cvStReply2to4 => '几个小改变，就能腾出不少时间。';

  @override
  String get cvStReply4to6 => '这占了你一天中不小的部分。我们一起把一些时间拿回来。';

  @override
  String get cvStReplyOver6 => '这是一天中很大的一部分，我们就从小处开始。';

  @override
  String get cvStReplyNotSure => '没关系。允许使用情况访问权限后，Pausey 就能测量。';

  @override
  String get cvPhraseFocus => '更专注';

  @override
  String get cvPhraseSleep => '更好的睡眠';

  @override
  String get cvPhraseScrolling => '少刷手机';

  @override
  String get cvPhraseMe => '更多属于自己的时间';

  @override
  String get cvPhraseHabits => '更健康的习惯';

  @override
  String get cvPhraseOther => '为重要的事留出空间';

  @override
  String cvPhraseOtherNamed(String thing) {
    return '更多时间给$thing';
  }

  @override
  String get cvReflectTitle => '我们了解到';

  @override
  String cvReflectApps(String goal, String apps) {
    return '你想要$goal，却总被$apps吸引过去。';
  }

  @override
  String cvReflectNoApps(String goal) {
    return '你想要$goal，但手机有时会碍事。';
  }

  @override
  String cvReflectEstimate(String time) {
    return '每天约 $time（你的估计）';
  }

  @override
  String cvReflectMeasured(String time) {
    return '今天到目前 $time（实测）';
  }

  @override
  String get cvReflectHelp => 'Pausey 可以帮你建立一个让注意力喘口气的日常习惯。';

  @override
  String get cvShowMeHow => '告诉我怎么做';

  @override
  String get cvHowTitle => 'Pausey 这样帮助你';

  @override
  String get cvHowPauseTab => '暂停';

  @override
  String get cvHowLimitTab => '限额';

  @override
  String get cvHowFocusTab => '专注';

  @override
  String get cvHowPauseTitle => '温和的暂停，而非惩罚';

  @override
  String get cvHowPauseBody => '当某个应用的时间用完，Pausey 会用安静的暂停页盖住它，并留一条出路。';

  @override
  String get cvHowLimitTitle => '每个应用的每日额度';

  @override
  String get cvHowLimitBody => '为每个应用单独设置每日时长和锁定时段。改一个，不会影响另一个。';

  @override
  String get cvHowFocusTitle => '专注时段';

  @override
  String get cvHowFocusBody => '为工作、学习或休息开启计时。结束前，你选的应用都会保持暂停。';

  @override
  String get cvPreview => '预览';

  @override
  String get cvYourApp => '你的应用';

  @override
  String get cvAnotherApp => '另一个应用';

  @override
  String cvMinOf(int used, int limit) {
    return '$used/$limit 分钟';
  }

  @override
  String get cvBuildPlan => '生成我的计划';

  @override
  String get cvPlanTitle => '从这里轻松开始';

  @override
  String get cvPlanSub => '根据你的回答推荐，可以随意修改。';

  @override
  String get cvPlanFocus => '专注时段';

  @override
  String cvPlanFocusSub(String time) {
    return '每次 $time';
  }

  @override
  String get cvPlanDaily => '每日专注目标';

  @override
  String cvPlanDailySub(String time) {
    return '每天专注 $time';
  }

  @override
  String get cvPlanLimit => '每日应用限额';

  @override
  String cvPlanLimitSub(String app, String time) {
    return '$app：每天 $time';
  }

  @override
  String get cvPlanLimitNoPkg => '此应用不在手机列表中，限额可稍后在应用锁中设置。';

  @override
  String get cvPlanWind => '晚间放松';

  @override
  String cvPlanWindSub(String start, String end) {
    return '所选应用将在 $start 至 $end 暂停';
  }

  @override
  String get cvPlanOff => '关闭';

  @override
  String get cvStarts => '开始';

  @override
  String get cvEnds => '结束';

  @override
  String get cvPlanNote => '目前还没有开启任何功能。完成设置后才会开始，你随时可以修改。';

  @override
  String get cvUsePlan => '使用此计划';

  @override
  String get cvPermTitle => '需要几项权限才能运行';

  @override
  String get cvPermSub => '每项都会打开 Android 设置。在那里开启后再返回。';

  @override
  String get cvPermUnsupported => '应用限额和暂停页适用于 Android 手机，其余功能在这里也能使用。';

  @override
  String get cvPermUsageTitle => '使用情况访问权限';

  @override
  String get cvPermUsageWhy => '让 Pausey 了解今天每个应用打开了多久，以及当前在屏幕上的是哪个应用。';

  @override
  String get cvPermUsageWithout => '没有它，Pausey 无法测量屏幕使用时间，也不知道何时达到限额。';

  @override
  String get cvPermOverlayTitle => '显示在其他应用上层';

  @override
  String get cvPermOverlayWhy => '让 Pausey 在应用时间用完时，在其上方显示暂停页。';

  @override
  String get cvPermOverlayWithout => '没有它，应用无法暂停。你的计划会保留，以后再用。';

  @override
  String get cvPermBatteryTitle => '保持 Pausey 运行';

  @override
  String get cvPermBatteryWhy => '有些手机会为了省电停止后台应用。允许 Pausey 运行，限额才能持续生效。';

  @override
  String get cvPermBatteryWithout => '没有它，限额可能会失效，直到你再次打开 Pausey。';

  @override
  String get cvPermLater => '之后可以在 Android 设置中更改。';

  @override
  String get cvPermPrivacy => 'Pausey 只读取应用名称和使用时长，任何数据都不会离开你的手机。';

  @override
  String get cvAllowInSettings => '前往设置允许';

  @override
  String get cvAllowed => '已允许';

  @override
  String get cvOptional => '可选';

  @override
  String get cvContinueAnyway => '暂时继续';

  @override
  String get cvAccountTitle => '保存你的进度';

  @override
  String get cvAccountSub => '以访客身份使用 Pausey，或登录。';

  @override
  String get cvNameLabel => '你的名字（可选）';

  @override
  String get cvNameHint => '我们该怎么称呼你？';

  @override
  String get cvContinueGuest => '以访客身份继续';

  @override
  String get cvAccountNote => '登录暂时不会备份你的数据。无论哪种方式，设置都保存在这台手机上。';

  @override
  String get cvReadyTitle => '你的第一步，从这里开始。';

  @override
  String cvReadyTitleNamed(String name) {
    return '$name，你的第一步从这里开始。';
  }

  @override
  String get cvReadyFocus => '为专注多留一点空间吧。';

  @override
  String get cvReadySleep => '让你的夜晚更平静一些吧。';

  @override
  String get cvReadyScrolling => '让刷手机少占一点你的一天吧。';

  @override
  String get cvReadyMe => '为你自己多留一点时间吧。';

  @override
  String get cvReadyHabits => '一起养成让人舒服的好习惯吧。';

  @override
  String get cvReadyOther => '为对你重要的事腾出更多空间吧。';

  @override
  String get cvYourPlan => '你的计划';

  @override
  String cvSumGoal(String goal) {
    return '目标：$goal';
  }

  @override
  String cvSumApps(String apps) {
    return '应用：$apps';
  }

  @override
  String cvSumFocus(String session, String daily) {
    return '每次专注 $session，每天 $daily';
  }

  @override
  String get cvReadyNeedsPerm => '应用限额已保存，但需允许这两项权限后才会生效。';

  @override
  String get cvReadyChange => '这些之后都可以修改。';

  @override
  String get cvStartFirstFocus => '开始我的第一次专注';

  @override
  String get cvFinishLimits => '完成应用限额设置';

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
  String get logInTitle => '登录你的账户';

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
  String get ob6OtherHint => '输入你的职业';

  @override
  String get timeSecondLabel => '秒';

  @override
  String get focusModePomodoro => '番茄钟';

  @override
  String get focusModeDeep => '深度专注';

  @override
  String get focusModeCustom => '自定义';

  @override
  String get focusRemaining => '剩余';

  @override
  String get focusBreakLabel => '休息';

  @override
  String get focusReadyLabel => '就绪';

  @override
  String get focusInSession => '专注中';

  @override
  String get focusPausedState => '已暂停';

  @override
  String get focusOnBreak => '休息中';

  @override
  String get focusIdleState => '点击开始';

  @override
  String get focusSessionsDone => '已完成';

  @override
  String get focusProgress => '进度';

  @override
  String get focusBreakAfter => '之后休息';

  @override
  String get focusFocusedToday => '今日专注';

  @override
  String focusAppsBlocked(int count) {
    return '已屏蔽 $count 个应用';
  }

  @override
  String get focusAppsBlockedSub => '本次专注期间屏蔽干扰。';

  @override
  String get focusNoApps => '未屏蔽应用';

  @override
  String get focusNoAppsSub => '选择专注时要锁定的应用。';

  @override
  String get focusEdit => '编辑';

  @override
  String get focusAdd => '添加';

  @override
  String get focusAmbient => '环境音';

  @override
  String get focusSoundOff => '关闭';

  @override
  String get focusSoundRain => '雨声';

  @override
  String get focusSoundForest => '森林';

  @override
  String get focusSoundWaves => '海浪';

  @override
  String get focusSoundWhite => '白噪音';

  @override
  String get focusVolume => '音量';

  @override
  String get focusStart => '开始';

  @override
  String get focusPause => '暂停';

  @override
  String get focusResume => '继续';

  @override
  String get focusStop => '停止';

  @override
  String get focusRestart => '重新开始';

  @override
  String get focusSkipBreak => '跳过休息';

  @override
  String get focusDurations => '时长设置';

  @override
  String focusMinutesN(int n) {
    return '$n 分钟';
  }

  @override
  String get focusBreakLength => '休息';

  @override
  String get focusCustomTitle => '自定义时长';

  @override
  String get focusSet => '确定';

  @override
  String get focusStopTitle => '提前结束？';

  @override
  String get focusStopBody => '已专注的时间会被保存。';

  @override
  String get focusEndSession => '结束';

  @override
  String get focusKeepGoing => '继续';

  @override
  String get focusTooShort => '不足一分钟，未保存。';

  @override
  String get focusBreakOver => '休息结束，准备好下一轮了吗？';

  @override
  String get focusBusy => '结束当前专注后才能切换模式。';

  @override
  String get focusFirstHint => '第一次专注从这里开始，点击开始吧。';

  @override
  String get focusCompleteA => '专注';

  @override
  String get focusCompleteB => '完成！';

  @override
  String get focusEndedTitle => '专注已结束';

  @override
  String focusCompleteMsg(String mode) {
    return '太棒了！你专心完成了$mode。';
  }

  @override
  String get focusEndedMsg => '每一分钟都算数，下次试试完整一轮。';

  @override
  String get focusDurationLabel => '专注时长';

  @override
  String get focusMinUnit => '分钟';

  @override
  String get focusDayStreak => '连续天数';

  @override
  String get focusAppsLabel => '已屏蔽';

  @override
  String get focusTodayGoal => '今日目标';

  @override
  String focusPctCompleted(int pct) {
    return '已完成 $pct%';
  }

  @override
  String focusPlusPct(int pct) {
    return '本次 +$pct%';
  }

  @override
  String get focusMomentum => '保持势头！';

  @override
  String get focusQuote1 => '坚持胜过强度，每一次专注都在积累。';

  @override
  String get focusQuote2 => '小段专注，成就大结果。';

  @override
  String get focusQuote3 => '你没有刷手机，而是在成长。再来一次。';

  @override
  String get focusStartNext => '开始下一轮';

  @override
  String get focusBackHome => '返回首页';

  @override
  String get goalsTitle => '我的目标';

  @override
  String goalsSubtitle(int active, int done) {
    return '$active 进行中 · $done 已完成';
  }

  @override
  String get goalsAdd => '添加目标';

  @override
  String get goalsCompleted => '已完成';

  @override
  String get goalsActive => '进行中';

  @override
  String get goalsStreak => '连续';

  @override
  String get goalsOverall => '总体完成度';

  @override
  String goalsWeeklyHit(int hit, int total) {
    return '本周 $total 项中完成 $hit 项';
  }

  @override
  String goalsVsLastWeek(String delta) {
    return '较上周 $delta';
  }

  @override
  String get goalsFilterAll => '全部';

  @override
  String get goalsDone => '完成';

  @override
  String get goalsCatFocus => '专注';

  @override
  String get goalsCatDiscipline => '自律';

  @override
  String get goalsCatWellness => '健康';

  @override
  String goalsTitleFocusHours(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '每日专注：$n 小时',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleFocusDur(String duration) {
    return '每日专注：$duration';
  }

  @override
  String get goalsTitleBlock => '屏蔽社交应用';

  @override
  String goalsTitleSessions(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '每天 $n 个番茄钟',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleScreen(String duration) {
    return '屏幕时间少于 $duration';
  }

  @override
  String get goalsTitlePhoneFree => '无手机时间';

  @override
  String goalsDescFocus(String duration) {
    return '每天深度专注 $duration';
  }

  @override
  String goalsDescBlock(int n) {
    return '每周 $n 天保持应用锁定';
  }

  @override
  String goalsDescSessions(int n) {
    return '每天至少完成 $n 次专注';
  }

  @override
  String goalsDescScreen(String duration) {
    return '每天手机使用少于 $duration';
  }

  @override
  String goalsDescPhoneFree(int n) {
    return '每周 $n 天不碰手机——逐日打卡';
  }

  @override
  String goalsProgressDays(int done, int total) {
    return '$done / $total 天';
  }

  @override
  String goalsProgressSessions(int done, int total) {
    return '$done / $total 次';
  }

  @override
  String goalsStreakShort(int n) {
    return '$n 天';
  }

  @override
  String goalsStreakN(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '连续 $n 天',
    );
    return '$_temp0';
  }

  @override
  String get goalsCheckIn => '标记今天完成';

  @override
  String get goalsCheckedIn => '今天已完成';

  @override
  String get goalsCheckedSnack => '太棒了！今天已标记完成。';

  @override
  String get goalsUncheckedSnack => '已取消今天的完成标记。';

  @override
  String get goalsCreateNew => '创建新目标';

  @override
  String get goalsEmptyBadge => '开始吧';

  @override
  String get goalsEmptyTitle => '还没有目标';

  @override
  String get goalsEmptyMsg => '设定一个小的每日目标，Pausey 会帮你追踪。';

  @override
  String get goalsFilterEmpty => '没有符合此筛选的目标。';

  @override
  String get goalsNewGoal => '新目标';

  @override
  String get goalsEditGoal => '编辑目标';

  @override
  String get goalsType => '目标类型';

  @override
  String get goalsTypeFocus => '专注时长';

  @override
  String get goalsTypeSessions => '专注次数';

  @override
  String get goalsTypeBlock => '屏蔽应用';

  @override
  String get goalsTypePhoneFree => '无手机日';

  @override
  String get goalsTypeScreen => '屏幕时间上限';

  @override
  String get goalsCategory => '类别';

  @override
  String get goalsTarget => '目标值';

  @override
  String get goalsPerDay => '每天';

  @override
  String get goalsPerWeek => '每周天数';

  @override
  String get goalsMaxPerDay => '每天最多';

  @override
  String get goalsTitleOptional => '标题（可选）';

  @override
  String get goalsSave => '保存目标';

  @override
  String get goalsCreate => '创建目标';

  @override
  String get goalsSavedSnack => '目标已保存';

  @override
  String get goalsCreatedSnack => '目标已创建';

  @override
  String get goalsEdit => '编辑';

  @override
  String get goalsDelete => '删除目标';

  @override
  String get goalsDeleteQ => '删除此目标？';

  @override
  String get goalsDeleteMsg => '其打卡记录将被删除，且无法撤销。';

  @override
  String get goalsDeletedSnack => '目标已删除';

  @override
  String get goalsComplete => '已完成';

  @override
  String get goalsDaysActive => '活跃天数';

  @override
  String get goalsTotalTime => '总时长';

  @override
  String get goalsSessionsLabel => '次数';

  @override
  String get goals7Day => '7 天完成度';

  @override
  String get goals7DaysAgo => '7 天前';

  @override
  String get goalsToday => '今天';

  @override
  String goalsTodayDate(String date) {
    return '今天，$date';
  }

  @override
  String goalsYesterdayDate(String date) {
    return '昨天，$date';
  }

  @override
  String get goalsMilestones => '里程碑';

  @override
  String get goalsMsFirst => '完成第一天';

  @override
  String get goalsMs3 => '连续 3 天';

  @override
  String get goalsMsHalf => '完成每周目标 50%';

  @override
  String get goalsMs5 => '连续 5 天';

  @override
  String get goalsMsWeek => '完成整整一周';

  @override
  String get goalsMsLocked => '尚未';

  @override
  String get goalsHistory => '活动记录';

  @override
  String get goalsShowLess => '收起';

  @override
  String get goalsStartSession => '开始专注';

  @override
  String get goalsManageApps => '管理屏蔽应用';

  @override
  String get goalsBlockHint => '锁定计划开启时自动计入。';

  @override
  String goalsScreenToday(String used) {
    return '今日屏幕时间：$used';
  }

  @override
  String get goalsNotFound => '此目标已不存在。';

  @override
  String get goalsMore => '更多选项';

  @override
  String goalsFreeLimit(int n) {
    return '免费版：最多 $n 个目标';
  }

  @override
  String get homeGoodMorning => '早上好';

  @override
  String get homeGoodAfternoon => '下午好';

  @override
  String get homeGoodEvening => '晚上好';

  @override
  String get homeFriend => '朋友';

  @override
  String get homeTodayFocus => '今日专注';

  @override
  String homeVsYesterday(String pct) {
    return '较昨天 $pct%';
  }

  @override
  String get homeStartToday => '今天还没有专注';

  @override
  String get homeDayStreak => '连续天数';

  @override
  String get homeTodayGoal => '今日目标';

  @override
  String homePctCompleted(int pct) {
    return '已完成 $pct%';
  }

  @override
  String get homeOnTrack => '进展顺利！';

  @override
  String get homeKeepGoing => '继续加油';

  @override
  String get homeGoalMet => '目标达成！';

  @override
  String get homeScreenTimeTitle => '屏幕使用时间';

  @override
  String get homeToday => '今天';

  @override
  String homeVsAvg(String pct) {
    return '较平均 $pct%';
  }

  @override
  String get homeQuickStart => '快速开始专注';

  @override
  String get homeManage => '管理';

  @override
  String get homeNoApps => '选择最让你分心的应用并在此锁定。';

  @override
  String get homeAddApps => '添加应用';

  @override
  String homeAppLocked(String app) {
    return '已锁定 $app';
  }

  @override
  String homeAppUnlocked(String app) {
    return '已解锁 $app';
  }

  @override
  String homeLockApp(String app) {
    return '锁定或解锁 $app';
  }

  @override
  String get homeUpgradeTitle => '升级到高级版';

  @override
  String get homeUpgradeBody => '无限屏蔽、目标与深度分析。';

  @override
  String get homeTryFree => '免费试用';

  @override
  String get homePro => 'PRO';

  @override
  String get homeProActive => 'Pausey Pro 已激活';

  @override
  String get homeProActiveBody => '全部功能已解锁，感谢支持！';

  @override
  String get homeNotifications => '通知';

  @override
  String get homeNoNotifications => '暂无新通知。';

  @override
  String get homePushLabel => '推送通知';

  @override
  String get homeFocusReminder => '每日专注提醒';

  @override
  String get homeStreakAlerts => '连续提醒';

  @override
  String get homePwTitle => '解锁 Pausey Pro';

  @override
  String get homePwSubtitle => '找回专注，戒掉手机瘾。';

  @override
  String get homePwMonthly => '月度';

  @override
  String get homePwBilledMonthly => '按月计费';

  @override
  String get homePwYearly => '年度';

  @override
  String get homePwPopular => '最受欢迎';

  @override
  String homePwSave(int pct) {
    return '省 $pct%';
  }

  @override
  String homePwBilledYearly(String price) {
    return '每年 $price';
  }

  @override
  String get homePwLifetime => '终身';

  @override
  String get homePwBestValue => '最超值';

  @override
  String get homePwPayOnce => '一次付费，永久使用';

  @override
  String get homePwPerMonth => '/ 月';

  @override
  String get homePwOnce => '一次性';

  @override
  String get homePwStartTrial => '开始 7 天免费试用';

  @override
  String get homePwBuyLifetime => '获取终身权限';

  @override
  String get homePwNoCharge => '今日不扣费 · 随时取消';

  @override
  String get homePwOneTime => '一次性付款 · 无订阅';

  @override
  String get homePwFree => '免费';

  @override
  String get homePwProCol => 'Pro';

  @override
  String get homePwFeatBlocking => '无限应用屏蔽';

  @override
  String get homePwFeatSessions => '全部专注模式';

  @override
  String get homePwFeatGoals => '无限目标';

  @override
  String get homePwFeatAnalytics => '高级分析';

  @override
  String get homePwFeatStreak => '连续记录保护';

  @override
  String get homePwFeatSchedule => '专注计划';

  @override
  String get homePwFeatFaceId => '面容 ID 锁';

  @override
  String get homePwFeatNotif => '智能通知';

  @override
  String homePwMax(int n) {
    return '最多 $n';
  }

  @override
  String get homePwSecure => '安全支付';

  @override
  String get homePwCancelAnytime => '随时取消';

  @override
  String get homePwPrivacyFirst => '隐私优先';

  @override
  String get homePwRestore => '恢复购买';

  @override
  String get homePwTerms => '服务条款';

  @override
  String get homePwPrivacyPolicy => '隐私政策';

  @override
  String get homePwWelcome => '欢迎使用 Pausey Pro！';

  @override
  String get homePwNothingToRestore => '未找到以往购买记录。';

  @override
  String get homePwRestored => '你的 Pro 权限已激活。';

  @override
  String get homePwLinkSoon => '此页面即将在我们的网站上开放。';

  @override
  String get homePwYouArePro => '你已是 Pro，尽情享用！';

  @override
  String get homePwClose => '关闭';

  @override
  String get homeAvgLegend => '7 天平均';

  @override
  String homeGoalOf(String done, String goal) {
    return '$done / $goal';
  }

  @override
  String get homeBest => '最佳:';

  @override
  String get homeMyApps => '我的应用';

  @override
  String get homeManageApps => '管理应用';

  @override
  String get homeUnblockApps => '解除屏蔽';

  @override
  String homeAppsLocked(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已锁定 $count 个应用',
    );
    return '$_temp0';
  }

  @override
  String homeAppNamesMore(String names, int count) {
    return '$names +$count';
  }

  @override
  String get homeNoLockedApps => '还没有锁定的应用';

  @override
  String get homeNoLockedAppsSub => '选出总让你停不下来的应用';

  @override
  String get insightsAnalytics => '分析';

  @override
  String get insightsScreenTime => '屏幕使用时间';

  @override
  String get insightsToday => '今天';

  @override
  String get insightsWeek => '周';

  @override
  String get insightsMonth => '月';

  @override
  String get insightsProductivity => '效率得分';

  @override
  String insightsPts(String delta) {
    return '$delta 分';
  }

  @override
  String get insightsVsLastWeek => '较上周';

  @override
  String get insightsVsLastMonth => '较上月';

  @override
  String insightsScoreDays(int n) {
    return '$n 天得分';
  }

  @override
  String get insightsFocusHours => '专注时长';

  @override
  String get insightsThisWeek => '本周';

  @override
  String get insightsThisMonth => '本月';

  @override
  String insightsGoalOf(String done, String goal) {
    return '$done / 目标 $goal';
  }

  @override
  String get insightsFocusScore => '专注';

  @override
  String get insightsGoals => '目标';

  @override
  String get insightsConsistency => '坚持度';

  @override
  String get insightsWeeklyFocus => '本周专注时长';

  @override
  String insightsDailyFocus(int n) {
    return '近 $n 天每日专注';
  }

  @override
  String insightsBestDay(String day, String time) {
    return '最佳：$day · $time';
  }

  @override
  String insightsAvgDay(String time) {
    return '平均 $time / 天';
  }

  @override
  String get insightsMonthlyTrends => '月度趋势';

  @override
  String get insightsActual => '实际';

  @override
  String get insightsGoal => '目标';

  @override
  String insightsWk(int n) {
    return '第$n周';
  }

  @override
  String insightsWeekBeat(int n, String time) {
    return '第 $n 周超出目标 $time';
  }

  @override
  String insightsWeekShort(int n, String time) {
    return '最佳为第 $n 周，距目标差 $time';
  }

  @override
  String get insightsGoalCompletion => '目标完成度';

  @override
  String insightsDaysOf(int done, int total) {
    return '$done/$total 天';
  }

  @override
  String get insightsNoGoals => '还没有目标。添加一个即可在此查看进度。';

  @override
  String get insightsManageGoals => '管理';

  @override
  String insightsGoalFocus(String hours) {
    return '每日专注：$hours 小时';
  }

  @override
  String get insightsGoalBlock => '屏蔽社交应用';

  @override
  String insightsGoalPomo(int n) {
    return '每天 $n 个番茄钟';
  }

  @override
  String insightsGoalScreen(String time) {
    return '屏幕时间少于 $time';
  }

  @override
  String get insightsGoalPhoneFree => '无手机时间';

  @override
  String get insightsEmptyBadge => '暂无专注';

  @override
  String get insightsEmptyTitle => '完成一次专注即可查看统计';

  @override
  String get insightsEmptyBody => '完成一次专注后，你的得分、图表和目标进度会显示在这里。';

  @override
  String get insightsEmptyCta => '开始专注';

  @override
  String get insightsDailyUsage => '每日使用';

  @override
  String get insightsFocusTime => '专注时间';

  @override
  String get insightsVsAvg => '较平均';

  @override
  String get insightsUsageByDay => '每日使用情况';

  @override
  String get insightsUsageByWeek => '每周使用情况';

  @override
  String get insightsUsage => '使用';

  @override
  String insightsTrend(int n) {
    return '$n 天趋势';
  }

  @override
  String get insightsImproving => '在改善';

  @override
  String get insightsRising => '在上升';

  @override
  String insightsDaysAgo(int n) {
    return '$n 天前';
  }

  @override
  String get insightsMostUsed => '最常用应用';

  @override
  String get insightsAllApps => '全部应用';

  @override
  String get insightsBreakdown => '使用分布';

  @override
  String get insightsTotal => '合计';

  @override
  String get insightsNoUsage => '此期间没有屏幕时间记录。';

  @override
  String get insightsLockApp => '锁定此应用';

  @override
  String insightsLocked(String app) {
    return '$app 已锁定';
  }

  @override
  String get insightsCatSocial => '社交';

  @override
  String get insightsCatVideo => '视频';

  @override
  String get insightsCatGames => '游戏';

  @override
  String get insightsCatShopping => '购物';

  @override
  String get insightsCatCommunity => '社区';

  @override
  String get insightsCatOther => '其他';

  @override
  String nativeBlockTitle(String app) {
    return '$app 已暂停';
  }

  @override
  String get nativeReasonLimit => '今天这个应用的使用时间已用完。';

  @override
  String get nativeReasonSchedule => '当前锁定时段正在生效。';

  @override
  String get nativeReasonGlobal => '此应用已在 Pausey 中锁定。';

  @override
  String get nativeReasonFocus => '你正在专注时段中。';

  @override
  String get nativeClose => '关闭应用';

  @override
  String get nativeNotifTitle => 'Pausey 正在执行你的限制';

  @override
  String get nativeNotifText => '应用限制和锁定时段已开启';

  @override
  String get profileSettings => '设置';

  @override
  String get profileGuestName => '访客';

  @override
  String get profileGuestBadge => '访客 · 仅保存在本机';

  @override
  String get profileEditName => '编辑名字';

  @override
  String get profileNameHint => '你的名字';

  @override
  String get profileSave => '保存';

  @override
  String profileMemberSince(String date) {
    return '$date 加入';
  }

  @override
  String get profileProActive => 'Pro · 已激活';

  @override
  String get profileFree => '免费版';

  @override
  String get profileUpgrade => '升级';

  @override
  String get profileBadges => '徽章';

  @override
  String get profileNoBadges => '完成专注即可获得徽章';

  @override
  String get profileFocusTime => '专注时长';

  @override
  String get profileGoalsDone => '已完成目标';

  @override
  String get profileDayStreak => '连续天数';

  @override
  String get profileAppsBlocked => '已屏蔽应用';

  @override
  String get profileFocusActivity => '专注记录';

  @override
  String get profileLast4Weeks => '最近4周';

  @override
  String get profileRecentActivity => '最近动态';

  @override
  String get profileSessionDone => '完成一次专注';

  @override
  String get profileSessionStopped => '提前结束专注';

  @override
  String get profileModePomodoro => '番茄钟';

  @override
  String get profileModeDeep => '深度工作';

  @override
  String get profileModeCustom => '自定义';

  @override
  String get profileJustNow => '刚刚';

  @override
  String profileAgoMinutes(int n) {
    return '$n分钟前';
  }

  @override
  String profileAgoHours(int n) {
    return '$n小时前';
  }

  @override
  String get profileYesterday => '昨天';

  @override
  String get profileEmptyTitle => '还没有专注记录';

  @override
  String get profileEmptyBody => '开始第一次专注，你的记录、连续天数和徽章会显示在这里。';

  @override
  String get profileStartFocus => '开始专注';

  @override
  String get profileMyGoals => '我的目标';

  @override
  String get profileStreaks => '连续记录与徽章';

  @override
  String get profileSubscription => '订阅';

  @override
  String get profileSignOutTitle => '要退出登录吗？';

  @override
  String get profileSignOutBody => '你可以随时重新登录。';

  @override
  String get profileSecNotifications => '通知';

  @override
  String get profileSecAppearance => '外观';

  @override
  String get profileSecFocus => '专注与屏蔽';

  @override
  String get profileSecPrivacy => '隐私与安全';

  @override
  String get profileSecAccount => '账户';

  @override
  String get profilePush => '推送通知';

  @override
  String get profilePushSub => '专注提醒与通知';

  @override
  String get profileReminder => '开始专注提醒';

  @override
  String profileReminderSub(String time) {
    return '每天 $time';
  }

  @override
  String get profileStreakAlerts => '连续提醒';

  @override
  String get profileStreakAlertsSub => '在连续中断前提醒';

  @override
  String get profileGoalMilestones => '目标里程碑';

  @override
  String get profileGoalMilestonesSub => '达成目标时';

  @override
  String get profileDarkMode => '深色模式';

  @override
  String get profileOn => '开';

  @override
  String get profileOff => '关';

  @override
  String get profileTextSize => '文字大小';

  @override
  String get profileTextSmall => '小';

  @override
  String get profileTextMedium => '中';

  @override
  String get profileTextLarge => '大';

  @override
  String get profileTextHuge => '特大';

  @override
  String get profilePomodoroLen => '番茄钟时长';

  @override
  String get profileBreakLen => '休息时长';

  @override
  String profileMinutes(int n) {
    return '$n 分钟';
  }

  @override
  String get profileFaceIdUnlock => '解锁需 Face ID';

  @override
  String get profileFaceIdUnlockSub => '解锁应用前确认';

  @override
  String get profileBypass => '紧急解锁';

  @override
  String profileBypassSub(int n) {
    return '每天 $n 次';
  }

  @override
  String get profileAppLock => '用 Face ID 锁定 Pausey';

  @override
  String get profileAppLockSub => '打开应用时验证';

  @override
  String get profileHideUsage => '隐藏使用数据';

  @override
  String get profileHideUsageSub => '隐藏屏幕使用时间';

  @override
  String get profileClearData => '清除活动数据';

  @override
  String get profileClearDataSub => '删除专注与目标记录';

  @override
  String get profileClearTitle => '要清除活动数据吗？';

  @override
  String get profileClearBody => '这将删除本机所有专注记录和目标打卡，且无法撤销。';

  @override
  String get profileClear => '清除';

  @override
  String get profileCleared => '已清除活动数据';

  @override
  String get profileExport => '导出我的数据';

  @override
  String get profileExportSub => '复制为 JSON';

  @override
  String get profileExported => '数据已复制到剪贴板';

  @override
  String get profileStreaksTitle => '连续记录';

  @override
  String get profileShare => '分享';

  @override
  String profileShareText(int n) {
    return '我已用 Pausey 连续专注 $n 天！';
  }

  @override
  String get profileCopied => '已复制';

  @override
  String profileNextMilestone(int n) {
    return '继续加油，距下一个里程碑还有 $n 天！';
  }

  @override
  String get profileAllMilestones => '已达成全部里程碑，传奇！';

  @override
  String get profileStartStreak => '今天完成一次专注，开启连续记录。';

  @override
  String get profileBest => '最佳';

  @override
  String get profileThisWeek => '本周';

  @override
  String profileDaysCompleted(int n) {
    return '已完成 $n/7 天';
  }

  @override
  String get profileCompleted => '完成';

  @override
  String get profilePartial => '部分';

  @override
  String get profileMissed => '错过';

  @override
  String get profilePrevMonth => '上个月';

  @override
  String get profileNextMonth => '下个月';

  @override
  String get profileMilestones => '连续里程碑';

  @override
  String get profileAchievements => '成就';

  @override
  String get profileAchOnFire => '火力全开';

  @override
  String get profileAchIronWill => '钢铁意志';

  @override
  String get profileAchFocusMaster => '专注大师';

  @override
  String get profileAchMonk => '数字隐士';

  @override
  String get profileAchLegend => '传奇';

  @override
  String get profileAchSpeed => '效率狂人';

  @override
  String profileAchStreakDesc(int n) {
    return '连续 $n 天';
  }

  @override
  String profileAchSessionsDesc(int n) {
    return '完成 $n 次专注';
  }

  @override
  String profileAchHoursDesc(int n) {
    return '累计专注 $n 小时';
  }

  @override
  String profileAchDayDesc(int n) {
    return '一天完成 $n 次';
  }

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

  @override
  String get statesTitle => '状态';

  @override
  String get statesSubtitle => '错误、空白与加载界面';

  @override
  String get statesNoInternet => '无网络';

  @override
  String get statesConnectionLost => '连接中断';

  @override
  String get statesOfflineTitle => '您已离线';

  @override
  String get statesOfflineMsg =>
      'Pausey 暂时无法连接服务器。请检查 Wi-Fi 或移动数据后重试——本地数据安全无虞。';

  @override
  String get statesTryAgain => '重试';

  @override
  String get statesOpenSettings => '打开设置';

  @override
  String get statesOfflineMode => '离线模式已开启';

  @override
  String get statesLimited => '受限';

  @override
  String get statesAvailable => '可用';

  @override
  String get statesUnavailable => '不可用';

  @override
  String get statesCapSessions => '查看以往专注';

  @override
  String get statesCapApps => '已锁定应用列表';

  @override
  String get statesCapTimer => '本地专注计时';

  @override
  String get statesCapSync => '同步连续记录与目标';

  @override
  String get statesCapAnalytics => '刷新分析数据';

  @override
  String get statesOfflineNote => '所有专注数据都保存在本地，离线也不会丢失。';

  @override
  String get statesBackOnline => '已恢复联网——全部同步完成';

  @override
  String get statesShowAgain => '再次显示';

  @override
  String get statesPermDenied => '权限被拒绝';

  @override
  String get statesPermRequired => '需要权限';

  @override
  String get statesPermTitle => '访问受阻';

  @override
  String get statesPermMsg => 'Pausey 需要屏幕使用时间权限才能屏蔽应用，否则屏蔽功能无法使用。';

  @override
  String get statesGrant => '授予权限';

  @override
  String get statesLearnMore => '了解更多';

  @override
  String get statesLearnMoreMsg => '屏幕使用时间权限让 Pausey 暂停干扰应用，数据不会离开手机。';

  @override
  String get statesRequiredPerms => '所需权限';

  @override
  String get statesPermNotif => '通知';

  @override
  String get statesPermScreenTime => '屏幕使用时间';

  @override
  String get statesPermUsage => '应用使用统计';

  @override
  String get statesPermBio => '面容 ID / 生物识别';

  @override
  String get statesGranted => '已授予';

  @override
  String get statesDenied => '已拒绝';

  @override
  String get statesPermNote => '没有屏幕使用时间权限仍可计时，但无法屏蔽应用。';

  @override
  String get statesAccessGranted => '已授权——屏蔽功能就绪';

  @override
  String get statesDataNA => '数据不可用';

  @override
  String get statesSyncFailed => '同步失败';

  @override
  String get statesLoadTitle => '数据加载失败';

  @override
  String get statesLoadMsg => '获取分析数据时出错，可能是服务器临时故障——本地数据未受影响。';

  @override
  String get statesRetrySync => '重新同步';

  @override
  String get statesUseCached => '使用缓存';

  @override
  String get statesErrorDetails => '错误详情';

  @override
  String get statesErrorCode => '错误代码';

  @override
  String get statesTimestamp => '时间';

  @override
  String get statesRetryCount => '重试次数';

  @override
  String statesAttempts(int n) {
    return '$n / 3 次';
  }

  @override
  String get statesReport => '报告给客服';

  @override
  String get statesReported => '谢谢，报告已发送';

  @override
  String get statesCachedNote => '在此期间可使用上次成功同步的缓存数据。';

  @override
  String get statesDataLoaded => '分析已加载';

  @override
  String get statesCachedShown => '正在显示缓存数据';

  @override
  String statesWeekFocus(String time) {
    return '本周专注：$time';
  }

  @override
  String get statesEmpty => '空状态';

  @override
  String get statesNothingYet => '暂无';

  @override
  String get statesEmptyTitle => '还没有专注记录';

  @override
  String get statesEmptyMsg => '开始第一次专注，你的进度会显示在这里。';

  @override
  String get statesStartFocus => '开始专注';

  @override
  String get statesLoadingSection => '加载状态';

  @override
  String get statesDashLoading => '仪表盘';

  @override
  String get statesAnalyticsLoading => '分析';

  @override
  String get statesGoalsLoading => '目标';

  @override
  String get statesProfileLoading => '我的';

  @override
  String get statesCrunching => '正在整理数据…';

  @override
  String get statesLoadingGoals => '正在加载目标…';

  @override
  String get statesLoadingProfile => '正在加载资料…';

  @override
  String get statesReplay => '重播';

  @override
  String get stHowCaption => '使用方式';

  @override
  String stHow1(String app) {
    return '你又打开了$app';
  }

  @override
  String get stHow2 => '你开始刷屏，但…';

  @override
  String get stHow3 => 'Pausey 会温和地让它暂停。';

  @override
  String get stHow4 => '并在到限前提醒你';

  @override
  String get stYourApp => '你的应用';

  @override
  String get stTapToContinue => '轻触继续';

  @override
  String get stNudgeGeneric => '今日额度快用完了';

  @override
  String get stPermTitle => '开启几项权限';

  @override
  String get stPermUsageTitle => '屏幕使用时间';

  @override
  String get stPermUsageWhy => '显示每天的屏幕使用时间，以及何时达到额度。';

  @override
  String get stPermOverlayTitle => '显示在其他应用上层';

  @override
  String get stPermOverlayWhy => '让 Pausey 能在让你分心的应用上显示暂停画面。';

  @override
  String get stPermNotifTitle => '通知';

  @override
  String get stPermNotifWhy => '在额度用完前温和提醒你，之后可以随时关闭。';

  @override
  String get stPermMore => '还有一件事……';

  @override
  String get stPermA11yTitle => '无障碍';

  @override
  String get stPermA11yWhy => '即时识别正在打开的应用，让暂停立刻生效。';

  @override
  String get stPermA11yNote => '部分手机接下来会显示自己的警告页面，这很正常——你可以随时在设置中关闭。';

  @override
  String get stPermOnHint => '已开启。如需关闭，请前往 Android 设置 › 应用 › Pausey。';

  @override
  String get stA11yDialogTitle => '为什么需要无障碍权限？';

  @override
  String get stA11yDialogBody =>
      'Pausey 仅使用无障碍权限来识别正在打开的应用，让你的额度和时间表立即生效，并让保护持续稳定运行。';

  @override
  String get stA11yNot => 'Pausey 不会：';

  @override
  String get stA11yNot1 => '读取或收集你屏幕上的内容';

  @override
  String get stA11yNot2 => '存储个人信息';

  @override
  String get stA11yNot3 => '把任何内容传出你的手机';

  @override
  String get stPw1 => '让每天更从容的计划';

  @override
  String get stPw2 => '不会被你说服的锁';

  @override
  String get stPw3 => '每周查看你的进步';

  @override
  String get stPwToday => '今天';

  @override
  String get stPwGoal => '你的目标';

  @override
  String stPwWeek(int n) {
    return '第$n周';
  }

  @override
  String get stPwFirstWeek => '你的第一周从现在开始';

  @override
  String get stPwFocusWeek => '每周专注时长';

  @override
  String nudgeTitle(String app) {
    return '$app 额度快用完了';
  }

  @override
  String nudgeText(String used, String limit) {
    return '今天已用 $used，共 $limit';
  }
}
