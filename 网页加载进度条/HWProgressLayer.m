//
//  HWProgressLayer.m
//  网页加载进度条
//
//  Created by  wuhiwi on 16/9/9.
//  Copyright © 2016年 wanglibank. All rights reserved.
//

#import "HWProgressLayer.h"
#import "NSTimer+addition.h"

static NSTimeInterval const kTimeInterval = 0.03;
#define kScreenWidth ([[UIScreen mainScreen] bounds].size.width)

@interface HWProgressLayer ()

@property (nonatomic, strong) NSTimer *timer;
/**
 *  每次增量
 */
@property (nonatomic, assign) CGFloat increaseWidth;

@end


@implementation HWProgressLayer

#pragma mark - init
- (instancetype)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _increaseWidth = 0.01;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:kTimeInterval target:self selector:@selector(progressValueChange) userInfo:nil repeats:YES];
    [_timer pauseTimer];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(0, 0)];
    [bezierPath addLineToPoint:CGPointMake(kScreenWidth, 0)];
    self.path = bezierPath.CGPath;
    self.strokeEnd = 0;
    self.lineWidth = 2;
    self.strokeColor = [UIColor blueColor].CGColor;
    return self;
}

- (void)progressValueChange
{
    if (self.strokeEnd >= 0.97) {
        [_timer pauseTimer];
        return;
    }
    
    if (self.strokeEnd > 0.85) {
        _increaseWidth = 0.001;
    }
    
    // 创建Animation
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    self.strokeEnd += _increaseWidth;
    [self addAnimation:animation forKey:nil];
}

- (void)startLoadProgressLayer
{
    [_timer resumeTimer];
}

- (void)finishLoadProgressLayer
{
    [self invalidateTimer];
    
    self.strokeEnd = 1.0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self removeFromSuperlayer];
    });
}

#pragma mark - privateMethod
- (void)invalidateTimer
{
    [_timer invalidate];
    _timer = nil;
}

- (void)dealloc
{
    
}

@end
