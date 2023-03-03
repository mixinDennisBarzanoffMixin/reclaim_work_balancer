import 'package:flutter_test/flutter_test.dart';
import 'package:protobuf/protobuf.dart';
import 'package:reclaim_work_balancer/models/grpc/google/protobuf/timestamp.pb.dart';
import 'package:reclaim_work_balancer/models/grpc/reclaim_task.pb.dart';
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
            startingDay: DateTime(2023, 11, 12),
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
       expect(split[0], unorderedEquals([
          Task()
            ..id = 123
            ..title = 'Example Task'
            ..notes = 'This is an example task'
            ..status = TaskStatus.NEW
            ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 12, 6))
            ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12, 22))
            ..eventCategory = EventCategory.WORK
            ..timeChunksRequired = 4.hours
            ..timeChunksRemaining = 4.hours
            ..timeChunksSpent = 0.hours
            ..freeze(),
          Task()
            ..title = 'Example Task'
            ..notes = 'This is an example task'
            ..status = TaskStatus.NEW
            ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 13, 6))
            ..due = Timestamp.fromDateTime(DateTime(2023, 11, 13, 22))
            ..eventCategory = EventCategory.WORK
            ..timeChunksRequired = 1.hours
            ..timeChunksRemaining = 1.hours
            ..timeChunksSpent = 0.hours
            ..freeze(),
          Task()
            ..id = 124
            ..title = 'Work placeholder'
            ..status = TaskStatus.NEW
            ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 13, 6))
            ..due = Timestamp.fromDateTime(DateTime(2023, 11, 13, 22))
            ..eventCategory = EventCategory.WORK
            ..timeChunksRequired = 3.hours
            ..timeChunksRemaining = 3.hours
            ..timeChunksSpent = 0.hours
            ..freeze(),
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
      expect(split[0], unorderedEquals([
        Task()
          ..id = 123
          ..title = 'Example Task'
          ..notes = 'This is an example task'
          ..status = TaskStatus.NEW
          ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 12, 6))
          ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12, 22))
          ..eventCategory = EventCategory.WORK
          ..timeChunksRequired = 1.hours 
          ..freeze(),
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
      
      expect(splitTasks[0], orderedEquals([
          workTask.rebuild((task) {
            task.timeChunksRequired = 4.hours;
            task.timeChunksRemaining = 4.hours;
            task.timeChunksSpent = 0.hours;
            task.snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 12, 6));
            task.due = Timestamp.fromDateTime(DateTime(2023, 11, 12, 22));
          }),
          workTask.rebuild((task) {
            task.clearId();
            task.timeChunksRequired = 1.hours;
            task.timeChunksRemaining = 1.hours;
            task.timeChunksSpent = 0.hours;
            task.due = Timestamp.fromDateTime(DateTime(2023, 11, 13, 22));
            task.snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 13, 6));
          }),
        // [personalTask],
      ]));
      expect(splitTasks.length, 1);
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

      expect(splitTasks[0], orderedEquals([
          workTask1.rebuild((task) {
            task.timeChunksRequired = 4.hours;
            task.timeChunksRemaining = 4.hours;
            task.timeChunksSpent = 0.hours;
            task.snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 12, 6));
            task.due = Timestamp.fromDateTime(DateTime(2023, 11, 12, 22));
          }),
          workTask1.rebuild((task) {
            task.clearId();
            task.timeChunksRequired = 4.hours;
            task.timeChunksRemaining = 4.hours;
            task.timeChunksSpent = 0.hours;
            task.due = Timestamp.fromDateTime(DateTime(2023, 11, 13, 22));
            task.snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 13, 6));
          }),
          workTask1.rebuild((task) {
            task.clearId();
            task.timeChunksRequired = 2.hours;
            task.timeChunksRemaining = 2.hours;
            task.timeChunksSpent = 0.hours;
            task.due = Timestamp.fromDateTime(DateTime(2023, 11, 14, 22));
            task.snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 14, 6));
          }),
          workTask2.rebuild((task) {
            task.timeChunksRequired = 2.hours;
            task.timeChunksRemaining = 2.hours;
            task.timeChunksSpent = 0.hours;
            task.due = Timestamp.fromDateTime(DateTime(2023, 11, 14, 22));
            task.snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 14, 6));
          }),
        ]));
        expect(splitTasks.length, 1);
    });

  });

}
