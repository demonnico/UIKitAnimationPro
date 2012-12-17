//
//  UIAnimation.m
//  animationFac
//
//  Created by demon on 11/14/12.
//  Copyright (c) 2012 NicoFun. All rights reserved.
//

#import "UIKitAnimation.h"

@implementation UIKitAnimation

-(UIKitAnimation*)getAnimationUnit
{
    return self;
}

-(void)setAnimationType:(AnimationElement)type
{
    _animationType  = type;
}
-(AnimationElement)getAnimationType
{
    return _animationType;
}

-(void)setDuration:(CGFloat)duration
{
    _animationDuration = duration;
}

-(CGFloat)getDuration
{
    return _animationDuration;
}
@end

@implementation UIFadeAnimation

+(UIFadeAnimation*)actionToAlpha:(CGFloat)alpha
                        Duration:(CGFloat)duration
{
    UIFadeAnimation * fadeTo = [[[UIFadeAnimation alloc] init] autorelease];
    [fadeTo setAnimationType:AnimationFadeTo];
    [fadeTo setDuration:duration];
    fadeTo.alpha = alpha;
    return fadeTo;
}
+(UIFadeAnimation*)actionByAlpha:(CGFloat)alpha
                        Duration:(CGFloat)duration
{
    UIFadeAnimation * fadeBy = [[[UIFadeAnimation alloc] init] autorelease];
    [fadeBy setAnimationType:AnimationFadeBy];
    [fadeBy setDuration:duration];
    fadeBy.alpha = alpha;
    return fadeBy;
}

@end
@implementation UIDisplaceAnimation

+(UIDisplaceAnimation*)actionToPoint:(CGPoint)point
                            Duration:(CGFloat)duration
{
    UIDisplaceAnimation * animation = [[[UIDisplaceAnimation alloc] init] autorelease];
    animation.point             = point;
    [animation setAnimationType:AnimationDisplacement];
    [animation setDuration:duration];
    return animation;
}

+(UIDisplaceAnimation*)actionByPoint:(CGPoint)point
                            Duration:(CGFloat)duration
{
    UIDisplaceAnimation * animation = [[[UIDisplaceAnimation alloc] init] autorelease];
    [animation setAnimationType:AnimationDisplacementBy];
    [animation setDuration:duration];
    animation.point             = point;
    return animation;
}

@end

@implementation UIScaleAnimation

+(UIScaleAnimation*)actionToScaleX:(CGFloat)scaleX
                            ScaleY:(CGFloat)scaleY
                          Duration:(CGFloat)duration
{
    UIScaleAnimation * animation = [[[UIScaleAnimation alloc] init] autorelease];
    [animation setAnimationType:AnimationScaleTo];
    [animation setDuration:duration];
    animation.scaleX            = scaleX;
    animation.scaleY            = scaleY;
    return animation;
}
+(UIScaleAnimation*)actionByScaleX:(CGFloat)scaleX
                            ScaleY:(CGFloat)scaleY
                          Duration:(CGFloat)duration;
{
    UIScaleAnimation * animation = [[[UIScaleAnimation alloc] init] autorelease];
    [animation setAnimationType:AnimationScaleBy];
    [animation setDuration:duration];
    animation.scaleX            = scaleX;
    animation.scaleY            = scaleY;
    return animation;
}

@end

@implementation UIRotateAnimation

+(UIRotateAnimation*)actionToRotate:(CGFloat)angle
                          Duration:(CGFloat)duration
{
    UIRotateAnimation * animation =[[[UIRotateAnimation alloc] init] autorelease];
    [animation setAnimationType:AnimationRotateTo];
    [animation setDuration:duration];
    animation.angle = angle;

    return animation;
}
+(UIRotateAnimation*)actionByRotate:(CGFloat)angle
                          Duration:(CGFloat)duration;
{
    UIRotateAnimation * animation =[[[UIRotateAnimation alloc] init] autorelease];
    [animation setAnimationType:AnimationRotateBy];
    [animation setDuration:duration];
    animation.angle = angle;
    
    return animation;
}

@end

@implementation UIAnimationSequence


- (void)dealloc
{
    [actionList release];
    [super dealloc];
}

-(id)init
{
    if(self=[super init])
    {
        actionList = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)removeFirstAction
{
    if([actionList count])
        [actionList removeObjectAtIndex:0];
}

-(void)addAction:(id<UIAnimationUnitProtocol>)action
{
    [actionList addObject:action];
}

-(UIKitAnimation*)getAnimationUnit
{
    if([actionList count])
        return [actionList objectAtIndex:0];
    return nil;
}
@end
