import 'package:flutter_test/flutter_test.dart';
import 'package:pausey/data/restrictions/restriction_evaluator.dart';
import 'package:pausey/data/restrictions/restriction_models.dart';

// 2026-10-12 is a Monday.
DateTime at(int day, int h, [int m = 0]) => DateTime(2026, 10, day, h, m);
const mon = 12, fri = 16, sat = 17, sun = 18;

AppLockSchedule sched(String id, int sh, int sm, int eh, int em, [Set<int>? days]) =>
    AppLockSchedule(id: id, startMinuteOfDay: sh * 60 + sm, endMinuteOfDay: eh * 60 + em, repeatWeekdays: days);

RestrictionState eval(AppRestrictionConfig c, DateTime t, {int? used, bool global = false, bool focus = false, TemporaryUnlock? unlock}) =>
    RestrictionEvaluator.evaluate(config: c, now: t, usedMinutes: used, globalRestricted: global, focusActive: focus, unlock: unlock);

void main() {
  final weekdays = {1, 2, 3, 4, 5};

  test('1-3: Instagram 30m and YouTube 60m limits are independent', () {
    final ig = AppRestrictionConfig(packageName: 'com.instagram.android', dailyLimitEnabled: true, dailyLimitMinutes: 30);
    final yt = AppRestrictionConfig(packageName: 'com.google.android.youtube', dailyLimitEnabled: true, dailyLimitMinutes: 60);
    final t = at(mon, 15);
    expect(eval(ig, t, used: 29).locked, isFalse);
    expect(eval(ig, t, used: 30).reasons, {RestrictionReason.dailyLimit});
    expect(eval(yt, t, used: 30).locked, isFalse);
    expect(eval(ig, t, used: 18).remainingMinutes, 12);
  });

  test('unknown usage never triggers a limit', () {
    final ig = AppRestrictionConfig(packageName: 'a', dailyLimitEnabled: true, dailyLimitMinutes: 30);
    expect(eval(ig, at(mon, 15)).locked, isFalse);
  });

  test('4-5: schedule locks at start and unlocks at end (half-open)', () {
    final c = AppRestrictionConfig(packageName: 'a', schedules: [sched('s', 9, 0, 17, 0, weekdays)]);
    expect(eval(c, at(mon, 8, 59)).locked, isFalse);
    expect(eval(c, at(mon, 9, 0)).reasons, {RestrictionReason.schedule});
    expect(eval(c, at(mon, 16, 59)).locked, isTrue);
    expect(eval(c, at(mon, 17, 0)).locked, isFalse);
    expect(eval(c, at(sat, 10)).locked, isFalse);
  });

  test('5: schedule end keeps lock when another reason remains', () {
    final c = AppRestrictionConfig(packageName: 'a', dailyLimitEnabled: true, dailyLimitMinutes: 30, schedules: [sched('s', 9, 0, 17, 0)]);
    final s = eval(c, at(mon, 17, 0), used: 40);
    expect(s.reasons, {RestrictionReason.dailyLimit});
  });

  test('6: overnight 22:00-07:00 Mon-Fri belongs to its start day', () {
    final c = AppRestrictionConfig(packageName: 'a', schedules: [sched('s', 22, 0, 7, 0, weekdays)]);
    expect(eval(c, at(mon, 21, 59)).locked, isFalse);
    expect(eval(c, at(mon, 22, 0)).locked, isTrue);
    expect(eval(c, at(13, 6, 59)).locked, isTrue); // Tue morning, started Mon
    expect(eval(c, at(13, 7, 0)).locked, isFalse);
    expect(eval(c, at(sat, 3)).locked, isTrue); // started Fri night
    expect(eval(c, at(sat, 23)).locked, isFalse); // Sat not selected
    expect(eval(c, at(mon, 3)).locked, isFalse); // Sun night not selected
  });

  test('7: overlapping schedules count once and both ids are active', () {
    final c = AppRestrictionConfig(packageName: 'a', schedules: [sched('study', 9, 0, 12, 0, weekdays), sched('x', 11, 0, 13, 0, weekdays)]);
    final s = eval(c, at(mon, 11, 30));
    expect(s.reasons, {RestrictionReason.schedule});
    expect(s.activeScheduleIds, {'study', 'x'});
    expect(eval(c, at(mon, 12, 30)).activeScheduleIds, {'x'});
  });

  test('zero-length schedules are invalid and ignored', () {
    final z = sched('z', 9, 0, 9, 0);
    expect(z.isValid, isFalse);
    final c = AppRestrictionConfig(packageName: 'a', schedules: [z]);
    expect(eval(c, at(mon, 9, 0)).locked, isFalse);
  });

  test('next lock start: same day, overnight and across the weekend', () {
    final c = AppRestrictionConfig(packageName: 'a', schedules: [sched('s', 22, 0, 7, 0, weekdays)]);
    expect(eval(c, at(mon, 15)).nextLockStart, at(mon, 22));
    expect(eval(c, at(sat, 10)).nextLockStart, at(19, 22)); // next Monday
    final multi = AppRestrictionConfig(packageName: 'a', schedules: [sched('a', 9, 0, 12, 0, weekdays), sched('b', 19, 0, 21, 0, weekdays)]);
    expect(eval(multi, at(mon, 10)).nextLockStart, at(mon, 19));
  });

  test('13: focus and own schedule coexist; disabled master keeps focus/global', () {
    final c = AppRestrictionConfig(packageName: 'a', schedules: [sched('s', 9, 0, 17, 0)]);
    expect(eval(c, at(mon, 10), focus: true).reasons, {RestrictionReason.schedule, RestrictionReason.focus});
    expect(eval(c, at(mon, 18), focus: true).reasons, {RestrictionReason.focus});
    c.enabled = false;
    expect(eval(c, at(mon, 10)).locked, isFalse);
    expect(eval(c, at(mon, 10), global: true).reasons, {RestrictionReason.global});
  });

  test('14: temporary unlock lifts schedule/limit until expiry, never focus', () {
    final c = AppRestrictionConfig(packageName: 'a', schedules: [sched('s', 9, 0, 17, 0)]);
    final u = TemporaryUnlock(packageName: 'a', expiry: at(mon, 10, 15));
    final s = eval(c, at(mon, 10), unlock: u);
    expect(s.locked, isFalse);
    expect(s.liftedByUnlock, {RestrictionReason.schedule});
    expect(eval(c, at(mon, 10, 15), unlock: u).locked, isTrue);
    expect(eval(c, at(mon, 10), unlock: u, focus: true).reasons, {RestrictionReason.focus});
  });

  test('8: config JSON round-trip keeps each app separate', () {
    final ig = AppRestrictionConfig(packageName: 'ig', dailyLimitEnabled: true, dailyLimitMinutes: 30, schedules: [sched('s', 22, 0, 7, 0, weekdays)..title = 'Sleep']);
    final back = AppRestrictionConfig.fromJson(ig.toJson());
    expect(back.packageName, 'ig');
    expect(back.dailyLimitMinutes, 30);
    expect(back.schedules.single.title, 'Sleep');
    expect(back.schedules.single.repeatWeekdays, weekdays);
    ig.copy().schedules.first.startMinuteOfDay = 60;
    expect(ig.schedules.first.startMinuteOfDay, 22 * 60);
  });

  test('sunday/monday wrap for overnight windows', () {
    final c = AppRestrictionConfig(packageName: 'a', schedules: [sched('s', 23, 0, 7, 0, {7})]);
    expect(eval(c, at(sun, 23, 30)).locked, isTrue);
    expect(eval(c, at(19, 6, 0)).locked, isTrue); // Monday morning after Sunday start
    expect(eval(c, at(fri, 6, 0)).locked, isFalse);
  });
}
