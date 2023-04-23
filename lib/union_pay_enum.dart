///支付结果状态
enum PaymentStatus {
  ///支付取消
  CANCEL,

  ///支付成功
  SUCCESS,

  ///支付失败
  FAIL,

  ///支付失败
  UNKNOW,
}

extension PaymentStatusExtension on PaymentStatus {
  String get msg {
    switch (this) {
      case PaymentStatus.CANCEL:
        return 'cancel';
      case PaymentStatus.SUCCESS:
        return 'success';
      case PaymentStatus.FAIL:
        return 'fail';
      case PaymentStatus.UNKNOW:
        return 'unKnow';
    }
  }
}

/// 支付环境
/// “00” – 银联正式环境 // “01” – 银联测试环境，该环境中不发生真实交易
enum PaymentEnv {
  ///生产环境
  PRODUCT,

  ///测试环境
  DEVELOPMENT,
}

extension PaymentEnvExtension on PaymentEnv {
  String get code {
    switch (this) {
      case PaymentEnv.PRODUCT:
        return '00';
      case PaymentEnv.DEVELOPMENT:
        return '01';
    }
  }
}
