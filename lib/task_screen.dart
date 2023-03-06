import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:reclaim_work_balancer/services/reclaim_task_service.dart';
import 'package:reclaim_work_balancer/time_budgeter.dart';
import 'package:reclaim_work_balancer/util/time_conversion.dart';

import 'command.dart';
import 'models/grpc/reclaim_task.pb.dart';
import 'models/grpc/time_policy.pb.dart';
import 'services/reclaim_user_service.dart';

class TaskScreen extends StatefulWidget {
  final String token;
  const TaskScreen({Key? key, required this.token}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late Future<List<Task>> future;
  late http.Client client = http.Client();
  late ReclaimTaskService service;
  var tasks = <Task>[];
  late TimePolicyService timePolicyService;

  @override
  void initState() {
    super.initState();
    service = ReclaimTaskService(client, widget.token);
    timePolicyService = TimePolicyService(client, widget.token);
    timePolicyService.getCurrentUserTimePolicy().then((policty) {
      print(policty);
    });
    refresh();
  }
  Future<void> refresh() async {
    final value = await service.fetchAllTasks();
    setState(() {
      tasks = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: tasks.isEmpty
              ? null
              : () async {
                  await refresh();
                  // iterate over the list of pouches
                  // for each pouch, iterate over the tasks
                  // for each task, check if it has an id
                  // if it does, update the task
                  // if not, create a new task
                  // then fetch all tasks again
                  final TimePolicy policy =  await timePolicyService.getCurrentUserTimePolicy();
                  final timeBudgeter = TimeBudgeter(
                    BudgetConfig(
                      budgetMatcher: [(Task task) => task.eventCategory == EventCategory.WORK],
                      budgetPerDayInChunks: 4.hours,
                      startingDay: DateTime.now(),
                      policy: policy,
                    ),
                  );

                  final commands = timeBudgeter.splitByBudgets(tasks);
                  for (int i = 0; i < commands.length; i++) {
                    var command = commands[i];
                    await command.operation(service);
                    if (commands[i - 1] is! DeleteCommand) {
                      // we don't wanna move something after something that doesn't exist anymore
                      await service.reindex(commands[i].task, "after", commands[i - 1].task.id);
                    }
                  }
                  // for (final pouch in pouches) {
                  //   for (int i = 0; i < pouch.length; i++) {
                  //     final task = pouch[i];
                  //     if (task.hasId()) {
                  //       await service.updateTask(task);
                  //     } else {
                  //       final Task newTask = await service.createTask(task);
                  //       pouch[i] = newTask;
                  //     }

                  //     if (i > 0) {
                  //       try {
                        // } catch (e) {
                          // print(e);
                        // }
                      // }
                        // if pouch[i] isn't already after pouch[i - 1]
                    // }
                  // }
                  await refresh();
                },
          child: const Icon(Icons.refresh),
        ),
        body: SafeArea(
          child: Builder(builder: (context) {
            if (tasks.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ReorderableListView(
              children: tasks
                  .map((item) => ListTile(
                        key: ValueKey(item),
                        title: Text(item.title),
                        subtitle: Text(
                          "${item.timeChunksRemaining / 4}h",
                        ),
                        tileColor: item.eventCategory == EventCategory.WORK
                            ? Colors.blue
                            : Colors.orange,
                      ))
                  .toList(),
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (newIndex > oldIndex) {
                    newIndex -= 1;
                  }
                  final newTask = tasks[newIndex];
                  final oldTask = tasks[oldIndex];
                  final direction = oldIndex < newIndex ? "after" : "before";
                  () async {
                    await service.reindex(oldTask, direction, newTask.id);
                    await refresh();
                  }();
                });
              },
            );
          }),
        ),
      ),
    );
  }
}
