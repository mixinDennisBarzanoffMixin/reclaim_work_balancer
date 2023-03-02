import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:reclaim_work_balancer/services/reclaim_task_service.dart';

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
  @override
  void initState() {
    super.initState();
    service = ReclaimTaskService(client);
    future = service.fetchAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder<List<Task>>(
          future: future,
          builder:
              (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  final task = snapshot.data![index];
                  return SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          "${task.eventCategory} ${task.timeChunksRemaining / 4}h",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  );
                }),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
