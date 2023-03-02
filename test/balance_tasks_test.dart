import 'package:flutter_test/flutter_test.dart';
import 'package:protobuf/protobuf.dart';
import 'package:reclaim_work_balancer/models/grpc/google/protobuf/timestamp.pb.dart';
import 'package:reclaim_work_balancer/models/grpc/reclaim_task.pb.dart';
import 'package:reclaim_work_balancer/time_budgeter.dart';

void main() {
  group('Test reclaim tasks balancer', () {
    late TimeBudgeter budgeter;
    
    setUp(() {
      budgeter = TimeBudgeter(
        BudgetConfig(
          budgetMatcher: 
            [(Task task) => task.eventCategory == EventCategory.WORK], 
            budgetPerDayInChunks: 4 * 4, 
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
        ..timeChunksRequired = 5 * 4
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
          ..timeChunksRequired = 4 * 4
          ..freeze(),
        Task()
          ..title = 'Example Task'
          ..notes = 'This is an example task'
          ..status = TaskStatus.NEW
          ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12))
          ..eventCategory = EventCategory.WORK
          ..timeChunksRequired = 1 * 4
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
        ..timeChunksRequired = 5 * 4
        ..freeze();
        
      final placeholder = Task()
        ..id = 124
        ..title = 'Work placeholder'
        ..status = TaskStatus.NEW
        ..due = Timestamp.fromDateTime(DateTime(2023, 11, 13))
        ..eventCategory = EventCategory.WORK
        ..timeChunksRequired = 3 * 4
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
            ..timeChunksRequired = 4 * 4
            ..freeze(),
          Task()
            ..title = 'Example Task'
            ..notes = 'This is an example task'
            ..status = TaskStatus.NEW
            ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 13, 6))
            ..due = Timestamp.fromDateTime(DateTime(2023, 11, 13, 22))
            ..eventCategory = EventCategory.WORK
            ..timeChunksRequired = 1 * 4
            ..freeze(),
          Task()
            ..id = 124
            ..title = 'Work placeholder'
            ..status = TaskStatus.NEW
            ..snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 13, 6))
            ..due = Timestamp.fromDateTime(DateTime(2023, 11, 13, 22))
            ..eventCategory = EventCategory.WORK
            ..timeChunksRequired = 3 * 4
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
        ..timeChunksRequired = 1 * 4
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
          ..timeChunksRequired = 1 * 4
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
        ..timeChunksRequired = 4 * 5
        ..freeze();

      final personalTask = Task()
        ..id = 124
        ..title = 'Example Personal Task'
        ..notes = 'This is an example personal task'
        ..status = TaskStatus.NEW
        ..due = Timestamp.fromDateTime(DateTime(2023, 11, 12))
        ..eventCategory = EventCategory.PERSONAL
        ..timeChunksRequired = 4
        ..freeze();

      final tasks = [workTask, personalTask];
      final splitTasks = budgeter.splitByBudgets(tasks);
      
      expect(splitTasks[0], orderedEquals([
          workTask.rebuild((task) {
            task.timeChunksRequired = 4 * 4;
            task.snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 12, 6));
            task.due = Timestamp.fromDateTime(DateTime(2023, 11, 12, 22));
          }),
          workTask.rebuild((task) {
            task.clearId();
            task.timeChunksRequired = 4;
            task.due = Timestamp.fromDateTime(DateTime(2023, 11, 13, 22));
            task.snoozeUntil = Timestamp.fromDateTime(DateTime(2023, 11, 13, 6));
          }),
        // [personalTask],
      ]));
      expect(splitTasks.length, 1);
    });

  });

}
