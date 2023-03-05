import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reclaim_work_balancer/task_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences_web/shared_preferences_web.dart' as web;

void main() {
  // if (kIsWeb) web.SharedPreferencesPlugin.registerWith(null);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Token Check',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TokenCheckPage(),
    );
  }
}

class TokenCheckPage extends StatefulWidget {
  @override
  _TokenCheckPageState createState() => _TokenCheckPageState();
}

class _TokenCheckPageState extends State<TokenCheckPage> {
  String? _token;

  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  Future<void> _checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    setState(() {
      _token = token;
    });
  }

  Future<void> _setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    setState(() {
      _token = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_token == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Enter Token'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Token',
                  ),
                  onSubmitted: _setToken,
                ),
              ],
            ),
          ),
        ),
      );
    } 
    return TaskScreen(token: _token!);
  }
}
