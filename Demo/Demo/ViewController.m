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
    [CCBatAnimation addBatAnimation:self.view withCount:5];
    
    // Swift
    //[CCSBatAnimation addBatAnimation:self.view andCount:5];
}

@end
