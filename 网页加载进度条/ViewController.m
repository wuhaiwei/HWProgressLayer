//
//  ViewController.m
//  网页加载进度条
//
//  Created by  wuhiwi on 16/9/8.
//  Copyright © 2016年 wanglibank. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"firstVC";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100,200, 100, 30);
    [button setTitle:@"push" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
//    NSTimer *timer = [NSTimer timerWithTimeInterval:5 target:self selector:@selector(time) userInfo:nil repeats:YES];
//    //timerWithTimeInterval  这个方法必须将timer加入runloop中timer才会生效
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
//    //立刻启动计时器
//    [timer fire];
    
    
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(time) userInfo:nil repeats:YES];
//    [timer fire];
    
}

- (void)time
{
    NSLog(@"%s",__func__);
}
- (void)click:(UIButton *)sender
{
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
}

@end
