//
//  SnowAniViewController.m
//  SnowAnimation
//
//  Created by Jamie Jyhyun Song on 7/19/16.
//  Copyright (c) 2016 JSONG. All rights reserved.
//

#import "SnowAniViewController.h"

@interface SnowAniViewController ()

@end

@implementation SnowAniViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    [self StartBackgroundAnimation:5]; //start moving background animation after 5 secs
    [self StartSnowAnimation:0.25]; //start snow falling animation in 0.25 sec interval
}

-(void) StartBackgroundAnimation:(float)Duration
{
    if(SnowImageView == nil)
    {
        SnowImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
        NSMutableArray *imageArray = [NSMutableArray array];
        for (int i=1; i<=46; i++)
            [imageArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"snow-%d.tiff",i]]];
        SnowImageView.animationImages = imageArray;
    }
    else
    {
        [SnowImageView removeFromSuperview];
    }
    SnowImageView.animationDuration = Duration; //length of animation
    SnowImageView.animationRepeatCount = 0; //set repeat times
    [SnowImageView startAnimating]; //start animation
    [self.view addSubview:SnowImageView];
}

-(void) StartSnowAnimation:(float)Duration
{
    snowImage = [UIImage imageNamed:@"snow.png"]; //call snow image
    [NSTimer scheduledTimerWithTimeInterval:(0.3) target: self //set timer
                                   selector:@selector(animationTimerHandler:) userInfo:nil repeats:YES];
}

-(void) animationTimerHandler:(NSTimer *)theTimer
{
    UIImageView *snowView = [[UIImageView alloc] initWithImage:snowImage];
    
    int startX = round(random()%375);
    int endX = round(random()%375);
    double snowSpeed = 10 + (random()%10)/10.0;
    snowView.alpha = 0.9;
    snowView.frame = CGRectMake(startX,-20,20,20); //starting point
    [UIView beginAnimations:nil context:(__bridge void *)(snowView)]; //set animation block
    [UIView setAnimationDuration:snowSpeed]; //animation speed
    
    snowView.frame = CGRectMake(endX, 667.0, 20, 20); //final arrival point
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    [UIView setAnimationDelegate:self];
    [SnowImageView addSubview:snowView]; //add image view
    [UIView commitAnimations]; //start animatoins
}

-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished
                context:(void *)context
{
    [(__bridge UIImageView *)context removeFromSuperview];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
