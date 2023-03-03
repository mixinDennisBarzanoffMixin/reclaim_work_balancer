import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:reclaim_work_balancer/services/reclaim_task_service.dart';
import 'package:reclaim_work_balancer/time_budgeter.dart';

import 'models/grpc/reclaim_task.pb.dart';

void main() {
  String jsonString = '{"id": 2382282, "title": "SMBM-1788"}';

  Map<String, dynamic> jsonMap = json.decode(jsonString);

  final task = Task()..mergeFromProto3Json(jsonMap);
  // Task task = Task.fromJson(jsonString).toProto3Json();

  print(task.id); // prints 2382282
  print(task.title); // prints SMBM-1788
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Task>> future;
  late http.Client client = http.Client();
  late ReclaimTaskService service;
  var tasks = <Task>[];
  final timeBudgeter = TimeBudgeter(
    BudgetConfig(
      budgetMatcher: [(Task task) => task.eventCategory == EventCategory.WORK],
      budgetPerDayInChunks: 4 * 4,
      startingDay: DateTime.now(),
    ),
  );

  @override
  void initState() {
    super.initState();
    service = ReclaimTaskService(client);
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

                  final pouches = timeBudgeter.splitByBudgets(tasks);
                  for (final pouch in pouches) {
                    for (final task in pouch) {
                      if (task.hasId()) {
                        await service.updateTask(task);
                      } else {
                        final Task newTask = await service.createTask(task);
                        // reindex after task
                        // await service.reindex(newTask, "after", task.id);
                      }
                    }
                  }
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
                  // final 
                  // final item = tasks.removeAt(oldIndex);
                  // _items.insert(newIndex, item);
                });
              },
            );
            // return ListView.builder(
            //   itemCount: tasks.length,
            //   itemBuilder: (context, index) {
            //     final task = tasks[index];
            //     return SizedBox(
            //       width: double.infinity,
            //       child: Column(
            //         children: [
            //           Text(
            //             "${task.eventCategory} ${task.timeChunksRemaining / 4}h",
            //             style: Theme.of(context).textTheme.headline4,
            //           ),
            //         ],
            //       ),
            //     );
            //   },
            // );
          }),
        ),
      ),
    );
  }
}
