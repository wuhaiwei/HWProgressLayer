//
//  HWProgressLayer.h
//  网页加载进度条
//
//  Created by  wuhiwi on 16/9/9.
//  Copyright © 2016年 wanglibank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface HWProgressLayer : CAShapeLayer
/**
 *  开始加载
 */
- (void)startLoadProgressLayer;

/**
 *  结束加载
 */
- (void)finishLoadProgressLayer;

@end
