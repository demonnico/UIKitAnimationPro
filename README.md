#Why use it

* it helps you create a sequnce of animaions like the way in cocos2d. (also like Sprite Kit even without iOS7)

#How To Use

```
UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
[self.view addSubview:view];
view.backgroundColor = [UIColor redColor];
[view release];

UICallbackBlock * callback = [UICallbackBlock actionWithBlock:^(id data)
{
    NSLog(@"animation finish");
}];

UIScaleAnimation * scale = [UIScaleAnimation actionByScaleX:2.0
                                                     ScaleY:3.0
                                                   Duration:1];
UIDisplaceAnimation * displace = [UIDisplaceAnimation actionByPoint:CGPointMake(200, 200)
                                                           Duration:1.0];
UIFadeAnimation * fade = [UIFadeAnimation actionByAlpha:-0.5
                                               Duration:1.0];

UIRotateAnimation * rotate = [UIRotateAnimation actionByRotate:45
                                                      Duration:1.0];

UIRotateAnimation * rotateTo = [UIRotateAnimation actionToRotate:15
                                                      Duration:1.0];

UIAnimationSequence * seq = [[][UIAnimationSequence alloc] init] autorelease];
[seq addAction:scale];
[seq addAction:callback];
[seq addAction:displace];
[seq addAction:fade];
[seq addAction:rotate];
[seq addAction:rotateTo];
[seq addAction:callback];

//of course,if you just only one animation, you just need
//[view runAction:scale] or [view runAction:displace];
[view runAction:seq];

```

