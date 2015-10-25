//
//  DHL_ShowViewController.m
//  PlusOneTest
//
//  Created by David Lee on 10/25/15.
//  Copyright © 2015 David Lee. All rights reserved.
//

#import "DHL_ShowViewController.h"

@interface DHL_ShowViewController ()

@end

@implementation DHL_ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Gesture Recognizer:
    UISwipeGestureRecognizer * swiperight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
    swiperight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swiperight];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer
{
    //Do what you want here
    [self.navigationController popViewControllerAnimated:YES];
}

@end
