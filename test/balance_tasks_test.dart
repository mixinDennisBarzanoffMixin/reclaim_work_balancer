import 'package:flutter_test/flutter_test.dart';
import 'package:protobuf/protobuf.dart';
import 'package:reclaim_work_balancer/command.dart';
import 'package:reclaim_work_balancer/models/grpc/google/protobuf/timestamp.pb.dart';
import 'package:reclaim_work_balancer/models/grpc/reclaim_task.pb.dart';
import 'package:reclaim_work_balancer/models/grpc/time_policy.pb.dart';
import 'package:reclaim_work_balancer/time_budgeter.dart';
import 'package:reclaim_work_balancer/util/time_conversion.dart';

void main() {
  group('Test reclaim tasks balancer', () {
    late TimeBudgeter budgeter;
    
    setUp(() {
      budgeter = TimeBudgeter(
        BudgetConfig(
          budgetMatcher: 
            [(Task task) => task.eventCategory == EventCategory.WORK], 
            budgetPerDayInChunks: 4.hours, 
            startingDay: DateTime(2023, 11, 12), policy: TimePolicy(work: TimePolicy_DayHoursMap(dayHours: {
              "MONDAY": TimePolicy_DayHours(intervals: [
                TimePolicy_DayHours_Interval(start: "06:00:00", end: "21:00:00", duration: 21 - 6),
              ]),
              "TUESDAY": TimePolicy_DayHours(intervals: [
                TimePolicy_DayHours_Interval(start: "06:00:00", end: "21:00:00", duration: 21 - 6),
              ]),
              "WEDNESDAY": TimePolicy_DayHours(intervals: [
                TimePolicy_DayHours_Interval(start: "06:00:00", end: "21:00:00", duration: 21 - 6),
              ]),
              "THURSDAY": TimePolicy_DayHours(intervals: [
                TimePolicy_DayHours_Interval(start: "06:00:00", end: "21:00:00", duration: 21 - 6),
              ]),
              "FRIDAY": TimePolicy_DayHours(intervals: [
                TimePolicy_DayHours_Interval(start: "06:00:00", end: "21:00:00", duration: 21 - 6),
              ]),
              "SATURDAY": TimePolicy_DayHours(intervals: [
                TimePolicy_DayHours_Interval(start: "06:00:00", end: "21:00:00", duration: 21 - 6),
              ]),
              "SUNDAY": TimePolicy_DayHours(intervals: [
                TimePolicy_DayHours_Interval(start: "06:00:00", end: "21:00:00", duration: 21 - 6),
              ]),
            })),
        ),
      );
    });
    test('Test splitting one task', () {
      final List<Task> tasks = budgeter.splitTaskInTwo(Task()
        ..id = 123
        ..title = 'Example Task'
        ..notes = 'This is an example task'
        ..status = TaskStatus.NEW
        ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12))
        ..eventCategory = EventCategory.WORK
        ..timeChunksRequired = 5.hours
        ..timeChunksRemaining = 5.hours
        ..timeChunksSpent = 0
        ..freeze(),
        4 * 4,
      );
      expect(tasks, orderedEquals([
        Task()
          ..id = 123
          ..title = 'Example Task'
          ..notes = 'This is an example task'
          ..status = TaskStatus.NEW
          ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12))
          ..eventCategory = EventCategory.WORK
          ..timeChunksRequired = 4.hours
          ..timeChunksRemaining = 4.hours
          ..timeChunksSpent = 0.hours
          ..freeze(),
        Task()
          ..title = 'Example Task'
          ..notes = 'This is an example task'
          ..status = TaskStatus.NEW
          ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12))
          ..eventCategory = EventCategory.WORK
          ..timeChunksRequired = 1.hours
          ..timeChunksRemaining = 1.hours
          ..timeChunksSpent = 0.hours
          ..freeze(),
      ]));
    });
    test('Test splitting one task with different time remaining', () {
      final List<Task> tasks = budgeter.splitTaskInTwo(Task()
        ..id = 123
        ..title = 'Example Task'
        ..notes = 'This is an example task'
        ..status = TaskStatus.NEW
        ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12))
        ..eventCategory = EventCategory.WORK
        ..timeChunksRequired = 5.hours
        ..timeChunksRemaining = 4.hours + 1.halfHours
        ..timeChunksSpent = 1.halfHours
        ..freeze(),
        4 * 4,
      );
      expect(tasks, orderedEquals([
        Task()
          ..id = 123
          ..title = 'Example Task'
          ..notes = 'This is an example task'
          ..status = TaskStatus.NEW
          ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12))
          ..eventCategory = EventCategory.WORK
          ..timeChunksRequired = 4.hours
          ..timeChunksRemaining = 3.hours + 1.halfHours
          ..timeChunksSpent = 1.halfHours
          ..freeze(),
          // remainder
        Task()
          ..title = 'Example Task'
          ..notes = 'This is an example task'
          ..status = TaskStatus.NEW
          ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12))
          ..eventCategory = EventCategory.WORK
          ..timeChunksRequired = 1.halfHours
          ..timeChunksRemaining = 1.halfHours
          ..timeChunksSpent = 0
          ..freeze(),
      ]));
    });
    test('Test splits off into multiple tasks', () {
      final task = Task()
        ..id = 123
        ..title = 'Example Task'
        ..notes = 'This is an example task'
        ..status = TaskStatus.NEW
        ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12))
        ..eventCategory = EventCategory.WORK
        ..timeChunksRequired = 5.hours
        ..timeChunksRemaining = 5.hours
        ..timeChunksSpent = 0.hours
        ..freeze();
        
      final placeholder = Task()
        ..id = 124
        ..title = 'Work placeholder'
        ..status = TaskStatus.NEW
        ..due = Timestamp.fromDateTime(DateTime(2023, 11, 13))
        ..eventCategory = EventCategory.WORK
        ..timeChunksRequired = 3.hours
        ..timeChunksRemaining = 3.hours
        ..timeChunksSpent = 0.hours
        ..freeze();

       final split = budgeter.splitByBudgets([task, placeholder]);
       expect(split, unorderedEquals([
          EditCommand(
            Task()
              ..id = 123
              ..title = 'Example Task'
              ..notes = 'This is an example task'
              ..status = TaskStatus.NEW
              ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 12, 6))
              ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12, 21))
              ..eventCategory = EventCategory.WORK
              ..timeChunksRequired = 4.hours
              ..timeChunksRemaining = 4.hours
              ..timeChunksSpent = 0.hours
              ..freeze(),
          ),
          CreateCommand(
            Task()
              ..title = 'Example Task'
              ..notes = 'This is an example task'
              ..status = TaskStatus.NEW
              ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 13, 6))
              ..due = Timestamp.fromDateTime(DateTime(2023, 11, 13, 21))
              ..eventCategory = EventCategory.WORK
              ..timeChunksRequired = 1.hours
              ..timeChunksRemaining = 1.hours
              ..timeChunksSpent = 0.hours
              ..freeze(),
          ),
          EditCommand(
            Task()
              ..id = 124
              ..title = 'Work placeholder'
              ..status = TaskStatus.NEW
              ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 13, 6))
              ..due = Timestamp.fromDateTime(DateTime(2023, 11, 13, 21))
              ..eventCategory = EventCategory.WORK
              ..timeChunksRequired = 3.hours
              ..timeChunksRemaining = 3.hours
              ..timeChunksSpent = 0.hours
              ..freeze(),
          ),
        ]),
       );
    });
    test('Test single small task is not split', () {
      final task = Task()
        ..id = 123
        ..title = 'Example Task'
        ..notes = 'This is an example task'
        ..status = TaskStatus.NEW
        ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12))
        ..eventCategory = EventCategory.WORK
        ..timeChunksRequired = 1.hours
        ..freeze();
          
      final split = budgeter.splitByBudgets([task]);
      expect(split, unorderedEquals([
        EditCommand(
          Task()
            ..id = 123
            ..title = 'Example Task'
            ..notes = 'This is an example task'
            ..status = TaskStatus.NEW
            ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 12, 6))
            ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12, 21))
            ..eventCategory = EventCategory.WORK
            ..timeChunksRequired = 1.hours 
            ..freeze(),
        ),
      ]));
    });
    test('Test only work tasks are modified', () {
      final workTask = Task()
        ..id = 123
        ..title = 'Example Work Task'
        ..notes = 'This is an example work task'
        ..status = TaskStatus.NEW
        ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12))
        ..eventCategory = EventCategory.WORK
        ..timeChunksRequired = 5.hours
        ..timeChunksRemaining = 5.hours
        ..timeChunksSpent = 0.hours
        ..freeze();

      final personalTask = Task()
        ..id = 124
        ..title = 'Example Personal Task'
        ..notes = 'This is an example personal task'
        ..status = TaskStatus.NEW
        ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12))
        ..eventCategory = EventCategory.PERSONAL
        ..timeChunksRequired = 1.hours
        ..timeChunksRemaining = 1.hours
        ..timeChunksSpent = 0.hours
        ..freeze();

      final tasks = [workTask, personalTask];
      final splitTasks = budgeter.splitByBudgets(tasks);
      
      expect(splitTasks, orderedEquals([
          EditCommand(
            workTask.rebuild((task) {
              task.timeChunksRequired = 4.hours;
              task.timeChunksRemaining = 4.hours;
              task.timeChunksSpent = 0.hours;
              task.snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 12, 6));
              task.due = Timestamp.fromDateTime(DateTime(2023, 11, 12, 21));
            }),
          ),
          CreateCommand(
            workTask.rebuild((task) {
              task.clearId();
              task.timeChunksRequired = 1.hours;
              task.timeChunksRemaining = 1.hours;
              task.timeChunksSpent = 0.hours;
              task.due = Timestamp.fromDateTime(DateTime(2023, 11, 13, 21));
              task.snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 13, 6));
            }),
          ),
        // [personalTask],
      ]));
    });

    test('Test updating work tasks and creating new ones', () {
      final workTask1 = Task()
        ..id = 123
        ..title = 'Example Work Task 1'
        ..notes = 'This is an example work task'
        ..status = TaskStatus.NEW
        ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12))
        ..eventCategory = EventCategory.WORK
        ..timeChunksRequired = 10.hours
        ..timeChunksRemaining = 10.hours
        ..timeChunksSpent = 0.hours
        ..freeze();

      final workTask2 = Task()
        ..id = 124
        ..title = 'Example Work Task 2'
        ..notes = 'This is another example work task'
        ..status = TaskStatus.NEW
        ..due = Timestamp.fromDateTime(DateTime(2023, 11, 14))
        ..eventCategory = EventCategory.WORK
        ..timeChunksRequired = 2.hours
        ..timeChunksRemaining = 2.hours
        ..timeChunksSpent = 0.hours
        ..freeze();

      final tasks = [workTask1, workTask2];
      final splitTasks = budgeter.splitByBudgets(tasks);

      expect(splitTasks, orderedEquals([
        EditCommand(
          workTask1.rebuild((task) {
            task.timeChunksRequired = 4.hours;
            task.timeChunksRemaining = 4.hours;
            task.timeChunksSpent = 0.hours;
            task.snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 12, 6));
            task.due = Timestamp.fromDateTime(DateTime(2023, 11, 12, 21));
          }),
        ),
        CreateCommand(
          workTask1.rebuild((task) {
            task.clearId();
            task.timeChunksRequired = 4.hours;
            task.timeChunksRemaining = 4.hours;
            task.timeChunksSpent = 0.hours;
            task.due = Timestamp.fromDateTime(DateTime(2023, 11, 13, 21));
            task.snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 13, 6));
          }),
        ),
        CreateCommand(
          workTask1.rebuild((task) {
            task.clearId();
            task.timeChunksRequired = 2.hours;
            task.timeChunksRemaining = 2.hours;
            task.timeChunksSpent = 0.hours;
            task.due = Timestamp.fromDateTime(DateTime(2023, 11, 14, 21));
            task.snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 14, 6));
          }),
        ),
        EditCommand(
          workTask2.rebuild((task) {
            task.timeChunksRequired = 2.hours;
            task.timeChunksRemaining = 2.hours;
            task.timeChunksSpent = 0.hours;
            task.due = Timestamp.fromDateTime(DateTime(2023, 11, 14, 21));
            task.snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 14, 6));
          }),
        ),
      ]));
    });
    test('Test tasks overflow in the next day', () {
      final task = Task()
        ..id = 123
        ..title = 'Example Task'
        ..notes = 'This is an example task'
        ..status = TaskStatus.NEW
        ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 12, 6))
        ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12, 21))
        ..eventCategory = EventCategory.WORK
        ..timeChunksRequired = 3.hours + 1.halfHours
        ..timeChunksRemaining = 3.hours + 1.halfHours
        ..timeChunksSpent = 0.hours
        ..freeze();
        
      final placeholder = Task()
        ..id = 124
        ..title = 'Work placeholder 1'
        ..status = TaskStatus.NEW
        ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 12, 6))
        ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12, 21))
        ..eventCategory = EventCategory.WORK
        ..timeChunksRequired = 4.hours
        ..timeChunksRemaining = 4.hours
        ..timeChunksSpent = 0.hours
        ..freeze();
      final placeholder2 = Task()
        ..id = 125
        ..title = 'Work placeholder 2'
        ..status = TaskStatus.NEW
        ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 12, 6))
        ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12, 21))
        ..eventCategory = EventCategory.WORK
        ..timeChunksRequired = 4.hours
        ..timeChunksRemaining = 4.hours
        ..timeChunksSpent = 0.hours
        ..freeze();
      final placeholder3 = Task()
        ..id = 126
        ..title = 'Work placeholder 3'
        ..status = TaskStatus.NEW
        ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 12, 6))
        ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12, 21))
        ..eventCategory = EventCategory.WORK
        ..timeChunksRequired = 4.hours
        ..timeChunksRemaining = 4.hours
        ..timeChunksSpent = 0.hours
        ..freeze();

       final split = budgeter.splitByBudgets([task, placeholder, placeholder2, placeholder3]);
       expect(split, unorderedEquals([
          EditCommand(
            task.rebuild((task) {
              task
                ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 12, 6))
                ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12, 21))
                ..timeChunksRequired = 3.hours + 1.halfHours
                ..timeChunksRemaining = 3.hours + 1.halfHours;
            }),
          ),
          EditCommand(
            placeholder.rebuild((task) {
              task
                ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 12, 6))
                ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12, 21))
                ..timeChunksRequired = 1.halfHours
                ..timeChunksRemaining = 1.halfHours;
            }),
          ),
          CreateCommand(
            placeholder.rebuild((task) {
              task
                ..clearId()
                ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 13, 6))
                ..due = Timestamp.fromDateTime(DateTime(2023, 11, 13, 21))
                ..timeChunksRequired = 3.hours + 1.halfHours
                ..timeChunksRemaining = 3.hours + 1.halfHours;
            }),
          ),
          EditCommand(
            placeholder2.rebuild((task) {
              task
                ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 13, 6))
                ..due = Timestamp.fromDateTime(DateTime(2023, 11, 13, 21))
                ..timeChunksRequired = 1.halfHours
                ..timeChunksRemaining = 1.halfHours;
            }),
          ),
          CreateCommand(
            placeholder2.rebuild((task) {
              task
                ..clearId()
                ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 14, 6))
                ..due = Timestamp.fromDateTime(DateTime(2023, 11, 14, 21))
                ..timeChunksRequired = 3.hours + 1.halfHours
                ..timeChunksRemaining = 3.hours + 1.halfHours;
            }),
          ),
          EditCommand(
            placeholder3.rebuild((task) {
              task
                ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 14, 6))
                ..due = Timestamp.fromDateTime(DateTime(2023, 11, 14, 21))
                ..timeChunksRequired = 1.halfHours
                ..timeChunksRemaining = 1.halfHours;
            }),
          ),
          CreateCommand(
            placeholder3.rebuild((task) {
              task
                ..clearId()
                ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 15, 6))
                ..due = Timestamp.fromDateTime(DateTime(2023, 11, 15, 21))
                ..timeChunksRequired = 3.hours + 1.halfHours
                ..timeChunksRemaining = 3.hours + 1.halfHours;
            }),
          ),
        ]),
       );
    });
    test('Merges tasks back into one task if they have the same name', () {
      final task = Task()
        ..id = 123
        ..title = 'Work'
        ..status = TaskStatus.NEW
        ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 13, 6))
        ..due = Timestamp.fromDateTime(DateTime(2023, 11, 13, 21))
        ..eventCategory = EventCategory.WORK
        ..timeChunksRequired = 2.hours + 1.halfHours
        ..timeChunksRemaining = 2.hours + 1.halfHours
        ..timeChunksSpent = 0.hours
        ..freeze();
        
      final placeholder = Task()
        ..id = 125
        ..title = 'Work placeholder'
        ..status = TaskStatus.NEW
        ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 14, 6))
        ..due = Timestamp.fromDateTime(DateTime(2023, 11, 14, 21))
        ..eventCategory = EventCategory.WORK
        ..timeChunksRequired = 4.hours
        ..timeChunksRemaining = 4.hours
        ..timeChunksSpent = 0.hours
        ..freeze();

      final task2 = Task()
        ..id = 124
        ..title = 'Work'
        ..status = TaskStatus.NEW
        ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 15, 6))
        ..due = Timestamp.fromDateTime(DateTime(2023, 11, 15, 21))
        ..eventCategory = EventCategory.WORK
        ..timeChunksRequired = 4.hours
        ..timeChunksRemaining = 4.hours
        ..timeChunksSpent = 0.hours
        ..freeze();

       final split = budgeter.splitByBudgets([task, placeholder, task2]);
       expect(split, orderedEquals([
          DeleteCommand(task2),
          EditCommand(
            task.rebuild((task) {
              task
                ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 12, 6))
                ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12, 21))
                ..timeChunksRequired = 4.hours
                ..timeChunksRemaining = 4.hours;
            }),
          ),
          CreateCommand(
            task.rebuild((task) {
              task
                ..clearId()
                ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 13, 6))
                ..due = Timestamp.fromDateTime(DateTime(2023, 11, 13, 21))
                ..timeChunksRequired = 2.hours + 1.halfHours
                ..timeChunksRemaining = 2.hours + 1.halfHours;
            }),
          ),
          EditCommand(
            placeholder.rebuild((task) {
              task
                ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 13, 6))
                ..due = Timestamp.fromDateTime(DateTime(2023, 11, 13, 21))
                ..timeChunksRequired = 1.hours + 1.halfHours
                ..timeChunksRemaining = 1.hours + 1.halfHours;
            }),
          ),
          CreateCommand(
            placeholder.rebuild((task) {
              task
                ..clearId()
                ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 14, 6))
                ..due = Timestamp.fromDateTime(DateTime(2023, 11, 14, 21))
                ..timeChunksRequired = 2.hours + 1.halfHours
                ..timeChunksRemaining = 2.hours + 1.halfHours;
            }),
          ),
       ]));
    });
    test('Doesn\'t merge non snoozed tasks because it\'s not safe', () {    
      final placeholder = Task()
        ..id = 124
        ..title = 'Work placeholder'
        ..status = TaskStatus.NEW
        ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 12, 6))
        ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12, 21))
        ..eventCategory = EventCategory.WORK
        ..timeChunksRequired = 2.hours
        ..timeChunksRemaining = 2.hours
        ..timeChunksSpent = 0.hours
        ..freeze();
      final placeholder2 = Task()
        ..id = 125
        ..title = 'Work placeholder'
        ..status = TaskStatus.NEW
        ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 13, 6))
        ..due = Timestamp.fromDateTime(DateTime(2023, 11, 13, 21))
        ..eventCategory = EventCategory.WORK
        ..timeChunksRequired = 2.hours
        ..timeChunksRemaining = 2.hours
        ..timeChunksSpent = 0.hours
        ..freeze();
      final placeholder3 = Task()
        ..id = 126
        ..title = 'Work placeholder'
        ..status = TaskStatus.NEW
        ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 14, 6))
        ..due = Timestamp.fromDateTime(DateTime(2023, 11, 14, 21))
        ..eventCategory = EventCategory.WORK
        ..timeChunksRequired = 4.hours
        ..timeChunksRemaining = 4.hours
        ..timeChunksSpent = 0.hours
        ..freeze();

       final split = budgeter.splitByBudgets([placeholder, placeholder2, placeholder3]);
       expect(split, orderedEquals([
          DeleteCommand(placeholder2),
          DeleteCommand(placeholder3),
          EditCommand(
            placeholder.rebuild((task) {
              task
                ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 12, 6))
                ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12, 21))
                ..timeChunksRequired = 4.hours
                ..timeChunksRemaining = 4.hours;
            }),
          ),
          CreateCommand(
            placeholder.rebuild((task) {
              task
                ..clearId()
                ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 13, 6))
                ..due = Timestamp.fromDateTime(DateTime(2023, 11, 13, 21))
                ..timeChunksRequired = 4.hours
                ..timeChunksRemaining = 4.hours;
            }),
          ),
       ]));
    });
  });
  group('Test no saturday behavior', () {
    late TimeBudgeter budgeter;
    print(DateTime(2023, 11, 12).weekday);
    
    setUp(() {
      budgeter = TimeBudgeter(
        BudgetConfig(
          budgetMatcher: 
            [(Task task) => task.eventCategory == EventCategory.WORK], 
            budgetPerDayInChunks: 4.hours, 
            startingDay: DateTime(2023, 11, 10), policy: TimePolicy(work: TimePolicy_DayHoursMap(dayHours: {
              "MONDAY": TimePolicy_DayHours(intervals: [
                TimePolicy_DayHours_Interval(start: "06:00:00", end: "21:00:00", duration: 21 - 6),
              ]),
              "TUESDAY": TimePolicy_DayHours(intervals: [
                TimePolicy_DayHours_Interval(start: "06:00:00", end: "21:00:00", duration: 21 - 6),
              ]),
              "WEDNESDAY": TimePolicy_DayHours(intervals: [
                TimePolicy_DayHours_Interval(start: "06:00:00", end: "21:00:00", duration: 21 - 6),
              ]),
              "THURSDAY": TimePolicy_DayHours(intervals: [
                TimePolicy_DayHours_Interval(start: "06:00:00", end: "21:00:00", duration: 21 - 6),
              ]),
              "FRIDAY": TimePolicy_DayHours(intervals: [
                TimePolicy_DayHours_Interval(start: "06:00:00", end: "21:00:00", duration: 21 - 6),
              ]),
              // NO SATURDAY
              "SUNDAY": TimePolicy_DayHours(intervals: [
                TimePolicy_DayHours_Interval(start: "06:00:00", end: "21:00:00", duration: 21 - 6),
              ]),
            })),
        ),
      );
    });
    test('Saturday is skipped when distributing tasks', () {
      final task = Task()
        ..id = 123
        ..title = 'Example Task'
        ..notes = 'This is an example task'
        ..status = TaskStatus.NEW
        ..due = Timestamp.fromDateTime(DateTime(2023, 11, 10))
        ..eventCategory = EventCategory.WORK
        ..timeChunksRequired = 10.hours
        ..timeChunksRemaining = 10.hours
        ..timeChunksSpent = 0.hours
        ..freeze();

      final tasks = [task];
      final splitTasks = budgeter.splitByBudgets(tasks);

      expect(splitTasks, orderedEquals([
        EditCommand(
          task.rebuild((task) {
            task
              ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 10, 6))
              ..due = Timestamp.fromDateTime(DateTime(2023, 11, 10, 21))
              ..timeChunksRequired = 4.hours
              ..timeChunksRemaining = 4.hours;
          }),
        ),
        CreateCommand(
          task.rebuild((task) {
            task
              ..clearId()
              ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 12, 6))
              ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12, 21))
              ..timeChunksRequired = 4.hours
              ..timeChunksRemaining = 4.hours;
          }),
        ),
        CreateCommand(
          task.rebuild((task) {
            task
              ..clearId()
              ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 13, 6))
              ..due = Timestamp.fromDateTime(DateTime(2023, 11, 13, 21))
              ..timeChunksRequired = 2.hours
              ..timeChunksRemaining = 2.hours;
          }),
        ),
      ]));
    });
  });

}
