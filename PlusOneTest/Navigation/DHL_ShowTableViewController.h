//
//  DHL_ShowTableViewController.h
//  PlusOneTest
//
//  Created by David Lee on 10/24/15.
//  Copyright © 2015 David Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DHL_ShowTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *menuItems;

// Initilization:
- (id)initWithMenuItems:(NSArray *)menuItems;

@end
