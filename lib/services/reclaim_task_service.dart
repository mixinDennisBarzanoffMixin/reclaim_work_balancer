import 'dart:convert';

import 'package:reclaim_work_balancer/models/grpc/reclaim_task.pb.dart';
import 'package:http/http.dart' as http;

class ReclaimTaskService {
  final http.Client client;
  final String token;
  ReclaimTaskService(this.client, this.token);
  Future<List<Task>> fetchAllTasks({
    bool instances = false,
  }) async {
    final url = Uri.https(
      'api.app.reclaim.ai',
      '/api/tasks',
      {
        'status':
            '${TaskStatus.NEW},${TaskStatus.SCHEDULED},${TaskStatus.IN_PROGRESS},${TaskStatus.COMPLETED}',
        if (instances) 'instances': 'true',
      },
    );

    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': 'https://mixindennisbarzanoffmixin.github.io',
      'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE,OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type, Authorization',
    };

    final response = await client.get(url, headers: headers);
    if (response.statusCode != 200) {
      throw 'Unexpected status code ${response.statusCode}';
    }
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((data) {
      final task = Task()
        ..mergeFromProto3Json(data)
        ..freeze();
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
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': 'https://mixindennisbarzanoffmixin.github.io',
      'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE,OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type, Authorization',
    };

    final body = jsonEncode(task.toProto3Json());

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
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': 'https://mixindennisbarzanoffmixin.github.io',
      'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE,OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type, Authorization',
    };

    final response = await client.post(
      url,
      headers: headers,
      body: jsonEncode(task.toProto3Json()),
    );

    if (response.statusCode != 200) {
      throw 'Unexpected status code ${response.statusCode}';
    }

    final data = jsonDecode(response.body);
    final newTask = Task()
      ..mergeFromProto3Json(data)
      ..freeze();
    return newTask;
  }
  
  Future<void> reindex(Task task, String reindexDirection, int relativeTaskId) async {
    final url = Uri.https('api.app.reclaim.ai', '/api/tasks/${task.id}/reindex');
    
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': 'https://mixindennisbarzanoffmixin.github.io',
      'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE,OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type, Authorization',
    };
    
    final body = jsonEncode({
      'reindexDirection': reindexDirection,
      'relativeTaskId': relativeTaskId,
    });
    
    final response = await client.patch(url, headers: headers, body: body);
    
    if (response.statusCode != 200) {
      throw 'Unexpected status code ${response.statusCode}';
    }
  }

}
