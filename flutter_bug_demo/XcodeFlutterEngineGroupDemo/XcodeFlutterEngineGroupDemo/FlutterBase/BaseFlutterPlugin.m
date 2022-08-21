//
#import "BaseFlutterPlugin.h"
#import <OpenGLES/EAGL.h>
#import <Flutter/FlutterEngineGroup.h>

@interface ShowFlutterViewController : FlutterViewController

@end

@implementation ShowFlutterViewController

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [EAGLContext setCurrentContext:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [EAGLContext setCurrentContext:nil];
    [super viewWillAppear:animated];
}

- (BOOL)loadDefaultSplashScreenView
{
    return NO;
}

- (void)dealloc
{
    [EAGLContext setCurrentContext:nil];
}

@end

@interface BaseFlutterPlugin ()<FlutterPlugin>

@property (nonatomic, strong) FlutterEngineGroup *engineGroup;

@end

@implementation BaseFlutterPlugin

+ (instancetype)shareInstance
{
    static id _instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    
    return _instance;
}

- (instancetype)init
{
    if (self = [super init]) {
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

+ (FlutterViewController *)getDefaultWithRoute:(NSString *)route
{
    if (route.length == 0) {
        return nil;
    }
    FlutterEngine *engine = [[BaseFlutterPlugin shareInstance] generateFlutterEngine];

    ShowFlutterViewController *flutterViewController = [[ShowFlutterViewController alloc] initWithEngine:engine nibName:nil bundle:nil];
    return flutterViewController;
}

- (FlutterEngine *)generateFlutterEngine
{
    if (!self.engineGroup) {
        self.engineGroup = [[FlutterEngineGroup alloc] initWithName:@"io.flutter.11" project:nil];
    }
    FlutterEngine *engine = [self.engineGroup makeEngineWithOptions:nil];
    return engine;
}

@end
//#endif
