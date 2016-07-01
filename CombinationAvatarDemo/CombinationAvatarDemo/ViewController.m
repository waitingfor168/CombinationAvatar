//
//  ViewController.m
//  CombinationAvatarDemo
//
//  Created by whj on 16/7/1.
//  Copyright © 2016年 whj. All rights reserved.
//

#import "ViewController.h"

#import "HJCombinationAvatar.h"
#import "HJAvatar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self p_showCombinationAvatar];
    [self.view setBackgroundColor:[UIColor grayColor]];
}

- (void)p_showCombinationAvatar {

    HJCombinationAvatar *combinationAvatar = nil;
    
    CGFloat rectSpace = 10.0;
    CGFloat rectY = 20.0;
    CGFloat rectWH = (self.view.frame.size.height - rectY) / 5.0 - rectSpace;
    CGFloat rectX = (self.view.frame.size.width - rectWH) / 2.0;
    CGRect rect = CGRectMake(rectX, rectY, rectWH, rectWH);
    
    NSMutableArray *avatars = [[NSMutableArray alloc] initWithCapacity:0];
    
    [avatars addObject:[UIImage imageNamed:@"000"]];
    combinationAvatar = [HJCombinationAvatar combinationAvatarWithFrame:rect images:avatars];
    [self.view addSubview:combinationAvatar];
    
    rect.origin.y += (rectWH + rectSpace);
    [avatars addObject:[UIImage imageNamed:@"001"]];
    combinationAvatar = [HJCombinationAvatar combinationAvatarWithFrame:rect images:avatars];
    [self.view addSubview:combinationAvatar];
    
    rect.origin.y += (rectWH + rectSpace);
    [avatars addObject:[UIImage imageNamed:@"002"]];
    combinationAvatar = [HJCombinationAvatar combinationAvatarWithFrame:rect images:avatars];
    [self.view addSubview:combinationAvatar];
    
    rect.origin.y += (rectWH + rectSpace);
    [avatars addObject:[UIImage imageNamed:@"003"]];
    combinationAvatar = [HJCombinationAvatar combinationAvatarWithFrame:rect images:avatars];
    [self.view addSubview:combinationAvatar];
    
    rect.origin.y += (rectWH + rectSpace);
    [avatars addObject:[UIImage imageNamed:@"004"]];
    combinationAvatar = [HJCombinationAvatar combinationAvatarWithFrame:rect images:avatars];
    [self.view addSubview:combinationAvatar];
}

@end
