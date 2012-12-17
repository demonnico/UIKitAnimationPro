//
//  ViewController.m
//  UIKitAnimationPro
//
//  Created by demon on 12/12/12.
//  Copyright (c) 2012 NicoFun. All rights reserved.
//

#import "ViewController.h"
#import "UIView+UIAnimationCatagory.h"
#import "UIKitAnimation.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(200, 200, 50, 50
                                                             )];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor redColor];
    [view release];
    
////    view.transform = CGAffineTransformMakeRotation(M_PI_4);
//    [UIView animateWithDuration:2.0
//                     animations:^()
//     {
////         view.center= CGPointMake(200, 200);
////         view.transform = CGAffineTransformTranslate(view.transform,
////                                                     50, 0);
//         view.transform = CGAffineTransformRotate(view.transform, M_PI_4);
////         view.transform = CGAffineTransformMakeTranslation(100, 100);
//     }completion:^(BOOL finished)
//     {
//         NSLog(@"%f",view.transform.a);//scaleX
//         NSLog(@"%f",view.transform.b);//
//         NSLog(@"%f",view.transform.c);//
//         NSLog(@"%f",view.transform.d); //scaleY
//         NSLog(@"%f",view.transform.tx);//x坐标
//         NSLog(@"%f",view.transform.ty);//y坐标
//     }];


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

    UIAnimationSequence * seq = [[UIAnimationSequence alloc] init];
//    [seq addAction:scale];
//    [seq addAction:displace];
//    [seq addAction:fade];
//    [seq addAction:rotate];
//    [seq addAction:rotateTo];
    
    for (int i=0; i<100; i++)
    {
        int x = arc4random()%5-2;
        int y = arc4random()%5-2;
        UIDisplaceAnimation * displace0 = [UIDisplaceAnimation actionByPoint:CGPointMake(x, y)
                                                                   Duration:1.0];

        [seq addAction:displace0];
    }
    [view runAction:seq];
    [seq      release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
