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
}
