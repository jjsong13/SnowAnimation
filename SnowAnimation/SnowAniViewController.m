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

- (void)viewDidLoad {
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

- (void)didReceiveMemoryWarning {
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
