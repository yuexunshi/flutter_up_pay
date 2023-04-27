import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_up_pay/union_pay_enum.dart';

import 'flutter_up_pay_platform_interface.dart';

/// An implementation of [FlutterUpPayPlatform] that uses method channels.
class MethodChannelFlutterUpPay extends FlutterUpPayPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_up_pay');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
    await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool> isInstalled() async {
    final isInstalled =
        await methodChannel.invokeMethod<bool>('isInstalled') ?? false;
    return isInstalled;
  }

  @override
  Future<String?> startPay(
      {required String tn,
      required PaymentEnv mode,
      required String scheme}) async {
    final version = await methodChannel.invokeMethod<String>('startPay', {
      'tn': tn,
      'mode': mode.code,
      'scheme': scheme,
    });
    return version;
  }
}
