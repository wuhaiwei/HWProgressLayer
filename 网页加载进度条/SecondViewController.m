//
//  SecondViewController.m
//  网页加载进度条
//
//  Created by  wuhiwi on 16/9/8.
//  Copyright © 2016年 wanglibank. All rights reserved.
//

#import "SecondViewController.h"
#import "HWProgressLayer.h"

static CGFloat const kNavigationBarHeight = 64.0;

#define kWebUrl @"https://www.baidu.com/"
#define kScreenWidth ([[UIScreen mainScreen] bounds].size.width)

@interface SecondViewController () <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
//@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) HWProgressLayer *progressLayer;

@end

@implementation SecondViewController

#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = YES;
    
    self.navigationItem.title = @"secondVC";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.webView];
    [self.view.layer addSublayer:self.progressLayer];
    
    
//     _timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(time) userInfo:nil repeats:YES];
//    //timer强引用控制器，runloop又强引用timer，如果不处理的话就会造成循环引用
//    [_timer fire];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    //这个是唯一一个可以将计时器从runloop中移出的方法
//    [_timer invalidate];
//    _timer = nil;
}


- (void)time
{
    NSLog(@"%s",__func__);
}

#pragma mark - getter
- (UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
        _webView.delegate = self;
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:kWebUrl]];
        [_webView loadRequest:request];
    }
    return _webView;
}

- (HWProgressLayer *)progressLayer
{
    if (!_progressLayer) {
        _progressLayer = [[HWProgressLayer alloc] init];
        CGFloat originY = self.navigationController.navigationBar.translucent ? kNavigationBarHeight : 0;
        _progressLayer.position = CGPointMake(0, originY);
        _progressLayer.anchorPoint = CGPointMake(0, 0);
    }
    return _progressLayer;
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.progressLayer startLoadProgressLayer];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.progressLayer finishLoadProgressLayer];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self.progressLayer finishLoadProgressLayer];
}
- (void)dealloc
{
    
}

@end
