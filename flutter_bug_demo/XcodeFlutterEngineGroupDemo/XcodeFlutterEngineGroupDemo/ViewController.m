//
//  ViewController.m
//  XcodeFlutterEngineGroupDemo
//
//  Created by Zarax Zerry on 2022/8/21.
//

#import "ViewController.h"
#import "BaseFlutterViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btn = [UIButton buttonWithType: UIButtonTypeCustom];
    self.btn.frame = CGRectMake(100, 100, 150, 40);
    self.btn.backgroundColor = [UIColor grayColor];
    [self.btn setTitle:@"打开flutter页面" forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(gotoFlutterView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
    // Do any additional setup after loading the view.
    
    
}

- (void)gotoFlutterView:(UIButton *)button
{
    BaseFlutterViewController *vc = [[BaseFlutterViewController alloc] init];
    [self presentViewController:vc animated:YES completion:^{
            
    }];
}


@end
