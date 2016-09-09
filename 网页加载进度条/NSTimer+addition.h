//
//  NSTimer+addition.h
//  网页加载进度条
//
//  Created by  wuhiwi on 16/9/9.
//  Copyright © 2016年 wanglibank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (addition)
/**
 *  暂停计时器
 */
- (void)pauseTimer;
/**
 *  恢复计时器
 */
- (void)resumeTimer;
/**
 *  恢复计时器
 *
 *  @param timeInterval 间隔时间
 */
- (void)resumeTimerWithTimeInterval:(NSTimeInterval)timeInterval;

@end
