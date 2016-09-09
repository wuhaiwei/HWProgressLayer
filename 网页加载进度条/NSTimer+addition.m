//
//  NSTimer+addition.m
//  网页加载进度条
//
//  Created by  wuhiwi on 16/9/9.
//  Copyright © 2016年 wanglibank. All rights reserved.
//

#import "NSTimer+addition.h"

@implementation NSTimer (addition)
- (void)pauseTimer
{
    if (!self.isValid) {
        return;
    }
    [self setFireDate:[NSDate distantFuture]];
}

- (void)resumeTimer
{
    if (!self.isValid) {
        return;
    }
    [self setFireDate:[NSDate date]];
}

- (void)resumeTimerWithTimeInterval:(NSTimeInterval)timeInterval
{
    if (!self.isValid) {
        return;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:timeInterval]];
}

@end
