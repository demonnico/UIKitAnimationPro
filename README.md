#How To Use
------
*	让你像在cocos2d中一样，对UIView进行动画操作.

```
------

UIScaleAnimation  		*scale//缩放动画
UIDisplaceAnimation		*displacement//位移动画
UIFadeAnimation  		*fade//淡入、淡出动画    
UIRotateAnimation 		*rotate//旋转动画
UIAnimationSequence		*sequnce//动画队列
UICallbackBlock			*callback//动画异步回调

------
example:
UIView * view;
UIAnimationSequence * seq;

[seq addAction:scale];
[seq addAction:callback];
[seq addAction:displace];
[seq addAction:fade];
[seq addAction:rotate];
[seq addAction:rotateTo];
[seq addAction:callback];

[view runAction:seq];

```

