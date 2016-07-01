//
//  HJCombinationAvatar.m
//  CombinationAvatarDemo
//
//  Created by whj on 16/7/1.
//  Copyright © 2016年 whj. All rights reserved.
//

#import "HJCombinationAvatar.h"
#import "HJAvatar.h"

@implementation HJCombinationAvatar {
    
    NSArray *_images;
    CGSize _size;
    CGPoint centerPoint;
}

+ (instancetype)combinationAvatarWithFrame:(CGRect)frame images:(NSArray *)images
{
    return [[self alloc] initWithFrame:frame images:images];
}

- (instancetype)initWithFrame:(CGRect)frame images:(NSArray *)images
{
    self = [super initWithFrame:frame];
    if (self) {
        _images = images;
        _size = frame.size;
        
        [self p_initViewData];
    }
    return self;
}

- (UIImage *)imageHeadCardView
{
    switch ([_images count]) {
        case 1:
            return _images[0];
        default:
            return [self imageRenderView:self];
    }
    return nil;
}

- (void)p_initViewData
{
    centerPoint.x = _size.width / 2;
    centerPoint.y = _size.height / 2;
    
    [self setBackgroundColor:[UIColor clearColor]];
    
    switch ([_images count]) {
        case 0:
            return;
        case 1:
            [self p_headCardViewOne];
            break;
        case 2:
            [self p_headCardViewTwo];
            break;
        case 3:
            [self p_headCardViewThree];
            break;
        case 4:
            [self p_headCardViewFour];
            break;
        default:
            [self p_headCardViewMore];
            break;
    }
    
}

- (void)p_headCardViewOne
{
    float cubeRadius = _size.width / 2;//variable
    
    NSArray *angles = @[@(0)];
    CGPoint point0 = CGPointMake(_size.width / 2, _size.width / 2);
    NSArray *points = @[[NSValue valueWithCGPoint:point0]];
    
    [self addImagesPoints:points angles:angles size:cubeRadius];
}

- (void)p_headCardViewTwo
{
    float cubeRadius = _size.width / 3.8;//subsview width and height
    float radius = centerPoint.x - cubeRadius;
    float datUnit = radius * sin(radians(45));
    
    CGPoint point0 = CGPointMake(-datUnit, -datUnit);
    CGPoint point1 = CGPointMake(datUnit, datUnit);
    
    NSArray *angles = @[@(45),@(0)];
    
    NSArray *points = @[[NSValue valueWithCGPoint:point0],
                        [NSValue valueWithCGPoint:point1]];
    
    points = [self resetCycleCenterOffset:cubeRadius + radius points:points];
    [self addImagesPoints:points angles:angles size:cubeRadius];
}

- (void)p_headCardViewThree
{
    float cubeRadius = _size.width / 4.1;//subsview width and height
    float radius = centerPoint.x - cubeRadius;
    
    CGPoint point0 = CGPointMake(0, -radius);
    CGPoint point1 = CGPointMake(-radius * cos(radians(30)), radius * sin(radians(30)));
    CGPoint point2 = CGPointMake(radius * cos(radians(30)), radius * sin(radians(30)));
    
    NSArray *angles = @[@(120),@( 0),@(-120)];
    
    NSArray *points = @[[NSValue valueWithCGPoint:point0],
                        [NSValue valueWithCGPoint:point1],
                        [NSValue valueWithCGPoint:point2]];
    
    points = [self resetCycleCenterOffset:cubeRadius + radius points:points];
    [self addImagesPoints:points angles:angles size:cubeRadius];
}
- (void)p_headCardViewFour
{
    float cubeRadius = _size.width / 4.5;//subsview width and height
    float radius = centerPoint.x - cubeRadius;
    float datUnit = radius * sin(radians(45));
    
    CGPoint point0 = CGPointMake(-datUnit, -datUnit);
    CGPoint point1 = CGPointMake(-datUnit, datUnit);
    CGPoint point2 = CGPointMake(datUnit, datUnit);
    CGPoint point3 = CGPointMake(datUnit, -datUnit);
    
    NSArray *angles = @[@(90),@(0),@(-90),@(-180)];
    
    NSArray *points = @[[NSValue valueWithCGPoint:point0],
                        [NSValue valueWithCGPoint:point1],
                        [NSValue valueWithCGPoint:point2],
                        [NSValue valueWithCGPoint:point3]];
    
    points = [self resetCycleCenterOffset:cubeRadius + radius points:points];
    [self addImagesPoints:points angles:angles size:cubeRadius];
}

- (void)p_headCardViewMore
{
    float cubeRadius = _size.width / 5;//subsview width and height
    float radius = centerPoint.x - cubeRadius;//
    
    CGPoint point0 = CGPointMake(0, -radius);
    CGPoint point1 = CGPointMake(radius * -cos(radians(18)), radius * -sin(radians(18)));
    CGPoint point2 = CGPointMake(radius * -cos(radians(54)), radius * sin(radians(54)));
    CGPoint point3 = CGPointMake(radius * cos(radians(54)), radius * sin(radians(54)));
    CGPoint point4 = CGPointMake(radius * cos(radians(18)), radius * -sin(radians(18)));
    
    NSArray *angles = @[@(36 * 4),@(36 * 2),@(0),@(36 * -2),@(36 * -4)];
    
    NSArray *points = @[[NSValue valueWithCGPoint:point0],
                        [NSValue valueWithCGPoint:point1],
                        [NSValue valueWithCGPoint:point2],
                        [NSValue valueWithCGPoint:point3],
                        [NSValue valueWithCGPoint:point4]];
    
    points = [self resetCycleCenterOffset:cubeRadius + radius points:points];
    [self addImagesPoints:points angles:angles size:cubeRadius];
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Method
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)addImagesPoints:(NSArray *)points angles:(NSArray *)angles size:(CGFloat)cubeRadius
{
    for (int num=0; num<[angles count]; num++) {
        
        CGFloat angle =[angles[num] floatValue];
        CGPoint point =[points[num] CGPointValue];
        
        CGRect cardViewRect = CGRectMake(0, 0, cubeRadius * 2, cubeRadius * 2);
        HJAvatar *avatar = [HJAvatar avatarWithFrame:cardViewRect image:_images[num]];
        avatar.backgroundColor = [UIColor clearColor];
        avatar.cycleRadius = cubeRadius;
        avatar.rotateAngle = angle;
        avatar.center = point;
        [self addSubview:avatar];
        
        if ([_images count] == 1 || ([_images count] == 2 && num == 1)){
            avatar.cycleClipAngle = 1;
        }
    }
}

- (UIImage *)imageRenderView:(UIView *)view
{
    UIGraphicsBeginImageContext(view.bounds.size);
    CGContextRef currnetContext = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:currnetContext];
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (NSArray *)resetCycleCenterOffset:(CGFloat)offset points:(NSArray *)points
{
    NSMutableArray *tempPoints = [points mutableCopy];
    
    for (int num=0; num<[tempPoints count]; num++) {
        
        CGPoint point = [tempPoints[num] CGPointValue];
        point.x += offset;
        point.y += offset;
        
        NSValue *pointValue = [NSValue valueWithCGPoint:point];
        [tempPoints replaceObjectAtIndex:num withObject:pointValue];
    }
    return tempPoints;
}

@end
