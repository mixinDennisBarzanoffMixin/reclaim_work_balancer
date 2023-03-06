import 'dart:math';

import 'package:flutter/material.dart';
import 'package:protobuf/protobuf.dart';

import 'models/grpc/google/protobuf/timestamp.pb.dart';
import 'models/grpc/reclaim_task.pb.dart';
import 'models/grpc/time_policy.pb.dart';

class BudgetConfig {
  final List<bool Function(Task)> budgetMatcher;
  final int budgetPerDayInChunks;
  final DateTime startingDay;
  final TimePolicy policy;

  const BudgetConfig({
    required this.budgetMatcher,
    required this.budgetPerDayInChunks,
    required this.startingDay,
    required this.policy,
  });
}

extension Chunks on Task {
  int get estimatedTimeInSeconds {
    return timeChunksRequired * 15 * 60;
  }
}

class TimeBudgeter {
  final BudgetConfig config;

  TimeBudgeter(this.config);
  List<Task> balanceTasks(List<Task> tasks) {
    final split = splitByBudgets(tasks);
    return split
        .map((sublist) => updateTasksForBudget(sublist, config))
        .toList()
        .fold([], (all, one) => [...all, ...one]);
  }

  List<List<Task>> splitByBudgets(List<Task> tasks) {
    final pockets = config.budgetMatcher.map((matcher) {
      return tasks.where(matcher).toList();
    }).toList();
    return pockets
        .map((pocket) => updateTasksForBudget(pocket, config))
        .toList();
  }

  /// Split task in multiple tasks if it exceeds the budget
  List<Task> splitTaskInTwo(Task task, int requiredChunks) {
    assert(requiredChunks <= task.timeChunksRemaining);
    assert(requiredChunks <= config.budgetPerDayInChunks);
    // Calculate the number of chunks per split task
    // case 1: the task is smaller or equal to the required chunks
    if (task.timeChunksRemaining <= requiredChunks) {
      return [task];
    }
    // case 2: the task is bigger than the required chunks
    return [
      task.rebuild((task) {
        // task.timeChunksRequired = requiredChunks;
        task.timeChunksRemaining = requiredChunks - task.timeChunksSpent;
        task.timeChunksRequired = task.timeChunksRemaining + task.timeChunksSpent;
        // task.timeChunksSpent = 0;
      }),
      task.rebuild((task) {
        task.clearId();
        task.timeChunksRemaining = task.timeChunksRemaining - requiredChunks;
        task.timeChunksRequired = task.timeChunksRemaining;
        task.timeChunksSpent = 0;
      }),
    ];
  }

  DateTime morningTime(DateTime date) {
    return DateTime(date.year, date.month, date.day, 6, 0, 0);
  }

  DateTime eveningTime(DateTime date) {
    return DateTime(date.year, date.month, date.day, 21, 0, 0);
  }

  List<int> _weekDays(TimePolicy_DayHoursMap map) {
    return [
      if (map.dayHours.containsKey("MONDAY")) 1,
      if (map.dayHours.containsKey("TUESDAY")) 2,
      if (map.dayHours.containsKey("WEDNESDAY")) 3,
      if (map.dayHours.containsKey("THURSDAY")) 4,
      if (map.dayHours.containsKey("FRIDAY")) 5,
      if (map.dayHours.containsKey("SATURDAY")) 6,
      if (map.dayHours.containsKey("SUNDAY")) 7,
    ];
  }

  DateTime findNextAvailableDate(DateTime date) {
    final weekDays = _weekDays(config.policy.work);
    if (weekDays.isEmpty) return date;
    while (!weekDays.contains(date.weekday)) {
      date = date.add(const Duration(days: 1));
    }
    return date;
  }

  /// This function takes a time budget config and creates and updates the taskToSort list to fit the budget.
  /// It iterates over all the tasks, determining if the budget is exceeded. If it is, it creates a placeholder task
  /// While iterating over the tasks, it calculates the remaining time left in the current day.
  /// If the task cannot be completed in the current day, it makes the task shorter, then duplicates the task into the next day as many times as necessary over and over until it is lower than the budget at some point.
  List<Task> updateTasksForBudget(List<Task> tasksToSort, BudgetConfig config) {
    final tasks = [...tasksToSort];
    var currentDate = config.startingDay;
    // loop through the tasks in the budget
    var currentDayUsedUpBudgetChunks = 0;
    final weekDays = _weekDays(config.policy.work);
    if (weekDays.isEmpty) return [];
    for (var i = 0; i < tasks.length; i++) {
      // for every task determine if it's in the budget
      var task = tasks[i];
      // loop until you find a currentDate that is specified in the config budget
      
      if (currentDayUsedUpBudgetChunks == config.budgetPerDayInChunks) {
        // if the current day is used up, reset the current day used up budget chunks
        currentDayUsedUpBudgetChunks = 0;
        // and set the current date to the next day
        currentDate = currentDate.add(const Duration(days: 1));
      }

      currentDate = findNextAvailableDate(currentDate);
      print("Weekday: ${currentDate.weekday}");
      // reset the task just in case to the current date
      task = task.rebuild((task) {
        task
          ..snoozeUntil = Timestamp.fromDateTime(morningTime(currentDate))
          ..due = Timestamp.fromDateTime(eveningTime(currentDate));
      });
      tasks[i] = task;
      // if the task is in the budget
      // if (taskIsInTheBudget(task)) continue;
      final timeRemaining = config.budgetPerDayInChunks - currentDayUsedUpBudgetChunks;
      if (task.timeChunksRemaining <= timeRemaining) {
        currentDayUsedUpBudgetChunks += task.timeChunksRemaining;
        continue;
      }
      // task is now the proper time, but might be exceeding the budget
      // split task into multiple tasks, add the second one for later in the list
      final remainingSpaceForDay =
          config.budgetPerDayInChunks - currentDayUsedUpBudgetChunks;
      final splitTasks = splitTaskInTwo(task, remainingSpaceForDay);
      tasks[i] = splitTasks[0];
      // insert the rest of the tasks into the list for processing
      tasks.insertAll(i + 1, splitTasks.sublist(1));
      currentDayUsedUpBudgetChunks += remainingSpaceForDay;
    }
    return tasks;
  }

  // Task createPlaceholderTask(Timestamp date, int timeChunksRequired) {
  //   return Task(
  //     id: UniqueKey().hashCode,
  //     title: 'Work placeholder',
  //     eventCategory: EventCategory.WORK,
  //     status: TaskStatus.NEW,
  //     timeChunksRequired: timeChunksRequired,
  //     due: date,
  //   );
  // }
}
