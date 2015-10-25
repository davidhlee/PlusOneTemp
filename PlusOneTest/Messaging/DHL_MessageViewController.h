//
//  DHL_MessageViewController.h
//  PlusOneTest
//
//  Created by David Lee on 10/24/15.
//  Copyright © 2015 David Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DHL_ObjectsManager.h"
#import "DHL_TextViewContainer.h"

@interface DHL_MessageViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextViewDelegate, DHL_TextViewContainerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong) DHL_ObjectsManager *objectsManager;

// UI:
@property (nonatomic, strong) NSString *cellIdentifier;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet DHL_TextViewContainer *textViewContainer;
@property (nonatomic, strong) IBOutlet UITextView *textView;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint *textViewHeight;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint *textViewContainerBottom;

// Methods:
- (IBAction)createMessage:(id)sender;
- (IBAction)presentAddPhoto:(id)sender;

@end