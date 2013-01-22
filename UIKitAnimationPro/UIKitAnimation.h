//
//  UIAnimation.h
//  animationFac
//
//  Created by demon on 11/14/12.
//  Copyright (c) 2012 NicoFun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^KIT_ANIMATION_BLOCK)(id data);

typedef enum
{
    AnimationNone   =0,
    AnimationDisplacementBy,
    AnimationDisplacement,
    AnimationFadeBy,
    AnimationFadeTo,
    AnimationScaleBy,
    AnimationScaleTo,
    AnimationRotateBy,
    AnimationRotateTo,
    AnimationCallBack
}AnimationElement;

@class UIKitAnimation;


@protocol  UIAnimationUnitProtocol <NSObject>

@required
-(UIKitAnimation*)getAnimationUnit;

-(CGFloat)getDuration;
-(void)setDuration:(CGFloat)duration;
-(AnimationElement)getAnimationType;
-(void)setAnimationType:(AnimationElement)type;

@end


@interface UIKitAnimation : NSObject<UIAnimationUnitProtocol>
{
    CGFloat _animationDuration;
    AnimationElement _animationType;
}
@end

@interface UIFadeAnimation : UIKitAnimation

@property (nonatomic,assign) CGFloat alpha;

+(UIFadeAnimation*)actionToAlpha:(CGFloat)alpha
                        Duration:(CGFloat)duration;
+(UIFadeAnimation*)actionByAlpha:(CGFloat)alpha
                        Duration:(CGFloat)duration;
@end

@interface UIDisplaceAnimation : UIKitAnimation

@property (nonatomic,assign) CGPoint point;

+(UIDisplaceAnimation*)actionToPoint:(CGPoint)point
                              Duration:(CGFloat)duration;
+(UIDisplaceAnimation*)actionByPoint:(CGPoint)point
                            Duration:(CGFloat)duration;
@end

@interface UIScaleAnimation : UIKitAnimation

@property (nonatomic,assign) CGFloat scaleX;
@property (nonatomic,assign) CGFloat scaleY;

+(UIScaleAnimation*)actionToScaleX:(CGFloat)scaleX
                            ScaleY:(CGFloat)scaleY
                          Duration:(CGFloat)duration;
+(UIScaleAnimation*)actionByScaleX:(CGFloat)scaleX
                            ScaleY:(CGFloat)scaleY
                          Duration:(CGFloat)duration;
@end

@interface UIRotateAnimation : UIKitAnimation

/**
 *	@brief	角度值
 */
@property (nonatomic,assign) CGFloat angle;


+(UIRotateAnimation*)actionToRotate:(CGFloat)angle
                          Duration:(CGFloat)duration;
+(UIRotateAnimation*)actionByRotate:(CGFloat)angle
                          Duration:(CGFloat)duration;

@end

@interface UICallbackBlock : UIKitAnimation
+(UICallbackBlock*)actionWithBlock:(KIT_ANIMATION_BLOCK)blocker;
@property (nonatomic,retain)KIT_ANIMATION_BLOCK blocker;
@end

@interface UIAnimationSequence :UIKitAnimation
{
    NSMutableArray * actionList;
}

-(void)removeFirstAction;
-(void)addAction:(id<UIAnimationUnitProtocol>)action;
@end

