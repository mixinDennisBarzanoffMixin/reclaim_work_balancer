import 'dart:convert';

import 'package:reclaim_work_balancer/models/grpc/reclaim_task.pb.dart';
import 'package:http/http.dart' as http;

class ReclaimTaskService {
  final http.Client client;
  ReclaimTaskService(this.client);
  Future<List<Task>> fetchAllTasks() async {
    final url = Uri.https(
      'api.app.reclaim.ai',
      '/api/tasks',
      {
        'status':
            '${TaskStatus.NEW},${TaskStatus.SCHEDULED},${TaskStatus.IN_PROGRESS},${TaskStatus.COMPLETED}'
      },
    );

    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer c59e0b11-9cc8-4e03-bb50-ba55d0e71fd1'
    };

    final response = await client.get(url, headers: headers);
    if (response.statusCode != 200) {
      throw 'Unexpected status code ${response.statusCode}';
    }
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((data) {
      final task = Task()..mergeFromProto3Json(data);
      return task;
    }).toList();
  }

  /// Makes an http request to the reclaim endpoint to update the task.
  /// Converts the task to json using the protobuf json encoder.
  /// Sets the appropriate headers
  /// Checks the response status and throws an exception if it is not 200
  Future<void> updateTask(final Task task) async {
    final url = Uri.https('api.app.reclaim.ai', '/api/tasks/${task.id}');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer c59e0b11-9cc8-4e03-bb50-ba55d0e71fd1'
    };

    final body = jsonEncode(task.writeToJsonMap());

    final response = await client.put(url, headers: headers, body: body);

    if (response.statusCode != 200) {
      throw 'Unexpected status code ${response.statusCode}';
    }
  }

  Future<Task> createTask(final Task task) async {
    final url = Uri.https(
      'api.app.reclaim.ai',
      '/api/tasks',
    );

    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer c59e0b11-9cc8-4e03-bb50-ba55d0e71fd1',
      'Content-Type': 'application/json',
    };

    final response = await client.post(
      url,
      headers: headers,
      body: jsonEncode(task.writeToJson()),
    );

    if (response.statusCode != 200) {
      throw 'Unexpected status code ${response.statusCode}';
    }

    final data = jsonDecode(response.body);
    final newTask = Task()..mergeFromProto3Json(data);
    return newTask;
  }
}
