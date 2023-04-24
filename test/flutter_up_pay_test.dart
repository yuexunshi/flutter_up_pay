import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_up_pay/flutter_up_pay.dart';
import 'package:flutter_up_pay/flutter_up_pay_platform_interface.dart';
import 'package:flutter_up_pay/flutter_up_pay_method_channel.dart';
import 'package:flutter_up_pay/union_pay_enum.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterUpPayPlatform
    with MockPlatformInterfaceMixin
    implements FlutterUpPayPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> startPay(
          {required String tn,
          required PaymentEnv mode,
          required String scheme}) =>
      Future.value('42');
}

void main() {
  final FlutterUpPayPlatform initialPlatform = FlutterUpPayPlatform.instance;

  test('$MethodChannelFlutterUpPay is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterUpPay>());
  });

  test('getPlatformVersion', () async {
    FlutterUpPay flutterUpPayPlugin = FlutterUpPay();
    MockFlutterUpPayPlatform fakePlatform = MockFlutterUpPayPlatform();
    FlutterUpPayPlatform.instance = fakePlatform;

    expect(await flutterUpPayPlugin.getPlatformVersion(), '42');
  });
}
