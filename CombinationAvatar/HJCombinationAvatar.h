//
//  HJCombinationAvatar.h
//  CombinationAvatarDemo
//
//  Created by whj on 16/7/1.
//  Copyright © 2016年 whj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJCombinationAvatar : UIView

/*!
 *  Create and returns an CombinationAvatar object with the images
 *
 *  @param frame  self frame
 *  @param images images an array of pictures
 *
 *  @return CombinationAvatar
 */
+ (instancetype)combinationAvatarWithFrame:(CGRect)frame images:(NSArray *)images;

/*!
 *  get CombinationAvatar image
 *
 *  @return UIImage
 */
- (UIImage *)imageHeadCardView;

@end
