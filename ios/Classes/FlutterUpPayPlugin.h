//
//  FlutterUpPayPlugin.h
//  flutter_up_pay
//
//  Created by hutf on 2023/4/24.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import "UPPaymentControl.h"

NS_ASSUME_NONNULL_BEGIN

@interface FlutterUpPayPlugin : NSObject<FlutterPlugin>

+ (instancetype)sharedInstance;

- (void)handlePaymentResult:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
