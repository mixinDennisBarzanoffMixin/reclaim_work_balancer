import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/grpc/time_policy.pb.dart';

class TimePolicyService {
  static const _baseUrl = 'https://api.app.reclaim.ai';
  final http.Client _client;

  TimePolicyService(this._client);

  Future<TimePolicy> getCurrentUserTimePolicy() async {
    final url = Uri.parse('$_baseUrl/api/users/current');
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${const String.fromEnvironment('RECLAIM_TOKEN')}',
    };

    final response = await _client.patch(url, headers: headers);
    if (response.statusCode != 200) {
      throw 'Unexpected status code ${response.statusCode}';
    }

    final data = jsonDecode(response.body)['features']['timePolicies'];
    final timePolicy = TimePolicy()..mergeFromProto3Json(data);
    return timePolicy;
  }
}
