//
//  UIAnimation.m
//  animationFac
//
//  Created by demon on 11/14/12.
//  Copyright (c) 2012 NicoFun. All rights reserved.
//

#import "UIKitAnimation.h"
#if !__has_feature(objc_arc)
#error THIS CODE MUST BE COMPILED WITH ARC ENABLED!
#endif
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
    UIFadeAnimation * fadeTo = [[UIFadeAnimation alloc] init];
    [fadeTo setAnimationType:AnimationFadeTo];
    [fadeTo setDuration:duration];
    fadeTo.alpha = alpha;
    return fadeTo;
}
+(UIFadeAnimation*)actionByAlpha:(CGFloat)alpha
                        Duration:(CGFloat)duration
{
    UIFadeAnimation * fadeBy = [[UIFadeAnimation alloc] init];
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
    UIDisplaceAnimation * animation = [[UIDisplaceAnimation alloc] init];
    animation.point             = point;
    [animation setAnimationType:AnimationDisplacement];
    [animation setDuration:duration];
    return animation;
}

+(UIDisplaceAnimation*)actionByPoint:(CGPoint)point
                            Duration:(CGFloat)duration
{
    UIDisplaceAnimation * animation = [[UIDisplaceAnimation alloc] init];
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
    UIScaleAnimation * animation = [[UIScaleAnimation alloc] init];
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
    UIScaleAnimation * animation = [[UIScaleAnimation alloc] init];
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
    UIRotateAnimation * animation =[[UIRotateAnimation alloc] init];
    [animation setAnimationType:AnimationRotateTo];
    [animation setDuration:duration];
    animation.angle = angle;

    return animation;
}
+(UIRotateAnimation*)actionByRotate:(CGFloat)angle
                          Duration:(CGFloat)duration;
{
    UIRotateAnimation * animation =[[UIRotateAnimation alloc] init];
    [animation setAnimationType:AnimationRotateBy];
    [animation setDuration:duration];
    animation.angle = angle;
    
    return animation;
}

@end
@implementation UICallbackBlock

+(UICallbackBlock*)actionWithBlock:(KIT_ANIMATION_BLOCK)blocker
{
    UICallbackBlock * animation =[[UICallbackBlock alloc] init];
    [animation setAnimationType:AnimationCallBack];
    animation.blocker = blocker;
    return animation;
}

@end

@interface UIAnimationSequence()

@property(nonatomic,strong) NSMutableArray * actionList;

@end
@implementation UIAnimationSequence

-(id)init
{
    if(self=[super init])
    {
        self.actionList = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)removeFirstAction
{
    if([_actionList count])
        [_actionList removeObjectAtIndex:0];
}

-(void)addAction:(id<UIAnimationUnitProtocol>)action
{
    [_actionList addObject:action];
}

-(UIKitAnimation*)getAnimationUnit
{
    if([_actionList count])
        return [_actionList objectAtIndex:0];
    return nil;
}
@end
