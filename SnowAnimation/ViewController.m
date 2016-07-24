//
//  ViewController.m
//  SnowAnimation
//
//  Created by Jamie Jyhyun Song on 7/19/16.
//  Copyright (c) 2016 JSONG. All rights reserved.
//

#import "ViewController.h"
#import "SnowAniViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize infoButton;

- (void)viewDidLoad {
    
    SnowAniViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SnowAniViewController"];
    
    //insert RecordViewController.view behind infoButton 
    [self.view insertSubview:viewController.view belowSubview:infoButton];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//hide status bar
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

//set color of status bar to white
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


@end
