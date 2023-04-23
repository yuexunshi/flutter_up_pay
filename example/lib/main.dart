import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_up_pay/flutter_up_pay.dart';
import 'package:flutter_up_pay/union_pay_enum.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _flutterUpPayPlugin = FlutterUpPay();
  String _platformVersion = 'unKnow';

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> startPay() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      var result = await _flutterUpPayPlugin.startPay(
        mode: PaymentEnv.DEVELOPMENT,
        tn: "886511661307367448110",
        scheme: "UnionPayTest",
      );
      platformVersion = result.msg;
      debugPrint('===platformVersion=${result.name}');
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            Text(_platformVersion),
            TextButton(
              onPressed: () {
                startPay();
              },
              child: const Text("调起支付"),
            )
          ],
        ),
      ),
    );
  }
}
