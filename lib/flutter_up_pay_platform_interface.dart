import 'package:flutter_up_pay/union_pay_enum.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_up_pay_method_channel.dart';

abstract class FlutterUpPayPlatform extends PlatformInterface {
  /// Constructs a FlutterUpPayPlatform.
  FlutterUpPayPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterUpPayPlatform _instance = MethodChannelFlutterUpPay();

  /// The default instance of [FlutterUpPayPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterUpPay].
  static FlutterUpPayPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterUpPayPlatform] when
  /// they register themselves.
  static set instance(FlutterUpPayPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> startPay(
      {required String tn,required PaymentEnv mode, required String scheme}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> isInstalled({ String? merchantInfo}) {
    throw UnimplementedError('isInstalled() has not been implemented.');
  }
}
