//
//  UIView+UIAnimationCatagory.h
//  animationFac
//
//  Created by demon on 11/14/12.
//  Copyright (c) 2012 NicoFun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIKitAnimation.h"
@interface UIView (UIAnimationCatagory)
-(void)runAction:(id<UIAnimationUnitProtocol>)action;
@end
