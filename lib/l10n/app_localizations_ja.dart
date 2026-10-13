// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get ob1Title => 'スマホ依存を減らそう';

  @override
  String get ob1Body => 'デジタル習慣をコントロールして、気が散るアプリに使う時間を減らしましょう。';

  @override
  String get ob1StatAvg => '1日の平均スクリーンタイム';

  @override
  String get ob1StatSocial => 'SNSに費やす時間';

  @override
  String get ob2SelectApps => 'アプリを選択';

  @override
  String get ob2Title => '気が散るアプリをロック';

  @override
  String get ob2Body => '強力なアプリロック機能で、SNSやゲームなどの誘惑をブロック。';

  @override
  String get ob2Feature1 => 'ワンタップでどのアプリもブロック';

  @override
  String get ob2Feature2 => 'ロック時間と集中タイムを設定';

  @override
  String get ob2Feature3 => 'パスワードでロックを守って決意をキープ';

  @override
  String get sheetTitle => 'アプリを選択';

  @override
  String get sheetTotalLocked => 'ロック合計';

  @override
  String get sheetAppsSelected => '個のアプリを選択';

  @override
  String get sheetTimeSaved => '節約した時間';

  @override
  String get sheetPerDayAvg => '1日平均';

  @override
  String sheetHoursValue(String h) {
    return '$h時間';
  }

  @override
  String get sheetSearchHint => 'アプリを検索...';

  @override
  String get sheetCatAll => 'すべて';

  @override
  String get sheetCatSocial => 'SNS';

  @override
  String get sheetCatEntertainment => 'エンタメ';

  @override
  String get sheetCatGames => 'ゲーム';

  @override
  String get sheetAppsHeader => 'アプリ';

  @override
  String sheetSelectedCount(int count) {
    return '$count件選択中';
  }

  @override
  String get sheetNoApps => 'アプリが見つかりません';

  @override
  String get sheetLockSchedule => 'ロックスケジュール';

  @override
  String get sheetAddCustomSemantic => 'カスタムのロックスケジュールを追加';

  @override
  String get sheetCustomBadge => '+ カスタム';

  @override
  String get sheetSchedMorning => '朝';

  @override
  String get sheetSchedWork => '仕事';

  @override
  String get sheetSchedEvening => '夜';

  @override
  String get sheetEveryDay => '毎日';

  @override
  String get sheetWeekdays => '平日';

  @override
  String get sheetWeekends => '週末';

  @override
  String get sheetUnlockMethod => 'ロック解除方法';

  @override
  String get sheetPin => 'PINコード';

  @override
  String get sheetPinSub => '4桁のPIN';

  @override
  String get sheetFaceId => 'Face ID';

  @override
  String get sheetFaceIdSub => '生体認証';

  @override
  String get sheetTouchId => 'Touch ID';

  @override
  String get sheetTouchIdSub => '指紋';

  @override
  String get sheetFooter => 'あとからいつでも変更できます';

  @override
  String get sheetConfirmLock => 'ロックを確定';

  @override
  String sheetRemove(String name) {
    return '$nameを削除';
  }

  @override
  String get sheetCustomTitle => 'カスタムスケジュール';

  @override
  String get sheetCustomBody => 'この時間中、選択したアプリはロックされます。';

  @override
  String get sheetNameLabel => '名前';

  @override
  String get sheetNameHint => '例：勉強時間';

  @override
  String get sheetStarts => '開始';

  @override
  String get sheetEnds => '終了';

  @override
  String get sheetSameTime => '開始と終了が同じです';

  @override
  String sheetLockedFor(String duration) {
    return '$durationロック';
  }

  @override
  String sheetLockedForOvernight(String duration) {
    return '$durationロック（夜間）';
  }

  @override
  String sheetDurH(int h) {
    return '$h時間';
  }

  @override
  String sheetDurM(int m) {
    return '$m分';
  }

  @override
  String sheetDurHM(int h, int m) {
    return '$h時間$m分';
  }

  @override
  String get sheetLockStartsAt => 'ロック開始時刻';

  @override
  String get sheetLockEndsAt => 'ロック終了時刻';

  @override
  String get sheetRepeatOn => '繰り返す曜日';

  @override
  String get sheetAddSchedule => 'スケジュールを追加';

  @override
  String get sheetCustomDefaultName => 'カスタム';

  @override
  String sheetChangeTime(String label, String time) {
    return '$label $time。時間を変更';
  }

  @override
  String get ob3Title => '毎日集中をキープ';

  @override
  String get ob3Body => 'ポモドーロとディープフォーカスで生産性を高め、もっと成果を出しましょう。';

  @override
  String get ob3Pomodoro => 'ポモドーロ';

  @override
  String ob3PomodoroSub(int min) {
    return '$min分セッション';
  }

  @override
  String get ob3DeepFocus => 'ディープフォーカス';

  @override
  String ob3DeepFocusSub(int min) {
    return '$min分フロー';
  }

  @override
  String get ob3StatBoost => '生産性アップ';

  @override
  String ob3StatStreakValue(int days) {
    return '$days日';
  }

  @override
  String get ob3StatStreak => '連続記録を更新';

  @override
  String get ob3StatGoal => '目標達成';

  @override
  String get ob3StartTimer => 'タイマー開始';

  @override
  String get ob3PauseTimer => 'タイマー一時停止';

  @override
  String get ob4Title => '進捗をチェック';

  @override
  String get ob4Body => 'スクリーンタイム、集中時間、目標、生産性を美しい分析で確認。';

  @override
  String get ob4Weekly => '週間';

  @override
  String get ob4WeeklySub => 'レポート';

  @override
  String get ob4Goals => '目標';

  @override
  String get ob4GoalsSub => 'トラッカー';

  @override
  String get ob4Insights => 'インサイト';

  @override
  String get ob4InsightsSub => 'AIコーチ';

  @override
  String get ob4Streaks => '連続記録';

  @override
  String get ob4StreaksSub => '＆バッジ';

  @override
  String get ob5Title => '1日の平均スクリーンタイムは？';

  @override
  String get ob5Subtitle => 'スマホのみ。おおよそで大丈夫です。';

  @override
  String get ob5More7 => '7時間以上';

  @override
  String get ob5H5to7 => '5-7時間';

  @override
  String get ob5H4to5 => '4-5時間';

  @override
  String get ob5H3to4 => '3-4時間';

  @override
  String get ob5H1to3 => '1-3時間';

  @override
  String get ob5Under1 => '1時間未満';

  @override
  String get ob6Title => '職業は何ですか？';

  @override
  String get ob6Subtitle => '働き方に合わせて集中プランをカスタマイズします。';

  @override
  String get ob6Software => 'ソフトウェア開発';

  @override
  String get ob6Founder => 'CEO / 創業者';

  @override
  String get ob6Remote => 'リモートワーカー';

  @override
  String get ob6Finance => '金融 / 業務 / コンサルティング';

  @override
  String get ob6Art => 'アート / コンテンツ';

  @override
  String get ob6Education => '教育';

  @override
  String get ob6Others => 'その他';

  @override
  String get ob7Title => '1日のスクリーンタイム目標を設定';

  @override
  String get ob7Subtitle => 'いつでも変更できます。上限が近づくとお知らせします。';

  @override
  String ob7Hours(String hours) {
    return '$hours時間';
  }

  @override
  String get ob7PerDay => '1日あたり';

  @override
  String ob7HoursPerDay(String hours) {
    return '1日 $hours';
  }

  @override
  String get ob7DialLabel => '1日のスクリーンタイム目標';

  @override
  String get ob7InfoNote => '平均的な人は1日4時間以上スマホを使っています。目標設定は時間を取り戻す第一歩です。';

  @override
  String get ob8Title => '必要な権限を有効にする';

  @override
  String get ob8Subtitle => 'アクセスを許可して Pausey をフルに活用しましょう。';

  @override
  String get ob8UsageTitle => '使用状況へのアクセス';

  @override
  String get ob8UsageSub => 'アプリの使用状況を確認し、集中セッションを実行します。';

  @override
  String get ob8NotifTitle => '通知';

  @override
  String get ob8NotifSub => 'タイムリーなリマインダーと進捗のお知らせ。';

  @override
  String get ob8TrackTitle => 'アプリ使用状況を記録';

  @override
  String get ob8TrackSub => '日別・週別の内訳。';

  @override
  String get ob9Title => '準備完了！';

  @override
  String get ob9Subtitle => '集中できる環境が整いました。';

  @override
  String get ob9Enter => 'Pausey を始める';

  @override
  String get ob9Replay => 'オンボーディングをもう一度';

  @override
  String get ob9ScreenTime => 'スクリーンタイム';

  @override
  String get ob9AppsLocked => 'ロック中のアプリ';

  @override
  String get ob9Permissions => '権限';

  @override
  String get ob9FocusMode => '集中モード';

  @override
  String get ob9AllOk => 'すべてOK';

  @override
  String get ob9On => 'オン';

  @override
  String get ob9Done => '完了';

  @override
  String get ob9StreakTitle => '1日目の連続記録がスタート';

  @override
  String get ob9StreakSub => 'セッションを完了して記録を続けよう';

  @override
  String get blockTitle => 'アプリロック';

  @override
  String blockSubtitle(int locked, int total) {
    return '$total個中$locked個のアプリをロック中';
  }

  @override
  String get blockAddApp => '追加';

  @override
  String blockLockedChip(int n) {
    return 'ロック $n';
  }

  @override
  String blockUnlockedChip(int n) {
    return '解除 $n';
  }

  @override
  String blockScheduledChip(int n) {
    return '予定 $n';
  }

  @override
  String get blockFaceIdTitle => 'Face ID保護';

  @override
  String get blockFaceIdSub => '解除にFace IDが必要';

  @override
  String get blockFaceIdUnavailable => 'この端末では生体認証を利用できません';

  @override
  String get blockFaceIdReason => '有効にするため本人確認してください';

  @override
  String get blockFaceIdFailed => '確認できませんでした（オフのまま）';

  @override
  String get blockScheduleTitle => 'スケジュールロック';

  @override
  String get blockStart => '開始';

  @override
  String get blockEnd => '終了';

  @override
  String get blockNeedOneDay => '少なくとも1日は選択してください';

  @override
  String get blockManagedApps => '管理中のアプリ';

  @override
  String get blockLockAll => 'すべてロック';

  @override
  String get blockAllLocked => 'すべてのアプリをロックしました';

  @override
  String get blockSched => '予定';

  @override
  String get blockOnlySchedule => 'スケジュール中のみロック';

  @override
  String get blockOnlyScheduleSub => 'オフなら終日ロック';

  @override
  String get blockLockedLabel => 'ロック';

  @override
  String get blockRemove => 'リストから削除';

  @override
  String blockRemoved(String app) {
    return '$appを削除しました';
  }

  @override
  String get blockUndo => '元に戻す';

  @override
  String get blockAppsUpdated => 'アプリを更新しました';

  @override
  String get blockCatSocial => 'SNS';

  @override
  String get blockCatVideo => '動画';

  @override
  String get blockCatGames => 'ゲーム';

  @override
  String get blockCatShopping => 'ショッピング';

  @override
  String get blockCatCommunity => 'コミュニティ';

  @override
  String get blockCatOther => 'その他';

  @override
  String get blockEmptyBadge => 'ブロックなし';

  @override
  String get blockEmptyTitle => 'まだアプリがありません';

  @override
  String get blockEmptyMsg => '気が散るアプリを追加すると、Pauseyがロックします。';

  @override
  String get blockEmergencyTitle => '緊急解除';

  @override
  String blockEmergencySub(int n) {
    return '一時的にすべて解除 · 今日あと$n回';
  }

  @override
  String get blockEmergencyOff => '設定でオフ';

  @override
  String get blockEmergencyUse => '使う';

  @override
  String get blockEmergencyConfirmTitle => '緊急解除を使いますか？';

  @override
  String blockEmergencyConfirmMsg(int n) {
    return '今日残り$n回のうち1回を使います。本当に必要なときだけ使いましょう。';
  }

  @override
  String get blockEmergencyUsed => '緊急解除しました';

  @override
  String get blockEmergencyNone => '今日はもう使えません';

  @override
  String get appName => 'Pausey';

  @override
  String get tagline => '自分の時間を取り戻そう';

  @override
  String get versionLabel => 'バージョン 2.0 · App Store 版';

  @override
  String get skip => 'スキップ';

  @override
  String get continueLabel => '続ける';

  @override
  String get back => '戻る';

  @override
  String get freeToStart => '無料で開始 · クレジットカード不要';

  @override
  String get dataStaysOnDevice => 'データが端末の外に出ることはありません。';

  @override
  String get switchToLight => 'ライトモードに切り替え';

  @override
  String get switchToDark => 'ダークモードに切り替え';

  @override
  String get language => '言語';

  @override
  String get phoneLanguage => '端末の言語';

  @override
  String get authTitle => 'スクロールを止めて。\n一日を自分のものに。';

  @override
  String get authSubtitle => 'アカウントを作成して目標と連続記録を同期するか、ゲストとして Pausey を試しましょう。';

  @override
  String get continueWithApple => 'Apple で続ける';

  @override
  String get continueWithGoogle => 'Google で続ける';

  @override
  String get signUpWithEmail => 'メールで登録';

  @override
  String get continueAsGuest => 'ゲストとして続ける';

  @override
  String get guestNote => 'ゲストデータはこの端末にのみ保存されます。';

  @override
  String get or => 'または';

  @override
  String get haveAccount => 'アカウントをお持ちですか？';

  @override
  String get noAccount => 'Pausey は初めてですか？';

  @override
  String get logIn => 'ログイン';

  @override
  String get signUp => '登録';

  @override
  String get createAccount => 'アカウントを作成';

  @override
  String get signUpTitle => 'アカウントを作成';

  @override
  String get signUpSubtitle => '穏やかなスクリーン習慣を始めましょう。';

  @override
  String get logInTitle => 'おかえりなさい';

  @override
  String get logInSubtitle => 'ログインして連続記録を続けましょう。';

  @override
  String get fullName => '氏名';

  @override
  String get email => 'メール';

  @override
  String get password => 'パスワード';

  @override
  String get confirmPassword => 'パスワードを確認';

  @override
  String get showPassword => 'パスワードを表示';

  @override
  String get hidePassword => 'パスワードを隠す';

  @override
  String get forgotPassword => 'パスワードをお忘れですか？';

  @override
  String get resetTitle => 'パスワードをリセット';

  @override
  String get resetSubtitle => 'メールアドレスを入力すると、リセット用リンクをお送りします。';

  @override
  String get sendLink => 'リンクを送信';

  @override
  String get resetSent => '受信トレイでリセット用リンクを確認してください。';

  @override
  String get agreeTerms => '利用規約とプライバシーポリシーに同意します';

  @override
  String get passwordStrength => 'パスワードの強度';

  @override
  String get strengthWeak => '弱い';

  @override
  String get strengthOk => '普通';

  @override
  String get strengthStrong => '強い';

  @override
  String get errNameRequired => '名前を入力してください';

  @override
  String get errEmailInvalid => '有効なメールアドレスを入力してください';

  @override
  String get errPasswordShort => '8文字以上にしてください';

  @override
  String get errPasswordMismatch => 'パスワードが一致しません';

  @override
  String get errTerms => '続けるには規約に同意してください';

  @override
  String get authErr_not_configured => 'ログインはまだ設定されていません。ゲストとして続けられます。';

  @override
  String get authErr_cancelled => 'ログインがキャンセルされました。';

  @override
  String get authErr_invalid_email => 'メールアドレスが正しくないようです。';

  @override
  String get authErr_wrong_password => 'メールアドレスまたはパスワードが正しくありません。';

  @override
  String get authErr_user_not_found => 'このメールのアカウントはありません。登録しますか？';

  @override
  String get authErr_email_in_use => 'このメールのアカウントは既に存在します。ログインしてください。';

  @override
  String get authErr_weak_password => 'より強いパスワードを選んでください。';

  @override
  String get authErr_network => 'インターネットに接続されていません。もう一度お試しください。';

  @override
  String get authErr_too_many => '試行回数が多すぎます。1分待ってからもう一度お試しください。';

  @override
  String get authErr_unknown => '問題が発生しました。もう一度お試しください。';

  @override
  String homeHello(String name) {
    return 'こんにちは、$nameさん';
  }

  @override
  String get homeHelloGuest => 'こんにちは';

  @override
  String get homeGuestBadge => 'ゲストモード · この端末に保存';

  @override
  String get homeSubtitle => 'プランの準備ができました。選んだ内容はこちら。';

  @override
  String get homeDailyGoal => '1日の目標';

  @override
  String get homeLockedApps => 'ロック中のアプリ';

  @override
  String get homeScreenTime => '現在のスクリーンタイム';

  @override
  String get homeNotSet => '未設定';

  @override
  String get homeCreateAccount => 'バックアップするにはアカウントを作成';

  @override
  String get signOut => 'ログアウト';

  @override
  String get signOutGuestWarn => 'ログアウトするとこの端末のゲストデータが削除されます。';

  @override
  String get cancel => 'キャンセル';

  @override
  String get focusModePomodoro => 'ポモドーロ';

  @override
  String get focusModeDeep => 'ディープフォーカス';

  @override
  String get focusModeCustom => 'カスタム';

  @override
  String get focusRemaining => '残り';

  @override
  String get focusBreakLabel => '休憩';

  @override
  String get focusReadyLabel => '準備完了';

  @override
  String get focusInSession => 'セッション中';

  @override
  String get focusPausedState => '一時停止中';

  @override
  String get focusOnBreak => '休憩中';

  @override
  String get focusIdleState => '再生をタップして開始';

  @override
  String get focusSessionsDone => '完了セッション';

  @override
  String get focusProgress => '進捗';

  @override
  String get focusBreakAfter => '休憩';

  @override
  String get focusFocusedToday => '今日の集中';

  @override
  String focusAppsBlocked(int count) {
    return '$count個のアプリをブロック';
  }

  @override
  String get focusAppsBlockedSub => 'このセッション中は誘惑をロックします。';

  @override
  String get focusNoApps => 'ブロック中のアプリなし';

  @override
  String get focusNoAppsSub => '集中中にロックするアプリを選択。';

  @override
  String get focusEdit => '編集';

  @override
  String get focusAdd => '追加';

  @override
  String get focusAmbient => '環境音';

  @override
  String get focusSoundOff => 'オフ';

  @override
  String get focusSoundRain => '雨';

  @override
  String get focusSoundForest => '森';

  @override
  String get focusSoundWaves => '波の音';

  @override
  String get focusSoundWhite => 'ホワイトノイズ';

  @override
  String get focusVolume => '音量';

  @override
  String get focusStart => '開始';

  @override
  String get focusPause => '一時停止';

  @override
  String get focusResume => '再開';

  @override
  String get focusStop => '停止';

  @override
  String get focusRestart => 'やり直す';

  @override
  String get focusSkipBreak => '休憩をスキップ';

  @override
  String get focusDurations => 'セッションの長さ';

  @override
  String focusMinutesN(int n) {
    return '$n分';
  }

  @override
  String get focusBreakLength => '休憩';

  @override
  String get focusCustomTitle => 'カスタム時間';

  @override
  String get focusSet => '設定';

  @override
  String get focusStopTitle => '早めに終了しますか？';

  @override
  String get focusStopBody => 'ここまでの集中時間は保存されます。';

  @override
  String get focusEndSession => '終了する';

  @override
  String get focusKeepGoing => '続ける';

  @override
  String get focusTooShort => '1分未満のため保存されません。';

  @override
  String get focusBreakOver => '休憩終了。次に進みますか？';

  @override
  String get focusBusy => 'モード変更は現在のセッション終了後に。';

  @override
  String get focusFirstHint => '最初のセッションはここから。再生を押そう。';

  @override
  String get focusCompleteA => 'セッション';

  @override
  String get focusCompleteB => '完了！';

  @override
  String get focusEndedTitle => 'セッション終了';

  @override
  String focusCompleteMsg(String mode) {
    return 'お見事！$modeセッションを集中して終えました。';
  }

  @override
  String get focusEndedMsg => '1分1分が力に。次は最後までやってみよう。';

  @override
  String get focusDurationLabel => '集中時間';

  @override
  String get focusMinUnit => '分';

  @override
  String get focusDayStreak => '連続日数';

  @override
  String get focusAppsLabel => 'ブロック中';

  @override
  String get focusTodayGoal => '今日の目標';

  @override
  String focusPctCompleted(int pct) {
    return '$pct%達成';
  }

  @override
  String focusPlusPct(int pct) {
    return 'このセッションで+$pct%';
  }

  @override
  String get focusMomentum => 'この勢いをキープ！';

  @override
  String get focusQuote1 => '強度より継続。一回一回が力になる。';

  @override
  String get focusQuote2 => '小さな集中の積み重ねが大きな成果に。';

  @override
  String get focusQuote3 => 'スクロールせず、積み上げた。もう一度。';

  @override
  String get focusStartNext => '次のセッションを開始';

  @override
  String get focusBackHome => 'ダッシュボードへ戻る';

  @override
  String get goalsTitle => 'マイ目標';

  @override
  String goalsSubtitle(int active, int done) {
    return '進行中 $active · 達成 $done';
  }

  @override
  String get goalsAdd => '目標を追加';

  @override
  String get goalsCompleted => '達成';

  @override
  String get goalsActive => '進行中';

  @override
  String get goalsStreak => '連続';

  @override
  String get goalsOverall => '全体の達成度';

  @override
  String goalsWeeklyHit(int hit, int total) {
    return '週の目標 $total 中 $hit 達成';
  }

  @override
  String goalsVsLastWeek(String delta) {
    return '先週比 $delta';
  }

  @override
  String get goalsFilterAll => 'すべて';

  @override
  String get goalsDone => '達成';

  @override
  String get goalsCatFocus => '集中';

  @override
  String get goalsCatDiscipline => '自制';

  @override
  String get goalsCatWellness => 'ウェルネス';

  @override
  String goalsTitleFocusHours(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '毎日の集中: $n時間',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleFocusDur(String duration) {
    return '毎日の集中: $duration';
  }

  @override
  String get goalsTitleBlock => 'SNSアプリをブロック';

  @override
  String goalsTitleSessions(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '1日$nポモドーロ',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleScreen(String duration) {
    return 'スクリーンタイム$duration未満';
  }

  @override
  String get goalsTitlePhoneFree => 'スマホなしの時間';

  @override
  String goalsDescFocus(String duration) {
    return '毎日$durationの深い集中を達成';
  }

  @override
  String goalsDescBlock(int n) {
    return 'ロックしたアプリを週$n日ロックしたままに';
  }

  @override
  String goalsDescSessions(int n) {
    return '毎日$n回以上の集中セッションを完了';
  }

  @override
  String goalsDescScreen(String duration) {
    return '1日のスマホ使用を$duration未満に';
  }

  @override
  String goalsDescPhoneFree(int n) {
    return '週$n日スマホなしで過ごし、毎日チェック';
  }

  @override
  String goalsProgressDays(int done, int total) {
    return '$done / $total 日';
  }

  @override
  String goalsProgressSessions(int done, int total) {
    return '$done / $total セッション';
  }

  @override
  String goalsStreakShort(int n) {
    return '$n日';
  }

  @override
  String goalsStreakN(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n日連続',
    );
    return '$_temp0';
  }

  @override
  String get goalsCheckIn => '今日を達成にする';

  @override
  String get goalsCheckedIn => '今日は達成';

  @override
  String get goalsCheckedSnack => 'やったね！今日を達成にしました。';

  @override
  String get goalsUncheckedSnack => '今日の達成を取り消しました。';

  @override
  String get goalsCreateNew => '新しい目標を作成';

  @override
  String get goalsEmptyBadge => 'はじめよう';

  @override
  String get goalsEmptyTitle => 'まだ目標がありません';

  @override
  String get goalsEmptyMsg => '小さな毎日の目標を決めれば、Pausey が記録します。';

  @override
  String get goalsFilterEmpty => 'このフィルターに合う目標はありません。';

  @override
  String get goalsNewGoal => '新しい目標';

  @override
  String get goalsEditGoal => '目標を編集';

  @override
  String get goalsType => '目標の種類';

  @override
  String get goalsTypeFocus => '集中時間';

  @override
  String get goalsTypeSessions => '集中セッション';

  @override
  String get goalsTypeBlock => 'アプリをブロック';

  @override
  String get goalsTypePhoneFree => 'スマホなしの日';

  @override
  String get goalsTypeScreen => 'スクリーンタイム上限';

  @override
  String get goalsCategory => 'カテゴリー';

  @override
  String get goalsTarget => '目標値';

  @override
  String get goalsPerDay => '1日あたり';

  @override
  String get goalsPerWeek => '週あたりの日数';

  @override
  String get goalsMaxPerDay => '1日の上限';

  @override
  String get goalsTitleOptional => 'タイトル（任意）';

  @override
  String get goalsSave => '目標を保存';

  @override
  String get goalsCreate => '目標を作成';

  @override
  String get goalsSavedSnack => '目標を保存しました';

  @override
  String get goalsCreatedSnack => '目標を作成しました';

  @override
  String get goalsEdit => '編集';

  @override
  String get goalsDelete => '目標を削除';

  @override
  String get goalsDeleteQ => 'この目標を削除しますか？';

  @override
  String get goalsDeleteMsg => '記録も削除されます。元に戻せません。';

  @override
  String get goalsDeletedSnack => '目標を削除しました';

  @override
  String get goalsComplete => '達成';

  @override
  String get goalsDaysActive => '活動日';

  @override
  String get goalsTotalTime => '合計時間';

  @override
  String get goalsSessionsLabel => 'セッション';

  @override
  String get goals7Day => '7日間の達成度';

  @override
  String get goals7DaysAgo => '7日前';

  @override
  String get goalsToday => '今日';

  @override
  String goalsTodayDate(String date) {
    return '今日 $date';
  }

  @override
  String goalsYesterdayDate(String date) {
    return '昨日 $date';
  }

  @override
  String get goalsMilestones => 'マイルストーン';

  @override
  String get goalsMsFirst => '初日を達成';

  @override
  String get goalsMs3 => '3日連続達成';

  @override
  String get goalsMsHalf => '週目標の50%';

  @override
  String get goalsMs5 => '5日連続';

  @override
  String get goalsMsWeek => '1週間すべて達成';

  @override
  String get goalsMsLocked => '未達成';

  @override
  String get goalsHistory => 'アクティビティ履歴';

  @override
  String get goalsShowLess => '閉じる';

  @override
  String get goalsStartSession => '集中セッションを開始';

  @override
  String get goalsManageApps => 'ブロック中のアプリを管理';

  @override
  String get goalsBlockHint => 'ロックスケジュールがオンの間、自動でカウントされます。';

  @override
  String goalsScreenToday(String used) {
    return '今日のスクリーンタイム: $used';
  }

  @override
  String get goalsNotFound => 'この目標はもうありません。';

  @override
  String get goalsMore => 'その他';

  @override
  String goalsFreeLimit(int n) {
    return '無料プラン: 目標$n個まで';
  }

  @override
  String get homeGoodMorning => 'おはようございます';

  @override
  String get homeGoodAfternoon => 'こんにちは';

  @override
  String get homeGoodEvening => 'こんばんは';

  @override
  String get homeFriend => 'ゲスト';

  @override
  String get homeTodayFocus => '今日の集中';

  @override
  String homeVsYesterday(String pct) {
    return '昨日比 $pct%';
  }

  @override
  String get homeStartToday => '今日はまだ集中なし';

  @override
  String get homeDayStreak => '連続日数';

  @override
  String get homeTodayGoal => '今日の目標';

  @override
  String homePctCompleted(int pct) {
    return '$pct% 完了';
  }

  @override
  String get homeOnTrack => '順調です！';

  @override
  String get homeKeepGoing => 'その調子';

  @override
  String get homeGoalMet => '目標達成！';

  @override
  String get homeScreenTimeTitle => 'スクリーンタイム';

  @override
  String get homeToday => '今日';

  @override
  String homeVsAvg(String pct) {
    return '平均比 $pct%';
  }

  @override
  String get homeQuickStart => '集中セッションを開始';

  @override
  String get homeManage => '管理';

  @override
  String get homeNoApps => '気が散るアプリを選んでここでロックしましょう。';

  @override
  String get homeAddApps => 'アプリを追加';

  @override
  String homeAppLocked(String app) {
    return '$app をロックしました';
  }

  @override
  String homeAppUnlocked(String app) {
    return '$app のロックを解除しました';
  }

  @override
  String homeLockApp(String app) {
    return '$app をロック/解除';
  }

  @override
  String get homeUpgradeTitle => 'プレミアムにアップグレード';

  @override
  String get homeUpgradeBody => '無制限のブロック・目標・詳細分析。';

  @override
  String get homeTryFree => '無料で試す';

  @override
  String get homePro => 'PRO';

  @override
  String get homeProActive => 'Pausey Pro 利用中';

  @override
  String get homeProActiveBody => '全機能が解放されました。ありがとう！';

  @override
  String get homeNotifications => '通知';

  @override
  String get homeNoNotifications => '新しい通知はありません。';

  @override
  String get homePushLabel => 'プッシュ通知';

  @override
  String get homeFocusReminder => '毎日の集中リマインダー';

  @override
  String get homeStreakAlerts => '連続記録アラート';

  @override
  String get homePwTitle => 'Pausey Pro を解放';

  @override
  String get homePwSubtitle => '集中力を取り戻し、スマホ依存を克服しよう。';

  @override
  String get homePwMonthly => '月額';

  @override
  String get homePwBilledMonthly => '毎月請求';

  @override
  String get homePwYearly => '年額';

  @override
  String get homePwPopular => '人気';

  @override
  String homePwSave(int pct) {
    return '$pct%お得';
  }

  @override
  String homePwBilledYearly(String price) {
    return '年 $price を請求';
  }

  @override
  String get homePwLifetime => '買い切り';

  @override
  String get homePwBestValue => 'お得';

  @override
  String get homePwPayOnce => '一度の支払いでずっと';

  @override
  String get homePwPerMonth => '/ 月';

  @override
  String get homePwOnce => '1回';

  @override
  String get homePwStartTrial => '7日間無料で試す';

  @override
  String get homePwBuyLifetime => '買い切りで購入';

  @override
  String get homePwNoCharge => '本日の請求なし · いつでも解約可';

  @override
  String get homePwOneTime => '一回払い · サブスクなし';

  @override
  String get homePwFree => '無料';

  @override
  String get homePwProCol => 'Pro';

  @override
  String get homePwFeatBlocking => 'アプリブロック無制限';

  @override
  String get homePwFeatSessions => 'すべての集中モード';

  @override
  String get homePwFeatGoals => '目標無制限';

  @override
  String get homePwFeatAnalytics => '高度な分析';

  @override
  String get homePwFeatStreak => '連続記録の保護';

  @override
  String get homePwFeatSchedule => '集中スケジュール';

  @override
  String get homePwFeatFaceId => 'Face ID ロック';

  @override
  String get homePwFeatNotif => 'スマート通知';

  @override
  String homePwMax(int n) {
    return '最大$n';
  }

  @override
  String get homePwSecure => '安全な支払い';

  @override
  String get homePwCancelAnytime => 'いつでも解約';

  @override
  String get homePwPrivacyFirst => 'プライバシー重視';

  @override
  String get homePwRestore => '購入を復元';

  @override
  String get homePwTerms => '利用規約';

  @override
  String get homePwPrivacyPolicy => 'プライバシーポリシー';

  @override
  String get homePwWelcome => 'Pausey Pro へようこそ！';

  @override
  String get homePwNothingToRestore => '以前の購入は見つかりませんでした。';

  @override
  String get homePwRestored => 'Pro が有効です。';

  @override
  String get homePwLinkSoon => 'このページは近日ウェブサイトで公開されます。';

  @override
  String get homePwYouArePro => 'Pro 会員です。お楽しみください！';

  @override
  String get homePwClose => '閉じる';

  @override
  String get insightsAnalytics => '分析';

  @override
  String get insightsScreenTime => 'スクリーンタイム';

  @override
  String get insightsToday => '今日';

  @override
  String get insightsWeek => '週';

  @override
  String get insightsMonth => '月';

  @override
  String get insightsProductivity => '生産性スコア';

  @override
  String insightsPts(String delta) {
    return '$delta pt';
  }

  @override
  String get insightsVsLastWeek => '先週比';

  @override
  String get insightsVsLastMonth => '先月比';

  @override
  String insightsScoreDays(int n) {
    return '$n日間のスコア';
  }

  @override
  String get insightsFocusHours => '集中時間';

  @override
  String get insightsThisWeek => '今週';

  @override
  String get insightsThisMonth => '今月';

  @override
  String insightsGoalOf(String done, String goal) {
    return '$done / 目標 $goal';
  }

  @override
  String get insightsFocusScore => '集中';

  @override
  String get insightsGoals => '目標';

  @override
  String get insightsConsistency => '継続性';

  @override
  String get insightsWeeklyFocus => '今週の集中時間';

  @override
  String insightsDailyFocus(int n) {
    return '直近$n日の集中';
  }

  @override
  String insightsBestDay(String day, String time) {
    return 'ベスト: $day · $time';
  }

  @override
  String insightsAvgDay(String time) {
    return '平均 $time / 日';
  }

  @override
  String get insightsMonthlyTrends => '月間トレンド';

  @override
  String get insightsActual => '実績';

  @override
  String get insightsGoal => '目標';

  @override
  String insightsWk(int n) {
    return '$n週';
  }

  @override
  String insightsWeekBeat(int n, String time) {
    return '第$n週は目標を$time上回りました';
  }

  @override
  String insightsWeekShort(int n, String time) {
    return '最高は第$n週、目標まであと$time';
  }

  @override
  String get insightsGoalCompletion => '目標達成';

  @override
  String insightsDaysOf(int done, int total) {
    return '$done/$total日';
  }

  @override
  String get insightsNoGoals => '目標はまだありません。追加すると進捗が表示されます。';

  @override
  String get insightsManageGoals => '管理';

  @override
  String insightsGoalFocus(String hours) {
    return '毎日の集中: $hours時間';
  }

  @override
  String get insightsGoalBlock => 'SNSアプリをブロック';

  @override
  String insightsGoalPomo(int n) {
    return '1日$nポモドーロ';
  }

  @override
  String insightsGoalScreen(String time) {
    return 'スクリーンタイム$time未満';
  }

  @override
  String get insightsGoalPhoneFree => 'スマホなし時間';

  @override
  String get insightsEmptyBadge => 'セッションなし';

  @override
  String get insightsEmptyTitle => '最初のセッションから分析が始まります';

  @override
  String get insightsEmptyBody => '集中セッションを1回終えると、スコアやグラフ、目標の進捗がここに表示されます。';

  @override
  String get insightsEmptyCta => '集中を始める';

  @override
  String get insightsDailyUsage => '1日の使用';

  @override
  String get insightsFocusTime => '集中時間';

  @override
  String get insightsVsAvg => '平均比';

  @override
  String get insightsUsageByDay => '日別の使用';

  @override
  String get insightsUsageByWeek => '週別の使用';

  @override
  String get insightsUsage => '使用';

  @override
  String insightsTrend(int n) {
    return '$n日間の推移';
  }

  @override
  String get insightsImproving => '改善中';

  @override
  String get insightsRising => '増加中';

  @override
  String insightsDaysAgo(int n) {
    return '$n日前';
  }

  @override
  String get insightsMostUsed => 'よく使うアプリ';

  @override
  String get insightsAllApps => 'すべてのアプリ';

  @override
  String get insightsBreakdown => '使用の内訳';

  @override
  String get insightsTotal => '合計';

  @override
  String get insightsNoUsage => 'この期間の記録はありません。';

  @override
  String get insightsLockApp => 'このアプリをロック';

  @override
  String insightsLocked(String app) {
    return '$appをロックしました';
  }

  @override
  String get insightsCatSocial => 'SNS';

  @override
  String get insightsCatVideo => '動画';

  @override
  String get insightsCatGames => 'ゲーム';

  @override
  String get insightsCatShopping => 'ショッピング';

  @override
  String get insightsCatCommunity => 'コミュニティ';

  @override
  String get insightsCatOther => 'その他';

  @override
  String get profileSettings => '設定';

  @override
  String get profileGuestName => 'ゲスト';

  @override
  String get profileGuestBadge => 'ゲスト · この端末に保存';

  @override
  String get profileEditName => '名前を編集';

  @override
  String get profileNameHint => 'お名前';

  @override
  String get profileSave => '保存';

  @override
  String profileMemberSince(String date) {
    return '$dateから利用';
  }

  @override
  String get profileProActive => 'Pro · 有効';

  @override
  String get profileFree => '無料プラン';

  @override
  String get profileUpgrade => 'アップグレード';

  @override
  String get profileBadges => 'バッジ';

  @override
  String get profileNoBadges => '集中セッションを終えてバッジを獲得';

  @override
  String get profileFocusTime => '集中時間';

  @override
  String get profileGoalsDone => '達成した目標';

  @override
  String get profileDayStreak => '連続日数';

  @override
  String get profileAppsBlocked => 'ブロック中のアプリ';

  @override
  String get profileFocusActivity => '集中アクティビティ';

  @override
  String get profileLast4Weeks => '過去4週間';

  @override
  String get profileRecentActivity => '最近のアクティビティ';

  @override
  String get profileSessionDone => '集中セッション完了';

  @override
  String get profileSessionStopped => '途中で終了';

  @override
  String get profileModePomodoro => 'ポモドーロ';

  @override
  String get profileModeDeep => 'ディープワーク';

  @override
  String get profileModeCustom => 'カスタム';

  @override
  String get profileJustNow => 'たった今';

  @override
  String profileAgoMinutes(int n) {
    return '$n分前';
  }

  @override
  String profileAgoHours(int n) {
    return '$n時間前';
  }

  @override
  String get profileYesterday => '昨日';

  @override
  String get profileEmptyTitle => 'まだセッションがありません';

  @override
  String get profileEmptyBody => '最初のセッションを始めると、記録・連続日数・バッジがここに表示されます。';

  @override
  String get profileStartFocus => '集中を始める';

  @override
  String get profileMyGoals => 'マイ目標';

  @override
  String get profileStreaks => '連続記録とバッジ';

  @override
  String get profileSubscription => 'サブスクリプション';

  @override
  String get profileSignOutTitle => 'サインアウトしますか？';

  @override
  String get profileSignOutBody => 'いつでも再ログインできます。';

  @override
  String get profileSecNotifications => '通知';

  @override
  String get profileSecAppearance => '外観';

  @override
  String get profileSecFocus => '集中とブロック';

  @override
  String get profileSecPrivacy => 'プライバシーとセキュリティ';

  @override
  String get profileSecAccount => 'アカウント';

  @override
  String get profilePush => 'プッシュ通知';

  @override
  String get profilePushSub => 'リマインダーとお知らせ';

  @override
  String get profileReminder => '開始リマインダー';

  @override
  String profileReminderSub(String time) {
    return '毎日 $time';
  }

  @override
  String get profileStreakAlerts => '連続記録アラート';

  @override
  String get profileStreakAlertsSub => '記録が途切れる前に';

  @override
  String get profileGoalMilestones => '目標のマイルストーン';

  @override
  String get profileGoalMilestonesSub => '目標を達成したとき';

  @override
  String get profileDarkMode => 'ダークモード';

  @override
  String get profileOn => 'オン';

  @override
  String get profileOff => 'オフ';

  @override
  String get profileTextSize => '文字サイズ';

  @override
  String get profileTextSmall => '小';

  @override
  String get profileTextMedium => '中';

  @override
  String get profileTextLarge => '大';

  @override
  String get profileTextHuge => '特大';

  @override
  String get profilePomodoroLen => 'ポモドーロの長さ';

  @override
  String get profileBreakLen => '休憩の長さ';

  @override
  String profileMinutes(int n) {
    return '$n分';
  }

  @override
  String get profileFaceIdUnlock => '解除にFace ID';

  @override
  String get profileFaceIdUnlockSub => 'アプリ解除前に確認';

  @override
  String get profileBypass => '緊急解除';

  @override
  String profileBypassSub(int n) {
    return '1日$n回';
  }

  @override
  String get profileAppLock => 'Face IDでPauseyをロック';

  @override
  String get profileAppLockSub => '起動時に確認';

  @override
  String get profileHideUsage => '使用データを隠す';

  @override
  String get profileHideUsageSub => 'スクリーンタイムを非表示';

  @override
  String get profileClearData => 'アクティビティを消去';

  @override
  String get profileClearDataSub => 'セッションと目標履歴を削除';

  @override
  String get profileClearTitle => 'アクティビティを消去しますか？';

  @override
  String get profileClearBody => 'この端末の集中セッションと目標の記録がすべて削除されます。元に戻せません。';

  @override
  String get profileClear => '消去';

  @override
  String get profileCleared => 'アクティビティを消去しました';

  @override
  String get profileExport => 'データを書き出す';

  @override
  String get profileExportSub => 'JSONとしてコピー';

  @override
  String get profileExported => 'データをクリップボードにコピーしました';

  @override
  String get profileStreaksTitle => '連続記録';

  @override
  String get profileShare => '共有';

  @override
  String profileShareText(int n) {
    return 'Pauseyで$n日連続集中中！';
  }

  @override
  String get profileCopied => 'コピーしました';

  @override
  String profileNextMilestone(int n) {
    return 'その調子！次の目標まであと$n日';
  }

  @override
  String get profileAllMilestones => '全マイルストーン達成。伝説級！';

  @override
  String get profileStartStreak => '今日セッションを1回終えて連続記録を始めよう。';

  @override
  String get profileBest => '最高';

  @override
  String get profileThisWeek => '今週';

  @override
  String profileDaysCompleted(int n) {
    return '$n/7日達成';
  }

  @override
  String get profileCompleted => '達成';

  @override
  String get profilePartial => '一部';

  @override
  String get profileMissed => '未達成';

  @override
  String get profilePrevMonth => '前の月';

  @override
  String get profileNextMonth => '次の月';

  @override
  String get profileMilestones => '連続記録のマイルストーン';

  @override
  String get profileAchievements => '実績';

  @override
  String get profileAchOnFire => '絶好調';

  @override
  String get profileAchIronWill => '鉄の意志';

  @override
  String get profileAchFocusMaster => '集中マスター';

  @override
  String get profileAchMonk => 'デジタル修行僧';

  @override
  String get profileAchLegend => 'レジェンド';

  @override
  String get profileAchSpeed => 'スピードスター';

  @override
  String profileAchStreakDesc(int n) {
    return '$n日連続';
  }

  @override
  String profileAchSessionsDesc(int n) {
    return '$n回のセッション';
  }

  @override
  String profileAchHoursDesc(int n) {
    return '合計$n時間集中';
  }

  @override
  String profileAchDayDesc(int n) {
    return '1日に$n回';
  }

  @override
  String get navHome => 'ホーム';

  @override
  String get navBlock => 'ブロック';

  @override
  String get navFocus => '集中';

  @override
  String get navInsights => '分析';

  @override
  String get navProfile => 'プロフィール';

  @override
  String get unitH => '時間';

  @override
  String get unitM => '分';

  @override
  String get sampleData => 'サンプルデータ';

  @override
  String get seeAll => 'すべて表示';

  @override
  String days(int count) {
    return '$count日';
  }

  @override
  String get statesTitle => '状態';

  @override
  String get statesSubtitle => 'エラー・空・読み込み画面';

  @override
  String get statesNoInternet => 'インターネットなし';

  @override
  String get statesConnectionLost => '接続が切れました';

  @override
  String get statesOfflineTitle => 'オフラインです';

  @override
  String get statesOfflineMsg =>
      'Pauseyがサーバーに接続できません。Wi-Fiまたはモバイルデータを確認して再試行してください。ローカルデータは安全です。';

  @override
  String get statesTryAgain => '再試行';

  @override
  String get statesOpenSettings => '設定を開く';

  @override
  String get statesOfflineMode => 'オフラインモード';

  @override
  String get statesLimited => '制限あり';

  @override
  String get statesAvailable => '利用可';

  @override
  String get statesUnavailable => '利用不可';

  @override
  String get statesCapSessions => '過去のセッションを見る';

  @override
  String get statesCapApps => 'ロック中のアプリ一覧';

  @override
  String get statesCapTimer => 'ローカル集中タイマー';

  @override
  String get statesCapSync => '連続記録と目標の同期';

  @override
  String get statesCapAnalytics => '分析データを更新';

  @override
  String get statesOfflineNote => '集中データはすべて端末に保存されます。オフラインでも失われません。';

  @override
  String get statesBackOnline => 'オンラインに復帰 – 同期完了';

  @override
  String get statesShowAgain => 'もう一度表示';

  @override
  String get statesPermDenied => '権限が拒否されました';

  @override
  String get statesPermRequired => '権限が必要です';

  @override
  String get statesPermTitle => 'アクセスがブロックされました';

  @override
  String get statesPermMsg =>
      'アプリをブロックするにはスクリーンタイムへのアクセスが必要です。許可がないとブロックできません。';

  @override
  String get statesGrant => 'アクセスを許可';

  @override
  String get statesLearnMore => '詳しく見る';

  @override
  String get statesLearnMoreMsg => 'スクリーンタイムにより気が散るアプリを一時停止できます。データは端末外に出ません。';

  @override
  String get statesRequiredPerms => '必要な権限';

  @override
  String get statesPermNotif => '通知';

  @override
  String get statesPermScreenTime => 'スクリーンタイム';

  @override
  String get statesPermUsage => 'アプリ使用状況';

  @override
  String get statesPermBio => 'Face ID / 生体認証';

  @override
  String get statesGranted => '許可済み';

  @override
  String get statesDenied => '拒否';

  @override
  String get statesPermNote => 'スクリーンタイムなしでもタイマーは使えますが、アプリはブロックできません。';

  @override
  String get statesAccessGranted => '許可されました – ブロック準備完了';

  @override
  String get statesDataNA => 'データを利用できません';

  @override
  String get statesSyncFailed => '同期に失敗';

  @override
  String get statesLoadTitle => '読み込めませんでした';

  @override
  String get statesLoadMsg =>
      '分析データの取得中に問題が発生しました。一時的な不具合の可能性があります。ローカルデータは無事です。';

  @override
  String get statesRetrySync => '再同期';

  @override
  String get statesUseCached => 'キャッシュを使用';

  @override
  String get statesErrorDetails => 'エラーの詳細';

  @override
  String get statesErrorCode => 'エラーコード';

  @override
  String get statesTimestamp => '時刻';

  @override
  String get statesRetryCount => '再試行回数';

  @override
  String statesAttempts(int n) {
    return '$n / 3 回';
  }

  @override
  String get statesReport => 'サポートに報告';

  @override
  String get statesReported => 'ありがとうございます。報告を送信しました';

  @override
  String get statesCachedNote => 'その間、前回同期したデータを利用できます。';

  @override
  String get statesDataLoaded => '分析を読み込みました';

  @override
  String get statesCachedShown => 'キャッシュを表示中';

  @override
  String statesWeekFocus(String time) {
    return '今週の集中：$time';
  }

  @override
  String get statesEmpty => '空の状態';

  @override
  String get statesNothingYet => 'まだありません';

  @override
  String get statesEmptyTitle => 'セッションはまだありません';

  @override
  String get statesEmptyMsg => '最初の集中セッションを始めると、ここに進捗が表示されます。';

  @override
  String get statesStartFocus => '集中を始める';

  @override
  String get statesLoadingSection => '読み込み中の状態';

  @override
  String get statesDashLoading => 'ダッシュボード';

  @override
  String get statesAnalyticsLoading => '分析';

  @override
  String get statesGoalsLoading => '目標';

  @override
  String get statesProfileLoading => 'プロフィール';

  @override
  String get statesCrunching => 'データを集計中…';

  @override
  String get statesLoadingGoals => '目標を読み込み中…';

  @override
  String get statesLoadingProfile => 'プロフィールを読み込み中…';

  @override
  String get statesReplay => 'もう一度';
}
