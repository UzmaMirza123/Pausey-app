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
  String get ob1ArtNote1 => 'Меньше скролла';

  @override
  String get ob1ArtNote2 => 'Больше тебя';

  @override
  String get ob1BookFocus => 'Фокус';

  @override
  String get ob1BookBalance => 'Баланс';

  @override
  String get ob1BookHappier => 'Счастливее ты';

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
  String get ob3RingStreak => 'дней подряд';

  @override
  String ob3RingSessions(int done, int total) {
    return '$done из $total сессий';
  }

  @override
  String get ob3RingTagline => 'Фокус делает\nвас лучше';

  @override
  String get ob4ArtScore => 'баллы';

  @override
  String get ob4ArtProductivity => 'Продуктивность';

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
  String get ob7Title => 'Дневная цель экранного времени';

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
  String alSummary(int locked, int total) {
    return 'Сейчас ограничено $locked · всего $total';
  }

  @override
  String alSummaryOff(int total) {
    return 'Всего $total · блокировка выкл.';
  }

  @override
  String get alFromInstalled => 'Выбрать из установленных';

  @override
  String get alFromInstalledSub => 'Любое приложение на телефоне';

  @override
  String get alPermTitle => 'Блокировка ещё не работает';

  @override
  String get alPermMsg =>
      'Правила сохранены, но Pausey не сможет блокировать, пока вы не дадите два разрешения:';

  @override
  String get alPermUsage => 'Доступ к истории';

  @override
  String get alPermUsageSub => 'Видеть открытое приложение и время за день';

  @override
  String get alPermOverlay => 'Поверх других приложений';

  @override
  String get alPermOverlaySub => 'Показывать экран блокировки';

  @override
  String get alAllow => 'Разрешить';

  @override
  String get alAllowed => 'Разрешено';

  @override
  String get alPermReturn => 'Вернитесь в Pausey — проверка пройдёт сама.';

  @override
  String get alAndroidOnly =>
      'Блокировка работает только на Android. Правила можно настроить здесь.';

  @override
  String get alSearchHint => 'Поиск приложений';

  @override
  String get alFilterAll => 'Все';

  @override
  String get alFilterLocked => 'Заблок.';

  @override
  String get alFilterScheduled => 'По расп.';

  @override
  String get alFilterAvailable => 'Доступны';

  @override
  String get alStateLocked => 'Заблок.';

  @override
  String get alStateWillLock => 'Будет заблок.';

  @override
  String get alStateScheduled => 'По расп.';

  @override
  String get alStateAvailable => 'Доступно';

  @override
  String alUsedOf(String used, String limit) {
    return 'Использовано $used из $limit';
  }

  @override
  String alUsedToday(String used) {
    return 'Сегодня $used';
  }

  @override
  String get alNoLimit => 'Без лимита';

  @override
  String alLimitNoUsage(String limit) {
    return 'Лимит $limit · нет данных';
  }

  @override
  String get alRulesOff => 'Ограничения выкл.';

  @override
  String alNextLock(String time) {
    return 'Следующая блокировка: $time';
  }

  @override
  String alUnlockedUntil(String time) {
    return 'Открыто до $time';
  }

  @override
  String get alReasonLimit => 'Лимит исчерпан';

  @override
  String get alReasonSchedule => 'Идёт блокировка по расписанию';

  @override
  String get alReasonGeneral => 'Идёт общее расписание';

  @override
  String get alReasonAllDay => 'Заблокировано весь день';

  @override
  String get alReasonFocus => 'Идёт фокус-сессия';

  @override
  String get alNoMatches => 'Ничего не найдено';

  @override
  String get alGeneral => 'Общее';

  @override
  String get alGeneralScheduleSub => 'Для приложений с «Общим расписанием»';

  @override
  String get alLockAllSub => 'Включить ограничения для всех';

  @override
  String get alSaved => 'Сохранено';

  @override
  String get alChangesApply => 'Изменения применяются сразу';

  @override
  String get alDetailsTitle => 'Лимиты';

  @override
  String get alBlockingOff => 'Блокировка на телефоне выключена';

  @override
  String get alRestrictApp => 'Ограничивать приложение';

  @override
  String get alMasterOff => 'Выкл. — Pausey не ограничивает его';

  @override
  String get alMasterOnRules => 'Действуют лимит и расписания ниже';

  @override
  String get alMasterOnAllDay => 'Нет лимита и расписания — весь день';

  @override
  String get alMasterOnGeneral => 'Блокируется по общему расписанию';

  @override
  String get alFollowGeneral => 'Общее расписание';

  @override
  String alFollowGeneralSub(String start, String end) {
    return 'Также блокировать $start – $end';
  }

  @override
  String get alGeneralOff => 'Общее расписание выключено';

  @override
  String get alDailyLimit => 'Дневной лимит';

  @override
  String get alDailyLimitOffSub => 'Блокировать после заданного времени в день';

  @override
  String get alCustom => 'Своё';

  @override
  String get alUsedLabel => 'Сегодня';

  @override
  String get alLeftLabel => 'Осталось';

  @override
  String get alLimitReached => 'Лимит на сегодня исчерпан';

  @override
  String get alResets => 'Сброс в полночь (время телефона)';

  @override
  String get alUsageUnavailable => 'Нет данных об использовании';

  @override
  String get alUsageNeedsAccess =>
      'Разрешите доступ к истории, чтобы Pausey считал время.';

  @override
  String get alUsageAndroidOnly =>
      'Время считается только на Android. Лимит сохранится и будет работать там.';

  @override
  String get alGrantUsage => 'Дать доступ';

  @override
  String get alCustomLimitTitle => 'Свой дневной лимит';

  @override
  String get alHours => 'Часы';

  @override
  String get alMinutes => 'Минуты';

  @override
  String get alErrZeroLimit => 'Выберите больше нуля';

  @override
  String get alSave => 'Сохранить';

  @override
  String get alScheduledLocking => 'Блокировка по расписанию';

  @override
  String get alScheduledOffSub => 'Блокировать в заданные часы';

  @override
  String get alNoSchedules => 'Расписаний пока нет';

  @override
  String get alAddSchedule => 'Добавить расписание';

  @override
  String get alActiveNow => 'Сейчас активно';

  @override
  String get alScheduleDefault => 'Время блокировки';

  @override
  String get alEndsNextDay => 'До следующего дня';

  @override
  String get alEdit => 'Изменить';

  @override
  String get alDelete => 'Удалить';

  @override
  String get alDeleteScheduleQ => 'Удалить расписание?';

  @override
  String alDeleteScheduleMsg(String title) {
    return '«$title» больше не будет блокировать приложение.';
  }

  @override
  String get alNewSchedule => 'Новое расписание';

  @override
  String get alEditSchedule => 'Изменить расписание';

  @override
  String get alTitleOptional => 'Название (необяз.)';

  @override
  String get alPresetStudy => 'Учёба';

  @override
  String get alPresetEvening => 'Вечер';

  @override
  String get alPresetSleep => 'Сон';

  @override
  String get alRepeatOn => 'Повтор по дням';

  @override
  String get alErrSameTime => 'Начало и конец не могут совпадать';

  @override
  String get alErrNoDays => 'Выберите хотя бы один день';

  @override
  String alTempUnlock(int minutes) {
    return 'Открыть на $minutes мин';
  }

  @override
  String alTempUnlockSub(int n) {
    return '1 экстренный доступ · осталось $n';
  }

  @override
  String get alTempUnlockFocus => 'Нельзя во время фокус-сессии';

  @override
  String get alTempUnlockNotLocked => 'Нужно, только когда заблокировано';

  @override
  String alTempUnlockQ(String app, int minutes) {
    return 'Открыть $app на $minutes мин?';
  }

  @override
  String get alUnlock => 'Открыть';

  @override
  String get alEndEarly => 'Завершить';

  @override
  String get alResetRules => 'Сбросить ограничения';

  @override
  String get alResetRulesSub => 'Удалить лимит и расписания';

  @override
  String alResetQ(String app) {
    return 'Сбросить ограничения $app?';
  }

  @override
  String get alResetMsg =>
      'Лимит и все расписания удалятся. Приложение останется в списке.';

  @override
  String get alReset => 'Сбросить';

  @override
  String get alResetDone => 'Ограничения сброшены';

  @override
  String get alRemoveApp => 'Убрать приложение';

  @override
  String get alRemoveAppSub => 'Больше не управлять';

  @override
  String alRemoveQ(String app) {
    return 'Убрать $app?';
  }

  @override
  String get alRemoveMsg =>
      'Pausey перестанет его ограничивать и удалит лимит и расписания.';

  @override
  String get alRemove => 'Убрать';

  @override
  String get alNoPackage =>
      'Лимиты и расписания нужны для конкретного приложения. На Android добавьте его через «Выбрать из установленных».';

  @override
  String get alNotFound => 'Приложение больше не в списке';

  @override
  String get alPickerTitle => 'Установленные';

  @override
  String get alPickerAdded => 'Уже добавлено';

  @override
  String alPickerAdd(int n) {
    return 'Добавить ($n)';
  }

  @override
  String get alPickerEmpty => 'Приложения не найдены';

  @override
  String get blockTitle => 'Блокировка';

  @override
  String get blockAddApp => 'Добавить';

  @override
  String get blockFaceIdTitle => 'Защита Face ID';

  @override
  String get blockFaceIdSub => 'Face ID для разблокировки приложений';

  @override
  String get blockFaceIdUnavailable =>
      'Биометрия недоступна на этом устройстве';

  @override
  String get blockFaceIdReason => 'Подтвердите личность для включения';

  @override
  String get blockFaceIdFailed => 'Не подтверждено — защита выключена';

  @override
  String get blockScheduleTitle => 'Блокировка по расписанию';

  @override
  String get blockStart => 'Начало';

  @override
  String get blockEnd => 'Конец';

  @override
  String get blockNeedOneDay => 'Оставьте хотя бы один день';

  @override
  String get blockManagedApps => 'Приложения';

  @override
  String get blockLockAll => 'Заблокировать все';

  @override
  String get blockAllLocked => 'Все приложения заблокированы';

  @override
  String blockRemoved(String app) {
    return '$app удалено';
  }

  @override
  String get blockAppsUpdated => 'Список обновлён';

  @override
  String get blockCatSocial => 'Соцсети';

  @override
  String get blockCatVideo => 'Видео';

  @override
  String get blockCatGames => 'Игры';

  @override
  String get blockCatShopping => 'Покупки';

  @override
  String get blockCatCommunity => 'Сообщества';

  @override
  String get blockCatOther => 'Другое';

  @override
  String get blockEmptyBadge => 'Ничего не заблок.';

  @override
  String get blockEmptyTitle => 'Пока нет приложений';

  @override
  String get blockEmptyMsg =>
      'Добавьте отвлекающие приложения — Pausey их заблокирует.';

  @override
  String get blockEmergencyTitle => 'Экстренный доступ';

  @override
  String blockEmergencySub(int n) {
    return 'Временно открыть все · осталось $n сегодня';
  }

  @override
  String get blockEmergencyOff => 'Отключено в настройках';

  @override
  String get blockEmergencyUse => 'Открыть';

  @override
  String get blockEmergencyConfirmTitle => 'Использовать экстренный доступ?';

  @override
  String blockEmergencyConfirmMsg(int n) {
    return 'Будет использован один из $n оставшихся сегодня. Только при необходимости.';
  }

  @override
  String get blockEmergencyUsed => 'Доступ использован — приложения открыты';

  @override
  String get blockEmergencyNone => 'На сегодня не осталось';

  @override
  String get blkTabLocked => 'Заблокированные';

  @override
  String get blkToday => 'Сегодня';

  @override
  String get blkUnblocks => 'Разблокировки';

  @override
  String get blkScreenTime => 'Экранное время';

  @override
  String get blkOpens => 'Открытия';

  @override
  String get blkBlock => 'Заблокировать';

  @override
  String get blkUnblock => 'Разблокировать';

  @override
  String get blkBlocked => 'Заблокировано';

  @override
  String get blkNotBlocked => 'Не заблокировано';

  @override
  String get blkNoLocked => 'Пока нет заблокированных приложений';

  @override
  String get blkNoScheduled => 'Пока нет приложений по расписанию';

  @override
  String blkBlockedSnack(String app) {
    return '$app заблокировано';
  }

  @override
  String blkUnblockedSnack(String app) {
    return '$app разблокировано';
  }

  @override
  String get cvNoAccount => 'Нет аккаунта?';

  @override
  String get cvYourName => 'Ваше имя';

  @override
  String get cvAppsLoadFailed =>
      'Не удалось прочитать приложения на этом телефоне.';

  @override
  String get cvTryAgain => 'Повторить';

  @override
  String get cvGetStarted => 'Начать';

  @override
  String get cvHaveAccount => 'У меня уже есть аккаунт';

  @override
  String get cvWelcomeTitle => 'Ваше время принадлежит вам.';

  @override
  String get cvWelcomeBody => 'Давайте освободим место для главного.';

  @override
  String get cvNext => 'Далее';

  @override
  String get cvSkipForNow => 'Пропустить пока';

  @override
  String get cvRelateTitle => 'Теряете счёт времени?';

  @override
  String get cvRelateSub => 'Будьте честны, неправильных ответов нет.';

  @override
  String get cvRelateOften => 'Постоянно';

  @override
  String get cvRelateSometimes => 'Иногда';

  @override
  String get cvRelateRarely => 'Редко';

  @override
  String get cvRelateReplyOften =>
      'Вы не одни. Телефоны так и задуманы, чтобы нас удерживать.';

  @override
  String get cvRelateReplySometimes =>
      'Так бывает почти у всех, обычно незаметно.';

  @override
  String get cvRelateReplyRarely => 'Отлично. Давайте так и оставим.';

  @override
  String get cvRelateCta => 'Это про меня';

  @override
  String get cvGoalTitle => 'Больше времени на что?';

  @override
  String get cvGoalSub => 'Выберите то, что для вас сейчас важнее всего.';

  @override
  String get cvGoalFocus => 'Больше концентрации';

  @override
  String get cvGoalSleep => 'Лучше спать';

  @override
  String get cvGoalScrolling => 'Меньше листать ленту';

  @override
  String get cvGoalMe => 'Больше времени для себя';

  @override
  String get cvGoalHabits => 'Более здоровые привычки';

  @override
  String get cvGoalOther => 'Другое';

  @override
  String get cvGoalOtherHint => 'На что вам хотелось бы больше времени?';

  @override
  String get cvGoalReplyFocus => 'Значит, фокус. Мы его сбережём.';

  @override
  String get cvGoalReplySleep => 'Хороший сон начинается со спокойного вечера.';

  @override
  String get cvGoalReplyScrolling =>
      'Пусть лента будет выбором, а не привычкой.';

  @override
  String get cvGoalReplyMe => 'Время для себя важно. Давайте его найдём.';

  @override
  String get cvGoalReplyHabits =>
      'Маленькие шаги складываются. Мы сделаем их лёгкими.';

  @override
  String get cvGoalReplyOther => 'Понятно. Подстроим всё под это.';

  @override
  String get cvAppsTitle => 'Какие приложения отвлекают?';

  @override
  String get cvAppsSubReal =>
      'Приложения, которыми вы пользуетесь чаще всего. Все будут на паузе; нажмите ✕, чтобы оставить одно.';

  @override
  String get cvAppsSubPopular =>
      'Приложения, которыми вы пользуетесь чаще всего. Все будут на паузе; нажмите ✕, чтобы оставить одно.';

  @override
  String get cvAppsSearch => 'Поиск приложений';

  @override
  String cvAppsReply(String apps) {
    return 'Записали: $apps. Начнём с них.';
  }

  @override
  String cvAnd(String a, String b) {
    return '$a и $b';
  }

  @override
  String cvAndMore(String a, String b, int count) {
    return '$a, $b и ещё $count';
  }

  @override
  String get cvStTitle => 'Ваше экранное время в день';

  @override
  String get cvStSub => 'Можно примерно. Это останется на вашем телефоне.';

  @override
  String cvStMeasured(String time) {
    return 'Сегодня на этом телефоне пока: $time';
  }

  @override
  String get cvStUnder2 => 'Меньше 2 часов';

  @override
  String get cvSt2to4 => 'От 2 до 4 часов';

  @override
  String get cvSt4to6 => 'От 4 до 6 часов';

  @override
  String get cvStOver6 => 'Больше 6 часов';

  @override
  String get cvStNotSure => 'Не знаю';

  @override
  String get cvStReplyUnder2 => 'Это хороший баланс. Мы поможем его сохранить.';

  @override
  String get cvStReply2to4 =>
      'Пара небольших изменений может освободить немало времени.';

  @override
  String get cvStReply4to6 => 'Это немало. Вернём часть себе.';

  @override
  String get cvStReplyOver6 =>
      'Это большая часть дня, поэтому начнём с малого.';

  @override
  String get cvStReplyNotSure => 'Не страшно. Pausey может это измерить.';

  @override
  String get cvPhraseFocus => 'больше концентрации';

  @override
  String get cvPhraseSleep => 'лучше спать';

  @override
  String get cvPhraseScrolling => 'меньше листать ленту';

  @override
  String get cvPhraseMe => 'больше времени для себя';

  @override
  String get cvPhraseHabits => 'более здоровые привычки';

  @override
  String get cvPhraseOther => 'больше места для главного';

  @override
  String cvPhraseOtherNamed(String thing) {
    return 'больше времени на $thing';
  }

  @override
  String cvReflectApps(String goal, String apps) {
    return 'Вы хотите $goal, но вас то и дело затягивает в $apps.';
  }

  @override
  String cvReflectNoApps(String goal) {
    return 'Вы хотите $goal, а телефон иногда мешает.';
  }

  @override
  String cvReflectEstimate(String time) {
    return 'Примерно $time в день (ваша оценка)';
  }

  @override
  String cvReflectMeasured(String time) {
    return '$time сегодня (измерено)';
  }

  @override
  String get cvReflectHelp =>
      'Pausey поможет выстроить распорядок, который даст вашему вниманию передышку.';

  @override
  String get cvShowMeHow => 'Покажите как';

  @override
  String get cvHowTitle => 'Вот как помогает Pausey';

  @override
  String get cvHowPauseTab => 'Пауза';

  @override
  String get cvHowLimitTab => 'Лимиты';

  @override
  String get cvHowFocusTab => 'Фокус';

  @override
  String get cvHowPauseTitle => 'Спокойная пауза, а не наказание';

  @override
  String get cvHowPauseBody =>
      'Когда время приложения выходит, Pausey закрывает его спокойным экраном паузы, оставляя выход.';

  @override
  String get cvHowLimitTitle => 'Дневной лимит для каждого приложения';

  @override
  String get cvHowLimitBody =>
      'У каждого приложения своё время в день и часы блокировки. Изменение одного не затрагивает другие.';

  @override
  String get cvHowFocusTitle => 'Фокус-сессии';

  @override
  String get cvHowFocusBody =>
      'Запустите таймер для работы, учёбы или отдыха. Выбранные приложения будут на паузе до его конца.';

  @override
  String get cvPreview => 'Предпросмотр';

  @override
  String get cvYourApp => 'Ваше приложение';

  @override
  String get cvAnotherApp => 'Другое приложение';

  @override
  String cvMinOf(int used, int limit) {
    return '$used из $limit мин';
  }

  @override
  String get cvBuildPlan => 'Составить мой план';

  @override
  String get cvPlanTitle => 'Вот мягкий старт';

  @override
  String get cvPlanSub => 'Подобрано по вашим ответам. Меняйте что угодно.';

  @override
  String get cvPlanFocus => 'Фокус-сессия';

  @override
  String cvPlanFocusSub(String time) {
    return '$time за сессию';
  }

  @override
  String get cvPlanDaily => 'Цель фокуса на день';

  @override
  String cvPlanDailySub(String time) {
    return '$time фокуса в день';
  }

  @override
  String get cvPlanLimit => 'Дневной лимит приложения';

  @override
  String cvPlanLimitSub(String app, String time) {
    return '$app: $time в день';
  }

  @override
  String get cvPlanLimitNoPkg =>
      'Этого приложения нет в списке на телефоне, поэтому лимит можно задать позже в разделе «Блокировка».';

  @override
  String get cvPlanWind => 'Вечерний отдых';

  @override
  String cvPlanWindSub(String start, String end) {
    return 'Выбранные приложения на паузе с $start до $end';
  }

  @override
  String get cvPlanOff => 'Выкл.';

  @override
  String get cvStarts => 'Начало';

  @override
  String get cvEnds => 'Конец';

  @override
  String get cvPlanNote =>
      'Пока ничего не включено. Всё заработает только после настройки, и это можно изменить в любой момент.';

  @override
  String get cvUsePlan => 'Выбрать этот план';

  @override
  String get cvPermTitle => 'Для работы нужны несколько разрешений';

  @override
  String get cvPermSub => 'Они помогают Pausey работать и дают лучший опыт.';

  @override
  String get cvPermUnsupported =>
      'Лимиты и экраны паузы работают на телефонах Android. Всё остальное работает и здесь.';

  @override
  String get cvPermUsageTitle => 'Доступ к истории';

  @override
  String get cvPermUsageWhy =>
      'Позволяет Pausey видеть, сколько сегодня открыто каждое приложение и какое сейчас на экране.';

  @override
  String get cvPermUsageWithout =>
      'Без него Pausey не сможет измерять экранное время и понимать, когда лимит исчерпан.';

  @override
  String get cvPermOverlayTitle => 'Поверх других приложений';

  @override
  String get cvPermOverlayWhy =>
      'Позволяет Pausey показывать экран паузы поверх приложения, когда его время вышло.';

  @override
  String get cvPermOverlayWithout =>
      'Без него приложения нельзя поставить на паузу. Ваш план сохранится на потом.';

  @override
  String get cvPermBatteryTitle => 'Не останавливать Pausey';

  @override
  String get cvPermBatteryWhy =>
      'Некоторые телефоны останавливают фоновые приложения ради экономии заряда. Разрешение для Pausey сохранит работу лимитов.';

  @override
  String get cvPermBatteryWithout =>
      'Без этого лимиты могут не работать, пока вы снова не откроете Pausey.';

  @override
  String get cvPermLater => 'Это можно изменить позже в настройках Android.';

  @override
  String get cvPermPrivacy =>
      'Pausey видит только названия приложений и время. Ничто не покидает ваш телефон.';

  @override
  String get cvAllowInSettings => 'Разрешить в настройках';

  @override
  String get cvAllowed => 'Разрешено';

  @override
  String get cvOptional => 'Необязательно';

  @override
  String get cvContinueAnyway => 'Пока продолжить';

  @override
  String get cvAccountTitle => 'Сохраните прогресс';

  @override
  String get cvAccountSub => 'Пользуйтесь Pausey как гость или войдите.';

  @override
  String get cvNameLabel => 'Ваше имя (необязательно)';

  @override
  String get cvNameHint => 'Как к вам обращаться?';

  @override
  String get cvContinueGuest => 'Продолжить как гость';

  @override
  String get cvAccountNote =>
      'Вход пока не создаёт резервную копию данных. В любом случае настройки остаются на этом телефоне.';

  @override
  String get cvReadyTitle => 'Ваш первый шаг начинается здесь.';

  @override
  String cvReadyTitleNamed(String name) {
    return '$name, ваш первый шаг начинается здесь.';
  }

  @override
  String get cvReadyFocus => 'Давайте освободим чуть больше места для фокуса.';

  @override
  String get cvReadySleep => 'Давайте сделаем ваши вечера чуть спокойнее.';

  @override
  String get cvReadyScrolling =>
      'Давайте отдавать ленте чуть меньше вашего дня.';

  @override
  String get cvReadyMe => 'Давайте найдём для вас чуть больше времени.';

  @override
  String get cvReadyHabits =>
      'Давайте выстроим привычки, которые приносят радость.';

  @override
  String get cvReadyOther =>
      'Давайте освободим больше места для того, что важно вам.';

  @override
  String get cvYourPlan => 'Ваш план';

  @override
  String cvSumGoal(String goal) {
    return 'Цель: $goal';
  }

  @override
  String cvSumApps(String apps) {
    return 'Приложения: $apps';
  }

  @override
  String cvSumFocus(String session, String daily) {
    return 'Фокус-сессии по $session, $daily в день';
  }

  @override
  String get cvReadyNeedsPerm =>
      'Лимиты сохранены, но заработают только после двух разрешений.';

  @override
  String get cvReadyChange => 'Всё это можно изменить позже.';

  @override
  String get cvStartFirstFocus => 'Начать первую фокус-сессию';

  @override
  String get cvFinishLimits => 'Завершить настройку лимитов';

  @override
  String get cvJourneyTitle => 'Начните путь с Pausey';

  @override
  String get cvJourneySub =>
      'Создайте аккаунт, чтобы синхронизировать прогресс, или продолжите как гость.';

  @override
  String get cvUsageNone => 'Сегодня не использовалось';

  @override
  String get cvUsageUnder1 => 'Сегодня меньше 1 мин';

  @override
  String cvUsageToday(String time) {
    return 'Сегодня $time';
  }

  @override
  String cvAppsSelected(int count) {
    return 'Выбрано приложений: $count';
  }

  @override
  String get cvAppsUsageNeeded =>
      'Разрешите доступ к экранному времени, чтобы Pausey показал самые используемые приложения.';

  @override
  String cvRemoveApp(String app) {
    return 'Убрать $app';
  }

  @override
  String get cvNotifAskTitle => 'Напомнить, пока время не вышло?';

  @override
  String get cvNotNow => 'Не сейчас';

  @override
  String get cvA11yTitle => 'И последнее';

  @override
  String get cvA11ySub =>
      'Включите специальные возможности, чтобы Pausey видел, какое приложение открыто и сколько времени. Тогда он сможет блокировать, разблокировать и планировать ваши приложения.';

  @override
  String get cvA11yReads => 'Pausey видит только:';

  @override
  String get cvA11yRead1 => 'Названия приложений';

  @override
  String get cvA11yRead2 => 'Время в каждом приложении';

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
  String get logInTitle => 'Войдите в аккаунт';

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

  @override
  String get ob6OtherHint => 'Введите вашу профессию';

  @override
  String get timeSecondLabel => 'Секунда';

  @override
  String get focusModePomodoro => 'Помодоро';

  @override
  String get focusModeDeep => 'Глубокий фокус';

  @override
  String get focusModeCustom => 'Своё';

  @override
  String get focusRemaining => 'ОСТАЛОСЬ';

  @override
  String get focusBreakLabel => 'ПЕРЕРЫВ';

  @override
  String get focusReadyLabel => 'ГОТОВО';

  @override
  String get focusInSession => 'Идёт сессия';

  @override
  String get focusPausedState => 'Пауза';

  @override
  String get focusOnBreak => 'Перерыв';

  @override
  String get focusIdleState => 'Нажмите «старт»';

  @override
  String get focusSessionsDone => 'Сессий';

  @override
  String get focusProgress => 'Прогресс';

  @override
  String get focusBreakAfter => 'Перерыв после';

  @override
  String get focusFocusedToday => 'Сегодня';

  @override
  String focusAppsBlocked(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count приложения заблокированы',
      many: '$count приложений заблокировано',
      few: '$count приложения заблокированы',
      one: '1 приложение заблокировано',
    );
    return '$_temp0';
  }

  @override
  String get focusAppsBlockedSub => 'Отвлечения заблокированы на эту сессию.';

  @override
  String get focusNoApps => 'Нет заблокированных';

  @override
  String get focusNoAppsSub => 'Выберите приложения для блокировки.';

  @override
  String get focusEdit => 'Изменить';

  @override
  String get focusAdd => 'Добавить';

  @override
  String get focusAmbient => 'Фоновый звук';

  @override
  String get focusSoundOff => 'Выкл.';

  @override
  String get focusSoundRain => 'Дождь';

  @override
  String get focusSoundForest => 'Лес';

  @override
  String get focusSoundWaves => 'Волны';

  @override
  String get focusSoundWhite => 'Белый шум';

  @override
  String get focusVolume => 'Громкость';

  @override
  String get focusStart => 'Старт';

  @override
  String get focusPause => 'Пауза';

  @override
  String get focusResume => 'Продолжить';

  @override
  String get focusStop => 'Стоп';

  @override
  String get focusRestart => 'Заново';

  @override
  String get focusSkipBreak => 'Пропустить';

  @override
  String get focusDurations => 'Длительность';

  @override
  String focusMinutesN(int n) {
    return '$n мин';
  }

  @override
  String get focusBreakLength => 'Перерыв';

  @override
  String get focusCustomTitle => 'Своя длительность';

  @override
  String get focusSet => 'Готово';

  @override
  String get focusStopTitle => 'Закончить раньше?';

  @override
  String get focusStopBody => 'Уже набранное время сохранится.';

  @override
  String get focusEndSession => 'Завершить';

  @override
  String get focusKeepGoing => 'Продолжить';

  @override
  String get focusTooShort => 'Меньше минуты — не сохранено.';

  @override
  String get focusBreakOver => 'Перерыв окончен — продолжим?';

  @override
  String get focusBusy => 'Завершите сессию, чтобы сменить режим.';

  @override
  String get focusFirstHint =>
      'Первая сессия начинается здесь — жмите «старт».';

  @override
  String get focusCompleteA => 'Сессия';

  @override
  String get focusCompleteB => 'завершена!';

  @override
  String get focusEndedTitle => 'Сессия окончена';

  @override
  String focusCompleteMsg(String mode) {
    return 'Отлично! Вы завершили сессию «$mode» без отвлечений.';
  }

  @override
  String get focusEndedMsg =>
      'Каждая минута важна. В следующий раз — до конца.';

  @override
  String get focusDurationLabel => 'ВРЕМЯ ФОКУСА';

  @override
  String get focusMinUnit => 'мин';

  @override
  String get focusDayStreak => 'Серия дней';

  @override
  String get focusAppsLabel => 'Заблокировано';

  @override
  String get focusTodayGoal => 'Цель на сегодня';

  @override
  String focusPctCompleted(int pct) {
    return 'Выполнено $pct%';
  }

  @override
  String focusPlusPct(int pct) {
    return '+$pct% за эту сессию';
  }

  @override
  String get focusMomentum => 'Не сбавляйте темп!';

  @override
  String get focusQuote1 =>
      'Постоянство важнее интенсивности. Каждая сессия — шаг к мастерству.';

  @override
  String get focusQuote2 => 'Маленькие блоки фокуса дают большие результаты.';

  @override
  String get focusQuote3 => 'Вы не листали ленту — вы делали. Ещё раз!';

  @override
  String get focusStartNext => 'Следующая сессия';

  @override
  String get focusBackHome => 'На главную';

  @override
  String get goalsTitle => 'Мои цели';

  @override
  String goalsSubtitle(int active, int done) {
    return 'Активных: $active · выполнено: $done';
  }

  @override
  String get goalsAdd => 'Добавить цель';

  @override
  String get goalsCompleted => 'Выполнено';

  @override
  String get goalsActive => 'Активные';

  @override
  String get goalsStreak => 'Серия';

  @override
  String get goalsOverall => 'Общий прогресс';

  @override
  String goalsWeeklyHit(int hit, int total) {
    return '$hit из $total недельных целей';
  }

  @override
  String goalsVsLastWeek(String delta) {
    return '$delta к прошлой неделе';
  }

  @override
  String get goalsFilterAll => 'Все';

  @override
  String get goalsDone => 'Готово';

  @override
  String get goalsCatFocus => 'Фокус';

  @override
  String get goalsCatDiscipline => 'Дисциплина';

  @override
  String get goalsCatWellness => 'Здоровье';

  @override
  String goalsTitleFocusHours(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Фокус: $n часов в день',
      few: 'Фокус: $n часа в день',
      one: 'Фокус: 1 час в день',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleFocusDur(String duration) {
    return 'Фокус: $duration в день';
  }

  @override
  String get goalsTitleBlock => 'Блокировать соцсети';

  @override
  String goalsTitleSessions(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n помодоро в день',
      few: '$n помодоро в день',
      one: '1 помодоро в день',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleScreen(String duration) {
    return 'Экран меньше $duration';
  }

  @override
  String get goalsTitlePhoneFree => 'Время без телефона';

  @override
  String goalsDescFocus(String duration) {
    return '$duration глубокой концентрации каждый день';
  }

  @override
  String goalsDescBlock(int n) {
    return 'Держите приложения заблокированными $n дн. в неделю';
  }

  @override
  String goalsDescSessions(int n) {
    return 'Минимум $n сессий фокуса в день';
  }

  @override
  String goalsDescScreen(String duration) {
    return 'Не больше $duration телефона в день';
  }

  @override
  String goalsDescPhoneFree(int n) {
    return '$n дн. без телефона в неделю — отмечайте их';
  }

  @override
  String goalsProgressDays(int done, int total) {
    return '$done / $total дн.';
  }

  @override
  String goalsProgressSessions(int done, int total) {
    return '$done / $total сессий';
  }

  @override
  String goalsStreakShort(int n) {
    return '$n дн';
  }

  @override
  String goalsStreakN(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Серия: $n дн.',
    );
    return '$_temp0';
  }

  @override
  String get goalsCheckIn => 'Отметить сегодня';

  @override
  String get goalsCheckedIn => 'Сегодня выполнено';

  @override
  String get goalsCheckedSnack => 'Отлично! Сегодня отмечено.';

  @override
  String get goalsUncheckedSnack => 'Отметка за сегодня снята.';

  @override
  String get goalsCreateNew => 'Создать цель';

  @override
  String get goalsEmptyBadge => 'Начните';

  @override
  String get goalsEmptyTitle => 'Целей пока нет';

  @override
  String get goalsEmptyMsg =>
      'Поставьте небольшую цель на день — Pausey будет её отслеживать.';

  @override
  String get goalsFilterEmpty => 'Нет целей для этого фильтра.';

  @override
  String get goalsNewGoal => 'Новая цель';

  @override
  String get goalsEditGoal => 'Изменить цель';

  @override
  String get goalsType => 'Тип цели';

  @override
  String get goalsTypeFocus => 'Время фокуса';

  @override
  String get goalsTypeSessions => 'Сессии фокуса';

  @override
  String get goalsTypeBlock => 'Блок приложений';

  @override
  String get goalsTypePhoneFree => 'Дни без телефона';

  @override
  String get goalsTypeScreen => 'Лимит экрана';

  @override
  String get goalsCategory => 'Категория';

  @override
  String get goalsTarget => 'Цель';

  @override
  String get goalsPerDay => 'в день';

  @override
  String get goalsPerWeek => 'дн. в неделю';

  @override
  String get goalsMaxPerDay => 'макс. в день';

  @override
  String get goalsTitleOptional => 'Название (необязательно)';

  @override
  String get goalsSave => 'Сохранить';

  @override
  String get goalsCreate => 'Создать цель';

  @override
  String get goalsSavedSnack => 'Цель сохранена';

  @override
  String get goalsCreatedSnack => 'Цель создана';

  @override
  String get goalsEdit => 'Изменить';

  @override
  String get goalsDelete => 'Удалить цель';

  @override
  String get goalsDeleteQ => 'Удалить эту цель?';

  @override
  String get goalsDeleteMsg => 'Отметки будут удалены. Это нельзя отменить.';

  @override
  String get goalsDeletedSnack => 'Цель удалена';

  @override
  String get goalsComplete => 'выполнено';

  @override
  String get goalsDaysActive => 'Активные дни';

  @override
  String get goalsTotalTime => 'Всего времени';

  @override
  String get goalsSessionsLabel => 'Сессии';

  @override
  String get goals7Day => 'Прогресс за 7 дней';

  @override
  String get goals7DaysAgo => '7 дней назад';

  @override
  String get goalsToday => 'Сегодня';

  @override
  String goalsTodayDate(String date) {
    return 'Сегодня, $date';
  }

  @override
  String goalsYesterdayDate(String date) {
    return 'Вчера, $date';
  }

  @override
  String get goalsMilestones => 'Этапы';

  @override
  String get goalsMsFirst => 'Первый день выполнен';

  @override
  String get goalsMs3 => 'Серия 3 дня';

  @override
  String get goalsMsHalf => '50% недельной цели';

  @override
  String get goalsMs5 => 'Серия 5 дней';

  @override
  String get goalsMsWeek => 'Целая неделя';

  @override
  String get goalsMsLocked => 'Пока нет';

  @override
  String get goalsHistory => 'История';

  @override
  String get goalsShowLess => 'Свернуть';

  @override
  String get goalsStartSession => 'Начать сессию';

  @override
  String get goalsManageApps => 'Управлять блокировкой';

  @override
  String get goalsBlockHint =>
      'Засчитывается, пока расписание блокировки включено.';

  @override
  String goalsScreenToday(String used) {
    return 'Экран сегодня: $used';
  }

  @override
  String get goalsNotFound => 'Этой цели больше нет.';

  @override
  String get goalsMore => 'Ещё';

  @override
  String goalsFreeLimit(int n) {
    return 'Бесплатно: до $n целей';
  }

  @override
  String get homeGoodMorning => 'Доброе утро';

  @override
  String get homeGoodAfternoon => 'Добрый день';

  @override
  String get homeGoodEvening => 'Добрый вечер';

  @override
  String get homeFriend => 'Друг';

  @override
  String get homeTodayFocus => 'Фокус сегодня';

  @override
  String homeVsYesterday(String pct) {
    return '$pct% к вчера';
  }

  @override
  String get homeStartToday => 'Сегодня ещё без фокуса';

  @override
  String get homeDayStreak => 'Дней подряд';

  @override
  String get homeTodayGoal => 'Цель на сегодня';

  @override
  String homePctCompleted(int pct) {
    return 'Выполнено $pct%';
  }

  @override
  String get homeOnTrack => 'По плану!';

  @override
  String get homeKeepGoing => 'Продолжайте';

  @override
  String get homeGoalMet => 'Цель достигнута!';

  @override
  String get homeScreenTimeTitle => 'Экранное время';

  @override
  String get homeToday => 'Сегодня';

  @override
  String homeVsAvg(String pct) {
    return '$pct% к среднему';
  }

  @override
  String get homeQuickStart => 'Быстрый старт фокуса';

  @override
  String get homeManage => 'Управлять';

  @override
  String get homeNoApps =>
      'Выберите самые отвлекающие приложения и заблокируйте их.';

  @override
  String get homeAddApps => 'Добавить';

  @override
  String homeAppLocked(String app) {
    return '$app заблокировано';
  }

  @override
  String homeAppUnlocked(String app) {
    return '$app разблокировано';
  }

  @override
  String homeLockApp(String app) {
    return 'Блок/разблок $app';
  }

  @override
  String get homeUpgradeTitle => 'Перейти на Премиум';

  @override
  String get homeUpgradeBody => 'Безлимитные блоки, цели и аналитика.';

  @override
  String get homeTryFree => 'Попробовать';

  @override
  String get homePro => 'PRO';

  @override
  String get homeProActive => 'Pausey Pro активен';

  @override
  String get homeProActiveBody => 'Все функции открыты. Спасибо!';

  @override
  String get homeNotifications => 'Уведомления';

  @override
  String get homeNoNotifications => 'Новых уведомлений нет.';

  @override
  String get homePushLabel => 'Push-уведомления';

  @override
  String get homeFocusReminder => 'Ежедневное напоминание';

  @override
  String get homeStreakAlerts => 'Оповещения о серии';

  @override
  String get homePwTitle => 'Откройте Pausey Pro';

  @override
  String get homePwSubtitle =>
      'Верните фокус и победите зависимость от телефона.';

  @override
  String get homePwMonthly => 'Ежемесячно';

  @override
  String get homePwBilledMonthly => 'Оплата раз в месяц';

  @override
  String get homePwYearly => 'Ежегодно';

  @override
  String get homePwPopular => 'Популярный';

  @override
  String homePwSave(int pct) {
    return '−$pct%';
  }

  @override
  String homePwBilledYearly(String price) {
    return '$price в год';
  }

  @override
  String get homePwLifetime => 'Навсегда';

  @override
  String get homePwBestValue => 'Выгодно';

  @override
  String get homePwPayOnce => 'Одна оплата навсегда';

  @override
  String get homePwPerMonth => '/ мес.';

  @override
  String get homePwOnce => 'разово';

  @override
  String get homePwStartTrial => '7 дней бесплатно';

  @override
  String get homePwBuyLifetime => 'Купить навсегда';

  @override
  String get homePwNoCharge => 'Сегодня бесплатно · Отмена в любой момент';

  @override
  String get homePwOneTime => 'Разовый платёж · Без подписки';

  @override
  String get homePwFree => 'Бесплатно';

  @override
  String get homePwProCol => 'Pro';

  @override
  String get homePwFeatBlocking => 'Безлимитная блокировка';

  @override
  String get homePwFeatSessions => 'Все режимы фокуса';

  @override
  String get homePwFeatGoals => 'Безлимитные цели';

  @override
  String get homePwFeatAnalytics => 'Расширенная аналитика';

  @override
  String get homePwFeatStreak => 'Защита серии';

  @override
  String get homePwFeatSchedule => 'Расписание фокуса';

  @override
  String get homePwFeatFaceId => 'Блокировка Face ID';

  @override
  String get homePwFeatNotif => 'Умные уведомления';

  @override
  String homePwMax(int n) {
    return 'до $n';
  }

  @override
  String get homePwSecure => 'Безопасная оплата';

  @override
  String get homePwCancelAnytime => 'Отмена в любое время';

  @override
  String get homePwPrivacyFirst => 'Приватность';

  @override
  String get homePwRestore => 'Восстановить покупки';

  @override
  String get homePwTerms => 'Условия использования';

  @override
  String get homePwPrivacyPolicy => 'Политика конфиденциальности';

  @override
  String get homePwWelcome => 'Добро пожаловать в Pausey Pro!';

  @override
  String get homePwNothingToRestore => 'Прошлых покупок не найдено.';

  @override
  String get homePwRestored => 'Доступ Pro активен.';

  @override
  String get homePwLinkSoon => 'Скоро эта страница откроется на нашем сайте.';

  @override
  String get homePwYouArePro => 'Вы Pro — наслаждайтесь!';

  @override
  String get homePwClose => 'Закрыть';

  @override
  String get homeAvgLegend => 'Среднее за 7 дней';

  @override
  String homeGoalOf(String done, String goal) {
    return '$done из $goal';
  }

  @override
  String get homeBest => 'Рекорд:';

  @override
  String get homeMyApps => 'Мои приложения';

  @override
  String get homeManageApps => 'Управлять';

  @override
  String get homeUnblockApps => 'Разблокировать';

  @override
  String homeAppsLocked(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count приложения заблокировано',
      many: '$count приложений заблокировано',
      few: '$count приложения заблокированы',
      one: '$count приложение заблокировано',
    );
    return '$_temp0';
  }

  @override
  String homeAppNamesMore(String names, int count) {
    return '$names +$count';
  }

  @override
  String get homeNoLockedApps => 'Пока ничего не заблокировано';

  @override
  String get homeNoLockedAppsSub => 'Выберите приложения, которые затягивают';

  @override
  String get insightsAnalytics => 'Аналитика';

  @override
  String get insightsScreenTime => 'Экранное время';

  @override
  String get insightsToday => 'Сегодня';

  @override
  String get insightsWeek => 'Неделя';

  @override
  String get insightsMonth => 'Месяц';

  @override
  String get insightsProductivity => 'Продуктивность';

  @override
  String insightsPts(String delta) {
    return '$delta балл.';
  }

  @override
  String get insightsVsLastWeek => 'к прошлой неделе';

  @override
  String get insightsVsLastMonth => 'к прошлому месяцу';

  @override
  String insightsScoreDays(int n) {
    return 'Оценка за $n дн.';
  }

  @override
  String get insightsFocusHours => 'Часы фокуса';

  @override
  String get insightsThisWeek => 'за неделю';

  @override
  String get insightsThisMonth => 'за месяц';

  @override
  String insightsGoalOf(String done, String goal) {
    return '$done / $goal цель';
  }

  @override
  String get insightsFocusScore => 'Фокус';

  @override
  String get insightsGoals => 'Цели';

  @override
  String get insightsConsistency => 'Регулярность';

  @override
  String get insightsWeeklyFocus => 'Фокус за неделю';

  @override
  String insightsDailyFocus(int n) {
    return 'Фокус по дням, $n дн.';
  }

  @override
  String insightsBestDay(String day, String time) {
    return 'Лучший день: $day · $time';
  }

  @override
  String insightsAvgDay(String time) {
    return 'В среднем $time / день';
  }

  @override
  String get insightsMonthlyTrends => 'Тренды месяца';

  @override
  String get insightsActual => 'Факт';

  @override
  String get insightsGoal => 'Цель';

  @override
  String insightsWk(int n) {
    return 'Нед $n';
  }

  @override
  String insightsWeekBeat(int n, String time) {
    return 'Неделя $n: цель превышена на $time';
  }

  @override
  String insightsWeekShort(int n, String time) {
    return 'Лучшая — неделя $n, до цели $time';
  }

  @override
  String get insightsGoalCompletion => 'Выполнение целей';

  @override
  String insightsDaysOf(int done, int total) {
    return '$done/$total дн.';
  }

  @override
  String get insightsNoGoals =>
      'Целей пока нет. Добавьте цель, чтобы видеть прогресс.';

  @override
  String get insightsManageGoals => 'Управлять';

  @override
  String insightsGoalFocus(String hours) {
    return 'Фокус в день: $hours ч';
  }

  @override
  String get insightsGoalBlock => 'Блокировать соцсети';

  @override
  String insightsGoalPomo(int n) {
    return '$n помодоро в день';
  }

  @override
  String insightsGoalScreen(String time) {
    return 'Экран меньше $time';
  }

  @override
  String get insightsGoalPhoneFree => 'Время без телефона';

  @override
  String get insightsEmptyBadge => 'Сессий пока нет';

  @override
  String get insightsEmptyTitle => 'Статистика начнётся с первой сессии';

  @override
  String get insightsEmptyBody =>
      'Завершите сессию фокуса — здесь появятся оценки, графики и цели.';

  @override
  String get insightsEmptyCta => 'Начать сессию';

  @override
  String get insightsDailyUsage => 'В день';

  @override
  String get insightsFocusTime => 'Время фокуса';

  @override
  String get insightsVsAvg => 'к среднему';

  @override
  String get insightsUsageByDay => 'По дням';

  @override
  String get insightsUsageByWeek => 'По неделям';

  @override
  String get insightsUsage => 'Экран';

  @override
  String insightsTrend(int n) {
    return 'Тренд за $n дн.';
  }

  @override
  String get insightsImproving => 'Лучше';

  @override
  String get insightsRising => 'Растёт';

  @override
  String insightsDaysAgo(int n) {
    return '$n дн. назад';
  }

  @override
  String get insightsMostUsed => 'Самые используемые';

  @override
  String get insightsAllApps => 'Все приложения';

  @override
  String get insightsBreakdown => 'Разбивка';

  @override
  String get insightsTotal => 'всего';

  @override
  String get insightsNoUsage => 'За этот период данных нет.';

  @override
  String get insightsLockApp => 'Заблокировать';

  @override
  String insightsLocked(String app) {
    return '$app заблокировано';
  }

  @override
  String get insightsCatSocial => 'Соцсети';

  @override
  String get insightsCatVideo => 'Видео';

  @override
  String get insightsCatGames => 'Игры';

  @override
  String get insightsCatShopping => 'Покупки';

  @override
  String get insightsCatCommunity => 'Сообщества';

  @override
  String get insightsCatOther => 'Другое';

  @override
  String nativeBlockTitle(String app) {
    return '$app на паузе';
  }

  @override
  String get nativeReasonLimit =>
      'Время на сегодня для этого приложения истекло.';

  @override
  String get nativeReasonSchedule => 'Сейчас действует расписание блокировки.';

  @override
  String get nativeReasonGlobal => 'Это приложение заблокировано в Pausey.';

  @override
  String get nativeReasonFocus => 'Идёт сессия фокусировки.';

  @override
  String get nativeClose => 'Закрыть приложение';

  @override
  String get nativeNotifTitle => 'Pausey следит за вашими лимитами';

  @override
  String get nativeNotifText => 'Лимиты и расписания блокировки включены';

  @override
  String get profileSettings => 'Настройки';

  @override
  String get profileGuestName => 'Гость';

  @override
  String get profileGuestBadge => 'Гость · сохранено на этом телефоне';

  @override
  String get profileEditName => 'Изменить имя';

  @override
  String get profileNameHint => 'Ваше имя';

  @override
  String get profileSave => 'Сохранить';

  @override
  String profileMemberSince(String date) {
    return 'С нами с $date';
  }

  @override
  String get profileProActive => 'Pro · Активно';

  @override
  String get profileFree => 'Бесплатный план';

  @override
  String get profileUpgrade => 'Улучшить';

  @override
  String get profileBadges => 'Значки';

  @override
  String get profileNoBadges => 'Завершайте сессии, чтобы получать значки';

  @override
  String get profileFocusTime => 'Время фокуса';

  @override
  String get profileGoalsDone => 'Цели выполнены';

  @override
  String get profileDayStreak => 'Дней подряд';

  @override
  String get profileAppsBlocked => 'Заблокировано';

  @override
  String get profileFocusActivity => 'Активность';

  @override
  String get profileLast4Weeks => 'Последние 4 недели';

  @override
  String get profileRecentActivity => 'Недавние действия';

  @override
  String get profileSessionDone => 'Сессия завершена';

  @override
  String get profileSessionStopped => 'Сессия прервана';

  @override
  String get profileModePomodoro => 'Помодоро';

  @override
  String get profileModeDeep => 'Глубокая работа';

  @override
  String get profileModeCustom => 'Своё';

  @override
  String get profileJustNow => 'Только что';

  @override
  String profileAgoMinutes(int n) {
    return '$n мин назад';
  }

  @override
  String profileAgoHours(int n) {
    return '$n ч назад';
  }

  @override
  String get profileYesterday => 'Вчера';

  @override
  String get profileEmptyTitle => 'Пока нет сессий';

  @override
  String get profileEmptyBody =>
      'Начните первую сессию — здесь появятся активность, серия и значки.';

  @override
  String get profileStartFocus => 'Начать';

  @override
  String get profileMyGoals => 'Мои цели';

  @override
  String get profileStreaks => 'Серии и значки';

  @override
  String get profileSubscription => 'Подписка';

  @override
  String get profileSignOutTitle => 'Выйти?';

  @override
  String get profileSignOutBody => 'Вы сможете войти снова в любой момент.';

  @override
  String get profileSecNotifications => 'Уведомления';

  @override
  String get profileSecAppearance => 'Оформление';

  @override
  String get profileSecFocus => 'Фокус и блокировка';

  @override
  String get profileSecPrivacy => 'Конфиденциальность';

  @override
  String get profileSecAccount => 'Аккаунт';

  @override
  String get profilePush => 'Push-уведомления';

  @override
  String get profilePushSub => 'Напоминания и оповещения';

  @override
  String get profileReminder => 'Напоминание о старте';

  @override
  String profileReminderSub(String time) {
    return 'Ежедневно в $time';
  }

  @override
  String get profileStreakAlerts => 'Оповещения о серии';

  @override
  String get profileStreakAlertsSub => 'Пока серия не прервалась';

  @override
  String get profileGoalMilestones => 'Этапы целей';

  @override
  String get profileGoalMilestonesSub => 'Когда цель выполнена';

  @override
  String get profileDarkMode => 'Тёмная тема';

  @override
  String get profileOn => 'Вкл.';

  @override
  String get profileOff => 'Выкл.';

  @override
  String get profileTextSize => 'Размер текста';

  @override
  String get profileTextSmall => 'Мелкий';

  @override
  String get profileTextMedium => 'Средний';

  @override
  String get profileTextLarge => 'Крупный';

  @override
  String get profileTextHuge => 'Очень крупный';

  @override
  String get profilePomodoroLen => 'Длина помодоро';

  @override
  String get profileBreakLen => 'Длина перерыва';

  @override
  String profileMinutes(int n) {
    return '$n мин';
  }

  @override
  String get profileFaceIdUnlock => 'Face ID для разблокировки';

  @override
  String get profileFaceIdUnlockSub => 'Подтверждать перед разблокировкой';

  @override
  String get profileBypass => 'Экстренный доступ';

  @override
  String profileBypassSub(int n) {
    return '$n в день';
  }

  @override
  String get profileAppLock => 'Защитить Pausey Face ID';

  @override
  String get profileAppLockSub => 'Спрашивать при открытии';

  @override
  String get profileHideUsage => 'Скрыть данные';

  @override
  String get profileHideUsageSub => 'Скрыть экранное время';

  @override
  String get profileClearData => 'Очистить активность';

  @override
  String get profileClearDataSub => 'Удаляет сессии и историю целей';

  @override
  String get profileClearTitle => 'Очистить активность?';

  @override
  String get profileClearBody =>
      'Все сессии и отметки целей на этом телефоне будут удалены. Отменить нельзя.';

  @override
  String get profileClear => 'Очистить';

  @override
  String get profileCleared => 'Активность очищена';

  @override
  String get profileExport => 'Экспорт данных';

  @override
  String get profileExportSub => 'Скопировать как JSON';

  @override
  String get profileExported => 'Данные скопированы в буфер';

  @override
  String get profileStreaksTitle => 'Серии';

  @override
  String get profileShare => 'Поделиться';

  @override
  String profileShareText(int n) {
    return 'У меня серия фокуса $n дн. с Pausey!';
  }

  @override
  String get profileCopied => 'Скопировано';

  @override
  String profileNextMilestone(int n) {
    return 'Так держать – до следующей цели $n дн.!';
  }

  @override
  String get profileAllMilestones => 'Все цели достигнуты. Легенда!';

  @override
  String get profileStartStreak =>
      'Завершите сессию сегодня, чтобы начать серию.';

  @override
  String get profileBest => 'Рекорд';

  @override
  String get profileThisWeek => 'Эта неделя';

  @override
  String profileDaysCompleted(int n) {
    return '$n/7 дн. выполнено';
  }

  @override
  String get profileCompleted => 'Выполнено';

  @override
  String get profilePartial => 'Частично';

  @override
  String get profileMissed => 'Пропущено';

  @override
  String get profilePrevMonth => 'Предыдущий месяц';

  @override
  String get profileNextMonth => 'Следующий месяц';

  @override
  String get profileMilestones => 'Этапы серии';

  @override
  String get profileAchievements => 'Достижения';

  @override
  String get profileAchOnFire => 'В огне';

  @override
  String get profileAchIronWill => 'Железная воля';

  @override
  String get profileAchFocusMaster => 'Мастер фокуса';

  @override
  String get profileAchMonk => 'Цифровой монах';

  @override
  String get profileAchLegend => 'Легенда';

  @override
  String get profileAchSpeed => 'Скорострел';

  @override
  String profileAchStreakDesc(int n) {
    return 'Серия $n дн.';
  }

  @override
  String profileAchSessionsDesc(int n) {
    return '$n сессий';
  }

  @override
  String profileAchHoursDesc(int n) {
    return '$n ч фокуса';
  }

  @override
  String profileAchDayDesc(int n) {
    return '$n сессий за день';
  }

  @override
  String get navHome => 'Главная';

  @override
  String get navBlock => 'Блок';

  @override
  String get navFocus => 'Фокус';

  @override
  String get navInsights => 'Статистика';

  @override
  String get navProfile => 'Профиль';

  @override
  String get unitH => 'ч';

  @override
  String get unitM => 'мин';

  @override
  String get sampleData => 'Пример данных';

  @override
  String get seeAll => 'Все';

  @override
  String days(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дня',
      many: '$count дней',
      few: '$count дня',
      one: '1 день',
    );
    return '$_temp0';
  }

  @override
  String get statesTitle => 'Состояния';

  @override
  String get statesSubtitle => 'Экраны ошибок, пустые и загрузки';

  @override
  String get statesNoInternet => 'Нет интернета';

  @override
  String get statesConnectionLost => 'Нет соединения';

  @override
  String get statesOfflineTitle => 'Вы не в сети';

  @override
  String get statesOfflineMsg =>
      'Pausey не может связаться с сервером. Проверьте Wi-Fi или мобильный интернет и повторите – локальные данные в безопасности.';

  @override
  String get statesTryAgain => 'Повторить';

  @override
  String get statesOpenSettings => 'Открыть настройки';

  @override
  String get statesOfflineMode => 'Офлайн-режим';

  @override
  String get statesLimited => 'Ограничен';

  @override
  String get statesAvailable => 'Доступно';

  @override
  String get statesUnavailable => 'Недоступно';

  @override
  String get statesCapSessions => 'Прошлые сессии';

  @override
  String get statesCapApps => 'Список заблокированных';

  @override
  String get statesCapTimer => 'Локальный таймер фокуса';

  @override
  String get statesCapSync => 'Синхронизация серии и целей';

  @override
  String get statesCapAnalytics => 'Обновить статистику';

  @override
  String get statesOfflineNote =>
      'Все данные хранятся на устройстве. Офлайн ничего не теряется.';

  @override
  String get statesBackOnline => 'Снова в сети – всё синхронизировано';

  @override
  String get statesShowAgain => 'Показать снова';

  @override
  String get statesPermDenied => 'Доступ запрещён';

  @override
  String get statesPermRequired => 'Нужно разрешение';

  @override
  String get statesPermTitle => 'Доступ закрыт';

  @override
  String get statesPermMsg =>
      'Pausey нужен доступ к Экранному времени для блокировки приложений. Без него блокировка не работает.';

  @override
  String get statesGrant => 'Разрешить';

  @override
  String get statesLearnMore => 'Подробнее';

  @override
  String get statesLearnMoreMsg =>
      'Доступ к Экранному времени позволяет Pausey ставить на паузу отвлекающие приложения. Данные остаются на телефоне.';

  @override
  String get statesRequiredPerms => 'Нужные разрешения';

  @override
  String get statesPermNotif => 'Уведомления';

  @override
  String get statesPermScreenTime => 'Экранное время';

  @override
  String get statesPermUsage => 'Статистика использования';

  @override
  String get statesPermBio => 'Face ID / биометрия';

  @override
  String get statesGranted => 'Разрешено';

  @override
  String get statesDenied => 'Запрещено';

  @override
  String get statesPermNote =>
      'Без Экранного времени таймер работает, но приложения не блокируются.';

  @override
  String get statesAccessGranted => 'Доступ получен – блокировка готова';

  @override
  String get statesDataNA => 'Данные недоступны';

  @override
  String get statesSyncFailed => 'Сбой синхронизации';

  @override
  String get statesLoadTitle => 'Не удалось загрузить';

  @override
  String get statesLoadMsg =>
      'Не удалось получить статистику. Возможно, временный сбой сервера – локальные данные не затронуты.';

  @override
  String get statesRetrySync => 'Повторить';

  @override
  String get statesUseCached => 'Из кэша';

  @override
  String get statesErrorDetails => 'Подробности ошибки';

  @override
  String get statesErrorCode => 'Код ошибки';

  @override
  String get statesTimestamp => 'Время';

  @override
  String get statesRetryCount => 'Попытки';

  @override
  String statesAttempts(int n) {
    return '$n / 3 попыток';
  }

  @override
  String get statesReport => 'Сообщить в поддержку';

  @override
  String get statesReported => 'Спасибо – отчёт отправлен';

  @override
  String get statesCachedNote =>
      'Пока доступны данные последней синхронизации.';

  @override
  String get statesDataLoaded => 'Статистика загружена';

  @override
  String get statesCachedShown => 'Показаны данные из кэша';

  @override
  String statesWeekFocus(String time) {
    return 'Фокус за неделю: $time';
  }

  @override
  String get statesEmpty => 'Пустое состояние';

  @override
  String get statesNothingYet => 'Пока пусто';

  @override
  String get statesEmptyTitle => 'Сессий пока нет';

  @override
  String get statesEmptyMsg =>
      'Начните первую сессию – прогресс появится здесь.';

  @override
  String get statesStartFocus => 'Начать';

  @override
  String get statesLoadingSection => 'Загрузка';

  @override
  String get statesDashLoading => 'Главная';

  @override
  String get statesAnalyticsLoading => 'Статистика';

  @override
  String get statesGoalsLoading => 'Цели';

  @override
  String get statesProfileLoading => 'Профиль';

  @override
  String get statesCrunching => 'Обрабатываем данные…';

  @override
  String get statesLoadingGoals => 'Загружаем цели…';

  @override
  String get statesLoadingProfile => 'Загружаем профиль…';

  @override
  String get statesReplay => 'Повторить';

  @override
  String get stHowCaption => 'Как это работает';

  @override
  String stHow1(String app) {
    return 'Вы снова открываете $app';
  }

  @override
  String get stHow2 => 'Вы листаете ленту, но…';

  @override
  String get stHow3 => 'Pausey мягко блокирует его.';

  @override
  String stBlockedTitle(String app) {
    return '$app заблокирован';
  }

  @override
  String get stHow4 => 'И напомнит до лимита';

  @override
  String get stYourApp => 'своё приложение';

  @override
  String get stTapToContinue => 'Нажмите, чтобы продолжить';

  @override
  String get stNudgeGeneric => 'Дневной лимит почти исчерпан';

  @override
  String get stPermTitle => 'Дайте пару разрешений';

  @override
  String get stPermUsageTitle => 'Экранное время';

  @override
  String get stPermUsageWhy =>
      'Показывает экранное время за день и момент, когда лимит исчерпан.';

  @override
  String get stPermOverlayTitle => 'Поверх других приложений';

  @override
  String get stPermOverlayWhy =>
      'Позволяет Pausey показывать экран паузы поверх отвлекающего приложения.';

  @override
  String get stPermNotifTitle => 'Уведомления';

  @override
  String get stPermNotifWhy =>
      'Мягкие напоминания до конца лимита. Их можно отключить позже.';

  @override
  String get stPermMore => 'И ещё кое-что…';

  @override
  String get stPermA11yTitle => 'Специальные возможности';

  @override
  String get stPermA11yWhy =>
      'Мгновенно определяет открытое приложение, чтобы пауза срабатывала сразу.';

  @override
  String get stPermA11yNote =>
      'Некоторые телефоны затем показывают своё предупреждение. Это нормально — отключить можно в любой момент в настройках.';

  @override
  String get stPermOnHint =>
      'Уже включено. Чтобы отключить, откройте Настройки Android › Приложения › Pausey.';

  @override
  String get stA11yDialogTitle => 'Зачем специальные возможности?';

  @override
  String get stA11yDialogBody =>
      'Pausey использует специальные возможности только чтобы понимать, какое приложение открыто, — так лимиты и расписания срабатывают сразу, а защита работает надёжно.';

  @override
  String get stA11yNot => 'Чего Pausey НЕ делает:';

  @override
  String get stA11yNot1 => 'Не читает и не собирает содержимое экрана';

  @override
  String get stA11yNot2 => 'Не хранит личные данные';

  @override
  String get stA11yNot3 => 'Ничего не передаёт за пределы телефона';

  @override
  String get stPw1 => 'Ваш план для спокойного дня';

  @override
  String get stPw2 => 'Блокировки, которые не уговоришь';

  @override
  String get stPw3 => 'Следите за прогрессом неделя за неделей';

  @override
  String get stPwToday => 'Сегодня';

  @override
  String get stPwGoal => 'Ваша цель';

  @override
  String stPwWeek(int n) {
    return 'Н$n';
  }

  @override
  String get stPwFirstWeek => 'Ваша первая неделя начинается сейчас';

  @override
  String get stPwFocusWeek => 'Время фокуса за неделю';

  @override
  String nudgeTitle(String app) {
    return 'Лимит $app почти исчерпан';
  }

  @override
  String nudgeText(String used, String limit) {
    return 'Сегодня использовано $used из $limit';
  }

  @override
  String get homeUnblockAllFor => 'Разблокировать все приложения на…';

  @override
  String homeMinutesN(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n минут',
      few: '$n минуты',
      one: '$n минута',
    );
    return '$_temp0';
  }

  @override
  String homeUnblockedLeft(String time) {
    return 'Открыты · осталось $time';
  }
}
