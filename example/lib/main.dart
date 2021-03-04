import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:metal_check/metal_check.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _metalAvailable;
  String _error;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    bool metalAvailable;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      metalAvailable = await MetalCheck.isMetalAvailable;
      _error = null;
    } on PlatformException {
      _error = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _metalAvailable = metalAvailable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: _error != null
              ? Text('Error: $_error')
              : _metalAvailable == null
                  ? CircularProgressIndicator()
                  : Text('Metal available $_metalAvailable'),
        ),
      ),
    );
  }
}
