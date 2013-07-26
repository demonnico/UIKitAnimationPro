//
//  UIView+UIAnimationCatagory.h
//  animationFac
//
//  Created by demon on 11/14/12.
//  Copyright (c) 2012 NicoFun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIKitAnimation.h"
/**
 *	给view添加了执行动画的方法。
 */
@interface UIView (UIAnimationCatagory)
-(void)runAction:(id<UIAnimationUnitProtocol>)action;
@end
