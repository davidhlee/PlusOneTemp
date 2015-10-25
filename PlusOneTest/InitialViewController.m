//
//  InitialViewController.m
//  PlusOneTest
//
//  Created by David Lee on 10/25/15.
//  Copyright © 2015 David Lee. All rights reserved.
//

#import "InitialViewController.h"
#import "DHL_ShowTableViewController.h"
#import "DHL_ShowViewController.h"

@interface InitialViewController ()

@end

@implementation InitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation
- (IBAction)pushShowVC:(id)sender {
    
    DHL_ShowViewController *vcShowTab1 = [[DHL_ShowViewController alloc] initWithNibName:@"MenuVC" bundle:nil];
    vcShowTab1.navigationItem.title = @"Jim";
    DHL_ShowViewController *vcShowTab2 = [[DHL_ShowViewController alloc] initWithNibName:@"MenuVC" bundle:nil];
    vcShowTab2.navigationItem.title = @"John";
    DHL_ShowViewController *vcShowTab3 = [[DHL_ShowViewController alloc] initWithNibName:@"MenuVC" bundle:nil];
    vcShowTab3.navigationItem.title = @"Joe";
    
    DHL_ShowTableViewController *vcShowTable = [[DHL_ShowTableViewController alloc] initWithMenuItems:@[vcShowTab1, vcShowTab2, vcShowTab3]];
    [self.navigationController pushViewController:vcShowTable animated:YES];
}

@end
