//
//  UIView+UIAnimationCatagory.m
//  animationFac
//
//  Created by demon on 11/14/12.
//  Copyright (c) 2012 NicoFun. All rights reserved.
//

#import "UIView+UIAnimationCatagory.h"

@implementation UIView (UIAnimationCatagory)
-(void)runAction:(id<UIAnimationUnitProtocol>)action;
{
    UIKitAnimation * animation = [action getAnimationUnit];
    if(!animation)
        return;
    CGPoint center = self.center;
    CGFloat alpha = self.alpha;
    CGAffineTransform transform = self.transform;
    
    switch ([animation getAnimationType])
    {
        case AnimationDisplacement:
        {
            UIDisplaceAnimation * displaceMent  = (UIDisplaceAnimation*)animation;
            center.x = displaceMent.point.x;
            center.y = displaceMent.point.y;
            break;
        }
        case AnimationDisplacementBy:
        {
            UIDisplaceAnimation * displaceMent  = (UIDisplaceAnimation*)animation;
            center.x+=displaceMent.point.x;
            center.y+=displaceMent.point.y;
            break;
        }
        case AnimationFadeTo:
        {
            UIFadeAnimation * fadeAnimation  = (UIFadeAnimation*)animation;
            alpha=fadeAnimation.alpha;
            break;
        }
        case AnimationFadeBy:
        {
            UIFadeAnimation * fadeAnimation  = (UIFadeAnimation*)animation;
            alpha+=fadeAnimation.alpha;
            break;
        }
        case AnimationScaleBy:
        {
            UIScaleAnimation * scale =(UIScaleAnimation*)animation;
            transform.a = scale.scaleX;
            transform.d = scale.scaleY;
            break;
        }
        case AnimationScaleTo:
        {
            UIScaleAnimation * scale =(UIScaleAnimation*)animation;
            transform = CGAffineTransformMakeScale(scale.scaleX,
                                                   scale.scaleY);
            break;
        }
        case AnimationRotateBy:
        {
            UIRotateAnimation * rotate =(UIRotateAnimation*)animation;
            CGFloat radians = rotate.angle*M_PI/180;
            CGAffineTransform rotatedTransform = CGAffineTransformRotate(transform,radians);
            transform  = rotatedTransform;
            break;
        }
            //TODO
        case AnimationRotateTo:
        {
            UIRotateAnimation * rotate =(UIRotateAnimation*)animation;
            CGFloat radians = rotate.angle*M_PI/180;
            transform = CGAffineTransformMakeRotation(radians);
//            CGAffineTransform rotateTransform = CGAffineTransformMakeRotation(rotate.angle);
            break;
        }
        case AnimationCallBack:
        {
            UICallbackBlock * callback  = (UICallbackBlock*)animation;
            callback.blocker(nil);//这里执行了block
            UIAnimationSequence * animationList = (UIAnimationSequence*)action;
            [animationList removeFirstAction];
            [self runAction:animationList];
            return;
        }
        default:
            break;
    }
    
    [UIView animateWithDuration:[animation getDuration]
                     animations:^(){
                         self.center    = center;
                         self.alpha     = alpha;
                         self.transform = transform;
                     } completion:^(BOOL finished)
        {
            if ([action isKindOfClass:[UIAnimationSequence class]])
            {
                UIAnimationSequence * animationList = (UIAnimationSequence*)action;
                [animationList removeFirstAction];
                [self runAction:animationList];//通过这里递归了
            }
        }];
}
@end
