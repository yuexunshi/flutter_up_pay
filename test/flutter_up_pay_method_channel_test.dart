import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_up_pay/flutter_up_pay_method_channel.dart';
import 'package:flutter_up_pay/union_pay_enum.dart';

void main() {
  MethodChannelFlutterUpPay platform = MethodChannelFlutterUpPay();
  const MethodChannel channel = MethodChannel('flutter_up_pay');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.startPay(tn: "tn", mode: PaymentEnv.DEVELOPMENT, scheme: "scheme"), '42');
  });
}
