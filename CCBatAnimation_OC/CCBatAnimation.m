//
//  CCBatAnimation.m
//  Demo
//
//  Created by mmclick on 15/12/9.
//  Copyright © 2015年 MMC. All rights reserved.
//

#import "CCBatAnimation.h"

@implementation CCBatAnimation

// 单例
+ (instancetype)shareInstance {
    static CCBatAnimation *batAnimation = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        batAnimation = [CCBatAnimation new];
    });
    return batAnimation;
}

/** 增加蝙蝠动画：加在哪个view，加多少数量 */
- (void)addBatAnimation:(UIView *)tempView withCount:(NSInteger)count {
    
    UIImage *image1 = [UIImage imageNamed:@"cc_bat_bianfu1"];
    UIImage *image2 = [UIImage imageNamed:@"cc_bat_bianfu2"];
    UIImage *image3 = [UIImage imageNamed:@"cc_bat_bianfu3"];
    NSArray *imageArr = @[image1,image2,image3];
    
    NSInteger midW = 30;
    NSInteger viewWidth  = tempView.bounds.size.width;
    NSInteger viewHeight = tempView.bounds.size.height;
    for (NSInteger index = 0; index < count; index++) {
        
        // 元素参数
        NSInteger startX = - (arc4random() % viewWidth  + midW);
        NSInteger startY = arc4random()  % (viewHeight - midW * 2) + midW;
        NSInteger addX   = viewWidth * 2 + midW;
        NSInteger addY   = arc4random() % 2 ? arc4random() % midW : - (arc4random() % midW);
        NSInteger batW   = arc4random() % midW + 10;
        NSInteger time   = (arc4random() % 5) + 3.5;
        CGFloat   alpha  = batW * 0.01 + 0.5;
        
        // 图片动画
        UIImageView *batImageView = [UIImageView new];
        batImageView.frame = CGRectMake(startX, startY, batW, batW);
        batImageView.image = image1;
        batImageView.alpha = alpha;
        batImageView.animationImages = imageArr;
        batImageView.animationDuration = 0.5;
        [batImageView startAnimating];
        [tempView addSubview:batImageView];
        
        // 位置移动
        NSValue *value1 = [NSValue valueWithCGPoint:batImageView.center];
        NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(batImageView.center.x + addX,batImageView.center.y + addY)];
        
        [CATransaction begin];
        [CATransaction setCompletionBlock:^{
            [batImageView removeFromSuperview];
        }];
        CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        keyAnimation.values   = @[value1,value2];
        keyAnimation.duration = time;
        keyAnimation.delegate = self;
        keyAnimation.removedOnCompletion = NO;
        [batImageView.layer addAnimation:keyAnimation forKey:nil];
        [CATransaction commit];
    }
}

@end
