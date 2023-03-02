import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  late Future<http.Response> future;
  late http.Client client = http.Client();
  @override
  void initState() {
    super.initState();
    final url = Uri.https(
      'api.app.reclaim.ai',
      '/api/tasks',
      {'status': 'NEW,SCHEDULED,IN_PROGRESS,COMPLETE'},
    );

    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer c59e0b11-9cc8-4e03-bb50-ba55d0e71fd1'
    };

    future = http.get(url, headers: headers);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder<http.Response>(
          future: future,
          builder:
              (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
            if (snapshot.hasError) {
              // if (kDebugMode) {
              //   print(snapshot.error);
              // }
            }
            if (snapshot.hasData) {
              if (kDebugMode) {
                print(snapshot.data!.statusCode);
                // print(snapshot.data!.body);
              }
              final data = jsonDecode(snapshot.data!.body);
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: ((context, index) {
                  final object = data[index];
                  final task = Task()..mergeFromProto3Json(object);
                  return SizedBox(
                    width: double.infinity,
                    child: Text(
                      "${task.title} ${task.timeChunksRemaining / 4}h",
                      style: Theme.of(context).textTheme.headline4,
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
