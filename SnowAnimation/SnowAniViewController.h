//
//  SnowAniViewController.h
//  SnowAnimation
//
//  Created by Jamie Jyhyun Song on 7/19/16.
//  Copyright (c) 2016 JSONG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SnowAniViewController : UIViewController
{
    UIImageView *SnowImageView; //image view of moving background
    UIImage *snowImage; //image of the snow
}

-(void) StartBackgroundAnimation:(float) Duration; //start the moving background animation
-(void) StartSnowAnimation:(float) Duration; //start snow animation
-(void) animationTimerHandler:(NSTimer*)theTimer; //timer event handler

@end
