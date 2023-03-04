import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/grpc/time_policy.pb.dart';

class TimePolicyService {
  static const _baseUrl = 'https://api.app.reclaim.ai';
  final http.Client _client;
  final String token;

  TimePolicyService(this._client, this.token);

  Future<TimePolicy> getCurrentUserTimePolicy() async {
    final url = Uri.parse('$_baseUrl/api/users/current');
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': 'https://mixindennisbarzanoffmixin.github.io',
      'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE,OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type, Authorization',
    };

    final response = await _client.get(url, headers: headers);
    if (response.statusCode != 200) {
      throw 'Unexpected status code ${response.statusCode}';
    }

    final Map<String, dynamic> data = jsonDecode(response.body)['features']['timePolicies'];
    return TimePolicy()..mergeFromProto3Json(data);
  }
}

