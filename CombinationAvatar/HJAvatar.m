//
//  HJAvatar.m
//  CombinationAvatarDemo
//
//  Created by whj on 16/7/1.
//  Copyright © 2016年 whj. All rights reserved.
//

#import "HJAvatar.h"

@implementation HJAvatar {
    
    CGRect _rect;
    UIImage *_image;
    
    CGPoint centerPoint;
}

+ (instancetype)avatarWithFrame:(CGRect)rect image:(UIImage *)image
{
    return [[self alloc] initWithFrame:rect image:image];
}

- (instancetype)initWithFrame:(CGRect)rect image:(UIImage *)image
{
    if (self = [super init]) {
        
        _rect = rect;
        _image = image;
        
        [self p_initView];
        [self p_initViewData];
    }
    return self;
}

- (void)p_initView
{
    self.frame = _rect;
    self.backgroundColor = [UIColor blueColor];
}

- (void)p_initViewData
{
    self.cycleStroke = 0.0;
    self.rotateAngle = 90.0;
    self.cycleClipAngle = 35.0;
    self.cycleRadius = (_rect.size.width - _cycleStroke) / 2.0;
    
    centerPoint.x = _rect.size.width / 2.0;
    centerPoint.y = _rect.size.height / 2.0;
}

-(void)drawRect:(CGRect)rect
{
    CGFloat beginAngle = -_cycleClipAngle + _rotateAngle;
    CGFloat endAngle = _cycleClipAngle + _rotateAngle;
    
    // R * (cos(a) - tan(a) * sin(a))
    CGFloat angleRadius = _cycleRadius * (cos(radians(_cycleClipAngle)) - tan(radians(_cycleClipAngle)) * sin(radians(_cycleClipAngle)));
    
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, _cycleStroke);
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    
    CGContextAddArc(context, centerPoint.x, centerPoint.y, _cycleRadius, radians(beginAngle), radians(endAngle), 1);
    
    CGPoint aPoints[2];//angle two points
    aPoints[0] =CGPointMake(centerPoint.x +_cycleRadius * cos(radians(beginAngle)), centerPoint.x + _cycleRadius * sin(radians(beginAngle)));//坐标1
    //    aPoints[1] =CGPointMake(centerPoint.x +_cycleRadius * cos(radians(endAngle)), centerPoint.x + _cycleRadius * sin(radians(endAngle)));
    //    CGContextAddLines(context, aPoints, 2);
    
    //    CGPoint aPoints[2];//angle controller point
    //    aPoints[0] =CGPointMake(centerPoint.x +angleRadius * cos(radians(_rotateAngle)), centerPoint.x +angleRadius * sin(radians(_rotateAngle)));//坐标1
    //    aPoints[1] =CGPointMake(centerPoint.x +angleRadius * cos(radians(_rotateAngle)) + 5, centerPoint.x +angleRadius * sin(radians(_rotateAngle)) + 5);
    //    CGContextAddLines(context, aPoints, 2);
    
    CGContextAddArcToPoint(context, centerPoint.x +angleRadius * cos(radians(_rotateAngle)), centerPoint.x +angleRadius * sin(radians(_rotateAngle)), aPoints[0].x, aPoints[0].y, _cycleRadius);
    
    //    CGContextDrawPath(context, kCGPathStroke);
    CGContextClosePath(context);
    CGContextClip(context);
    
    [_image drawInRect:CGRectMake(_cycleStroke / 2.0, _cycleStroke / 2.0, _cycleRadius * 2.0, _cycleRadius * 2.0)];
}

@end
