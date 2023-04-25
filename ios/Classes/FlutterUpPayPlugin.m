//
//  FlutterUpPayPlugin.m
//  flutter_up_pay
//
//  Created by hutf on 2023/4/24.
//

#import "FlutterUpPayPlugin.h"
#import "UPPaymentControl.h"

@interface FlutterUpPayPlugin ()

@property(nonatomic, copy) FlutterResult payResult;

@end

@implementation FlutterUpPayPlugin

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static FlutterUpPayPlugin *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}


+ (void)registerWithRegistrar:(nonnull NSObject<FlutterPluginRegistrar> *)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"flutter_up_pay" binaryMessenger:registrar.messenger];
    FlutterUpPayPlugin *instance = [FlutterUpPayPlugin sharedInstance];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    if ([call.method isEqualToString:@"startPay"]) {
        [self startPayCall:call result:result];
    }else {

    }
}

- (void)startPayCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    self.payResult = result;
    
    NSDictionary *arguments = call.arguments;
    NSString *tn = arguments[@"tn"];
    NSString *scheme = arguments[@"scheme"];
    NSString *mode = arguments[@"mode"];
    
    UIViewController *topController = [self viewControllerWithWindow:nil];
    
    [[UPPaymentControl defaultControl] startPay:tn
                                     fromScheme:scheme
                                           mode:mode
                                 viewController:topController];
}


- (void)handlePaymentResult:(NSURL *)url {
    __weak __typeof(self)weakSelf = self;
    [[UPPaymentControl defaultControl] handlePaymentResult:url
                                             completeBlock:^(NSString *code, NSDictionary *data) {
#ifdef DEBUG
        NSLog(@"handlePaymentResult: code:%@ data:%@",code,data);
#endif
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        if (strongSelf.payResult) {
            strongSelf.payResult(code);
        }
    }];
}

- (UIViewController *)viewControllerWithWindow:(UIWindow *)window {
  UIWindow *windowToUse = window;
  if (windowToUse == nil) {
    for (UIWindow *window in [UIApplication sharedApplication].windows) {
      if (window.isKeyWindow) {
        windowToUse = window;
        break;
      }
    }
  }

  UIViewController *topController = windowToUse.rootViewController;
  while (topController.presentedViewController) {
    topController = topController.presentedViewController;
  }
  return topController;
}


@end

