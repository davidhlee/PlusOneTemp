//
//  DHL_ShowTableViewController.m
//  PlusOneTest
//
//  Created by David Lee on 10/24/15.
//  Copyright © 2015 David Lee. All rights reserved.
//

#import "DHL_ShowTableViewController.h"
#import "DHL_ShowViewController.h"

@interface DHL_ShowTableViewController ()

@end

@implementation DHL_ShowTableViewController

- (id)initWithMenuItems:(NSArray *)menuItems {
    self = [super init];
    if (self) {
        self.menuItems = [[NSMutableArray alloc] initWithArray:menuItems];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class]forCellReuseIdentifier:@"Cell" ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    UIViewController *menuVC = [self.menuItems objectAtIndex:indexPath.row];
    cell.textLabel.text =  menuVC.navigationItem.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DHL_ShowViewController *vc = [self.menuItems objectAtIndex:indexPath.row];
    [self.navigationController showViewController:vc sender:self];
}

@end
