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
      {'status': '${TaskStatus.NEW},${TaskStatus.SCHEDULED},${TaskStatus.IN_PROGRESS},${TaskStatus.COMPLETED}'},
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
}