//
//  ViewController.m
//  Demo
//
//  Created by mmclick on 15/12/9.
//  Copyright © 2015年 MMC. All rights reserved.
//

#import "ViewController.h"
#import "CCBatAnimation.h"
#import "Demo-Swift.h"

@implementation ViewController

- (IBAction)startAnimation:(id)sender {
    
    // OC
    [[CCBatAnimation shareInstance] addBatAnimation:self.view withCount:20];
    
    // Swift
    //[[CCSBatAnimation shareInstance] addBatAnimation:self.view andCount:20];
}

@end
