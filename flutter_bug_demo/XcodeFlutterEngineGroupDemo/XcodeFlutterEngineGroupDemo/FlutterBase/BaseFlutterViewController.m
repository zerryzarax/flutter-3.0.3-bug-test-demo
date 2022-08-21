//
#import "BaseFlutterViewController.h"
#import "BaseFlutterPlugin.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
#define WEAK_SELF __weak __typeof(&*self)weakSelf = self

@interface BaseFlutterViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) FlutterViewController *flutterViewController;

@end

@implementation BaseFlutterViewController

- (instancetype)init
{
    if (self = [super init]) {
        FlutterViewController *flutterViewController = [BaseFlutterPlugin getDefaultWithRoute:[self getInitialRouteName]];
        if (flutterViewController) {
            self.flutterViewController = flutterViewController;
            CGFloat width = SCREEN_MIN_LENGTH;
            CGFloat height = SCREEN_MAX_LENGTH;
            self.flutterViewController.view.frame = CGRectMake(0, 0, width, height);
            [self.flutterViewController viewWillAppear:NO];
            [self.flutterViewController viewDidLayoutSubviews];
            [self.flutterViewController viewDidAppear:NO];
        }
    }
    return self;
}

- (NSString *)getInitialRouteName
{
    return @"test";
}

- (void)fxViewDidAppear
{
    [self.flutterViewController viewWillAppear:NO];
    [self.flutterViewController viewDidAppear:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.flutterViewController.view];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewWillRemove:(BOOL)isAnimated
{
    [self.flutterViewController viewDidDisappear:NO];
    self.flutterViewController = nil;
}


- (void)destroyEngine
{
    if (_flutterViewController) {
        _flutterViewController.engine.viewController = nil;
        [_flutterViewController.engine destroyContext];
    }
}

- (void)dealloc {
    NSLog(@"释放%@ flutter页面.", self);
    [self destroyEngine];
}

@end
//#endif
