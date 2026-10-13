// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get ob1Title => 'Меньше зависимости от экрана';

  @override
  String get ob1Body =>
      'Возьмите цифровые привычки под контроль и тратьте меньше времени на отвлекающие приложения.';

  @override
  String get ob1StatAvg => 'Среднее экранное время в день';

  @override
  String get ob1StatSocial => 'Уходит на соцсети';

  @override
  String get ob2SelectApps => 'Выбрать приложения';

  @override
  String get ob2Title => 'Блокируйте отвлекающие приложения';

  @override
  String get ob2Body =>
      'Блокируйте соцсети, игры и другие отвлечения с помощью мощных инструментов блокировки.';

  @override
  String get ob2Feature1 => 'Блокировка любого приложения одним касанием';

  @override
  String get ob2Feature2 => 'Расписание блокировок и время фокуса';

  @override
  String get ob2Feature3 => 'Защитите блокировки паролем, чтобы не сдаться';

  @override
  String get sheetTitle => 'Выбрать приложения';

  @override
  String get sheetTotalLocked => 'Всего заблокировано';

  @override
  String get sheetAppsSelected => 'приложений выбрано';

  @override
  String get sheetTimeSaved => 'Сэкономлено времени';

  @override
  String get sheetPerDayAvg => 'в среднем в день';

  @override
  String sheetHoursValue(String h) {
    return '$h ч';
  }

  @override
  String get sheetSearchHint => 'Поиск приложений...';

  @override
  String get sheetCatAll => 'Все';

  @override
  String get sheetCatSocial => 'Соцсети';

  @override
  String get sheetCatEntertainment => 'Развлечения';

  @override
  String get sheetCatGames => 'Игры';

  @override
  String get sheetAppsHeader => 'ПРИЛОЖЕНИЯ';

  @override
  String sheetSelectedCount(int count) {
    return 'Выбрано: $count';
  }

  @override
  String get sheetNoApps => 'Приложения не найдены';

  @override
  String get sheetLockSchedule => 'РАСПИСАНИЕ БЛОКИРОВКИ';

  @override
  String get sheetAddCustomSemantic => 'Добавить своё расписание блокировки';

  @override
  String get sheetCustomBadge => '+ Своё';

  @override
  String get sheetSchedMorning => 'Утро';

  @override
  String get sheetSchedWork => 'Работа';

  @override
  String get sheetSchedEvening => 'Вечер';

  @override
  String get sheetEveryDay => 'Каждый день';

  @override
  String get sheetWeekdays => 'По будням';

  @override
  String get sheetWeekends => 'По выходным';

  @override
  String get sheetUnlockMethod => 'СПОСОБ РАЗБЛОКИРОВКИ';

  @override
  String get sheetPin => 'PIN-код';

  @override
  String get sheetPinSub => 'PIN из 4 цифр';

  @override
  String get sheetFaceId => 'Face ID';

  @override
  String get sheetFaceIdSub => 'Биометрия';

  @override
  String get sheetTouchId => 'Touch ID';

  @override
  String get sheetTouchIdSub => 'Отпечаток пальца';

  @override
  String get sheetFooter => 'Это всегда можно изменить позже';

  @override
  String get sheetConfirmLock => 'Подтвердить блокировку';

  @override
  String sheetRemove(String name) {
    return 'Удалить $name';
  }

  @override
  String get sheetCustomTitle => 'Своё расписание';

  @override
  String get sheetCustomBody =>
      'Выбранные приложения будут заблокированы в это время.';

  @override
  String get sheetNameLabel => 'НАЗВАНИЕ';

  @override
  String get sheetNameHint => 'напр. Учёба';

  @override
  String get sheetStarts => 'Начало';

  @override
  String get sheetEnds => 'Конец';

  @override
  String get sheetSameTime => 'Начало и конец совпадают';

  @override
  String sheetLockedFor(String duration) {
    return 'Блокировка на $duration';
  }

  @override
  String sheetLockedForOvernight(String duration) {
    return 'Блокировка на $duration (на ночь)';
  }

  @override
  String sheetDurH(int h) {
    return '$h ч';
  }

  @override
  String sheetDurM(int m) {
    return '$m мин';
  }

  @override
  String sheetDurHM(int h, int m) {
    return '$h ч $m мин';
  }

  @override
  String get sheetLockStartsAt => 'БЛОКИРОВКА НАЧИНАЕТСЯ В';

  @override
  String get sheetLockEndsAt => 'БЛОКИРОВКА ЗАКАНЧИВАЕТСЯ В';

  @override
  String get sheetRepeatOn => 'ПОВТОРЯТЬ';

  @override
  String get sheetAddSchedule => 'Добавить расписание';

  @override
  String get sheetCustomDefaultName => 'Своё';

  @override
  String sheetChangeTime(String label, String time) {
    return '$label $time. Изменить время';
  }

  @override
  String get ob3Title => 'Сохраняйте фокус каждый день';

  @override
  String get ob3Body =>
      'Используйте сессии Pomodoro и глубокого фокуса, чтобы повысить продуктивность и успевать больше.';

  @override
  String get ob3Pomodoro => 'Помодоро';

  @override
  String ob3PomodoroSub(int min) {
    return 'Сессии по $min мин';
  }

  @override
  String get ob3DeepFocus => 'Глубокий фокус';

  @override
  String ob3DeepFocusSub(int min) {
    return 'Поток $min мин';
  }

  @override
  String get ob3StatBoost => 'рост продуктивности';

  @override
  String ob3StatStreakValue(int days) {
    return '$days дн.';
  }

  @override
  String get ob3StatStreak => 'серия растёт';

  @override
  String get ob3StatGoal => 'цели выполнены';

  @override
  String get ob3StartTimer => 'Запустить таймер';

  @override
  String get ob3PauseTimer => 'Пауза таймера';

  @override
  String get ob4Title => 'Следите за прогрессом';

  @override
  String get ob4Body =>
      'Следите за экранным временем, часами фокуса, целями и продуктивностью с красивой аналитикой.';

  @override
  String get ob4Weekly => 'Еженедельные';

  @override
  String get ob4WeeklySub => 'отчёты';

  @override
  String get ob4Goals => 'Цели';

  @override
  String get ob4GoalsSub => 'трекер';

  @override
  String get ob4Insights => 'Инсайты';

  @override
  String get ob4InsightsSub => 'ИИ-коуч';

  @override
  String get ob4Streaks => 'Серии';

  @override
  String get ob4StreaksSub => 'и значки';

  @override
  String get ob5Title => 'Сколько в среднем экранного времени у вас в день?';

  @override
  String get ob5Subtitle => 'Только на телефоне. Можно примерно.';

  @override
  String get ob5More7 => 'Более 7 часов';

  @override
  String get ob5H5to7 => '5-7 часов';

  @override
  String get ob5H4to5 => '4-5 часов';

  @override
  String get ob5H3to4 => '3-4 часа';

  @override
  String get ob5H1to3 => '1-3 часа';

  @override
  String get ob5Under1 => 'Меньше 1 часа';

  @override
  String get ob6Title => 'Чем вы занимаетесь?';

  @override
  String get ob6Subtitle => 'Мы подстроим план фокуса под ваш стиль работы.';

  @override
  String get ob6Software => 'Разработка ПО';

  @override
  String get ob6Founder => 'CEO / Основатель';

  @override
  String get ob6Remote => 'Удалённая работа';

  @override
  String get ob6Finance => 'Финансы / Операции / Консалтинг';

  @override
  String get ob6Art => 'Искусство / Контент';

  @override
  String get ob6Education => 'Образование';

  @override
  String get ob6Others => 'Другое';

  @override
  String get ob7Title => 'Задайте дневную цель экранного времени';

  @override
  String get ob7Subtitle =>
      'Это можно изменить в любой момент. Мы напомним, когда вы будете близки к лимиту.';

  @override
  String ob7Hours(String hours) {
    return '$hours ч';
  }

  @override
  String get ob7PerDay => 'в день';

  @override
  String ob7HoursPerDay(String hours) {
    return '$hours в день';
  }

  @override
  String get ob7DialLabel => 'Дневная цель экранного времени';

  @override
  String get ob7InfoNote =>
      'В среднем человек проводит в телефоне более 4 ч в день. Цель — первый шаг к тому, чтобы вернуть своё время.';

  @override
  String get ob8Title => 'Включите основные разрешения';

  @override
  String get ob8Subtitle =>
      'Предоставьте доступ, чтобы пользоваться Pausey в полной мере.';

  @override
  String get ob8UsageTitle => 'Доступ к статистике';

  @override
  String get ob8UsageSub =>
      'Отслеживайте использование приложений и соблюдайте сессии фокуса.';

  @override
  String get ob8NotifTitle => 'Уведомления';

  @override
  String get ob8NotifSub =>
      'Своевременные напоминания и уведомления о прогрессе.';

  @override
  String get ob8TrackTitle => 'Учёт использования приложений';

  @override
  String get ob8TrackSub => 'Ежедневная и еженедельная статистика.';

  @override
  String get ob9Title => 'Всё готово!';

  @override
  String get ob9Subtitle => 'Ваше пространство для фокуса готово.';

  @override
  String get ob9Enter => 'Открыть Pausey';

  @override
  String get ob9Replay => 'Пройти знакомство снова';

  @override
  String get ob9ScreenTime => 'Экранное время';

  @override
  String get ob9AppsLocked => 'Заблокированные';

  @override
  String get ob9Permissions => 'Разрешения';

  @override
  String get ob9FocusMode => 'Режим фокуса';

  @override
  String get ob9AllOk => 'Всё в порядке';

  @override
  String get ob9On => 'ВКЛ';

  @override
  String get ob9Done => 'ГОТОВО';

  @override
  String get ob9StreakTitle => 'Серия первого дня начинается сейчас';

  @override
  String get ob9StreakSub => 'Завершите сессию, чтобы не прерывать её';

  @override
  String get appName => 'Pausey';

  @override
  String get tagline => 'Верните своё время';

  @override
  String get versionLabel => 'Версия 2.0 · Издание App Store';

  @override
  String get skip => 'Пропустить';

  @override
  String get continueLabel => 'Продолжить';

  @override
  String get back => 'Назад';

  @override
  String get freeToStart => 'Бесплатный старт · Без банковской карты';

  @override
  String get dataStaysOnDevice => 'Ваши данные никогда не покидают устройство.';

  @override
  String get switchToLight => 'Включить светлую тему';

  @override
  String get switchToDark => 'Включить тёмную тему';

  @override
  String get language => 'Язык';

  @override
  String get phoneLanguage => 'Язык телефона';

  @override
  String get authTitle => 'Хватит листать.\nУправляйте своим днём.';

  @override
  String get authSubtitle =>
      'Создайте аккаунт для синхронизации целей и серий или попробуйте Pausey как гость.';

  @override
  String get continueWithApple => 'Продолжить с Apple';

  @override
  String get continueWithGoogle => 'Продолжить с Google';

  @override
  String get signUpWithEmail => 'Регистрация по email';

  @override
  String get continueAsGuest => 'Продолжить как гость';

  @override
  String get guestNote => 'Данные гостя хранятся только на этом телефоне.';

  @override
  String get or => 'или';

  @override
  String get haveAccount => 'Уже есть аккаунт?';

  @override
  String get noAccount => 'Впервые в Pausey?';

  @override
  String get logIn => 'Войти';

  @override
  String get signUp => 'Регистрация';

  @override
  String get createAccount => 'Создать аккаунт';

  @override
  String get signUpTitle => 'Создайте аккаунт';

  @override
  String get signUpSubtitle => 'Начните формировать спокойные привычки.';

  @override
  String get logInTitle => 'С возвращением';

  @override
  String get logInSubtitle => 'Войдите, чтобы продолжить серию.';

  @override
  String get fullName => 'Полное имя';

  @override
  String get email => 'Email';

  @override
  String get password => 'Пароль';

  @override
  String get confirmPassword => 'Подтвердите пароль';

  @override
  String get showPassword => 'Показать пароль';

  @override
  String get hidePassword => 'Скрыть пароль';

  @override
  String get forgotPassword => 'Забыли пароль?';

  @override
  String get resetTitle => 'Сброс пароля';

  @override
  String get resetSubtitle => 'Введите email, и мы пришлём ссылку для сброса.';

  @override
  String get sendLink => 'Отправить ссылку';

  @override
  String get resetSent => 'Проверьте почту — там ссылка для сброса.';

  @override
  String get agreeTerms => 'Я принимаю Условия и Политику конфиденциальности';

  @override
  String get passwordStrength => 'Надёжность пароля';

  @override
  String get strengthWeak => 'Слабый';

  @override
  String get strengthOk => 'Средний';

  @override
  String get strengthStrong => 'Надёжный';

  @override
  String get errNameRequired => 'Введите имя';

  @override
  String get errEmailInvalid => 'Введите корректный email';

  @override
  String get errPasswordShort => 'Минимум 8 символов';

  @override
  String get errPasswordMismatch => 'Пароли не совпадают';

  @override
  String get errTerms => 'Примите условия, чтобы продолжить';

  @override
  String get authErr_not_configured =>
      'Вход ещё не настроен. Можно продолжить как гость.';

  @override
  String get authErr_cancelled => 'Вход отменён.';

  @override
  String get authErr_invalid_email => 'Похоже, email указан неверно.';

  @override
  String get authErr_wrong_password => 'Неверный email или пароль.';

  @override
  String get authErr_user_not_found =>
      'Аккаунта с этим email нет. Зарегистрироваться?';

  @override
  String get authErr_email_in_use =>
      'Аккаунт с этим email уже существует. Войдите.';

  @override
  String get authErr_weak_password => 'Выберите более надёжный пароль.';

  @override
  String get authErr_network =>
      'Нет подключения к интернету. Попробуйте снова.';

  @override
  String get authErr_too_many =>
      'Слишком много попыток. Подождите минуту и повторите.';

  @override
  String get authErr_unknown => 'Что-то пошло не так. Попробуйте снова.';

  @override
  String homeHello(String name) {
    return 'Привет, $name';
  }

  @override
  String get homeHelloGuest => 'Привет';

  @override
  String get homeGuestBadge => 'Гостевой режим · сохранено на этом телефоне';

  @override
  String get homeSubtitle => 'Ваш план готов. Вот что вы выбрали.';

  @override
  String get homeDailyGoal => 'Цель на день';

  @override
  String get homeLockedApps => 'Заблокированные приложения';

  @override
  String get homeScreenTime => 'Текущее экранное время';

  @override
  String get homeNotSet => 'Не задано';

  @override
  String get homeCreateAccount => 'Создайте аккаунт для резервной копии';

  @override
  String get signOut => 'Выйти';

  @override
  String get signOutGuestWarn => 'Выход удалит данные гостя на этом телефоне.';

  @override
  String get cancel => 'Отмена';
}
