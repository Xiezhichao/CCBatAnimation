//
//  CCBatAnimation.h
//  Demo
//
//  Created by mmclick on 15/12/9.
//  Copyright © 2015年 MMC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface CCBatAnimation : NSObject

+ (instancetype)shareInstance;

/** 增加蝙蝠动画：加在哪个view，加多少数量 */
- (void)addBatAnimation:(UIView *)tempView withCount:(NSInteger)count;

@end
