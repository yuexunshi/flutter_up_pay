import 'flutter_up_pay_platform_interface.dart';
import 'union_pay_enum.dart';

class FlutterUpPay {

  Future<PaymentStatus> startPay(
      {required String tn,
      required PaymentEnv mode,
      required String scheme}) async {
    var result = await FlutterUpPayPlatform.instance
        .startPay(tn: tn, mode: mode, scheme: scheme);
    return _map(result);
  }

  Future<String?> getPlatformVersion() {
    return FlutterUpPayPlatform.instance.getPlatformVersion();
  }


  PaymentStatus _map(String? str) {
    if (str == PaymentStatus.CANCEL.msg) {
      return PaymentStatus.CANCEL;
    } else if (str == PaymentStatus.FAIL.msg) {
      return PaymentStatus.FAIL;
    } else if (str == PaymentStatus.SUCCESS.msg) {
      return PaymentStatus.SUCCESS;
    } else {
      return PaymentStatus.UNKNOW;
    }
  }
}
