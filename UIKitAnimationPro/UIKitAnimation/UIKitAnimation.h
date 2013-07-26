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
    AnimationNone   =0,//无
    AnimationDisplacementBy,//是位置移动量
    AnimationDisplacement,//位置移动
    AnimationFadeBy,
    AnimationFadeTo,
    AnimationScaleBy,
    AnimationScaleTo,
    AnimationRotateBy,
    AnimationRotateTo,
    AnimationCallBack//回调block
    
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
/**
 *	UIFadeAnimation 透明度变化的动画
 */
@interface UIFadeAnimation : UIKitAnimation

@property (nonatomic,assign) CGFloat alpha;
/**
 *	返回alpha变化到某一数值的动画
 *
 *	@param	alpha	要变化到的alpha
 *	@param	duration	动画的时间
 *
 *	@return	返回UIFadeAnimation
 */
+(UIFadeAnimation*)actionToAlpha:(CGFloat)alpha
                        Duration:(CGFloat)duration;
/**
 *	返回alpha变化量为某一数值的动画
 *
 *	@param	alpha	alpha的变化量，可以是正负值
 *	@param	duration	动画的时间
 *
 *	@return	返回UIFadeAnimation
 */
+(UIFadeAnimation*)actionByAlpha:(CGFloat)alpha
                        Duration:(CGFloat)duration;
@end

/**
 *	UIDisplaceAnimation 位置移动
 */
@interface UIDisplaceAnimation : UIKitAnimation

@property (nonatomic,assign) CGPoint point;

+(UIDisplaceAnimation*)actionToPoint:(CGPoint)point
                              Duration:(CGFloat)duration;
+(UIDisplaceAnimation*)actionByPoint:(CGPoint)point
                            Duration:(CGFloat)duration;
@end

/**
 *	UIScaleAnimation 缩放动画
 */
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

/**
 *	UIRotateAnimation 旋转动画
 */
@interface UIRotateAnimation : UIKitAnimation

/**
 *	@brief	角度值 就是 不是M_PI,是180，不是弧度。
 */
@property (nonatomic,assign) CGFloat angle;


+(UIRotateAnimation*)actionToRotate:(CGFloat)angle
                          Duration:(CGFloat)duration;
+(UIRotateAnimation*)actionByRotate:(CGFloat)angle
                          Duration:(CGFloat)duration;

@end

/**
 *	UICallbackBlock 传入动画回调block
 */
@interface UICallbackBlock : UIKitAnimation
+(UICallbackBlock*)actionWithBlock:(KIT_ANIMATION_BLOCK)blocker;
@property (nonatomic,copy)KIT_ANIMATION_BLOCK blocker;
@end

/**
 *	UIAnimationSequence 动画队列，添加动作到队列中，然后view执行队列，显示动画
 */
@interface UIAnimationSequence :UIKitAnimation

-(void)removeFirstAction;
-(void)addAction:(id<UIAnimationUnitProtocol>)action;
@end

