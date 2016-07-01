//
//  HJAvatar.h
//  CombinationAvatarDemo
//
//  Created by whj on 16/7/1.
//  Copyright © 2016年 whj. All rights reserved.
//

#import <UIKit/UIKit.h>

static inline double radians(CGFloat degrees) {
    
    return degrees * M_PI / 180;
}

@interface HJAvatar : UIView

/*!
 *  Create and returns an Avatar object with the image
 *
 *  @param rect  frame
 *  @param image image
 *
 *  @return Avatar
 */
+ (instancetype)avatarWithFrame:(CGRect)rect image:(UIImage *)image;

/*!
 *  instalizes returns an Avatar object with the image
 *
 *  @param rect  frame
 *  @param image image
 *
 *  @return Avatar
 */
- (instancetype)initWithFrame:(CGRect)rect image:(UIImage *)image;


/**
 * cycleRadius
 */
@property(nonatomic, assign) CGFloat cycleRadius;

/**
 * cycleStroke
 */
@property(nonatomic, assign) CGFloat cycleStroke;

/**
 * cycleClipAngle
 */
@property(nonatomic, assign) CGFloat cycleClipAngle;

/**
 * rotateAngle
 */
@property(nonatomic, assign) CGFloat rotateAngle;

@end
