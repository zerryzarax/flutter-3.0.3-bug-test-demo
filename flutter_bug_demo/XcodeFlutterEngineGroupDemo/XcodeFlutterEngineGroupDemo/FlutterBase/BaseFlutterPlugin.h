//
#import <Flutter/Flutter.h>

@interface BaseFlutterPlugin : NSObject

+ (instancetype)shareInstance;

+ (FlutterViewController *)getDefaultWithRoute:(NSString *)route;

- (id)registerChannel:(NSString *)channel
      binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger
               hander:(FlutterMethodCallHandler)handler;

@end
